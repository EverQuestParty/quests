---@type NPC

---@type { [number]:string }
Players = {}

local outOpcode = 0x6969
local inOpcode = 0x6969

---@param e PlayerEvententerzone
function event_enter_zone(e)
    local pack = Packet(outOpcode, 2, true)
	pack:WriteInt16(outOpcode)
    e.self:QueuePacket(pack)
    eq.set_timer(tostring(e.self:CharacterID()), 6000)
    e.self:Say("send challenge")
end

---@param e PlayerEventtimer
function event_timer(e)
    if Players[e.timer] == nil then
        e.self:Say("todo: disconnect")
        eq.stop_timer(e.timer)
        return
    end
    Players[e.self:CharacterID()] = nil
end

---@param e PlayerEventunhandledopcode
function event_unhandled_opcode(e)
    e.self:Say(string.format("got packet 0x%x", e.packet:GetOpcode()))
    if e.packet:GetOpcode() == inOpcode then
        e.self:Say("Got packet from "..e.self:CharacterID())
        Players[tostring(e.self:CharacterID())] = "1"
    end
end