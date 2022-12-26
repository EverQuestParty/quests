# EverQuest Party Quests

## Prepare definitions
- Clone [eqemu definitions](https://github.com/xackery/eqemu-definitions) to c:\src\lua-definitions\eqemu-definitions
- [In vscode, get lua definition server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
- Create a folder .vscode, and inside it make a settings.json with the following contents:
```json
{
    "Lua.runtime.version": "LuaJIT",
    "Lua.workspace.library": [
        "/src/lua-definitions/eqemu-definitions"
    ],
    "Lua.diagnostics.disable": [
        "lowercase-global"
    ],
}
```