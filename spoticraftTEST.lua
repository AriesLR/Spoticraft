-- spoticraft.lua
local scriptUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/spoticraft-logicTEST.lua"
local playlistsUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/playlists.json"
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

-- Download playlists.json
downloadIfMissing(playlistsUrl, targetDir)

-- Run the main script
print("Running " .. mainScriptPath .. "...")
shell.run(mainScriptPath)
