local scriptUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/program/spoticraft-logic.lua"
local uninstallUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/program/spoticraft-uninstall.lua"
local playlistsUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/playlists/default/playlists.json"
local targetDir = "/alr"

-- Ensure the directory exists
if not fs.exists(targetDir) then
    print("Creating directory " .. targetDir)
    fs.makeDir(targetDir)
end

-- Function to download a file if it doesn't exist
local function downloadIfMissing(url, dir)
    local fileName = url:match(".+/([^/]+)$")
    local fullPath = dir .. "/" .. fileName

    if not fs.exists(fullPath) then
        print("Downloading " .. fileName .. " to " .. dir .. "...")
        shell.run("wget " .. url .. " " .. fullPath)
    else
        print(fileName .. " already exists. Skipping download.")
    end

    return fullPath
end

-- Download main script
local mainScriptPath = downloadIfMissing(scriptUrl, targetDir)

-- Download uninstaller
downloadIfMissing(uninstallUrl, targetDir)

-- Download playlists.json
downloadIfMissing(playlistsUrl, targetDir)

-- Run the main script
print("Running " .. mainScriptPath .. "...")
shell.run(mainScriptPath)
