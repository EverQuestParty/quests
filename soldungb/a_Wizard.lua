---@type NPC

local outOpcode = 0x6969

---@param e NPCEventSay
function event_say(e)
	--if e.message:findi("hail") then	
    eq.popup("EverQuest Party", "EveryQuest Party!! <br><br><a href=\"https://discord.gg/VNp26UZEkR\">Check out Discord</a><br><br><a href=\"https://github.com/EverQuestParty/client/releases/download/latest/eqparty.exe\">Download Patcher</a>", 10, 0, 0)
    --return
    --end
	
	local pack = Packet(outOpcode, 2, true)
	pack:WriteInt16(outOpcode)
    e.other:QueuePacket(pack)
    e.other:Say("send challenge")
end

---@param e NPCEventTrade
function event_trade(e)
end
