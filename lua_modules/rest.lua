local rest = {}

---@alias Methods "GET" | "POST" | "DELETE" | "PUT"

---@param method Methods -- Method to request
---@param url string -- URL to request
---@returns data any, error string # returns a data table or error string
function rest.request(method, url)
    local json = require("lib/json")
    local http_request = require("http.request")
    local http_headers = require("http.headers")

    local req_headers = http_headers.new()
    req_headers:append(":method", method)
    local my_req = http_request.new_from_uri(url, req_headers)
    local headers, stream = assert(my_req:go())
    if headers:get ":status" ~= "200" then return nil, string.format("status not 200: %s", headers:get ":status") end
    return json:decode(stream:get_body_as_string()), nil
end

return rest;