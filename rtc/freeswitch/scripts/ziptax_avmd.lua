local human_detected = false;
local machine_detected = false;
local voicemail_detected = false;

function onInput(session, type, obj)

    if type == "dtmf" and obj['digit'] == '1' and human_detected == false then
        human_detected = true;
        session:execute("avmd","stop");

        -- transfer
        session:transfer("2010", "XML", "default");

        -- stop the on beep voicemail machine detection
        session:execute("avmd","stop");

        -- clean report message and break, crashing the shit out of it.
        return "break";
    end

    if type == "dtmf" and obj['digit'] == '3' and human_detected == false then
        human_detected = true;

        -- stop the on beep voicemail machine detection
        session:execute("avmd","stop");

        -- do not disturb, message missing

        -- hangup
        session:hangup();
        return "break";
    end
 
    if type == "event" and voicemail_detected == false then
        voicemail_detected = true;
        machine_detected = true;

        -- stop the on beep voicemail machine detection
        session:execute("avmd","stop");
        
        -- play voicemail message
        session:streamFile("/usr/local/freeswitch/sounds/ziptax/voicemail.wav");

        -- clean report message, report this as voicemail machine.

        -- hangup
        session:hangup();
        return "break";
    end
end

-- answer the call
session:answer();
session:setAutoHangup(false);
session:setInputCallback("onInput");

session:execute("avmd","start");

-- sleep a second
session:sleep(1000);

-- play a file
session:streamFile("/usr/local/freeswitch/sounds/ziptax/voice_press_1.wav");

session:sleep(500);

session:streamFile("/usr/local/freeswitch/sounds/ziptax/voice_press_1.wav");

session:sleep(500);

session:streamFile("/usr/local/freeswitch/sounds/ziptax/voice_press_1.wav");

session:execute("avmd","stop");