DROP TABLE IF EXISTS voicemail;
CREATE TABLE voicemail (
    -- All of these column names are very specific, including "uniqueid".  Do not change them if you wish voicemail to work.
    uniqueid INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -- Mailbox context.
    context CHAR(80) NOT NULL DEFAULT 'default',
    -- Mailbox number.  Should be numeric.
    mailbox CHAR(80) NOT NULL,
    -- Must be numeric.  Negative if you don't want it to be changed from VoicemailMain
    password CHAR(80) NOT NULL,
    -- Used in email and for Directory app
    fullname CHAR(80),
    -- Email address (will get sound file if attach=yes)
    email CHAR(80),
    -- Email address (won't get sound file)
    pager CHAR(80),
    -- Attach sound file to email - YES/no
    attach CHAR(3),
    -- Which sound format to attach
    attachfmt CHAR(10),
    -- Send email from this address
    serveremail CHAR(80),
    -- Prompts in alternative language
    LANGUAGE CHAR(20),
    -- Alternative timezone, as defined in voicemail.conf
    tz CHAR(30),
    -- Delete voicemail from server after sending email notification - yes/NO
    deletevoicemail CHAR(3),
    -- Read back CallerID information during playback - yes/NO
    saycid CHAR(3),
    -- Allow user to send voicemail from within VoicemailMain - YES/no
    sendvoicemail CHAR(3),
    -- Listen to voicemail and approve before sending - yes/NO
    review CHAR(3),
    -- Warn user a temporary greeting exists - yes/NO
    tempgreetwarn CHAR(3),
    -- Allow '0' to jump out during greeting - yes/NO
    operator CHAR(3),
    -- Hear date/time of message within VoicemailMain - YES/no
    envelope CHAR(3),
    -- Hear length of message within VoicemailMain - yes/NO
    sayduration CHAR(3),
    -- Minimum duration in minutes to say
    saydurationm INT(3),
    -- Force new user to record name when entering voicemail - yes/NO
    forcename CHAR(3),
    -- Force new user to record greetings when entering voicemail - yes/NO
    forcegreetings CHAR(3),
    -- Context in which to dial extension for callback
    callback CHAR(80),
    -- Context in which to dial extension (from advanced menu)
    dialout CHAR(80),
    -- Context in which to execute 0 or * escape during greeting
    exitcontext CHAR(80),
    -- Maximum messages in a folder (100 if not specified)
    maxmsg INT(5),
    -- Increase DB gain on recorded message by this amount (0.0 means none)
    volgain DECIMAL(5,2),
    -- IMAP user for authentication (if using IMAP storage)
    imapuser VARCHAR(80),
    -- IMAP password for authentication (if using IMAP storage)
    imappassword VARCHAR(80),
    -- IMAP server location (if using IMAP storage)
    imapsever VARCHAR(80),
    -- IMAP port (if using IMAP storage)
    imapport VARCHAR(8),
    -- IMAP flags (if using IMAP storage)
    imapflags VARCHAR(80),
    stamp TIMESTAMP
);
 
DROP TABLE IF EXISTS voicemail_data;
CREATE TABLE voicemail_data (
    -- Path to the recording
    filename CHAR(255) NOT NULL PRIMARY KEY,
    -- Mailbox number (without context)
    origmailbox CHAR(80),
    -- Dialplan context
    context CHAR(80),
    -- Dialplan context, if voicemail was invoked from a macro
    macrocontext CHAR(80),
    -- Dialplan extension
    exten CHAR(80),
    -- Dialplan priority
    priority INT(5),
    -- Name of the channel, when message was left
    callerchan CHAR(80),
    -- CallerID on the channel, when message was left
    callerid CHAR(80),
    -- Contrary to the name, origdate is a full datetime, in localized format
    origdate CHAR(30),
    -- Same date as origdate, but in Unixtime
    origtime INT(11),
    -- Value of the channel variable VM_CATEGORY, if set
    category CHAR(30),
    -- Length of the message, in seconds
    duration INT(11)
);
DROP TABLE IF EXISTS voicemail_messages;
CREATE TABLE voicemail_messages (
    -- Logical directory
    dir CHAR(255),
    -- Message number within the logical directory
    msgnum INT(4),
    -- Dialplan context
    context CHAR(80),
    -- Dialplan context, if Voicemail was invoked from a macro
    macrocontext CHAR(80),
    -- CallerID, when the message was left
    callerid CHAR(80),
    -- Date when the message was left, in Unixtime
    origtime INT(11),
    -- Length of the message, in seconds
    duration INT(11),
    -- The recording itself
    recording BLOB,
    -- Text flags indicating urgency of the message
    flag CHAR(30),
    -- Value of channel variable VM_CATEGORY, if set
    category CHAR(30),
    -- Owner of the mailbox
    mailboxuser CHAR(30),
    -- Context of the owner of the mailbox
    mailboxcontext CHAR(30),
    -- Unique ID of the message,
    msg_id CHAR(40),
    PRIMARY KEY (dir, msgnum)
);2