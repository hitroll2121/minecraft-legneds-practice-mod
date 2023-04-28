@echo off

set "filePath=../Content/data/resource_packs/badger_base/gamelayer/launcher/game_mode.json"
set "filePath2=../Content/data/resource_packs/badger_base/texts/en_US.lang"
set "sourceDir=images"
set "destDir=../Content/data/resource_packs/badger_base/textures-hbui/hub_screen"
set "sourceDir1=gamerules"
set "destDir1=../Content/data/resource_packs/badger_base/custom_game_rules"
set "destDir2=../Content/data/resource_packs/badger_base/game_rules"

set "gameMode={\"name\": \"flatland\", \"parent\": \"conquest_multiplayer\", \"lobby_session_template_name\": \"BadgerLobby_8p\", \"game_session_template_name\": \"BadgerGame_8p\", \"lobby_title\": \"hbui.lobby.conquest_private.title\", \"max_players\": 16, \"requires_online_premium\": true, \"telemetry_name\": \"PVP_Private\", \"activity_enabled\": true}"
set "host={\"name\": \"flatland\"}"

echo Removing changes made by the script...

echo Restoring original game mode file...
powershell -Command "(Get-Content %filePath%) | ForEach-Object { $_ -replace '\r','' } | Set-Content %filePath% -Force"
powershell -Command "$json = Get-Content %filePath% -Raw | ConvertFrom-Json; $json.game_modes = $json.game_modes | Where-Object { $_.name -ne 'flatland' }; $json.multiplayer_hub_host_list = $json.multiplayer_hub_host_list | Where-Object { $_.name -ne 'flatland' }; $json | ConvertTo-Json -Depth 100 | Set-Content %filePath%"
echo Game mode file has been updated.

echo Original game mode file has been restored.

echo Restoring original language file...
powershell -Command "$text = Get-Content %filePath2%; $text = $text | Where-Object { $_ -notmatch 'hbui.hubScreen.pvpMode.flatland.description=' -and $_ -notmatch 'hbui.hubScreen.pvpMode.flatland.title=' }; $text | Set-Content %filePath2%"
echo Original language file has been restored.

echo Removing image files...
del "%destDir%\flatland.png"
del "%destDir%\flatland_highlight.png"
del "%destDir%\flatland_default.png"
echo Image files have been removed.

echo Removing game rule files...
del "%destDir1%\custom_game_rules_flatland.json"
del "%destDir2%\game_rules_flatland.json"
echo Game rule files have been removed.

echo All changes made by the script have been removed.
