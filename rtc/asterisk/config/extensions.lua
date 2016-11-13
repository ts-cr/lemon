TRUNK_ITELLUM = "itellum_4/"
PREFIX = "002041" 
SIP = "SIP/"
TIME = "45" 
PARAMETER = "Tt"
CALL_MONKEYS = "Local/500@default"


function e_drop_call(context, entension)
    app.Dial(CALL_MONKEYS)
    app.hangup()
end


function e_outgoing_sip(context, extension)

    name = channel.CALLERID("name"):get()
    peername = channel.CHANNEL("peername"):get()
    extension = string.sub(extension, 1)
    app.Verbose("Called outgoing " .. extension .. " in context " .. context)
    
    app.Dial(SIP .. TRUNK_ITELLUM .. PREFIX .. extension, TIME, PARAMETER)
end

function e_outgoing_sip_cr(context, extension)
	Pref = "002079011"
    name = channel.CALLERID("name"):get()
    peername = channel.CHANNEL("peername"):get()
    extension = string.sub(extension, 1)
    app.Verbose("Called outgoing " .. extension .. " in context " .. context)
    
    app.Dial(SIP .. TRUNK_ITELLUM .. Pref .. extension, TIME, PARAMETER)
end

function e_internal_sip(context, extension)
	--callee is destina

    app.Verbose("Called internal extension " .. extension .. " in context " .. context)
    name = channel.CALLERID("name"):get()
    peername = channel.CHANNEL("peername"):get()
    callee = channel.CALLERID("num"):get()
    app.Verbose(1, string.format("Device name : %s, callee %s", name, callee))
    
    --if extension == "1111" then
    	--app.Dial("SIP/7000,45,Tt")
    --elseif extension == "2222" then 
    	--app.Verbose("si llega perfectamente aca mae...")
    --end

    app.Dial(SIP .. extension, TIME, PARAMETER)

end

function e_incoming(context, extension)
    
    --callee is destina
    app.Verbose("Called internal extension " .. extension .. " in context " .. context)
    name = channel.CALLERID("name"):get()
    peername = channel.CHANNEL("peername"):get()
    callee = channel.CALLERID("num"):get()
    app.Verbose(1, string.format("Device name : %s, callee %s", name, callee))
    
    if extension == "12028188659" then
    	app.Dial("SIP/7000,45,Tt")
    else
    	app.Verbose("q putas mae...")
    --elseif extension == "2222" then 
    	--app.Verbose("si llega perfectamente aca mae...")
    end
end

--codemachine_main_usa = {

--        ["1"] = function(context, extension)
--            app.Dial("Local/40018646@codemachine_es")
--        end;

--        ["2"] = function(context, extension)
--            app.Dial("Local/40018646@codemachine_en")
--        end;

--        [""] = function(context, extension)
--           app.Dial("Local/40018646@codemachine_main")
--       end;

        --["_40018646"] = function(context, extension)
          --  app.Background("ivr_codemachine_main")
        --end;
--    };



extensions = {

    ["howler"] = {
        ["s"] = e_drop_call,
        ["_X!"] = e_drop_call,
        ["_XXX"] = e_internal_sip,
        ["_XXXX"] = e_internal_sip,
        ["_1XXXXXXXXXX"] = e_outgoing_sip,
        ["_506XXXXXXXX"] = e_outgoing_sip_cr
    };

    ["spider"] = {
        ["_12028188659"] = e_incoming,
    };

    ["fun-accounts"] = {
      include = {"howler", "spider"};
    };
}