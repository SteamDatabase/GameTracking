## Game Tracker

Tracking things, so you don't have to.

You will not be able to track games yourself by just cloning this repository,
as the actual game file updating is done by the SteamDB backend. You may be able
to replicate the functionality using steamcmd though.

### How files are tracked

- [`files.json`](/files.json) is a mapping of depot ids and which files to download from them.
- [`depots_mapping.json`](/depots_mapping.json) specifies which folder each depot should download to.
  - it must contain a mapping for the game appid itself.
- [`common.sh`](/common.sh) provides common function used for dumping or decompiling files.

Some folders (such as `dota`) are [ignored](/.gitignore) in this repository,
and instead are tracked in [GameTracking-Dota2](https://github.com/SteamDatabase/GameTracking-Dota2) repository.

All game folders contain a `update.sh` file which is run when the game is updated.

For example, [`hl2/update.sh`](/hl2/update.sh) and
[`dota/update.sh`](https://github.com/SteamDatabase/GameTracking-Dota2/blob/master/update.sh).

## Join our Discord

[![Join our Discord](https://discord.com/api/guilds/467730051622764565/embed.png?style=banner2)](https://steamdb.info/discord/)
