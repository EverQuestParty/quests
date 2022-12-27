---@type NPC

---@type { [string]:string }
Players = {}

local outOpcode = 0x6969
local inOpcode = 0x6969

---@param e PlayerEvententerzone
function event_enter_zone(e)
    local pack = Packet(outOpcode, 212, true);
	pack:WriteInt64(64, 0x11223344556677); -- SessionID (reply packet contains it)
	pack:WriteInt8(72, 10); -- total options
    
	for i = 0,10,1 do
		pack:WriteInt16((i*12)+96, 280); -- ZoneID
		pack:WriteInt16((i*12)+98, 1); -- Unknown
		pack:WriteInt32((i*12)+100, i+1); -- Player Count
		pack:WriteInt32((i*12)+104, i+1); -- Instance ID (not displayed)
	end
    eq.set_timer(e.self:GetName(), 6000)
	e.self:QueuePacket(pack);
end

---@param e PlayerEventtimer
function event_timer(e)
    if Players[e.timer] == nil then
        --TODO: disconnect
    end
    Players[e.self:GetName()] = nil
end

---@param e PlayerEventplayerpacket
function event_player_packet(e)
    if e.packet.GetRawOpcode() == inOpcode then
        e.self:Say("Got packet from "..e.self:GetName())
        Players[e.self:GetName()] = "1"
    end
end