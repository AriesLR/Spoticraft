local scriptUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/program/spoticraft-logic.lua"
local uninstallUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/program/uninstall.lua"
local playlistsUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/lib/playlists/default/playlists.json"
local targetDir = "/alr"

-- Ensure the directory exists
if not fs.exists(targetDir) then
    print("Creating directory " .. targetDir)
    fs.makeDir(targetDir)
end

-- Function to download a file (always busts cache)
local function downloadFile(url, dir)
    -- Append a timestamp to force fresh download
    local bustUrl = url .. "?t=" .. tostring(os.epoch("utc"))
    local fileName = url:match(".+/([^/]+)$")
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
