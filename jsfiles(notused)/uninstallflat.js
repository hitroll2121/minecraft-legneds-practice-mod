const fs = require('fs');

const filePath = '../Content/data/resource_packs/badger_base/gamelayer/launcher/game_mode.json';
const gameModeName = "flatland";

fs.readFile(filePath, 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }

  const json = JSON.parse(data);

  // Remove game mode with the specified name
  json.game_modes = json.game_modes.filter(mode => mode.name !== gameModeName);

  // Remove host with the specified name
  json.multiplayer_hub_host_list = json.multiplayer_hub_host_list.filter(host => host.name !== gameModeName);

  const jsonString = JSON.stringify(json, null, 2);

  fs.writeFile(filePath, jsonString, 'utf8', err => {
    if (err) {
      console.error(err);
      return;
    }
    console.log('JSON file has been updated.');
  });
});
