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

echo Updating game mode file...
powershell -Command "(Get-Content %filePath%) | ForEach-Object { $_ -replace '\r','' } | Set-Content %filePath% -Force"
powershell -Command "$json = Get-Content %filePath% -Raw | ConvertFrom-Json; $json.game_modes += ConvertFrom-Json '%gameMode%'; $json.multiplayer_hub_host_list += ConvertFrom-Json '%host%'; $json | ConvertTo-Json -Depth 100 | Set-Content %filePath%"
echo Game mode file has been updated.

echo Updating language file...
set "newDescription=hbui.hubScreen.pvpMode.flatland.description=A place with infinite resources and no piglins"
set "newTitle=hbui.hubScreen.pvpMode.flatland.title=flatland"
echo %newDescription%>> %filePath2%
echo %newTitle%>> %filePath2%
echo Language file has been updated.

echo Copying image files...
copy "%sourceDir%\flatland.png" "%destDir%" /y
copy "%sourceDir%\flatland_highlight.png" "%destDir%" /y
copy "%sourceDir%\flatland_default.png" "%destDir%" /y
echo Image files have been copied.

echo Copying game rule files...
copy "%sourceDir1%\custom_game_rules_flatland.json" "%destDir1%" /y
copy "%sourceDir1%\game_rules_flatland.json" "%destDir2%" /y
echo Game rule files have been copied.

echo All files have been updated.
