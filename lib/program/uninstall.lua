-- Delete the /alr folder and everything inside it
if fs.exists("/alr") then
    print("Deleting /alr folder and its contents...")
    fs.delete("/alr")
else
    print("/alr folder not found, skipping...")
end

-- Delete spoticraft.lua
if fs.exists("/spoticraft.lua") then
    print("Deleting spoticraft.lua...")
    fs.delete("/spoticraft.lua")
else
    print("spoticraft.lua not found, skipping...")
end

-- Temporary script to delete this script after it finishes
local selfPath = "/alr/uninstall.lua"
local temp = fs.open("/delete_self.lua", "w")
temp.write([[
sleep(0.5)
fs.delete("]] .. selfPath .. [[")
fs.delete("/delete_self.lua")
]])
temp.close()

-- Run the temporary delete_self script
shell.run("/delete_self.lua")
print("Uninstall complete!")
