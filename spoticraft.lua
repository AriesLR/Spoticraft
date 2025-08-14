-- spoticraft.lua
local scriptUrl = "https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/spoticraft-logic.lua"
local targetDir = "/alr"

-- Ensure the directory exists
if not fs.exists(targetDir) then
    print("Creating directory " .. targetDir)
    fs.makeDir(targetDir)
end

-- Download the script if it doesn't exist
local fileName = scriptUrl:match(".+/([^/]+)$")
local fullPath = targetDir .. "/" .. fileName

if not fs.exists(fullPath) then
    print("Downloading " .. fileName .. " to " .. targetDir .. "...")
    shell.run("wget " .. scriptUrl .. " " .. fullPath)
else
    print(fileName .. " already exists. Skipping download.")
end

-- Run the script
print("Running " .. fullPath .. "...")
shell.run(fullPath)
