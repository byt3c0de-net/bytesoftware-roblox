--[[
Byte Software - ERV Hub
---------------------------------
Credits:
  - Byt3c0de (www.byt3c0de.net | @byt3c0de.net)
  - Byte Software (www.bytesoftware.net | discord.gg/bytesoftware)
  - Everyone who has supported me on this journey

I’ve created these scripts and am sharing them openly so that others can learn, experiment, and build amazing projects. 
I hope my code inspires creativity and helps you on your own development journey!

Have fun coding!
]]

local Library = loadstring(game:HttpGet("https://bytesoftware.net/roblox/ervhub/library.lua"))()

local TeleportService = game:GetService("TeleportService")
local placeId = game.PlaceId
local player = game.Players.LocalPlayer

local Player = game:GetService("Players").LocalPlayer
local antiKickConnection
local globalTarget = nil
local gunName = ""

local autoKill = false
local autoGun = false

local function LowestPlayer()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"
    local _place = game.PlaceId
    local _servers = Api .. _place .. "/servers/Public?sortOrder=Asc&limit=100"
    function ListServers(cursor)
        local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
        return Http:JSONDecode(Raw)
    end
    local Server, Next
    repeat
        local Servers = ListServers(Next)
        Server = Servers.data[1]
        Next = Servers.nextPageCursor
    until Server
    TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
end

local function Rejoin()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
end

local function Serverhop()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"
    local _place = game.PlaceId
    local _servers = Api .. _place .. "/servers/Public?sortOrder=Desc&limit=100"
    function ListServers(cursor)
        local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
        return Http:JSONDecode(Raw)
    end
    local Server, Next
    repeat
        local Servers = ListServers(Next)
        Server = nil
        for _, s in ipairs(Servers.data) do
            if s.maxPlayers > s.playing then
                Server = s
                break
            end
        end
        Next = Servers.nextPageCursor
    until Server
    TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
end

local Window = Library:CreateWindow("ERV Hub", "Zombie Attack")

local Tab1 = Window:CreateTab("97943845400322")
local Tab2 = Window:CreateTab("78413794210216")
local Tab3 = Window:CreateTab("119720224175089")
local Tab4 = Window:CreateTab("91133292164917")
local Tab5 = Window:CreateTab("139340575789519")

Tab1:CreateSection("General Farming")
Tab1:CreateToggle(
    "Auto Kill",
    function(state)
        if state then
            autoKill = true

            local groundDistance = 8
            local Player = game:GetService("Players").LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")

            local normalWalkSpeed = Humanoid.WalkSpeed
            local normalJumpPower = Humanoid.JumpPower
            local normalGravity = game.Workspace.Gravity
            local canJump = Humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping)

            Humanoid.WalkSpeed = 0
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            game.Workspace.Gravity = 0

            while autoKill do
                wait()

                local function getNearest()
                    local nearest, dist = nil, 99999
                    for _, v in pairs(game.Workspace.BossFolder:GetChildren()) do
                        if v:FindFirstChild("Head") then
                            local m = (Character.Head.Position - v.Head.Position).magnitude
                            if m < dist then
                                dist = m
                                nearest = v
                            end
                        end
                    end
                    for _, v in pairs(game.Workspace.enemies:GetChildren()) do
                        if v:FindFirstChild("Head") then
                            local m = (Character.Head.Position - v.Head.Position).magnitude
                            if m < dist then
                                dist = m
                                nearest = v
                            end
                        end
                    end
                    return nearest
                end

                Character = Player.Character
                if Character and Character:FindFirstChild("HumanoidRootPart") then
                    local target = getNearest()
                    if target and target:FindFirstChild("Head") and target:FindFirstChild("HumanoidRootPart") then
                        globalTarget = target
                        game:GetService("Workspace").CurrentCamera.CFrame =
                            CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.p, target.Head.Position)
                        Character.HumanoidRootPart.CFrame =
                            target.HumanoidRootPart.CFrame * CFrame.new(0, groundDistance, 9)
                    end

                    if Character and Character:FindFirstChild("HumanoidRootPart") then
                        local velocity = Character.HumanoidRootPart.Velocity
                        Character.HumanoidRootPart.Velocity = Vector3.new(0, velocity.Y, 0)
                    end

                    if globalTarget and globalTarget:FindFirstChild("Head") and Character:FindFirstChildOfClass("Tool") then
                        local tool = Character:FindFirstChildOfClass("Tool")
                        if tool then
                            game.ReplicatedStorage.Gun:FireServer(
                                {
                                    ["Normal"] = Vector3.new(0, 0, 0),
                                    ["Direction"] = globalTarget.Head.Position,
                                    ["Name"] = tool.Name,
                                    ["Hit"] = globalTarget.Head,
                                    ["Origin"] = globalTarget.Head.Position,
                                    ["Pos"] = globalTarget.Head.Position
                                }
                            )
                        end
                    end
                end
            end
        else
            autoKill = false
            globalTarget = nil

            local Character = Player.Character
            if Character then
                local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                if Humanoid then
                    Humanoid.WalkSpeed = Character:GetAttribute("NormalWalkSpeed") or 16
                    Humanoid.JumpPower = Character:GetAttribute("NormalJumpPower") or 50
                    Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end
            game.Workspace.Gravity = Character:GetAttribute("NormalGravity") or 196.2
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        end
    end
)
Tab1:CreateBox(
    "Enter Gun Name",
    function(input)
        gunName = input
    end
)
Tab1:CreateToggle(
    "Auto Equip Gun",
    function(state)
        if state then
            autoGun = true
            while autoGun do
                wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == gunName then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
            end
        else
            autoGun = false
            wait(0.5)
            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
        end
    end
)

Tab1:CreateSection("Miscellaneous Features")
Tab1:CreateButton(
    "Get All Guns",
    function()
        for _, Thing in pairs(game.ReplicatedStorage.Guns:GetChildren()) do
            if Thing:IsA("Tool") then
                Thing.Parent = game.Players.LocalPlayer.Backpack
            end
        end
    end
)
Tab1:CreateButton(
    "Get All Knifes",
    function()
        for _, Thing in pairs(game.ReplicatedStorage.Knives:GetChildren()) do
            if Thing:IsA("Tool") then
                Thing.Parent = game.Players.LocalPlayer.Backpack
            end
        end
    end
)

Tab1:CreateSection("Server Connection")
Tab1:CreateToggle(
    "Anti Idle",
    function(state)
        if state then
            antiKickConnection =
                game:service "Players".LocalPlayer.Idled:connect(
                function()
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
                end
            )
        else
            if antiKickConnection then
                antiKickConnection:Disconnect()
                antiKickConnection = nil
            end
        end
    end
)
Tab1:CreateToggle(
    "Connection Enhancer",
    function(state)
        if state then
            connectionEnhancer = true
            while connectionEnhancer == true do
                wait()
                game:GetService("NetworkClient"):SetOutgoingKBPSLimit(800000)
                game:GetService("NetworkClient"):SetIncomingKBPSLimit(800000)
                wait(5)
            end
        else
            connectionEnhancer = false
        end
    end
)

Tab2:CreateSection("Teleports")
Tab2:CreateButton(
    "Spawn",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(143.896622, -39.7914124, 2512.38745, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end
)
Tab2:CreateButton(
    "Maps",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            66.5044479,
            -39.7914124,
            2467.40869,
            0.999507248,
            -4.64199434e-09,
            -0.0313879475,
            1.8045091e-09,
            1,
            -9.04287987e-08,
            0.0313879475,
            9.03276032e-08,
            0.999507248
        )
    end
)

Tab2:CreateSection("Server Teleports")
Tab2:CreateButton(
    "Lowest Player Count",
    function()
        LowestPlayer()
    end
)
Tab2:CreateButton(
    "Server Hop",
    function()
        Serverhop()
    end
)
Tab2:CreateButton(
    "Rejoin",
    function()
        Rejoin()
    end
)

Tab3:CreateSection("Settings")
Tab3:CreateToggle(
    "Freeze",
    function(state)
        if state then
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = true
        else
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = false
        end
    end
)
Tab3:CreateToggle(
    "Bull",
    function(state)
        if state then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local newProperties = PhysicalProperties.new(30, 0.3, 0.5)
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CustomPhysicalProperties = newProperties
                end
            end
        else
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CustomPhysicalProperties = nil
                end
            end
        end
    end
)
Tab3:CreateBox(
    "Walk Speed",
    function(input)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = input
    end
)
Tab3:CreateBox(
    "Jump Power",
    function(input)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = input
    end
)
Tab3:CreateBox(
    "Hip Height",
    function(input)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = input
    end
)
Tab3:CreateBox(
    "Gravity",
    function(input)
        game.Workspace.Gravity = input
    end
)

Tab4:CreateSection("Player Stats")
Tab4.statsLabel1 = Tab4:CreateLabel("Kills: ")
Tab4.statsLabel2 = Tab4:CreateLabel("Level: ")
Tab4.statsLabel3 = Tab4:CreateLabel("Cash: ")

local function updateStats()
    local player = game.Players.LocalPlayer
    local leaderstats = player:FindFirstChild("leaderstats")

    local function convertFormattedNumber(text)
        if not text then
            return "0"
        end

        local num, suffix = text:match("([%d%.]+)([KMBT]?)")
        if not num then
            return "0"
        end

        num = tonumber(num) or 0

        local multipliers = {K = 1e3, M = 1e6, B = 1e9, T = 1e12}
        local multiplier = multipliers[suffix] or 1
        return tostring(math.floor(num * multiplier))
    end

    local function onStatChanged()
        if leaderstats then
            if leaderstats:FindFirstChild("Kills") then
                Tab4.statsLabel1.SetText("Kills: " .. leaderstats.Kills.Value)
            end
            if leaderstats:FindFirstChild("Level") then
                Tab4.statsLabel2.SetText("Level: " .. leaderstats.Level.Value)
            end
            if leaderstats:FindFirstChild("Cash") then
                Tab4.statsLabel3.SetText("Cash: " .. leaderstats.Cash.Value)
            end
        end
    end

    onStatChanged()
end

task.spawn(
    function()
        while true do
            updateStats()
            task.wait()
        end
    end
)

Tab5:CreateSection("Script Configuration")
Tab5:CreateLabel("Coming soon!")