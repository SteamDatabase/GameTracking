## Game Tracker

Tracking things, so you don't have to.

### How files are tracked

- [`files.json`](/files.json) is a mapping of depot ids and which files to download from them.
- [`depots_mapping.json`](/depots_mapping.json) specifies which folder each depot should download to.
- [`common.sh`](/common.sh) provides common function used for dumping or decompiling files.
- [`update.sh`](/update.sh) in this repository is only invoked if a folder does not have its own `update.sh` file.

Some folders (such as `dota`) are [ignored](/.gitignore) in this repository, and instead are tracked in [GameTracking-Dota2](https://github.com/SteamDatabase/GameTracking-Dota2) repository.

For example, [`dota/update.sh`](https://github.com/SteamDatabase/GameTracking-Dota2/blob/master/update.sh) is run when the game is updated.

## Join our Discord

[![Join our Discord](https://discord.com/api/guilds/467730051622764565/embed.png?style=banner2)](https://steamdb.info/discord/)
