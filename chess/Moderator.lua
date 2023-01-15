local rest_lib = require("rest");

---@param e NPCEventSay
function event_say(e)
    local key = string.format("%d-chess-session", e.other:CharacterID())
    local session = eq.get_data(key)
    if(e.message:findi("board")) then
        if session == "" then
            e.self:Say("no session started")
            return
        end

        local result, err = rest_lib.request("GET", string.format("http://127.0.0.1/?action=board&session=%s", session), 6969);
        if err or result == nil then
            e.self:Say("failed board request: " .. err)
            return
        end
    
        e.self:Say("board " .. result.Board)
        return
    end

    if(e.message:findi("new chess")) then
        local result, err = rest_lib.request("GET", string.format("http://127.0.0.1/?action=new"), 6969);
        if err or result == nil then
            e.self:Say("failed new request: " .. err)
            return
        end
        eq.set_data(key, result.Session)
        e.self:Say("created session " .. result.Session)
        return
    end
    if session == "" then
        e.self:Say(string.format("Looking to start a [%s] session?", eq.say_link("new chess", false, "new chess")))
        return
    end
    e.self:Say(string.format("session %s already started", session))
end