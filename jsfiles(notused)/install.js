const fs = require('fs');

const filePath = '../Content/data/resource_packs/badger_base/gamelayer/launcher/game_mode.json';
const gameMode = {
  "name": "flatland",
  "parent": "conquest_multiplayer",
  "lobby_session_template_name": "BadgerLobby_8p",
  "game_session_template_name": "BadgerGame_8p",
  "lobby_title": "hbui.lobby.conquest_private.title",
  "max_players": 16,
  "requires_online_premium": true,
  "telemetry_name": "PVP_Private",
  "activity_enabled": true
};
const host = {
  "name": "flatland"
};

fs.readFile(filePath, 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }

  const json = JSON.parse(data);
  json.game_modes.push(gameMode);
  json.multiplayer_hub_host_list.push(host);

  const jsonString = JSON.stringify(json, null, 2);

  fs.writeFile(filePath, jsonString, 'utf8', err => {
    if (err) {
      console.error(err);
      return;
    }
    console.log('JSON file has been updated.');
  });
});


const filePath2 = '../Content/data/resource_packs/badger_base/texts/en_US.lang';
const newDescription = 'hbui.hubScreen.pvpMode.flatland.description=A place with infinite resources and no piglins';
const newTitle = 'hbui.hubScreen.pvpMode.flatland.title=flatland';

fs.appendFileSync(filePath2, '\n' + newDescription + '\n' + newTitle);




const path = require('path');

const sourceDir = 'images';
const destDir = '../Content/data/resource_packs/badger_base/textures-hbui/hub_screen';

const filesToCopy = ['flatland.png', 'flatland_highlight.png', 'flatland_default.png'];

filesToCopy.forEach(filename => {
  const sourcePath = path.join(sourceDir, filename);
  const destPath = path.join(destDir, filename);
  
  fs.copyFileSync(sourcePath, destPath);
});



const sourceDir1 = 'gamerules';
const destDir1 = '../Content/data/resource_packs/badger_base/custom_game_rules';
const destDir2 = '../Content/data/resource_packs/badger_base/game_rules';

const filesToCopy2 = ['custom_game_rules_flatland.json', 'game_rules_flatland.json'];

// Copy the first file to the first destination directory
const firstFilename = filesToCopy2[0];
const firstSourcePath = path.join(sourceDir1, firstFilename);
const firstDestPath = path.join(destDir1, firstFilename);
fs.copyFileSync(firstSourcePath, firstDestPath);

// Copy the second file to the second destination directory
const secondFilename = filesToCopy2[1];
const secondSourcePath = path.join(sourceDir1, secondFilename);
const secondDestPath = path.join(destDir2, secondFilename);
fs.copyFileSync(secondSourcePath, secondDestPath);
