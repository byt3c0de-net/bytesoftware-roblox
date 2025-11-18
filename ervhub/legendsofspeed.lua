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

local ERVLibrary = loadstring(game:HttpGet("https://bytesoftware.net/roblox/ervhub/library.lua"))()

local TeleportService = game:GetService("TeleportService")
local placeId = game.PlaceId
local player = game.Players.LocalPlayer

local Player = game:GetService("Players").LocalPlayer
local antiKickConnection
local race = "V1"
local rebirthSuccessful = false
local rebamount = 0
local optionSpeed = 0
local optionOrb = ""
local optionCity = ""
local optionSpeed2 = 0
local optionOrb2 = ""
local optionCity2 = ""
local premiumOptionSpeed = 0
local premiumOptionOrb = ""
local premiumOptionCity = ""
local optionOrbHit = ""
local optionCityHit = ""
local optionSpeedHit = 0
local optionOrbHit2 = ""
local optionCityHit2 = ""
local optionSpeedHit2 = 0
local selectedbasicpettohatch = ""
local selectedadvancedpettohatch = ""
local selectedrarepettohatch = ""
local selectedepicpettohatch = ""
local selecteduniquepettohatch = ""
local selectedomegapettohatch = ""
local selectedbasicpettoevolve = ""
local selectedadvancedpettoevolve = ""
local selectedrarepettoevolve = ""
local selectedepicpettoevolve = ""
local selecteduniquepettoevolve = ""
local selectedomegapettoevolve = ""
local orbCooldown = 0.4
local autoRebirthStoppingPointCooldown = 0.5
local autoRebirthCooldown = 0.5
local citiesteleport = ""
local otherteleport = ""
local spaceteleport = ""
local desertteleport = ""
local premiumTeleport = ""
local premiumServerTeleport = ""
local entercurrentrebirth = ""
local adaptiveWait = false
local instantRebirthAmount = 0
local optionSpeed3 = 600
local optionOrb3 = ""
local optionCity3 = ""
local optionOrbMultiplierHit = 0
local optionOrbMultiplierHit2 = 0

local oldOrbCooldown = 0.4
local oldOrbSpeed = 600

local oldCityYellowOrb = false
local oldCityOrangeOrb = false
local oldCityBlueOrb = false
local oldCityRedOrb = false
local oldCityEtherealOrb = false
local oldCityGem = false
local oldCityInfernalGem = false

local oldSnowCityYellowOrb = false
local oldSnowCityOrangeOrb = false
local oldSnowCityBlueOrb = false
local oldSnowCityRedOrb = false
local oldSnowCityEtherealOrb = false
local oldSnowCityGem = false
local oldSnowCityInfernalGem = false

local oldMagmaCityYellowOrb = false
local oldMagmaCityOrangeOrb = false
local oldMagmaCityBlueOrb = false
local oldMagmaCityRedOrb = false
local oldMagmaCityEtherealOrb = false
local oldMagmaCityGem = false
local oldMagmaCityInfernalGem = false

local oldLegendsHighwayYellowOrb = false
local oldLegendsHighwayOrangeOrb = false
local oldLegendsHighwayBlueOrb = false
local oldLegendsHighwayRedOrb = false
local oldLegendsHighwayEtherealOrb = false
local oldLegendsHighwayGem = false
local oldLegendsHighwayInfernalGem = false

local oldSpeedJungleYellowOrb = false
local oldSpeedJungleOrangeOrb = false
local oldSpeedJungleBlueOrb = false
local oldSpeedJungleRedOrb = false
local oldSpeedJungleEtherealOrb = false
local oldSpeedJungleGem = false
local oldSpeedJungleInfernalGem = false

local primaryAutoOrbActive = false
local secondaryAutoOrbActive = false
local thirdAutoOrbActive3 = false
local autoRace1 = false
local autoRace2 = false
local autoHoopV1 = false
local autoRebirthStoppingPoint = false
local autoRebirth = false
local connectionEnhancer = false
local hatchBasicPets = false
local hatchAdvancedPets = false
local hatchRarePets = false
local hatchEpicPets = false
local hatchUniquePets = false
local hatchOmegaPets = false
local evolveBasicPets = false
local evolveAdvancedcPets = false
local evolveRarePets = false
local evolveEpicPets = false
local evolveUniquePets = false
local evolveOmegaPets = false
local redCrystal = false
local lightningCrystal = false
local yellowCrystal = false
local purpleCrystal = false
local blueCrystal = false
local snowCrystal = false
local lavaCrystal = false
local infernoCrystal = false
local electroLegendsCrystal = false
local jungleCrystal = false
local spaceCrystal = false
local alienCrystal = false
local desertCrystal = false
local electroCrystal = false

local minPing = 450
local maxPing = 2500

game:GetService("ReplicatedStorage").raceInProgress.Changed:Connect(
    function()
        if autoRace2 == true then
            if game:GetService("ReplicatedStorage").raceInProgress.Value == true then
                game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
            end
        end
    end
)
game:GetService("ReplicatedStorage").raceStarted.Changed:Connect(
    function()
        if autoRace2 == true then
            if game:GetService("ReplicatedStorage").raceStarted.Value == true then
                for i, v in pairs(game:GetService("Workspace").raceMaps:GetChildren()) do
                    local OldFinishPosition = v.finishPart.CFrame
                    v.finishPart.CFrame = Player.Character.HumanoidRootPart.CFrame
                    wait()
                    v.finishPart.CFrame = OldFinishPosition
                end
            end
            wait(2)
        end
    end
)

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

local Window = ERVLibrary:CreateWindow("ERV Hub", "Legends Of Speed")

local Tab1 = Window:CreateTab("97943845400322")
local Tab2 = Window:CreateTab("133560794251495")
local Tab3 = Window:CreateTab("120537707302474")
local Tab14 = Window:CreateTab("109958938379521")
local Tab4 = Window:CreateTab("108289467963312")
local Tab5 = Window:CreateTab("108289467963312")
local Tab6 = Window:CreateTab("126732386711554")
local Tab7 = Window:CreateTab("74340141663614")
local Tab8 = Window:CreateTab("104463835309303")
local Tab9 = Window:CreateTab("78413794210216")
local Tab10 = Window:CreateTab("119720224175089")
local Tab11 = Window:CreateTab("87506200403323")
local Tab12 = Window:CreateTab("91133292164917")
local Tab13 = Window:CreateTab("139340575789519")

Tab1:CreateSection("Race Farming")
Tab1:CreateDropdown(
    "Race Type",
    {"Teleport", "Smooth"},
    function(ddrace)
        if ddrace == "Teleport" then
            race = "V1"
        elseif ddrace == "Smooth" then
            race = "V2"
        end
    end
)
Tab1:CreateToggle(
    "Auto Racing",
    function(state)
        if state then
            if race == "V1" then
                autoRace1 = true
                while autoRace1 do
                    wait()
                    local args = {
                        [1] = "joinRace"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("raceEvent"):FireServer(
                        unpack(args)
                    )
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(48.3109131, 36.3147125, -8680.45312, -1, 0, 0, 0, 1, 0, 0, 0, -1)
                    wait(0.4)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(
                        1686.07495,
                        36.3147125,
                        -5946.63428,
                        -0.984812617,
                        0,
                        0.173621148,
                        0,
                        1,
                        0,
                        -0.173621148,
                        0,
                        -0.984812617
                    )
                    wait(0.4)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(
                        1001.33118,
                        36.3147125,
                        -10986.2178,
                        -0.996191859,
                        0,
                        -0.0871884301,
                        0,
                        1,
                        0,
                        0.0871884301,
                        0,
                        -0.996191859
                    )
                    wait(0.4)
                end
            elseif race == "V2" then
                autoRace2 = true
            end
        else
            autoRace2 = false
            autoRace1 = false
        end
    end
)
Tab1:CreateSection("Hoop Farming")
Tab1:CreateButton(
    "Clean Hoops",
    function()
        local player = game.Players.LocalPlayer
        local hoopGui = player:WaitForChild("PlayerGui"):FindFirstChild("hoopGui")
        if hoopGui then
            local screenGradient = hoopGui:FindFirstChild("screenGradient")
            if screenGradient then
                screenGradient:Destroy()
            end
        end
        local hoopsFolder = game.Workspace:FindFirstChild("Hoops")
        if hoopsFolder then
            for _, hoop in ipairs(hoopsFolder:GetChildren()) do
                local hoopParticle = hoop:FindFirstChild("hoopParticle")
                if hoopParticle then
                    hoopParticle:Destroy()
                end
                local hoopSound = hoop:FindFirstChild("hoopSound")
                if hoopSound then
                    hoopSound:Destroy()
                end
                local playerParticle = hoop:FindFirstChild("playerParticle")
                if playerParticle then
                    playerParticle:Destroy()
                end
            end
        end
    end
)
Tab1:CreateToggle(
    "Auto Hoops",
    function(state)
        if state then
            autoHoopV1 = true
            while autoHoopV1 do
                wait()
                for i, v in pairs(game:GetService("Workspace").Hoops:GetChildren()) do
                    firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                    wait()
                    firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                end
            end
        else
            autoHoopV1 = false
        end
    end
)
Tab1:CreateSection("Rebirth Farming")
Tab1:CreateBox(
    "Enter Rebirth Cooldown",
    function(input)
        local inputNumber = tonumber(input)
        if inputNumber then
            autoRebirthCooldown = inputNumber
        else
            autoRebirthCooldown = 0.5
        end
    end
)
Tab1:CreateToggle(
    "Auto Rebirth",
    function(state)
        if state then
            autoRebirth = true
            while autoRebirth do
                wait()
                game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
                wait(autoRebirthCooldown)
            end
        else
            autoRebirth = false
        end
    end
)
Tab1:CreateSection("Rebirth Target Farming")
Tab1:CreateBox(
    "Rebirth Target",
    function(rebamountbb)
        rebamount = tonumber(rebamountbb) or 0
    end
)
Tab1:CreateBox(
    "Enter Rebirth Cooldown",
    function(input)
        local inputNumber = tonumber(input)
        if inputNumber then
            autoRebirthStoppingPointCooldown = inputNumber
        else
            autoRebirthStoppingPointCooldown = 0.5
        end
    end
)
Tab1:CreateToggle(
    "Auto Rebirth",
    function(state)
        if state then
            autoRebirthStoppingPoint = true
            while autoRebirthStoppingPoint do
                wait()
                local success, err =
                    pcall(
                    function()
                        local rebirthsBefore = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                        game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
                        wait(autoRebirthStoppingPointCooldown)
                        local rebirthsAfter = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                        if rebirthsAfter > rebirthsBefore then
                            rebirthSuccessful = true
                            wait(autoRebirthStoppingPointCooldown)
                            rebirthSuccessful = false
                        end
                        if rebirthsAfter >= rebamount then
                            autoRebirthStoppingPoint = false
                            primaryAutoOrbActive = false
                            secondaryAutoOrbActive = false
                        end
                    end
                )
                if not success then
                    autoRebirthStoppingPoint = false
                    primaryAutoOrbActive = false
                    secondaryAutoOrbActive = false
                end
            end
        else
            autoRebirthStoppingPoint = false
            primaryAutoOrbActive = false
            secondaryAutoOrbActive = false
        end
    end
)

Tab1:CreateSection("Server Connection")
Tab1:CreateBox(
    "Minimum Ping",
    function(input)
        minPing = tonumber(input) or 450
    end
)
Tab1:CreateBox(
    "Maximum Ping",
    function(input)
        maxPing = tonumber(input) or 2500
    end
)
Tab1:CreateToggle(
    "Enable Ping Optimizer",
    function(state)
        pingMonitorActive = state
        if pingMonitorActive then
            spawn(
                function()
                    while pingMonitorActive do
                        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                        ping = tonumber(string.match(ping, "%d+"))
                        if ping and maxPing and ping > maxPing then
                            repeat
                                wait(1)
                                ping =
                                    tonumber(
                                    string.match(
                                        game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                        "%d+"
                                    )
                                )
                            until (ping and ping < minPing) or not pingMonitorActive
                            if pingMonitorActive then
                            end
                        end
                        wait(0.5)
                    end
                end
            )
        end
    end
)
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

Tab1:CreateSection("Trading")
Tab1:CreateToggle(
    "Trading",
    function(state)
        if state then
            local args = {
                [1] = "enableTrading"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("tradingEvent"):FireServer(
                unpack(args)
            )
        else
            local args = {
                [1] = "disableTrading"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("tradingEvent"):FireServer(
                unpack(args)
            )
        end
    end
)
Tab1:CreateBox(
    "Enter Target",
    function(input)
        usernameTrade = input
    end
)
Tab1:CreateButton(
    "Send trade",
    function()
        if usernameTrade and usernameTrade ~= "" then
            local playerTrade = game:GetService("Players")[usernameTrade]
            if playerTrade then
                local args = {
                    [1] = "sendTradeRequest",
                    [2] = playerTrade
                }
                game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer(unpack(args))
            end
        end
    end
)

Tab11:CreateSection("Instant Rebirth Farming")
Tab11:CreateBox(
    "Instant Rebirth Amount",
    function(instantreb)
        instantRebirthAmount = tonumber(instantreb) or 0
    end
)
Tab11:CreateButton(
    "Activate",
    function()
        for i = 1, instantRebirthAmount do
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
        end
    end
)

Tab2:CreateSection("Farming Configuration")
Tab2:CreateBox(
    "Enter Orb Cooldown",
    function(input)
        local inputNumber = tonumber(input)
        if inputNumber then
            orbCooldown = inputNumber / 100
        else
            orbCooldown = 0.4
        end
    end
)
Tab2:CreateSection("First Orb Auto Farm")
Tab2:CreateDropdown(
    "Select Orb",
    {"Yellow Orb", "Orange Orb", "Blue Orb", "Red Orb", "Ethereal Orb", "Gem", "Infernal Gem"},
    function(ddmorbs)
        if ddmorbs == "Yellow Orb" then
            optionOrb = "Yellow Orb"
        elseif ddmorbs == "Orange Orb" then
            optionOrb = "Orange Orb"
        elseif ddmorbs == "Blue Orb" then
            optionOrb = "Blue Orb"
        elseif ddmorbs == "Red Orb" then
            optionOrb = "Red Orb"
        elseif ddmorbs == "Ethereal Orb" then
            optionOrb = "Ethereal Orb"
        elseif ddmorbs == "Gem" then
            optionOrb = "Gem"
        elseif ddmorbs == "Infernal Gem" then
            optionOrb = "Infernal Gem"
        end
    end
)
Tab2:CreateDropdown(
    "Select City",
    {"City", "Snow City", "Magma City", "Legends Highway", "Speed Jungle", "Space", "Desert"},
    function(ddmcities)
        if ddmcities == "City" then
            optionCity = "City"
        elseif ddmcities == "Snow City" then
            optionCity = "Snow City"
        elseif ddmcities == "Magma City" then
            optionCity = "Magma City"
        elseif ddmcities == "Legends Highway" then
            optionCity = "Legends Highway"
        elseif ddmcities == "Speed Jungle" then
            optionCity = "Speed Jungle"
        elseif ddmcities == "Space" then
            optionCity = "Space"
        elseif ddmcities == "Desert" then
            optionCity = "Desert"
        end
    end
)
Tab2:CreateDropdown(
    "Select Orb Multiplier",
    {
        "x400 Orbs",
        "x450 Orbs",
        "x500 Orbs",
        "x550 Orbs",
        "x600 Orbs",
        "x650 Orbs",
        "x700 Orbs",
        "x750 Orbs",
        "x800 Orbs",
        "x850 Orbs",
        "x900 Orbs",
        "x950 Orbs",
        "x1000 Orbs",
        "x1050 Orbs",
        "x1100 Orbs",
        "x1150 Orbs",
        "x1200 Orbs",
        "x1250 Orbs",
        "x1300 Orbs",
        "x1350 Orbs",
        "x1400 Orbs",
        "x1450 Orbs",
        "x1500 Orbs",
        "x1550 Orbs",
        "x1600 Orbs",
        "x1650 Orbs",
        "x1700 Orbs",
        "x1750 Orbs",
        "x1800 Orbs",
        "x1850 Orbs",
        "x1900 Orbs",
        "x1950 Orbs",
        "x2000 Orbs"
    },
    function(ddmspeed)
        if ddmspeed == "x400 Orbs" then
            optionSpeed = 400
        elseif ddmspeed == "x450 Orbs" then
            optionSpeed = 450
        elseif ddmspeed == "x500 Orbs" then
            optionSpeed = 500
        elseif ddmspeed == "x550 Orbs" then
            optionSpeed = 550
        elseif ddmspeed == "x600 Orbs" then
            optionSpeed = 600
        elseif ddmspeed == "x650 Orbs" then
            optionSpeed = 650
        elseif ddmspeed == "x700 Orbs" then
            optionSpeed = 700
        elseif ddmspeed == "x750 Orbs" then
            optionSpeed = 750
        elseif ddmspeed == "x800 Orbs" then
            optionSpeed = 800
        elseif ddmspeed == "x850 Orbs" then
            optionSpeed = 850
        elseif ddmspeed == "x900 Orbs" then
            optionSpeed = 900
        elseif ddmspeed == "x950 Orbs" then
            optionSpeed = 950
        elseif ddmspeed == "x1000 Orbs" then
            optionSpeed = 1000
        elseif ddmspeed == "x1050 Orbs" then
            optionSpeed = 1050
        elseif ddmspeed == "x1100 Orbs" then
            optionSpeed = 1100
        elseif ddmspeed == "x1150 Orbs" then
            optionSpeed = 1150
        elseif ddmspeed == "x1200 Orbs" then
            optionSpeed = 1200
        elseif ddmspeed == "x1250 Orbs" then
            optionSpeed = 1250
        elseif ddmspeed == "x1300 Orbs" then
            optionSpeed = 1300
        elseif ddmspeed == "x1350 Orbs" then
            optionSpeed = 1350
        elseif ddmspeed == "x1400 Orbs" then
            optionSpeed = 1400
        elseif ddmspeed == "x1450 Orbs" then
            optionSpeed = 1450
        elseif ddmspeed == "x1500 Orbs" then
            optionSpeed = 1500
        elseif ddmspeed == "x1550 Orbs" then
            optionSpeed = 1550
        elseif ddmspeed == "x1600 Orbs" then
            optionSpeed = 1600
        elseif ddmspeed == "x1650 Orbs" then
            optionSpeed = 1650
        elseif ddmspeed == "x1700 Orbs" then
            optionSpeed = 1700
        elseif ddmspeed == "x1750 Orbs" then
            optionSpeed = 1750
        elseif ddmspeed == "x1800 Orbs" then
            optionSpeed = 1800
        elseif ddmspeed == "x1850 Orbs" then
            optionSpeed = 1850
        elseif ddmspeed == "x1900 Orbs" then
            optionSpeed = 1900
        elseif ddmspeed == "x1950 Orbs" then
            optionSpeed = 1950
        elseif ddmspeed == "x2000 Orbs" then
            optionSpeed = 2000
        end
    end
)
Tab2:CreateToggle(
    "Auto Orb",
    function(state)
        if state then
            primaryAutoOrbActive = true
            while primaryAutoOrbActive do
                if not primaryAutoOrbActive then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not primaryAutoOrbActive
                        if not primaryAutoOrbActive then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(optionSpeed / 5)
                local remainingOrbs = optionSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, 1 do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            optionOrb,
                            optionCity
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(orbCooldown)
            end
        else
            primaryAutoOrbActive = false
        end
    end
)
Tab2:CreateSection("Second Orb Auto Farm")
Tab2:CreateDropdown(
    "Select Orb",
    {"Yellow Orb", "Orange Orb", "Blue Orb", "Red Orb", "Ethereal Orb", "Gem", "Infernal Gem"},
    function(ddmorbs)
        if ddmorbs == "Yellow Orb" then
            optionOrb2 = "Yellow Orb"
        elseif ddmorbs == "Orange Orb" then
            optionOrb2 = "Orange Orb"
        elseif ddmorbs == "Blue Orb" then
            optionOrb2 = "Blue Orb"
        elseif ddmorbs == "Red Orb" then
            optionOrb2 = "Red Orb"
        elseif ddmorbs == "Ethereal Orb" then
            optionOrb2 = "Ethereal Orb"
        elseif ddmorbs == "Gem" then
            optionOrb2 = "Gem"
        elseif ddmorbs == "Infernal Gem" then
            optionOrb2 = "Infernal Gem"
        end
    end
)
Tab2:CreateDropdown(
    "Select City",
    {"City", "Snow City", "Magma City", "Legends Highway", "Speed Jungle", "Space", "Desert"},
    function(ddmcities)
        if ddmcities == "City" then
            optionCity2 = "City"
        elseif ddmcities == "Snow City" then
            optionCity2 = "Snow City"
        elseif ddmcities == "Magma City" then
            optionCity2 = "Magma City"
        elseif ddmcities == "Legends Highway" then
            optionCity2 = "Legends Highway"
        elseif ddmcities == "Speed Jungle" then
            optionCity2 = "Speed Jungle"
        elseif ddmcities == "Space" then
            optionCity2 = "Space"
        elseif ddmcities == "Desert" then
            optionCity2 = "Desert"
        end
    end
)
Tab2:CreateDropdown(
    "Select Orb Multiplier",
    {
        "x400 Orbs",
        "x450 Orbs",
        "x500 Orbs",
        "x550 Orbs",
        "x600 Orbs",
        "x650 Orbs",
        "x700 Orbs",
        "x750 Orbs",
        "x800 Orbs",
        "x850 Orbs",
        "x900 Orbs",
        "x950 Orbs",
        "x1000 Orbs",
        "x1050 Orbs",
        "x1100 Orbs",
        "x1150 Orbs",
        "x1200 Orbs",
        "x1250 Orbs",
        "x1300 Orbs",
        "x1350 Orbs",
        "x1400 Orbs",
        "x1450 Orbs",
        "x1500 Orbs",
        "x1550 Orbs",
        "x1600 Orbs",
        "x1650 Orbs",
        "x1700 Orbs",
        "x1750 Orbs",
        "x1800 Orbs",
        "x1850 Orbs",
        "x1900 Orbs",
        "x1950 Orbs",
        "x2000 Orbs"
    },
    function(ddmspeed)
        if ddmspeed == "x400 Orbs" then
            optionSpeed2 = 400
        elseif ddmspeed == "x450 Orbs" then
            optionSpeed2 = 450
        elseif ddmspeed == "x500 Orbs" then
            optionSpeed2 = 500
        elseif ddmspeed == "x550 Orbs" then
            optionSpeed2 = 550
        elseif ddmspeed == "x600 Orbs" then
            optionSpeed2 = 600
        elseif ddmspeed == "x650 Orbs" then
            optionSpeed2 = 650
        elseif ddmspeed == "x700 Orbs" then
            optionSpeed2 = 700
        elseif ddmspeed == "x750 Orbs" then
            optionSpeed2 = 750
        elseif ddmspeed == "x800 Orbs" then
            optionSpeed2 = 800
        elseif ddmspeed == "x850 Orbs" then
            optionSpeed2 = 850
        elseif ddmspeed == "x900 Orbs" then
            optionSpeed2 = 900
        elseif ddmspeed == "x950 Orbs" then
            optionSpeed2 = 950
        elseif ddmspeed == "x1000 Orbs" then
            optionSpeed2 = 1000
        elseif ddmspeed == "x1050 Orbs" then
            optionSpeed2 = 1050
        elseif ddmspeed == "x1100 Orbs" then
            optionSpeed2 = 1100
        elseif ddmspeed == "x1150 Orbs" then
            optionSpeed2 = 1150
        elseif ddmspeed == "x1200 Orbs" then
            optionSpeed2 = 1200
        elseif ddmspeed == "x1250 Orbs" then
            optionSpeed2 = 1250
        elseif ddmspeed == "x1300 Orbs" then
            optionSpeed2 = 1300
        elseif ddmspeed == "x1350 Orbs" then
            optionSpeed2 = 1350
        elseif ddmspeed == "x1400 Orbs" then
            optionSpeed2 = 1400
        elseif ddmspeed == "x1450 Orbs" then
            optionSpeed2 = 1450
        elseif ddmspeed == "x1500 Orbs" then
            optionSpeed2 = 1500
        elseif ddmspeed == "x1550 Orbs" then
            optionSpeed2 = 1550
        elseif ddmspeed == "x1600 Orbs" then
            optionSpeed2 = 1600
        elseif ddmspeed == "x1650 Orbs" then
            optionSpeed2 = 1650
        elseif ddmspeed == "x1700 Orbs" then
            optionSpeed2 = 1700
        elseif ddmspeed == "x1750 Orbs" then
            optionSpeed2 = 1750
        elseif ddmspeed == "x1800 Orbs" then
            optionSpeed2 = 1800
        elseif ddmspeed == "x1850 Orbs" then
            optionSpeed2 = 1850
        elseif ddmspeed == "x1900 Orbs" then
            optionSpeed2 = 1900
        elseif ddmspeed == "x1950 Orbs" then
            optionSpeed2 = 1950
        elseif ddmspeed == "x2000 Orbs" then
            optionSpeed2 = 2000
        end
    end
)
Tab2:CreateToggle(
    "Auto Orb",
    function(state)
        if state then
            secondaryAutoOrbActive = true
            while secondaryAutoOrbActive do
                if not secondaryAutoOrbActive then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not secondaryAutoOrbActive
                        if not secondaryAutoOrbActive then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(optionSpeed2 / 5)
                local remainingOrbs = optionSpeed2
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            optionOrb2,
                            optionCity2
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(orbCooldown)
            end
        else
            secondaryAutoOrbActive = false
        end
    end
)

Tab2:CreateSection("Third Orb Auto Farm")
Tab2:CreateDropdown(
    "Select Orb",
    {"Yellow Orb", "Orange Orb", "Blue Orb", "Red Orb", "Ethereal Orb", "Gem", "Infernal Gem"},
    function(selected)
        if selected == "Yellow Orb" then
            optionOrb3 = "Yellow Orb"
        elseif selected == "Orange Orb" then
            optionOrb3 = "Orange Orb"
        elseif selected == "Blue Orb" then
            optionOrb3 = "Blue Orb"
        elseif selected == "Red Orb" then
            optionOrb3 = "Red Orb"
        elseif selected == "Ethereal Orb" then
            optionOrb3 = "Ethereal Orb"
        elseif selected == "Gem" then
            optionOrb3 = "Gem"
        elseif selected == "Infernal Gem" then
            optionOrb3 = "Infernal Gem"
        end
    end
)
Tab2:CreateDropdown(
    "Select City",
    {"City", "Snow City", "Magma City", "Legends Highway", "Speed Jungle", "Space", "Desert"},
    function(selected)
        if selected == "City" then
            optionCity3 = "City"
        elseif selected == "Snow City" then
            optionCity3 = "Snow City"
        elseif selected == "Magma City" then
            optionCity3 = "Magma City"
        elseif selected == "Legends Highway" then
            optionCity3 = "Legends Highway"
        elseif selected == "Speed Jungle" then
            optionCity3 = "Speed Jungle"
        elseif selected == "Space" then
            optionCity3 = "Space"
        elseif selected == "Desert" then
            optionCity3 = "Desert"
        end
    end
)
Tab2:CreateBox(
    "Enter Orb Multiplier",
    function(input)
        local inputNumber = tonumber(input)
        if inputNumber then
            optionSpeed3 = inputNumber
        else
            optionSpeed3 = 600
        end
    end
)
Tab2:CreateToggle(
    "Auto Orb",
    function(state)
        if state then
            thirdAutoOrbActive3 = true
            while thirdAutoOrbActive3 do
                if not thirdAutoOrbActive3 then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not thirdAutoOrbActive3
                        if not thirdAutoOrbActive3 then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(optionSpeed3 / 5)
                local remainingOrbs = optionSpeed3
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            optionOrb3,
                            optionCity3
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(orbCooldown)
            end
        else
            thirdAutoOrbActive3 = false
        end
    end
)

Tab3:CreateSection("Old Farm Configuration")
Tab3:CreateBox(
    "Enter Orb Cooldown",
    function(input)
        local inputNumber = tonumber(input)
        if inputNumber then
            oldOrbCooldown = inputNumber / 100
        else
            oldOrbCooldown = 0.4
        end
    end
)
Tab3:CreateBox(
    "Enter Orb Multiplier",
    function(input)
        local inputNumber = tonumber(input)
        if inputNumber then
            oldOrbSpeed = inputNumber
        else
            oldOrbSpeed = 600
        end
    end
)

Tab3:CreateSection("City Farming")
Tab3:CreateToggle(
    "Auto Yellow Orb",
    function(state)
        if state then
            oldCityYellowOrb = true
            while oldCityYellowOrb do
                if not oldCityYellowOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldCityYellowOrb
                        if not oldCityYellowOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Yellow Orb",
                            "City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldCityYellowOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Orange Orb",
    function(state)
        if state then
            oldCityOrangeOrb = true
            while oldCityOrangeOrb do
                if not oldCityOrangeOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldCityOrangeOrb
                        if not oldCityOrangeOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Orange Orb",
                            "City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldCityOrangeOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Blue Orb",
    function(state)
        if state then
            oldCityBlueOrb = true
            while oldCityBlueOrb do
                if not oldCityBlueOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldCityBlueOrb
                        if not oldCityBlueOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Blue Orb",
                            "City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldCityBlueOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Red Orb",
    function(state)
        if state then
            oldCityRedOrb = true
            while oldCityRedOrb do
                if not oldCityRedOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldCityRedOrb
                        if not oldCityRedOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Red Orb",
                            "City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldCityRedOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Ethereal Orb",
    function(state)
        if state then
            oldCityEtherealOrb = true
            while oldCityEtherealOrb do
                if not oldCityEtherealOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldCityEtherealOrb
                        if not oldCityEtherealOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Ethereal Orb",
                            "City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldCityEtherealOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Gem",
    function(state)
        if state then
            oldCityGem = true
            while oldCityGem do
                if not oldCityGem then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldCityGem
                        if not oldCityGem then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Gem", "City")
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldCityGem = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Gem",
    function(state)
        if state then
            oldCityInfernalGem = true
            while oldCityInfernalGem do
                if not oldCityInfernalGem then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldCityInfernalGem
                        if not oldCityInfernalGem then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Infernal Gem",
                            "City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldCityInfernalGem = false
        end
    end
)

Tab3:CreateSection("Snow City Farming")
Tab3:CreateToggle(
    "Auto Yellow Orb",
    function(state)
        if state then
            oldSnowCityYellowOrb = true
            while oldSnowCityYellowOrb do
                if not oldSnowCityYellowOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSnowCityYellowOrb
                        if not oldSnowCityYellowOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Yellow Orb",
                            "Snow City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSnowCityYellowOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Orange Orb",
    function(state)
        if state then
            oldSnowCityOrangeOrb = true
            while oldSnowCityOrangeOrb do
                if not oldSnowCityOrangeOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSnowCityOrangeOrb
                        if not oldSnowCityOrangeOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Orange Orb",
                            "Snow City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSnowCityOrangeOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Blue Orb",
    function(state)
        if state then
            oldSnowCityBlueOrb = true
            while oldSnowCityBlueOrb do
                if not oldSnowCityBlueOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSnowCityBlueOrb
                        if not oldSnowCityBlueOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Blue Orb",
                            "Snow City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSnowCityBlueOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Red Orb",
    function(state)
        if state then
            oldSnowCityRedOrb = true
            while oldSnowCityRedOrb do
                if not oldSnowCityRedOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSnowCityRedOrb
                        if not oldSnowCityRedOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Red Orb",
                            "Snow City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSnowCityRedOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Ethereal Orb",
    function(state)
        if state then
            oldSnowCityEtherealOrb = true
            while oldSnowCityEtherealOrb do
                if not oldSnowCityEtherealOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSnowCityEtherealOrb
                        if not oldSnowCityEtherealOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Ethereal Orb",
                            "Snow City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSnowCityEtherealOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Gem",
    function(state)
        if state then
            oldSnowCityGem = true
            while oldSnowCityGem do
                if not oldSnowCityGem then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSnowCityGem
                        if not oldSnowCityGem then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Gem",
                            "Snow City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSnowCityGem = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Infernal Gem",
    function(state)
        if state then
            oldSnowCityInfernalGem = true
            while oldSnowCityInfernalGem do
                if not oldSnowCityInfernalGem then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSnowCityInfernalGem
                        if not oldSnowCityInfernalGem then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Infernal Gem",
                            "Snow City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSnowCityInfernalGem = false
        end
    end
)

Tab3:CreateSection("Magma City Farming")
Tab3:CreateToggle(
    "Auto Yellow Orb",
    function(state)
        if state then
            oldMagmaCityYellowOrb = true
            while oldMagmaCityYellowOrb do
                if not oldMagmaCityYellowOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldMagmaCityYellowOrb
                        if not oldMagmaCityYellowOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Yellow Orb",
                            "Magma City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldMagmaCityYellowOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Orange Orb",
    function(state)
        if state then
            oldMagmaCityOrangeOrb = true
            while oldMagmaCityOrangeOrb do
                if not oldMagmaCityOrangeOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldMagmaCityOrangeOrb
                        if not oldMagmaCityOrangeOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Orange Orb",
                            "Magma City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldMagmaCityOrangeOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Blue Orb",
    function(state)
        if state then
            oldMagmaCityBlueOrb = true
            while oldMagmaCityBlueOrb do
                if not oldMagmaCityBlueOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldMagmaCityBlueOrb
                        if not oldMagmaCityBlueOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Blue Orb",
                            "Magma City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldMagmaCityBlueOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Red Orb",
    function(state)
        if state then
            oldMagmaCityRedOrb = true
            while oldMagmaCityRedOrb do
                if not oldMagmaCityRedOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldMagmaCityRedOrb
                        if not oldMagmaCityRedOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Red Orb",
                            "Magma City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldMagmaCityRedOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Ethereal Orb",
    function(state)
        if state then
            oldMagmaCityEtherealOrb = true
            while oldMagmaCityEtherealOrb do
                if not oldMagmaCityEtherealOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldMagmaCityEtherealOrb
                        if not oldMagmaCityEtherealOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Ethereal Orb",
                            "Magma City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldMagmaCityEtherealOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Gem",
    function(state)
        if state then
            oldMagmaCityGem = true
            while oldMagmaCityGem do
                if not oldMagmaCityGem then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldMagmaCityGem
                        if not oldMagmaCityGem then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Gem",
                            "Magma City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldMagmaCityGem = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Infernal Gem",
    function(state)
        if state then
            oldMagmaCityInfernalGem = true
            while oldMagmaCityInfernalGem do
                if not oldMagmaCityInfernalGem then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldMagmaCityInfernalGem
                        if not oldMagmaCityInfernalGem then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Infernal Gem",
                            "Magma City"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldMagmaCityInfernalGem = false
        end
    end
)

Tab3:CreateSection("Legends Highway Farming")
Tab3:CreateToggle(
    "Auto Yellow Orb",
    function(state)
        if state then
            oldLegendsHighwayYellowOrb = true
            while oldLegendsHighwayYellowOrb do
                if not oldLegendsHighwayYellowOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldLegendsHighwayYellowOrb
                        if not oldLegendsHighwayYellowOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Yellow Orb",
                            "Legends Highway"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldLegendsHighwayYellowOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Orange Orb",
    function(state)
        if state then
            oldLegendsHighwayOrangeOrb = true
            while oldLegendsHighwayOrangeOrb do
                if not oldLegendsHighwayOrangeOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldLegendsHighwayOrangeOrb
                        if not oldLegendsHighwayOrangeOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Orange Orb",
                            "Legends Highway"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldLegendsHighwayOrangeOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Blue Orb",
    function(state)
        if state then
            oldLegendsHighwayBlueOrb = true
            while oldLegendsHighwayBlueOrb do
                if not oldLegendsHighwayBlueOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldLegendsHighwayBlueOrb
                        if not oldLegendsHighwayBlueOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Blue Orb",
                            "Legends Highway"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldLegendsHighwayBlueOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Red Orb",
    function(state)
        if state then
            oldLegendsHighwayRedOrb = true
            while oldLegendsHighwayRedOrb do
                if not oldLegendsHighwayRedOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldLegendsHighwayRedOrb
                        if not oldLegendsHighwayRedOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Red Orb",
                            "Legends Highway"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldLegendsHighwayRedOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Ethereal Orb",
    function(state)
        if state then
            oldLegendsHighwayEtherealOrb = true
            while oldLegendsHighwayEtherealOrb do
                if not oldLegendsHighwayEtherealOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldLegendsHighwayEtherealOrb
                        if not oldLegendsHighwayEtherealOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Ethereal Orb",
                            "Legends Highway"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldLegendsHighwayEtherealOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Gem",
    function(state)
        if state then
            oldLegendsHighwayGem = true
            while oldLegendsHighwayGem do
                if not oldLegendsHighwayGem then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldLegendsHighwayGem
                        if not oldLegendsHighwayGem then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Gem",
                            "Legends Highway"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldLegendsHighwayGem = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Infernal Gem",
    function(state)
        if state then
            oldLegendsHighwayInfernalGem = true
            while oldLegendsHighwayInfernalGem do
                if not oldLegendsHighwayInfernalGem then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldLegendsHighwayInfernalGem
                        if not oldLegendsHighwayInfernalGem then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Infernal Gem",
                            "Legends Highway"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldLegendsHighwayInfernalGem = false
        end
    end
)

Tab3:CreateSection("Speed Jungle Farming")
Tab3:CreateToggle(
    "Auto Yellow Orb",
    function(state)
        if state then
            oldSpeedJungleYellowOrb = true
            while oldSpeedJungleYellowOrb do
                if not oldSpeedJungleYellowOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSpeedJungleYellowOrb
                        if not oldSpeedJungleYellowOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Yellow Orb",
                            "Speed Jungle"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSpeedJungleYellowOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Orange Orb",
    function(state)
        if state then
            oldSpeedJungleOrangeOrb = true
            while oldSpeedJungleOrangeOrb do
                if not oldSpeedJungleOrangeOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSpeedJungleOrangeOrb
                        if not oldSpeedJungleOrangeOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Orange Orb",
                            "Speed Jungle"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSpeedJungleOrangeOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Blue Orb",
    function(state)
        if state then
            oldSpeedJungleBlueOrb = true
            while oldSpeedJungleBlueOrb do
                if not oldSpeedJungleBlueOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSpeedJungleBlueOrb
                        if not oldSpeedJungleBlueOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Blue Orb",
                            "Speed Jungle"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSpeedJungleBlueOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Red Orb",
    function(state)
        if state then
            oldSpeedJungleRedOrb = true
            while oldSpeedJungleRedOrb do
                if not oldSpeedJungleRedOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSpeedJungleRedOrb
                        if not oldSpeedJungleRedOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Red Orb",
                            "Speed Jungle"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSpeedJungleRedOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Ethereal Orb",
    function(state)
        if state then
            oldSpeedJungleEtherealOrb = true
            while oldSpeedJungleEtherealOrb do
                if not oldSpeedJungleEtherealOrb then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSpeedJungleEtherealOrb
                        if not oldSpeedJungleEtherealOrb then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Ethereal Orb",
                            "Speed Jungle"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSpeedJungleEtherealOrb = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Gem",
    function(state)
        if state then
            oldSpeedJungleGem = true
            while oldSpeedJungleGem do
                if not oldSpeedJungleGem then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSpeedJungleGem
                        if not oldSpeedJungleGem then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Gem",
                            "Speed Jungle"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSpeedJungleGem = false
        end
    end
)
Tab3:CreateToggle(
    "Auto Infernal Gem",
    function(state)
        if state then
            oldSpeedJungleInfernalGem = true
            while oldSpeedJungleInfernalGem do
                if not oldSpeedJungleInfernalGem then
                    break
                end
                if pingMonitorActive then
                    local ping =
                        tonumber(
                        string.match(
                            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                            "%d+"
                        )
                    )
                    if ping and ping > maxPing then
                        repeat
                            wait(1)
                            ping =
                                tonumber(
                                string.match(
                                    game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                    "%d+"
                                )
                            )
                        until ping and ping < minPing or not oldSpeedJungleInfernalGem
                        if not oldSpeedJungleInfernalGem then
                            break
                        end
                    end
                end
                local batchSize = math.ceil(oldOrbSpeed / 5)
                local remainingOrbs = oldOrbSpeed
                local startTime = tick()
                while remainingOrbs > 0 do
                    local currentBatch = math.min(batchSize, remainingOrbs)
                    for i = 1, currentBatch do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                            "collectOrb",
                            "Infernal Gem",
                            "Speed Jungle"
                        )
                    end
                    remainingOrbs = remainingOrbs - currentBatch
                    wait(0.11)
                end
                wait(oldOrbCooldown)
            end
        else
            oldSpeedJungleInfernalGem = false
        end
    end
)

Tab14:CreateSection("Custom Singular Orb Hits [1]")
Tab14:CreateDropdown(
    "Select Orb",
    {"Yellow Orb", "Orange Orb", "Blue Orb", "Red Orb", "Ethereal Orb", "Gem", "Infernal Gem"},
    function(ddmorbs)
        if ddmorbs == "Yellow Orb" then
            optionOrbHit = "Yellow Orb"
        elseif ddmorbs == "Orange Orb" then
            optionOrbHit = "Orange Orb"
        elseif ddmorbs == "Blue Orb" then
            optionOrbHit = "Blue Orb"
        elseif ddmorbs == "Red Orb" then
            optionOrbHit = "Red Orb"
        elseif ddmorbs == "Ethereal Orb" then
            optionOrbHit = "Ethereal Orb"
        elseif ddmorbs == "Gem" then
            optionCityHit = "Gem"
        elseif ddmorbs == "Infernal Gem" then
            optionOrbHit = "Infernal Gem"
        end
    end
)
Tab14:CreateDropdown(
    "Select City",
    {"City", "Snow City", "Magma City", "Legends Highway", "Speed Jungle", "Space", "Desert"},
    function(ddmcities)
        if ddmcities == "City" then
            optionCityHit = "City"
        elseif ddmcities == "Snow City" then
            optionCityHit = "Snow City"
        elseif ddmcities == "Magma City" then
            optionCityHit = "Magma City"
        elseif ddmcities == "Legends Highway" then
            optionCityHit = "Legends Highway"
        elseif ddmcities == "Speed Jungle" then
            optionCityHit = "Speed Jungle"
        elseif ddmcities == "Space" then
            optionCityHit = "Space"
        elseif ddmcities == "Desert" then
            optionCityHit = "Desert"
        end
    end
)
Tab14:CreateBox(
    "Enter Orb Hits",
    function(input)
        local inputNumber = tonumber(input)
        if inputNumber then
            optionOrbMultiplierHit = inputNumber
        end
    end
)
Tab14:CreateButton(
    "Activate",
    function()
        for i = 1, optionOrbMultiplierHit do
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", optionOrbHit, optionCityHit)
        end
    end
)

Tab14:CreateSection("Custom Singular Orb Hits [2]")
Tab14:CreateDropdown(
    "Select Orb",
    {"Yellow Orb", "Orange Orb", "Blue Orb", "Red Orb", "Ethereal Orb", "Gem", "Infernal Gem"},
    function(ddmorbs)
        if ddmorbs == "Yellow Orb" then
            optionOrbHit2 = "Yellow Orb"
        elseif ddmorbs == "Orange Orb" then
            optionOrbHit2 = "Orange Orb"
        elseif ddmorbs == "Blue Orb" then
            optionOrbHit2 = "Blue Orb"
        elseif ddmorbs == "Red Orb" then
            optionOrbHit2 = "Red Orb"
        elseif ddmorbs == "Ethereal Orb" then
            optionOrbHit2 = "Ethereal Orb"
        elseif ddmorbs == "Gem" then
            optionCityHit2 = "Gem"
        elseif ddmorbs == "Infernal Gem" then
            optionOrbHit2 = "Infernal Gem"
        end
    end
)
Tab14:CreateDropdown(
    "Select City",
    {"City", "Snow City", "Magma City", "Legends Highway", "Speed Jungle", "Space", "Desert"},
    function(ddmcities)
        if ddmcities == "City" then
            optionCityHit2 = "City"
        elseif ddmcities == "Snow City" then
            optionCityHit2 = "Snow City"
        elseif ddmcities == "Magma City" then
            optionCityHit2 = "Magma City"
        elseif ddmcities == "Legends Highway" then
            optionCityHit2 = "Legends Highway"
        elseif ddmcities == "Speed Jungle" then
            optionCityHit2 = "Speed Jungle"
        elseif ddmcities == "Space" then
            optionCityHit2 = "Space"
        elseif ddmcities == "Desert" then
            optionCityHit2 = "Desert"
        end
    end
)
Tab14:CreateBox(
    "Enter Orb Hits",
    function(input)
        local inputNumber = tonumber(input)
        if inputNumber then
            optionOrbMultiplierHit2 = inputNumber
        end
    end
)
Tab14:CreateButton(
    "Activate",
    function()
        for i = 1, optionOrbMultiplierHit2 do
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(
                "collectOrb",
                optionOrbHit2,
                optionCityHit2
            )
        end
    end
)

Tab4:CreateSection("Hatch Basic Pets")
Tab4:CreateDropdown(
    "Select Pet",
    {"Red Bunny", "Red Kitty", "Blue Bunny", "Silver Dog", "Yellow Squeak"},
    function(input)
        if input == "Red Bunny" then
            selectedbasicpettohatch = input
        elseif input == "Red Kitty" then
            selectedbasicpettohatch = input
        elseif input == "Blue Bunny" then
            selectedbasicpettohatch = input
        elseif input == "Silver Dog" then
            selectedbasicpettohatch = input
        elseif input == "Yellow Squeak" then
            selectedbasicpettohatch = input
        end
    end
)
Tab4:CreateToggle(
    "Auto Hatch",
    function(state)
        if state then
            hatchBasicPets = true
            while hatchBasicPets == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        selectedbasicpettohatch
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            hatchBasicPets = false
        end
    end
)
Tab4:CreateSection("Hatch Advanced Pets")
Tab4:CreateDropdown(
    "Select Pet",
    {"Green Vampy", "Dark Golem", "Pink Butterfly", "Yellow Butterfly", "Green Golem"},
    function(input)
        if input == "Green Vampy" then
            selectedadvancedpettohatch = input
        elseif input == "Dark Golem" then
            selectedadvancedpettohatch = input
        elseif input == "Pink Butterfly" then
            selectedadvancedpettohatch = input
        elseif input == "Yellow Butterfly" then
            selectedadvancedpettohatch = input
        elseif input == "Green Golem" then
            selectedadvancedpettohatch = input
        end
    end
)
Tab4:CreateToggle(
    "Auto Hatch",
    function(state)
        if state then
            hatchAdvancedPets = true
            while hatchAdvancedPets == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        selectedadvancedpettohatch
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            hatchAdvancedPets = false
        end
    end
)
Tab4:CreateSection("Hatch Rare Pets")
Tab4:CreateDropdown(
    "Select Pet",
    {
        "Purple Pegasus",
        "Golden Angel",
        "Orange Pegasus",
        "Orange Falcon",
        "Blue Firecaster",
        "White Phoenix",
        "Red Phoenix",
        "Red Firecaster"
    },
    function(input)
        if input == "Purple Pegasus" then
            selectedrarepettohatch = input
        elseif input == "Golden Angel" then
            selectedrarepettohatch = input
        elseif input == "Orange Pegasus" then
            selectedrarepettohatch = input
        elseif input == "Orange Falcon" then
            selectedrarepettohatch = input
        elseif input == "Blue Firecaster" then
            selectedrarepettohatch = input
        elseif input == "White Phoenix" then
            selectedrarepettohatch = input
        elseif input == "Red Phoenix" then
            selectedrarepettohatch = input
        elseif input == "Red Firecaster" then
            selectedrarepettohatch = input
        end
    end
)
Tab4:CreateToggle(
    "Auto Hatch",
    function(state)
        if state then
            hatchRarePets = true
            while hatchRarePets == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        selectedrarepettohatch
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            hatchRarePets = false
        end
    end
)
Tab4:CreateSection("Hatch Epic Pets")
Tab4:CreateDropdown(
    "Select Pet",
    {"Golden Phoenix", "Green Firecaster", "Voltaic Falcon", "Blue Phoenix", "Divine Pegasus"},
    function(input)
        if input == "Golden Phoenix" then
            selectedepicpettohatch = input
        elseif input == "Green Firecaster" then
            selectedepicpettohatch = input
        elseif input == "Voltaic Falcon" then
            selectedepicpettohatch = input
        elseif input == "Blue Phoenix" then
            selectedepicpettohatch = input
        elseif input == "Divine Pegasus" then
            selectedepicpettohatch = input
        end
    end
)
Tab4:CreateToggle(
    "Auto Hatch",
    function(state)
        if state then
            hatchEpicPets = true
            while hatchEpicPets == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        selectedepicpettohatch
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            hatchEpicPets = false
        end
    end
)
Tab4:CreateSection("Hatch Unique Pets")
Tab4:CreateDropdown(
    "Select Pet",
    {
        "Flaming Hedgehog",
        "Electro Golem",
        "Voltaic Falcon",
        "Void Dragon",
        "Ultra Birdie",
        "Quantum Dragon",
        "Tundra Dragon",
        "Magic Butterfly",
        "Maestro Dog",
        "Golden Viking",
        "Speedy Sensei"
    },
    function(input)
        if input == "Flaming Hedgehog" then
            selecteduniquepettohatch = input
        elseif input == "Electro Golem" then
            selecteduniquepettohatch = input
        elseif input == "Voltaic Falcon" then
            selecteduniquepettohatch = input
        elseif input == "Void Dragon" then
            selecteduniquepettohatch = input
        elseif input == "Ultra Birdie" then
            selecteduniquepettohatch = input
        elseif input == "Quantum Dragon" then
            selecteduniquepettohatch = input
        elseif input == "Tundra Dragon" then
            selecteduniquepettohatch = input
        elseif input == "Magic Butterfly" then
            selecteduniquepettohatch = input
        elseif input == "Maestro Dog" then
            selecteduniquepettohatch = input
        elseif input == "Golden Viking" then
            selecteduniquepettohatch = input
        elseif input == "Speedy Sensei" then
            selecteduniquepettohatch = input
        end
    end
)
Tab4:CreateToggle(
    "Auto Hatch",
    function(state)
        if state then
            hatchUniquePets = true
            while hatchUniquePets == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        selecteduniquepettohatch
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            hatchUniquePets = false
        end
    end
)
Tab4:CreateSection("Hatch Omega Pets")
Tab4:CreateDropdown(
    "Select Pet",
    {
        "Soul Fusion Dog",
        "Hypersonic Pegasus",
        "Dark Soul Birdie",
        "Eternal Nebula Dragon",
        "Shadows Edge Kitty",
        "Ultimate Overdrive Bunny",
        "Swift Samurai"
    },
    function(input)
        if input == "Soul Fusion Dog" then
            selectedomegapettohatch = input
        elseif input == "Hypersonic Pegasus" then
            selectedomegapettohatch = input
        elseif input == "Dark Soul Birdie" then
            selectedomegapettohatch = input
        elseif input == "Eternal Nebula Dragon" then
            selectedomegapettohatch = input
        elseif input == "Shadows Edge Kitty" then
            selectedomegapettohatch = input
        elseif input == "Ultimate Overdrive Bunny" then
            selectedomegapettohatch = input
        elseif input == "Swift Samurai" then
            selectedomegapettohatch = input
        end
    end
)
Tab4:CreateToggle(
    "Auto Hatch",
    function(state)
        if state then
            hatchOmegaPets = true
            while hatchOmegaPets == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        selectedomegapettohatch
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            hatchOmegaPets = false
        end
    end
)

Tab5:CreateSection("Evolve Basic Pets")
Tab5:CreateDropdown(
    "Select Pet",
    {"Red Bunny", "Red Kitty", "Blue Bunny", "Silver Dog", "Yellow Squeak"},
    function(input)
        if input == "Red Bunny" then
            selectedbasicpettoevolve = input
        elseif input == "Red Kitty" then
            selectedbasicpettoevolve = input
        elseif input == "Blue Bunny" then
            selectedbasicpettoevolve = input
        elseif input == "Silver Dog" then
            selectedbasicpettoevolve = input
        elseif input == "Yellow Squeak" then
            selectedbasicpettoevolve = input
        end
    end
)
Tab5:CreateToggle(
    "Auto Evolve",
    function(state)
        if state then
            evolveBasicPets = true
            while evolveBasicPets == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = selectedbasicpettoevolve
                }
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            evolveBasicPets = false
        end
    end
)
Tab5:CreateSection("Evolve Advanced Pets")
Tab5:CreateDropdown(
    "Select Pet",
    {"Green Vampy", "Dark Golem", "Pink Butterfly", "Yellow Butterfly", "Green Golem"},
    function(input)
        if input == "Green Vampy" then
            selectedadvancedpettoevolve = input
        elseif input == "Dark Golem" then
            selectedadvancedpettoevolve = input
        elseif input == "Pink Butterfly" then
            selectedadvancedpettoevolve = input
        elseif input == "Yellow Butterfly" then
            selectedadvancedpettoevolve = input
        elseif input == "Green Golem" then
            selectedadvancedpettoevolve = input
        end
    end
)
Tab5:CreateToggle(
    "Auto Evolve",
    function(state)
        if state then
            evolveAdvancedPets = true
            while evolveAdvancedPets == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = selectedadvancedpettoevolve
                }
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            evolveAdvancedPets = false
        end
    end
)
Tab5:CreateSection("Evolve Rare Pets")
Tab5:CreateDropdown(
    "Select Pet",
    {
        "Purple Pegasus",
        "Golden Angel",
        "Orange Pegasus",
        "Orange Falcon",
        "Blue Firecaster",
        "White Phoenix",
        "Red Phoenix",
        "Red Firecaster"
    },
    function(input)
        if input == "Purple Pegasus" then
            selectedrarepettoevolve = input
        elseif input == "Golden Angel" then
            selectedrarepettoevolve = input
        elseif input == "Orange Pegasus" then
            selectedrarepettoevolve = input
        elseif input == "Orange Falcon" then
            selectedrarepettoevolve = input
        elseif input == "Blue Firecaster" then
            selectedrarepettoevolve = input
        elseif input == "White Phoenix" then
            selectedrarepettoevolve = input
        elseif input == "Red Phoenix" then
            selectedrarepettoevolve = input
        elseif input == "Red Firecaster" then
            selectedrarepettoevolve = input
        end
    end
)
Tab5:CreateToggle(
    "Auto Evolve",
    function(state)
        if state then
            evolveRarePets = true
            while evolveRarePets == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = selectedrarepettoevolve
                }
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            evolveRarePets = false
        end
    end
)
Tab5:CreateSection("Evolve Epic Pets")
Tab5:CreateDropdown(
    "Select Pet",
    {"Golden Phoenix", "Green Firecaster", "Voltaic Falcon", "Blue Phoenix", "Divine Pegasus"},
    function(input)
        if input == "Golden Phoenix" then
            selectedepicpettoevolve = input
        elseif input == "Green Firecaster" then
            selectedepicpettoevolve = input
        elseif input == "Voltaic Falcon" then
            selectedepicpettoevolve = input
        elseif input == "Blue Phoenix" then
            selectedepicpettoevolve = input
        elseif input == "Divine Pegasus" then
            selectedepicpettoevolve = input
        end
    end
)
Tab5:CreateToggle(
    "Auto Evolve",
    function(state)
        if state then
            evolveEpicPets = true
            while evolveEpicPets == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = selectedepicpettoevolve
                }
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            evolveEpicPets = false
        end
    end
)
Tab5:CreateSection("Evolve Unique Pets")
Tab5:CreateDropdown(
    "Select Pet",
    {
        "Flaming Hedgehog",
        "Electro Golem",
        "Voltaic Falcon",
        "Void Dragon",
        "Ultra Birdie",
        "Quantum Dragon",
        "Tundra Dragon",
        "Magic Butterfly",
        "Maestro Dog",
        "Golden Viking",
        "Speedy Sensei"
    },
    function(input)
        if input == "Flaming Hedgehog" then
            selecteduniquepettoevolve = input
        elseif input == "Electro Golem" then
            selecteduniquepettoevolve = input
        elseif input == "Voltaic Falcon" then
            selecteduniquepettoevolve = input
        elseif input == "Void Dragon" then
            selecteduniquepettoevolve = input
        elseif input == "Ultra Birdie" then
            selecteduniquepettoevolve = input
        elseif input == "Quantum Dragon" then
            selecteduniquepettoevolve = input
        elseif input == "Tundra Dragon" then
            selecteduniquepettoevolve = input
        elseif input == "Magic Butterfly" then
            selecteduniquepettoevolve = input
        elseif input == "Maestro Dog" then
            selecteduniquepettoevolve = input
        elseif input == "Golden Viking" then
            selecteduniquepettoevolve = input
        elseif input == "Speedy Sensei" then
            selecteduniquepettoevolve = input
        end
    end
)
Tab5:CreateToggle(
    "Auto Evolve",
    function(state)
        if state then
            evolveUniquePets = true
            while evolveUniquePets == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = selecteduniquepettoevolve
                }
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            evolveUniquePets = false
        end
    end
)
Tab5:CreateSection("Evolve Omega Pets")
Tab5:CreateDropdown(
    "Select Pet",
    {
        "Soul Fusion Dog",
        "Hypersonic Pegasus",
        "Dark Soul Birdie",
        "Eternal Nebula Dragon",
        "Shadows Edge Kitty",
        "Ultimate Overdrive Bunny",
        "Swift Samurai"
    },
    function(input)
        if input == "Soul Fusion Dog" then
            selectedomegapettoevolve = input
        elseif input == "Hypersonic Pegasus" then
            selectedomegapettoevolve = input
        elseif input == "Dark Soul Birdie" then
            selectedomegapettoevolve = input
        elseif input == "Eternal Nebula Dragon" then
            selectedomegapettoevolve = input
        elseif input == "Shadows Edge Kitty" then
            selectedomegapettoevolve = input
        elseif input == "Ultimate Overdrive Bunny" then
            selectedomegapettoevolve = input
        elseif input == "Swift Samurai" then
            selectedomegapettoevolve = input
        end
    end
)
Tab5:CreateToggle(
    "Auto Evolve",
    function(state)
        if state then
            evolveOmegaPets = true
            while evolveOmegaPets == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = selectedomegapettoevolve
                }
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            evolveOmegaPets = false
        end
    end
)

Tab6:CreateSection("Main Crystals")
Tab6:CreateToggle(
    "Red Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Red Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateToggle(
    "Lightning Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Lightning Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateToggle(
    "Yellow Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Yellow Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateToggle(
    "Purple Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Purple Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateToggle(
    "Blue Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Blue Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateToggle(
    "Snow Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Snow Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateToggle(
    "Lava Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Lava Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateToggle(
    "Inferno Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Inferno Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateToggle(
    "Electro Legends Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Electro Legends Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab6:CreateToggle(
    "Jungle Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Jungle Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateSection("Space Crystals")

Tab6:CreateToggle(
    "Space Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Space Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateToggle(
    "Alien Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Alien Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateSection("Desert Crystals")

Tab6:CreateToggle(
    "Desert Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Desert Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateToggle(
    "Electro Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Electro Crystal"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab7:CreateSection("Numbers")
Tab7:CreateToggle(
    "1st Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("1st Trail")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)

Tab7:CreateToggle(
    "2nd Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("2nd Trail")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Third Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Third Trail"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Fourth Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Fourth Trail"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Fifth Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Fifth Trail"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateSection("B")
Tab7:CreateToggle(
    "BG Speed",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("BG Speed")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)

Tab7:CreateToggle(
    "Blue & Green",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Blue & Green"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Blue Coin",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Blue Coin")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Blue Gem",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Blue Gem")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Blue Lightning",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Blue Lightning"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Blue Snow",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Blue Snow")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Blue Soul",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Blue Soul")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Blue Sparks",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Blue Sparks"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Blue Storm",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Blue Storm")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Blue Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Blue Trail")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateSection("D")
Tab7:CreateToggle(
    "Dragonfire",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Dragonfire")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateSection("G")
Tab7:CreateToggle(
    "Golden Lightning",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Golden Lightning"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Green & Orange",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Green & Orange"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Green Coin",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Green Coin")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Green Gem",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Green Gem")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Green Lightning",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Green Lightning"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Green Snow",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Green Snow")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Green Soul",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Green Soul")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Green Sparks",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Green Sparks"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Green Storm",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Green Storm"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Green Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Green Trail"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateSection("H")
Tab7:CreateToggle(
    "Hyperblast",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Hyperblast")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateSection("O")
Tab7:CreateToggle(
    "OG Speed",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("OG Speed")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Orange Coin",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Orange Coin"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Orange Gem",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Orange Gem")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Orange Lightning",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Orange Lightning"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Orange Snow",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Orange Snow"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Orange Soul",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Orange Soul"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Orange Sparks",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Orange Sparks"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Orange Storm",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Orange Storm"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Orange Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Orange Trail"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateSection("P")
Tab7:CreateToggle(
    "PP Speed",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("PP Speed")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Pink Gem",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Pink Gem")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Pink Lightning",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Pink Lightning"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Pink Snow",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Pink Snow")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Pink Soul",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Pink Soul")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Pink Sparks",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Pink Sparks"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Pink Storm",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Pink Storm")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Pink Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Pink Trail")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Purple & Pink",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Purple & Pink"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Purple Coin",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Purple Coin"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Purple Gem",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Purple Gem")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Purple Lightning",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Purple Lightning"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Purple Soul",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        " Purple Soul"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Purple Sparks",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Purple Sparks"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Purple Storm",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Purple Storm"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Purple Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Purple Trail"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateSection("R")
Tab7:CreateToggle(
    "RB Speed",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("RB Speed")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Rainbow Lightning",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Rainbow Lightning"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Rainbow Soul",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Rainbow Soul"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Rainbow Sparks",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Rainbow Sparks"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Rainbow Speed",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Rainbow Speed"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Rainbow Steps",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Rainbow Steps"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Rainbow Storm",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Rainbow Storm"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Rainbow Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Rainbow Trail"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Red & Blue",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red & Blue")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Red Coin",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red Coin")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Red Gem",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red Gem")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Red Lightning",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Red Lightning"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Red Snow",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red Snow")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Red Soul",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red Soul")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Red Sparks",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red Sparks")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Red Storm",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red Storm")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Red Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red Trail")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateSection("W")
Tab7:CreateToggle(
    "White Snow",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("White Snow")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateSection("Y")
Tab7:CreateToggle(
    "YB Speed",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("YB Speed")
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Yellow & Blue",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Yellow & Blue"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Yellow Soul",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Yellow Soul"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Yellow Sparks",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Yellow Sparks"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)

Tab7:CreateToggle(
    "Yellow Trail",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Yellow Trail"
                    )
                }

                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)

Tab8:CreateSection("Rebirth Pets")
Tab8:CreateButton(
    "Magzor",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Magzor"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Crowd Surfer",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Crowd Surfer"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Sorenzo",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Sorenzo"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)

Tab8:CreateSection("Game Upgrades")
Tab8:CreateButton(
    "x2 Trail Boosts",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "x2 Trail Boosts"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "+1 Pet Slot",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "+1 Pet Slot"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "+10 Item Capacity",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "+10 Item Capacity"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "+1 Daily Spin",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "+1 Daily Spin"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "x2 Chest Rewards",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "x2 Chest Rewards"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "x2 Quest Rewards",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "x2 Quest Rewards"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)

Tab8:CreateSection("Enhancements")
Tab8:CreateButton(
    "Gem Booster",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Gem Booster"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Step Booster",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Step Booster"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Infernal Gems",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Infernal Gems"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Ethereal Orbs",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Ethereal Orbs"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Demon Hoops",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Demon Hoops"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Divine Rebirth",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Divine Rebirth"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)

Tab9:CreateSection("Main Teleports")
Tab9:CreateButton(
    "City",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -9682.98828,
            74.8522873,
            3099.03394,
            0.087131381,
            0,
            0.996196866,
            0,
            1,
            0,
            -0.996196866,
            0,
            0.087131381
        )
    end
)
Tab9:CreateButton(
    "Snow City",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-9676.13867, 74.8522873, 3782.69385, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    end
)
Tab9:CreateButton(
    "Magma City",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -11054.9688,
            232.791656,
            4898.62842,
            -0.0872479677,
            0.000158954252,
            -0.996186614,
            -0.00054083002,
            0.999999821,
            0.00020692969,
            0.996186495,
            0.000556821818,
            -0.0872478485
        )
    end
)
Tab9:CreateButton(
    "Legends Highway",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -13098.8711,
            232.791656,
            5907.62793,
            -0.0872479677,
            0.000158954252,
            -0.996186614,
            -0.00054083002,
            0.999999821,
            0.00020692969,
            0.996186495,
            0.000556821818,
            -0.0872478485
        )
    end
)
Tab9:CreateButton(
    "Speed Jungle",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15274, 399, 5576)
    end
)

Tab9:CreateSection("Other Teleports")
Tab9:CreateButton(
    "Desert Race",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(48.3109131, 36.3147125, -8680.45312, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    end
)
Tab9:CreateButton(
    "Grassland Race",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            1686.07495,
            36.3147125,
            -5946.63428,
            -0.984812617,
            0,
            0.173621148,
            0,
            1,
            0,
            -0.173621148,
            0,
            -0.984812617
        )
    end
)
Tab9:CreateButton(
    "Magma Race",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            1001.33118,
            36.3147125,
            -10986.2178,
            -0.996191859,
            0,
            -0.0871884301,
            0,
            1,
            0,
            0.0871884301,
            0,
            -0.996191859
        )
    end
)
Tab9:CreateButton(
    "Space World",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -331.764069,
            5.45415115,
            585.201721,
            -1.03712082e-05,
            0.93968749,
            0.34203434,
            -1,
            -1.03712082e-05,
            -1.81794167e-06,
            1.81794167e-06,
            -0.34203434,
            0.939687431
        )
    end
)
Tab9:CreateButton(
    "Desert World",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            2519.90063,
            15.7072296,
            4355.74072,
            1.69873238e-05,
            0.93922013,
            0.343315423,
            -0.99999994,
            1.69873238e-05,
            2.9951334e-06,
            -2.9951334e-06,
            -0.343315423,
            0.93922019
        )
    end
)

Tab9:CreateSection("Space Teleports")
Tab9:CreateButton(
    "+1000 Hoop",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-477, 156, 755)
    end
)
Tab9:CreateButton(
    "Starway Race",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5018, 29, -4779)
    end
)

Tab9:CreateSection("Desert Teleports")
Tab9:CreateButton(
    "+8000 Hoop",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3386, 259, 16916)
    end
)
Tab9:CreateButton(
    "Speedway Race",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(663, 28, 9767)
    end
)
Tab9:CreateButton(
    "Second Island",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10517, 621, -5)
    end
)

Tab9:CreateSection("World Teleports")
Tab9:CreateButton(
    "City",
    function()
        game:GetService("TeleportService"):Teleport(3101667897)
    end
)
Tab9:CreateButton(
    "Outer Space",
    function()
        game:GetService("TeleportService"):Teleport(3232996272)
    end
)
Tab9:CreateButton(
    "Speed Desert",
    function()
        game:GetService("TeleportService"):Teleport(3276265788)
    end
)

Tab9:CreateSection("Server Teleports")
Tab9:CreateButton(
    "Lowest Player Count",
    function()
        LowestPlayer()
    end
)
Tab9:CreateButton(
    "Server Hop",
    function()
        Serverhop()
    end
)
Tab9:CreateButton(
    "Rejoin",
    function()
        Rejoin()
    end
)

Tab10:CreateSection("Settings")
Tab10:CreateToggle(
    "Freeze",
    function(state)
        if state then
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = true
        else
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = false
        end
    end
)
Tab10:CreateToggle(
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
Tab10:CreateBox(
    "Walk Speed",
    function(input)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = input
    end
)
Tab10:CreateBox(
    "Jump Power",
    function(input)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = input
    end
)
Tab10:CreateBox(
    "Hip Height",
    function(input)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = input
    end
)
Tab10:CreateBox(
    "Gravity",
    function(input)
        game.Workspace.Gravity = input
    end
)

Tab11:CreateSection("Ethereal Orb Rebirths")
Tab11:CreateLabel("49 Rebirths")
Tab11:CreateLabel("99 Rebirths")
Tab11:CreateLabel("199 Rebirths")
Tab11:CreateLabel("299 Rebirths")
Tab11:CreateLabel("399 Rebirths")
Tab11:CreateLabel("499 Rebirths")
Tab11:CreateLabel("599 Rebirths")
Tab11:CreateLabel("699 Rebirths")
Tab11:CreateLabel("799 Rebirths")
Tab11:CreateLabel("899 Rebirths")
Tab11:CreateLabel("999 Rebirths")
Tab11:CreateLabel("1099 Rebirths")
Tab11:CreateLabel("1749 Rebirths")
Tab11:CreateLabel("2099 Rebirths")
Tab11:CreateLabel("3099 Rebirths")
Tab11:CreateLabel("4399 Rebirths")
Tab11:CreateLabel("5499 Rebirths")
Tab11:CreateLabel("6499 Rebirths")
Tab11:CreateLabel("7839 Rebirths")
Tab11:CreateLabel("9799 Rebirths")
Tab11:CreateLabel("10999 Rebirths")
Tab11:CreateLabel("12749 Rebirths")
Tab11:CreateLabel("13159 Rebirths")
Tab11:CreateLabel("15399 Rebirths")
Tab11:CreateLabel("15499 Rebirths")

Tab12:CreateSection("Player Stats")
Tab12.statsLabel1 = Tab12:CreateLabel("Steps: ")
Tab12.statsLabel2 = Tab12:CreateLabel("Rebirths: ")
Tab12.statsLabel3 = Tab12:CreateLabel("Hoops: ")
Tab12.statsLabel4 = Tab12:CreateLabel("Races: ")
Tab12:CreateSection("Pet Stats")
Tab12.petsLabel1 = Tab12:CreateLabel("Equipped: ")
Tab12.petsLabel2 = Tab12:CreateLabel("Total Steps: ")
Tab12.petsLabel3 = Tab12:CreateLabel("Total Gems: ")

local function updateStats()
    local player = game.Players.LocalPlayer
    local leaderstats = player:FindFirstChild("leaderstats")

    repeat
        wait()
    until player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("gameGui")

    local petMenu = player.PlayerGui.gameGui:FindFirstChild("petsMenu")
    if not petMenu then
        return
    end

    local petInfoMenu = petMenu:FindFirstChild("petInfoMenu")
    if not petInfoMenu then
        return
    end

    local equippedPetsLabel = petInfoMenu:FindFirstChild("petsLabel")
    local petStepsLabel =
        petInfoMenu:FindFirstChild("totalStepsLabel") and petInfoMenu.totalStepsLabel:FindFirstChild("stepsLabel")
    local petGemsLabel =
        petInfoMenu:FindFirstChild("totalGemsLabel") and petInfoMenu.totalGemsLabel:FindFirstChild("gemsLabel")

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
            if leaderstats:FindFirstChild("Steps") then
                Tab12.statsLabel1.SetText("Steps: " .. leaderstats.Steps.Value)
            end
            if leaderstats:FindFirstChild("Rebirths") then
                Tab12.statsLabel2.SetText("Rebirths: " .. leaderstats.Rebirths.Value)
            end
            if leaderstats:FindFirstChild("Hoops") then
                Tab12.statsLabel3.SetText("Hoops: " .. leaderstats.Hoops.Value)
            end
            if leaderstats:FindFirstChild("Races") then
                Tab12.statsLabel4.SetText("Races: " .. leaderstats.Races.Value)
            end
        end

        if equippedPetsLabel then
            local petCount = convertFormattedNumber(equippedPetsLabel.Text)
            Tab12.petsLabel1.SetText("Equipped: " .. petCount)
        end
        if petStepsLabel then
            local stepsCount = convertFormattedNumber(petStepsLabel.Text)
            Tab12.petsLabel2.SetText("Total Steps: " .. stepsCount)
        end
        if petGemsLabel then
            local gemsCount = convertFormattedNumber(petGemsLabel.Text)
            Tab12.petsLabel3.SetText("Total Gems: " .. gemsCount)
        end
    end

    if leaderstats then
        for _, stat in ipairs(leaderstats:GetChildren()) do
            if stat:IsA("IntValue") or stat:IsA("NumberValue") then
                stat.Changed:Connect(onStatChanged)
            end
        end
    end

    if equippedPetsLabel then
        equippedPetsLabel:GetPropertyChangedSignal("Text"):Connect(onStatChanged)
    end
    if petStepsLabel then
        petStepsLabel:GetPropertyChangedSignal("Text"):Connect(onStatChanged)
    end
    if petGemsLabel then
        petGemsLabel:GetPropertyChangedSignal("Text"):Connect(onStatChanged)
    end

    onStatChanged()
end

updateStats()

Tab13:CreateSection("Script Configuration")
Tab13:CreateLabel("Coming soon!")