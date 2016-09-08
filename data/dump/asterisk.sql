--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cdr; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cdr (
    id integer NOT NULL,
    calldate timestamp with time zone DEFAULT now() NOT NULL,
    clid character varying(80),
    src character varying(80),
    dst character varying(80),
    dcontext character varying(80),
    channel character varying(80),
    dstchannel character varying(80),
    lastapp character varying(80),
    lastdata character varying(80),
    duration integer DEFAULT 0 NOT NULL,
    billsec integer DEFAULT 0 NOT NULL,
    disposition character varying(45),
    amaflags integer DEFAULT 0 NOT NULL,
    accountcode character varying(36),
    uniqueid character varying(36),
    userfield character varying(36),
    checked boolean DEFAULT false NOT NULL
);


ALTER TABLE public.cdr OWNER TO postgres;

--
-- Name: cdr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cdr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cdr_id_seq OWNER TO postgres;

--
-- Name: cdr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cdr_id_seq OWNED BY cdr.id;


--
-- Name: sip; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sip (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    accountcode character varying(40),
    amaflags character varying(7),
    callcounter character varying(3),
    busylevel integer,
    allowoverlap character varying(3),
    allowsubscribe character varying(3),
    videosupport character varying(3),
    maxcallbitrate integer,
    rfc2833compensate character varying(3),
    "session-timers" character varying(9),
    "session-expires" integer,
    "session-minse" integer,
    "session-refresher" character varying(3),
    t38pt_usertpsource character varying(40),
    sendrpid character varying(3),
    outboundproxy character varying(40),
    callbackextension character varying(3),
    timert1 integer,
    timerb integer,
    qualifyfreq integer,
    constantssrc character varying(3),
    contactpermit character varying(40),
    contactdeny character varying(40),
    usereqphone character varying(3),
    textsupport character varying(3),
    faxdetect character varying(3),
    buggymwi character varying(3),
    auth character varying(40),
    fullname character varying(40),
    trunkname character varying(40),
    cid_number character varying(40),
    callingpres character varying(40),
    mohinterpret character varying(40),
    mohsuggest character varying(40),
    parkinglot character varying(40),
    hasvoicemail character varying(3),
    subscribemwi character varying(3),
    vmexten character varying(40),
    autoframing character varying(3),
    rtpkeepalive integer,
    "call-limit" integer,
    g726nonstandard character varying(3),
    ignoresdpversion character varying(3),
    allowtransfer character varying(3),
    dynamic character varying(3),
    sippasswd character varying(80),
    callgroup character varying(10),
    callerid character varying(80),
    directmedia character varying(3) DEFAULT 'no'::character varying,
    context character varying(80) DEFAULT 'default'::character varying,
    defaultip character varying(15),
    dtmfmode character varying(7),
    fromuser character varying(80),
    fromdomain character varying(80),
    host character varying(200) DEFAULT 'dynamic'::character varying NOT NULL,
    insecure character varying(40),
    trustrpid character varying(3) DEFAULT 'yes'::character varying,
    progressinband character varying(3) DEFAULT 'yes'::character varying,
    promiscredir character varying(3) DEFAULT 'yes'::character varying,
    useclientcode character varying(40) DEFAULT 'yes'::character varying,
    setvar character varying(40),
    language character varying(2),
    mailbox character varying(50),
    md5secret character varying(80),
    transport character varying(7),
    nat character varying(40) DEFAULT 'no'::character varying NOT NULL,
    permit character varying(95),
    deny character varying(95),
    mask character varying(95),
    pickupgroup character varying(10),
    port character varying(5),
    qualify character varying(3),
    restrictcid character varying(1),
    rtptimeout character varying(3),
    rtpholdtimeout character varying(3),
    secret character varying(80),
    remotesecret character varying(80),
    type character varying DEFAULT 'friend'::character varying NOT NULL,
    username character varying(80),
    disallow character varying(100) DEFAULT 'all'::character varying,
    allow character varying(100) DEFAULT 'g729,gsm,alaw,ulaw'::character varying,
    musiconhold character varying(100),
    regseconds integer DEFAULT 0 NOT NULL,
    ipaddr character varying(45),
    regexten character varying(80),
    cancallforward character varying(3) DEFAULT 'yes'::character varying,
    canreinvite character varying(3) DEFAULT 'yes'::character varying,
    lastms character varying(80),
    useragent character varying(100),
    defaultuser character varying(100),
    fullcontact character varying(100),
    regserver character varying(100),
    subscribecontext character varying(80),
    avpf character varying(3),
    encryption character varying(3),
    force_avp character varying(3),
    dtlsenable character varying(100),
    dtlsverify character varying(100),
    dtlscertfile character varying(100),
    dtlsprivatekey character varying(100),
    dtlssetup character varying(100),
    directrtpsetup character varying(100),
    icesupport character varying(3) DEFAULT 'no'::character varying
);


ALTER TABLE public.sip OWNER TO postgres;

--
-- Name: sip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sip_id_seq OWNER TO postgres;

--
-- Name: sip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sip_id_seq OWNED BY sip.id;


--
-- Name: sip_regs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sip_regs (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    fullcontact character varying(80) DEFAULT ''::character varying NOT NULL,
    ipaddr character varying(80),
    port character varying(80) DEFAULT 0 NOT NULL,
    username character varying(80) DEFAULT ''::character varying NOT NULL,
    regserver character varying(80),
    regseconds character varying(80) DEFAULT 0 NOT NULL,
    defaultuser character varying(80) DEFAULT ''::character varying NOT NULL,
    useragent character varying(80),
    lastms character varying(80)
);


ALTER TABLE public.sip_regs OWNER TO postgres;

--
-- Name: sip_regs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sip_regs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sip_regs_id_seq OWNER TO postgres;

--
-- Name: sip_regs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sip_regs_id_seq OWNED BY sip_regs.id;


--
-- Name: queue_members; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE queue_members (
    id integer NOT NULL,
    uniqueid character varying(36),
    membername character varying(36),
    queue_name character varying(128),
    interface character varying(128),
    penalty integer,
    paused integer
);


ALTER TABLE public.queue_members OWNER TO postgres;

--
-- Name: queue_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE queue_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queue_members_id_seq OWNER TO postgres;

--
-- Name: queue_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE queue_members_id_seq OWNED BY queue_members.id;


--
-- Name: queues; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE queues (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    musiconhold character varying(128),
    announce character varying(128),
    context character varying(128),
    timeout integer,
    monitor_join boolean,
    monitor_format character varying(128),
    queue_youarenext character varying(128),
    queue_thereare character varying(128),
    queue_callswaiting character varying(128),
    queue_holdtime character varying(128),
    queue_minutes character varying(128),
    queue_seconds character varying(128),
    queue_lessthan character varying(128),
    queue_thankyou character varying(128),
    queue_reporthold character varying(128),
    announce_frequency integer,
    announce_round_seconds integer,
    announce_holdtime character varying(128),
    retry integer,
    wrapuptime integer,
    maxlen integer,
    servicelevel integer,
    strategy character varying(128),
    joinempty character varying(128),
    leavewhenempty character varying(128),
    eventmemberstatus boolean,
    eventwhencalled boolean,
    reportholdtime boolean,
    memberdelay integer,
    weight integer,
    timeoutrestart boolean,
    periodic_announce character varying(128),
    periodic_announce_frequency integer,
    ringinuse boolean,
    setinterfacevar boolean
);


ALTER TABLE public.queues OWNER TO postgres;

--
-- Name: queues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE queues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queues_id_seq OWNER TO postgres;

--
-- Name: queues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE queues_id_seq OWNED BY queues.id;


--
-- Name: queue_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE queue_log (
    id integer NOT NULL,
    time timestamp with time zone DEFAULT now() NOT NULL,
    callid character varying(36),
    queuename character varying(128),
    agent character varying(36),
    event character varying(36),
    data1 character varying(128),
    data2 character varying(128),
    data3 character varying(128),
    data4 character varying(128),
    data5 character varying(128)
);


ALTER TABLE public.queue_log OWNER TO postgres;

--
-- Name: queue_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE queue_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queue_log_id_seq OWNER TO postgres;

--
-- Name: queue_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE queue_log_id_seq OWNED BY queue_log.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cdr ALTER COLUMN id SET DEFAULT nextval('cdr_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sip ALTER COLUMN id SET DEFAULT nextval('sip_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sip_regs ALTER COLUMN id SET DEFAULT nextval('sip_regs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY queue_members ALTER COLUMN id SET DEFAULT nextval('queue_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY queues ALTER COLUMN id SET DEFAULT nextval('queues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY queue_log ALTER COLUMN id SET DEFAULT nextval('queue_log_id_seq'::regclass);


--
-- Data for Name: cdr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cdr (id, calldate, clid, src, dst, dcontext, channel, dstchannel, lastapp, lastdata, duration, billsec, disposition, amaflags, accountcode, uniqueid, userfield) FROM stdin;
\.


--
-- Name: cdr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cdr_id_seq', 1, false);


--
-- Data for Name: sip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sip (id, name, accountcode, amaflags, callcounter, busylevel, allowoverlap, allowsubscribe, videosupport, maxcallbitrate, rfc2833compensate, "session-timers", "session-expires", "session-minse", "session-refresher", t38pt_usertpsource, sendrpid, outboundproxy, callbackextension, timert1, timerb, qualifyfreq, constantssrc, contactpermit, contactdeny, usereqphone, textsupport, faxdetect, buggymwi, auth, fullname, trunkname, cid_number, callingpres, mohinterpret, mohsuggest, parkinglot, hasvoicemail, subscribemwi, vmexten, autoframing, rtpkeepalive, "call-limit", g726nonstandard, ignoresdpversion, allowtransfer, dynamic, sippasswd, callgroup, callerid, directmedia, context, defaultip, dtmfmode, fromuser, fromdomain, host, insecure, trustrpid, progressinband, promiscredir, useclientcode, setvar, language, mailbox, md5secret, transport, nat, permit, deny, mask, pickupgroup, port, qualify, restrictcid, rtptimeout, rtpholdtimeout, secret, remotesecret, type, username, disallow, allow, musiconhold, regseconds, ipaddr, regexten, cancallforward, canreinvite, lastms, useragent, defaultuser, fullcontact, regserver, subscribecontext, avpf, encryption, force_avp, dtlsenable, dtlsverify, dtlscertfile, dtlsprivatekey, dtlssetup, directrtpsetup, icesupport) FROM stdin;
\.


--
-- Name: sip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sip_id_seq', 1, false);


--
-- Data for Name: sip_regs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sip_regs (id, name, fullcontact, ipaddr, port, username, regserver, regseconds, defaultuser, useragent, lastms) FROM stdin;
\.


--
-- Name: sip_regs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sip_regs_id_seq', 1, false);


--
-- Data for Name: queue_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY queue_members (id, uniqueid, membername, queue_name, interface, penalty, paused) FROM stdin;
\.


--
-- Name: queue_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('queue_members_id_seq', 1, false);


--
-- Data for Name: queues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY queues (id, name, musiconhold, announce, context, timeout, monitor_join, monitor_format, queue_youarenext, queue_thereare, queue_callswaiting, queue_holdtime, queue_minutes, queue_seconds, queue_lessthan, queue_thankyou, queue_reporthold, announce_frequency, announce_round_seconds, announce_holdtime, retry, wrapuptime, maxlen, servicelevel, strategy, joinempty, leavewhenempty, eventmemberstatus, eventwhencalled, reportholdtime, memberdelay, weight, timeoutrestart, periodic_announce, periodic_announce_frequency, ringinuse, setinterfacevar) FROM stdin;
\.


--
-- Name: queues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('queues_id_seq', 1, false);


--
-- Data for Name: queue_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY queue_log (id, time, callid, queuename, agent, event, data1, data2, data3, data4, data5) FROM stdin;
\.


--
-- Name: queue_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('queue_log_id_seq', 1, false);


--
-- Name: cdr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cdr
    ADD CONSTRAINT cdr_pkey PRIMARY KEY (id);


--
-- Name: sip_conf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sip
    ADD CONSTRAINT sip_conf_pkey PRIMARY KEY (id);


--
-- Name: sip_regs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sip_regs
    ADD CONSTRAINT sip_regs_pkey PRIMARY KEY (id);


--
-- Name: queue_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY queue_members
    ADD CONSTRAINT queue_members_pkey PRIMARY KEY (id);


--
-- Name: queues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY queues
    ADD CONSTRAINT queues_pkey PRIMARY KEY (id);


--
-- Name: sip_regs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY queue_log
    ADD CONSTRAINT queue_log_pkey PRIMARY KEY (id);


--
-- Name: accountcode; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX accountcode ON cdr USING btree (accountcode);


--
-- Name: calldate; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX calldate ON cdr USING btree (calldate);


--
-- Name: dst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX dst ON cdr USING btree (dst);


--
-- Name: name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX name ON sip USING btree (name);


--
-- Name: name_sip_regs; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX name_sip_regs ON sip_regs USING btree (name);


--
-- Name: src; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX src ON cdr USING btree (src);


--
-- Name: uniqueid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX uniqueid ON cdr USING btree (uniqueid);


--
-- Name: queue_member_interface; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX queue_member_interface ON queue_members USING btree (queue_name, interface);


--
-- Name: queue_member_uniqueid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX queue_member_uniqueid ON queue_members USING btree (uniqueid);


--
-- Name: name_queues; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX name_queues ON queues USING btree (name);


--
-- Name: eventdate; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX eventdate ON queue_log USING btree (time);


--
-- Name: cdr_uniqueid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cdr_uniqueid ON queue_log USING btree (callid);


--
-- Name: queuename; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX queuename ON queue_log USING btree (queuename);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

