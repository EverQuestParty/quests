---@param e PlayerEventtargetchange
function event_target_change(e)
    e.self:Say(e.self:GetTarget():GetName())
end

---@param e PlayerEventclickdoor
function event_click_door(e)
    e.self:Say("click door id " .. e.door:GetDoorID() .. " at " .. e.door:GetX() .. ", " .. e.door:GetY())
end


---@param e PlayerEventclickobject
function event_click_object(e)
    e.self:Say("click object id " .. e.object:GetDBID() .. " at " .. e.object:GetX() .. ", " .. e.object:GetY())
end