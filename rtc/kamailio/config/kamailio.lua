-- SIP request routing
function route_request(name)
	-- some initial debug messages
	sr.dbg("routing SIP request from Lua [" .. name .. "]\n")
	ruri = sr.pv.get("$ru")
	rdomain = sr.pv.get("$rd")
	furi = sr.pv.get("$fu")
	fdomain = sr.pv.get("$fd")
	tdomain = sr.pv.get("$td")
	method = sr.pv.get("$rm")
	srcip = sr.pv.get("$si")
	sr.dbg("--- [" .. srcip .. "] (" .. method .. ") " .. furi .. " => " .. ruri .. "\n")
 
	-- initial checks of SIP request
	if sr.maxfwd.process_maxfwd(10) < 0 then
		sr.sl.send_reply(483,"Too Many Hops")
		return
	end
 
	-- route within dialog SIP requests
	if not sr.pv.is_null("$tt") then
		if sr.rr.loose_route()>0 then
			if method=="BYE" then
				sr.setflag(1)
				sr.setflag(3)
			end
			sr.tm.t_relay()
			return
		else
			if method=="ACK" then
				if sr.tm.t_check_trans()>0 then
					sr.tm.t_relay()
					return
				else
					return
				end
			end
			sr.sl.send_reply(404, "Not here")
		end
		return
	end
 
	-- only initial requests (no To tag)
 
	-- CANCEL processing
	if method =="CANCEL" then
		if sr.tm.t_check_trans() > 0 then
			sr.tm.t_relay()
		end
		return;
	end
 
	if sr.tm.t_check_trans() == 0 then return end
 
	-- authentication
	if method == "REGISTER" then
		-- authenticate the REGISTER requests
		if sr.auth_db.www_authenticate(tdomain, "subscriber") < 0 then
			sr.auth.www_challenge(tdomain, 1);
			return;
		end
 
		if sr.pv.get("$au") ~= sr.pv.get("$tU") then
			sr.sl.send_reply(403, "Forbidden auth ID");
			return;
		end
	else
		-- authenticate if from local subscriber
		if sr.is_myself( fdomain ) == true then
			if sr.auth_db.proxy_authenticate(fdomain, "subscriber") < 0 then
				sr.auth.proxy_challenge(fdomain, 1)
				return
			end
			if sr.pv.get("$au") ~= sr.pv.get("$fU") then
				sr.sl.send_reply(403, "Forbidden auth ID")
				return
			end
			sr.auth.consume_credentials();
			-- caller authenticated
		else
			-- caller is not local subscriber, if callee is not as well,
			-- do not become an open relay
			if sr.is_myself(rdomain)==false then
				sr.sl.send_reply(403, "Not relaying")
				return
			end
		end
	end
 
	-- record routing
	sr.hdr.remove("Route");
	if method == "INVITE" or  method == "SUBSCRIBE" then
		sr.rr.record_route()
	end
	if method=="INVITE" then
		sr.setflag(1)
	end
 
	-- non local destinations
	if sr.is_myself(rdomain)==false then
		sr.tm.t_relay()
		return
	end
 
	-- SIP registrar server
	if method == "REGISTER" then
		if sr.registrar.save("location") < 0 then
			sr.sl.send_reply(500, "Server error")
		end
		return
	end
 
	if sr.pv.is_null("$rU") then
		-- request with no Username in RURI
		sr.sl.send_reply(484, "Address Incomplete")
		return
	end
	-- SIP location server
	if sr.registrar.lookup("location") < 0 then
		-- destination user offline
		sr.sl.send_reply(404, "Not found")
		return
	end
	if method=="INVITE" then
		sr.setflag(2)
	end
 
	-- relay the request
	sr.tm.t_on_branch("TEST");
	sr.tm.t_on_reply("TEST");
	sr.tm.t_on_failure("TEST");
	if sr.tm.t_relay() < 0 then
		sr.sl.send_reply(500, "Server error")
	end
end
 
-- SIP branch routing
function route_branch(name)
	sr.dbg("routing SIP branch from Lua [" .. name .. "]\n")
end
 
-- SIP reply routing
function route_reply(name)
	sr.dbg("routing SIP reply from Lua [" .. name .. "]\n")
end
 
-- SIP failure routing
function route_failure(name)
	sr.dbg("routing SIP failure from Lua [" .. name .. "]\n")
end