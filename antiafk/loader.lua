--[[
Byte Software - Anti AFK
---------------------------------
Credits:
  - Byt3c0de (www.byt3c0de.net | @byt3c0de.net)
  - Byte Software (www.bytesoftware.net | discord.gg/bytesoftware)
  - Everyone who has supported me on this journey

I’ve created these scripts and am sharing them openly so that others can learn, experiment, and build amazing projects. 
I hope my code inspires creativity and helps you on your own development journey!

Have fun coding!
]]

local Library = loadstring(game:HttpGet("https://bytesoftware.net/roblox/antiafk/library.lua", true))()

local Window = Library:CreateWindow("Anti AFK")

Window.statusLabel1 = Window:CreateLabel("Status: Off")

Window:CreateToggle(
    "Enable Anti AFK",
    function(state)
        if state then
            Window.statusLabel1.SetText("Status: On")
            antiKickConnection =
                game:GetService("Players").LocalPlayer.Idled:Connect(
                function()
                    local vu = game:GetService("VirtualUser")
                    vu:CaptureController()
                    vu:ClickButton2(Vector2.new())
                end
            )
        elseif antiKickConnection then
            Window.statusLabel1.SetText("Status: Off")
            antiKickConnection:Disconnect()
            antiKickConnection = nil
        end
    end
)

Window:CreateButton(
    "Reset",
    function(state)
        if game.CoreGui:FindFirstChild("Tools") then
            game.CoreGui:FindFirstChild("Tools"):Destroy()
        end
        if antiKickConnection then
            pcall(
                function()
                    antiKickConnection:Disconnect()
                end
            )
            antiKickConnection = nil
        end
        loadstring(game:HttpGet("https://bytesoftware.net/roblox/antiafk/loader.lua", true))()
    end
)