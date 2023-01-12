--copy or symbolic link this file to /server/lua_modules/, it will not work in /server/quests/lua_modules/

local commands_path = "lua_modules/commands/";
local commands      = { };

commands["endurance"] = { 50,  require(commands_path .. "endurance") };

function eq.DispatchCommands(e)
	local command = commands[e.command];

	for k,v in pairs(e.args) do
		eq.debug("[command.lua] key " .. k .. ' value ' .. v);
	end

	if(command) then
		local access = command[1];
		if(access > e.self:Admin()) then
			e.self:Message(13, "Access level not high enough.");
			return 1;
		end

		local func = command[2];
		func(e);
		return 1;
	end
	return 0;
end
