local width, height = term.getSize()
local tab = 1
local last_input = nil
local waiting_for_input = false

function redrawScreen()
    term.setCursorBlink(false)
    term.setBackgroundColor(colors.black)
    term.clear()

    -- Draw top bar background
    term.setCursorPos(1, 1)
    term.setBackgroundColor(colors.green)
    term.clearLine()

    -- Draw single tab
    local tab_label = " Playlist Downloader "
    local x = math.floor((width - #tab_label) / 2) + 1
    term.setCursorPos(x, 1)
    term.setTextColor(colors.black)
    term.setBackgroundColor(colors.green)
    term.write(tab_label)

    -- Draw search bar
    paintutils.drawFilledBox(2, 3, width-1, 5, colors.lightGray)
    term.setBackgroundColor(colors.lightGray)
    term.setCursorPos(3, 4)
    term.setTextColor(colors.black)
    term.write(last_input or "Paste URL here...")

    -- Usage/help text below search bar
    term.setCursorPos(2, 7)
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.lightGray)
    print("Usage: ")
    print(" ")
    print("  - Paste a direct file URL")
    print("  - Press Enter to download")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
    print(" by AriesLR")
end

function uiLoop()
    redrawScreen()
    while true do
        if not waiting_for_input then
            local event, button, x, y = os.pullEvent("mouse_click")
            if y >= 3 and y <= 5 and x >= 1 and x <= width-1 then
                paintutils.drawFilledBox(2, 3, width-1, 5, colors.white)
                term.setBackgroundColor(colors.white)
                term.setCursorPos(3, 4)
                term.setTextColor(colors.black)
                last_input = read()
                waiting_for_input = true
            end
        else
            if last_input and #last_input > 0 then
                term.setBackgroundColor(colors.black)
                term.setTextColor(colors.lightGray)
                term.setCursorPos(2, 7)
                -- Download using wget to /alr
                shell.run("wget", last_input, "/alr/playlist.json")
                term.setCursorPos(2, 12)
                term.write("Done! Press any key to continue.")
                os.pullEvent("key")
                last_input = nil
                waiting_for_input = false
                redrawScreen()
            else
                waiting_for_input = false
                redrawScreen()
            end
        end
    end
end

uiLoop()