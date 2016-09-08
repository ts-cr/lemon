local human_detected = false;
local voicemail_detected = false;

function onInput(session, type, obj)

    if type == "dtmf" and obj['digit'] == '1' and human_detected == false then
        human_detected = true;
        session:execute("avmd","stop");

        -- transfer
        session:transfer("2007", "XML", "default");
        session:execute("avmd","stop");
        return "break";
    end

    if type == "dtmf" and obj['digit'] == '0' and human_detected == false then
        human_detected = true;
        session:execute("avmd","stop");

        -- hangup
        session:hangup();
        return "break";
    end
 
    if type == "event" and voicemail_detected == false then
        voicemail_detected = true;
        session:execute("avmd","stop");
        session:streamFile("/usr/local/freeswitch/sounds/radio/voicemail.wav");

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
session:streamFile("/usr/local/freeswitch/sounds/radio/urbano.wav");

session:sleep(500);

session:streamFile("/usr/local/freeswitch/sounds/radio/urbano.wav");

session:sleep(500);

session:streamFile("/usr/local/freeswitch/sounds/radio/urbano.wav");

session:execute("avmd","stop");