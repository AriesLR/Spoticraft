# Spoticraft - A Music Player for ComputerCraft: Tweaked

## Table of Contents

- [Requirements](#requirements)
- [Features](#features)
- [Installation](#installation)
- [Updating](#updating)
- [Uninstalling](#uninstalling)
- [Playlists](#playlists)
  - [Song Format](#song-format)
  - [Edit Playlists](#edit-playlists)
- [Acknowledgements](#acknowledgements)
- [License](#license)
- [Tips](#tips)

## Requirements

- [Minecraft](https://www.minecraft.net)
  - You're definitely going to need the game.

- [ComputerCraft: Tweaked](https://computercraft.cc)
  - This is a program for a CC: Tweaked computer, of course you need this.

## Features

- **Play Audio from YouTube**
  - Search for videos by name or paste a url into the search field.

- **Create Playlists**
  - Create your own playlist to easily add all songs to the queue.

## Installation

To install **Spoticraft**, simply run these commands:

1. Install via wget by running this command:

    `wget https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/spoticraft.lua`

2. To run the program just type this:

    `spoticraft.lua`

## Updating

Update the current version of **Spoticraft** by running this command:
  
`alr/update.lua`

Your playlists will not be lost during the update process.

## Uninstalling

Uninstall the current version of **Spoticraft** by running this command:
  
`alr/uninstall.lua`

## Playlists

Spoticraft supports custom playlists through a `playlists.json` file. You can edit this file to add, remove, or rearrange songs in your playlists.

#

### Song Format
Each song entry requires a **YouTube video ID** in the `"id"` field. This is the unique code at the end of a YouTube URL.  

Example:  
If the song URL is:  
https://www.youtube.com/watch?v=dQw4w9WgXcQ  

The "id" field should contain:  
`dQw4w9WgXcQ`

#

### Edit Playlists
There are two main ways to edit playlists:

#### Option 1: Edit the Local playlists.json
1. Navigate to the alr/ folder:  
   `cd alr/`
2. Open the playlists file for editing:  
   `edit playlists.json`
3. Add or remove songs as needed.

#### Option 2: Use a Template and the Playlist Downloader
1. Download the [Playlist Template](https://github.com/AriesLR/Spoticraft/releases/download/v1.0.0/playlists.json).
2. Edit the template to your liking.
3. Upload it somewhere accessible online (e.g., GitHub).  
4. Run Spoticraft's playlist downloader:  
   `alr/download-playlist.lua`
5. Paste the URL of your uploaded playlist and press **Enter**.
6. Now load up Spoticraft and enjoy your new playlist.

Example URL for the default playlist on GitHub:  
https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/playlists/default/playlists.json
 
## Acknowledgements
- [Terreng](https://github.com/terreng) - For creating the [base](https://github.com/terreng/computercraft-streaming-music) for this ComputerCraft: Tweaked program.

## License

[MIT License](LICENSE)

## Tips
[Buy Me a Coffee](https://www.buymeacoffee.com/arieslr)


<img src="https://i.imgflip.com/1u2oyu.jpg" alt="I like this doge" width="100">