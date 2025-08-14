-- Delete uninstall.lua
if fs.exists("/alr/uninstall.lua") then
    print("Deleting uninstall.lua...")
    fs.delete("/alr/uninstall.lua")
else
    print("uninstall.lua not found, skipping...")
end

-- Delete spoticraft-logic.lua
if fs.exists("/alr/spoticraft-logic.lua") then
    print("Deleting spoticraft-logic.lua...")
    fs.delete("/alr/spoticraft-logic.lua")
else
    print("spoticraft-logic.lua not found, skipping...")
end

-- Delete download-playlist.lua
if fs.exists("/alr/download-playlist.lua") then
    print("Deleting download-playlist.lua...")
    fs.delete("/alr/download-playlist.lua")
else
    print("download-playlist.lua not found, skipping...")
end

-- Delete spoticraft.lua
if fs.exists("/spoticraft.lua") then
    print("Deleting spoticraft.lua...")
    fs.delete("/spoticraft.lua")
else
    print("spoticraft.lua not found, skipping...")
end

-- Temporary script to delete this script after it finishes
local selfPath = "/alr/update.lua"
local temp = fs.open("/delete_self.lua", "w")
temp.write([[
sleep(0.5)
fs.delete("]] .. selfPath .. [[")
fs.delete("/delete_self.lua")

-- Download the latest version of spoticraft.lua
shell.run("wget https://raw.githubusercontent.com/AriesLR/Spoticraft/refs/heads/main/spoticraft.lua /spoticraft.lua")

-- Run the updated script
shell.run("/spoticraft.lua")
]])
temp.close()

-- Run the temporary delete_self script
shell.run("/delete_self.lua")
print("Update complete!")