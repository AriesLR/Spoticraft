local scriptUrl = "https://github.com/AriesLR/Spoticraft/blob/main/lib/program/spoticraft-logic.lua?raw=1"
local updateUrl = "https://github.com/AriesLR/Spoticraft/blob/main/lib/program/update.lua?raw=1"
local uninstallUrl = "https://github.com/AriesLR/Spoticraft/blob/main/lib/program/uninstall.lua?raw=1"
local playlistsUrl = "https://github.com/AriesLR/Spoticraft/blob/main/lib/playlists/default/playlists.json?raw=1"
local targetDir = "/alr"

-- Ensure the directory exists
if not fs.exists(targetDir) then
    print("Creating directory " .. targetDir)
    fs.makeDir(targetDir)
end

-- Function to download a file (tries to avoid GitHub's cache)
local function downloadFile(url, dir)
    local bustUrl = url .. "&t=" .. tostring(os.epoch("utc"))
    local fileName = url:match(".+/([^/]+)$")
    fileName = fileName:gsub("%?.*$", "")

    local fullPath = dir .. "/" .. fileName

    print("Downloading " .. fileName .. " to " .. dir .. "...")
    local res = http.get(bustUrl)
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
downloadFile(updatelUrl, targetDir)

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
