--
--  Howler Task worker
--  Connects PULL socket to tcp://localhost:5557
--  Collects workloads from ventilator via that socket
--
--  Connects PUSH socket to tcp://localhost:5558
--  Sends results to sink via that socket
--
--  Adds pub-sub flow to receive and respond to kill signal
--

--require"zmq"
--require"zmq.poller"

-- require"zhelpers"

--local context = zmq.init(1)

--  Socket to receive messages on
--local receiver = context:socket(zmq.PULL)
--receiver:connect("tcp://localhost:5557")

--  Socket to send messages to
--local sender = context:socket(zmq.PUSH)
--sender:connect("tcp://localhost:5558")

--  Socket for controller input
--local controller = context:socket(zmq.SUB)
--controller:connect("tcp://localhost:5559")
--controller:setopt(zmq.SUBSCRIBE, "", 0)

-- machine detection settings
local human_detected = false;
local machine_detected = false;
local voicemail_detected = false;

-- account managment stuff
local account_uuid = false;
local forward_number = false;
local transfer_number = false;

local account = "raymond";

local voice_press_one = "voice_press_one";
local voice_press_one = "/usr/local/freeswitch/sounds/" .. account .. "/" .. voice_press_one .. ".wav";
local voicemail = "/usr/local/freeswitch/sounds/" .. account .. "/voicemail.wav";

--  Process messages from receiver and controller
--local poller = zmq.poller(2)

--poller:add(receiver, zmq.POLLIN, function()
--    local msg = receiver:recv()
--
    --  Do the work
--    s_sleep(tonumber(msg))

    --  Send results to sink
--    sender:send("")

    --  Simple progress indicator for the viewer
--    io.write(".")
--    io.stdout:flush()
--end)

--poller:add(controller, zmq.POLLIN, function()
--    poller:stop() --  Exit loop
--end)


function onInput(session, type, obj)

    -- start poller's event loop
    -- poller:start()

    if type == "dtmf" and obj['digit'] == '1' and human_detected == false then
        human_detected = true;

        -- stop the answer machine detection
        session:execute("avmd","stop");

        -- transfer
        session:transfer("2011", "XML", "default");

        -- stop the on beep voicemail machine detection
        session:execute("avmd","stop");
        
        -- Message Acknowledgement
        -- sender:send("human, transfer ack");

        -- clean report message and break, crashing the shit out of it.
        return "break";
    end

    if type == "dtmf" and obj['digit'] == '3' and human_detected == false then
        human_detected = true;

        -- stop the on beep voicemail machine detection
        session:execute("avmd","stop");
        
        -- sender:send("human, do not call");

        -- do not disturb, message missing

        -- hangup
        session:hangup();
        return "break";
    end

    if type == "dtmf" and obj['digit'] == '5' and human_detected == false then
        human_detected = true;

        -- stop the on beep voicemail machine detection
        session:execute("avmd","stop");
        
        -- sender:send("human, do not call");

        -- do not disturb, message missing

        -- hangup
        session:hangup();
        return "break";
    end

    if type == "dtmf" and obj['digit'] == '9' and human_detected == false then
        human_detected = true;

        -- stop the on beep voicemail machine detection
        session:execute("avmd","stop");
        
        -- sender:send("human, do not call");

        -- do not disturb, message missing

        -- hangup
        session:hangup();
        return "break";
    end
 
    if type == "event" and voicemail_detected == false then
        voicemail_detected = true;
        machine_detected = true;

        -- stop the answer machine detection
        session:execute("avmd","stop");
        
        -- play voicemail message
        --session:streamFile(voicemail);

        -- clean report message, report this as voicemail machine.

        -- hangup
        session:hangup();
        return "break";
    end
end

-- start poller's event loop
--poller:start()

-- answer the call
session:answer();
session:setAutoHangup(false);
session:setInputCallback("onInput");

-- start the answer machine detection
session:execute("avmd","start");

-- sleep a second
session:sleep(1000);

-- stream press one campaign audio
session:streamFile(voice_press_one);

-- sleep half a second
session:sleep(500);

-- stream press one campaign audio
session:streamFile(voice_press_one);

-- sleep half a second
session:sleep(500);

-- stream press one campaign audio
session:streamFile(voice_press_one);

--  Finished
session:execute("avmd","stop");

--receiver:close()
--sender:close()
--controller:close()
--context:term()