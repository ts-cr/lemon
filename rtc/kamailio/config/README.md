# Several features can be enabled using '#!define WITH_FEATURE' directives:
#
# *** To run in debug mode: 
#     - define WITH_DEBUG
#
# *** To enable authentication execute:
#     - define WITH_AUTH
#     - add users using 'kamctl'
#
# *** To enable IP authentication execute:
#     - enable authentication
#     - define WITH_IPAUTH
#     - add IP addresses with group id '1' to 'address' table
#
# *** To enable persistent user location execute:
#     - define WITH_USRLOCDB
#
# *** To enable presence server execute:
#     - define WITH_PRESENCE
#
# *** To enable nat traversal execute:
#     - define WITH_NAT
#     - install rtpengine: http://www.rtpengine.org
#     - start rtpengine:
#        rtpengine -l _your_public_ip_ -s udp:localhost:7722
#
# *** To enable PSTN gateway routing execute:
#     - define WITH_PSTN
#     - set the value of pstn.gw_ip
#     - check route[PSTN] for regexp routing condition
#
# *** To enable database aliases lookup execute:
#     - define WITH_ALIASDB
#
# *** To enable speed dial lookup execute:
#     - define WITH_SPEEDDIAL
#
# *** To enable multi-domain support execute:
#     - define WITH_MULTIDOMAIN
#
# *** To enable TLS support execute:
#     - adjust CFGDIR/tls.cfg as needed
#     - define WITH_TLS
#
# *** To enable XMLRPC support execute:
#     - define WITH_XMLRPC
#     - adjust route[XMLRPC] for access policy
#
# *** To enable anti-flood detection execute:
#     - adjust pike and htable=>ipban settings as needed (default is
#       block if more than 16 requests in 2 seconds and ban for 300 seconds)
#     - define WITH_ANTIFLOOD
#
# *** To block 3XX redirect replies execute:
#     - define WITH_BLOCK3XX
#
# *** To enable VoiceMail routing execute:
#     - define WITH_VOICEMAIL
#     - set the value of voicemail.srv_ip
#     - adjust the value of voicemail.srv_port
#
# *** To enhance accounting execute:
#     - define WITH_ACCDB
#     - add following columns to database
#!ifdef ACCDB_COMMENT
  ALTER TABLE acc ADD COLUMN src_user VARCHAR(64) NOT NULL DEFAULT '';
  ALTER TABLE acc ADD COLUMN src_domain VARCHAR(128) NOT NULL DEFAULT '';
  ALTER TABLE acc ADD COLUMN src_ip varchar(64) NOT NULL default '';
  ALTER TABLE acc ADD COLUMN dst_ouser VARCHAR(64) NOT NULL DEFAULT '';
  ALTER TABLE acc ADD COLUMN dst_user VARCHAR(64) NOT NULL DEFAULT '';
  ALTER TABLE acc ADD COLUMN dst_domain VARCHAR(128) NOT NULL DEFAULT '';
  ALTER TABLE missed_calls ADD COLUMN src_user VARCHAR(64) NOT NULL DEFAULT '';
  ALTER TABLE missed_calls ADD COLUMN src_domain VARCHAR(128) NOT NULL DEFAULT '';
  ALTER TABLE missed_calls ADD COLUMN src_ip varchar(64) NOT NULL default '';
  ALTER TABLE missed_calls ADD COLUMN dst_ouser VARCHAR(64) NOT NULL DEFAULT '';
  ALTER TABLE missed_calls ADD COLUMN dst_user VARCHAR(64) NOT NULL DEFAULT '';
  ALTER TABLE missed_calls ADD COLUMN dst_domain VARCHAR(128) NOT NULL DEFAULT '';
#!endif