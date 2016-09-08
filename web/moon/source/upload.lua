#!/usr/bin/env luajit

-- Turn it up, turn it up, turn it up, fucked up loud

local upload = require "resty.upload"
local cjson = require "cjson"
local socket = require "socket"
local uuid = require "uuid"
local zmq = require "lzmq"

-- init uuid random seed
uuid.randomseed(socket.gettime()*10000)

local context = zmq.init(1)
local publisher = context:socket(zmq.PUB)

local chunk_size = 4096
local file
local file_name
local upload_uuid = uuid()
local message
local message_string
local topic = "upload"
local von_count = 1
local stuff = {}
local form, err = upload:new(chunk_size)

-- report the upload to another process by message passing. 

publisher:connect("tcp://msg.nonsense.ws:8132")

if not form then
    ngx.log(ngx.ERR, "failed to new upload: ", err)
    ngx.exit(500)
end

while true do
    local typ, res, err = form:read()
    if not typ then
        ngx.say("failed to read: ", err)
        return
    end
    if typ == "header" then
        file_name = uuid()
        if file_name then
            file = io.open("/tmp/" .. file_name, "w+")
            stuff[von_count] = {uuid = file_name}
            von_count = von_count + 1

            if not file then
                ngx.say("failed to open file ", file_name)
                return
            end
        end

    elseif typ == "body" then
        if file then
            file:write(res)
        end

    elseif typ == "part_end" then
        file:close()
        file = nil

    elseif typ == "eof" then
        stuff["uuid"] = upload_uuid
        message = cjson.encode(stuff)
        message_string = string.format("%s %s", topic, message)
        publisher:send(message_string)
        ngx.say(message)
        break

    else
        -- do nothing
    end
end