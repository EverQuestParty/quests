---@param e PlayerEventtargetchange
function event_target_change(e)
    e.self:Say(e.self:GetTarget():GetName())
end

doorCoords = {
    "h1", "g1", "f1", "e1", "d1", "c1", "b1", "a1",
    "h2", "g2", "f2", "e2", "d2", "c2", "b2", "a2",
    "h3", "g3", "f3", "e3", "d3", "c3", "b3", "a3",
    "h4", "g4", "f4", "e4", "d", "c4", "b4", "a4",
    "h5", "g5", "f5", "e5", "d5", "c5", "b5", "a5",
    "h6", "g6", "f6", "e6", "d6", "c6", "b6", "a6",
    "h7", "g7", "f7", "e7", "d7", "c7", "b7", "a7",
    "h8", "g8", "f8", "e8", "d8", "c8", "b8", "a8",
}


---@param e PlayerEventclickdoor
function event_click_door(e)
    e.self:Say("click door id " .. e.door:GetDoorID() .. " at " .. e.door:GetX() .. ", " .. e.door:GetY() .. ", coord " .. doorCoords[e.door:GetDoorID()])

    local rest_lib = require("rest");
    local result, err = rest_lib.request("GET", "https://jsonplaceholder.typicode.com/todos/1") --"http://localhost:8080?action=move&move=" .. doorCoords[e.door:GetDoorID()]);
    if err or result == nil then
        e.self:Message(0, "failed request: " .. err)
        return
    end

    require ("lib/utils")
    var_dump(result)
   e.self:Message(0, "dump: " .. result.title)
end


---@param e PlayerEventclickobject
function event_click_object(e)
    e.self:Say("click object id " .. e.object:GetDBID() .. " at " .. e.object:GetX() .. ", " .. e.object:GetY())
end