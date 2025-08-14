local scriptUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/program/spoticraft-logic.lua"
local downloaderUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/program/download-playlist.lua"
local updateUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/program/update.lua"
local uninstallUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/program/uninstall.lua"
local playlistsUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/playlists/default/playlists.json"
local targetDir = "/alr"

-- Ensure the directory exists
if not fs.exists(targetDir) then
    print("Creating directory " .. targetDir)
    fs.makeDir(targetDir)
end

-- Download from raw URL
local function downloadFile(url, dir)
    local fileName = url:match(".+/([^/]+)$")
    local fullPath = dir .. "/" .. fileName

    print("Downloading " .. fileName .. " to " .. dir .. "...")
    local res = http.get(url)
    if res then
        local f = fs.open(fullPath, "w")
        f.write(res.readAll())
        f.close()
        res.close()
        print(fileName .. " downloaded successfully.")
    else
        print("Failed to download " .. fileName)
    end

    return fullPath
end

-- Download main script
local mainScriptPath = downloadFile(scriptUrl, targetDir)

-- Download uninstaller
downloadFile(uninstallUrl, targetDir)

-- Download updater
downloadFile(updateUrl, targetDir)

-- Download playlist downloader
downloadFile(downloaderUrl, targetDir)

-- Download playlists.json
local playlistsPath = targetDir .. "/playlists.json"
if not fs.exists(playlistsPath) then
    downloadFile(playlistsUrl, targetDir)
else
    print("playlists.json already exists, skipping download.")
end

-- Run the main script
print("Running " .. mainScriptPath .. "...")
shell.run(mainScriptPath)
