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
local basicexercise = ""

local beachgymlift = ""
local frostgymlift = ""
local mythicalgymlift = ""
local eternalgymlift = ""
local legendgymlift = ""
local musclekinggymlift = ""
local junglegymlift = ""
local durabilityrock = ""
local rebirthSuccessful = false
local rebamount = 0
local selectedbasicpettohatch = ""
local selectedadvancedpettohatch = ""
local selectedrarepettohatch = ""
local selectedepicpettohatch = ""
local selecteduniquepettohatch = ""
local selectedbasicpettoevolve = ""
local selectedadvancedpettoevolve = ""
local selectedrarepettoevolve = ""
local selectedepicpettoevolve = ""
local selecteduniquepettoevolve = ""

local autoWeight = false
local safeAutoWeight = false
local autoPushups = false
local safeAutoPushups = false
local autoHandstands = false
local safeAutoHandstands = false
local autoSitups = false
local safeAutoSitups = false
local autoBeachSquatRack = false
local autoBeachBenchPress = false
local autoBeachPullups = false
local autoBeachDeadlift = false
local autoBeachBoulderThrow = false
local autoFrostSquatRack = false
local autoFrostBenchPress = false
local autoFrostDeadlift = false
local autoMythicalPullups = false
local autoMythicalBenchPress = false
local autoMythicalBoulderThrow = false
local autoEternalBenchPress = false
local autoLegendPullups = false
local autoLegendSquatRack = false
local autoLegendBenchPress = false
local autoLegendDeadlift = false
local autoLegendBoulderThrow = false
local autoMuscleKingSquatRack = false
local autoMuscleKingBenchPress = false
local autoMuscleKingDeadlift = false
local autoMuscleKingBoulder = false
local autoJungleBenchPress = false
local autoJungleDeadlift = false
local autoJungleSquatRack = false
local autoJungleBoulderThrow = false
local autoRebirthStoppingPoint = false
local autoRebirth = false
local autoStrength = false
local autoKill = false
local safeAutoKill = false
local auto0DbRock = false
local auto10DbRock = false
local auto100DbRock = false
local auto5KDbRock = false
local auto150KDbRock = false
local auto400KDbRock = false
local auto750KDbRock = false
local auto1MDbRock = false
local auto5MDbRock = false
local auto10MDbRock = false
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

local function teleportToBaseplate()
    local baseplate = Instance.new("Part")
    baseplate.Size = Vector3.new(2000, 2, 2000)
    baseplate.Anchored = true
    baseplate.Position = Vector3.new(0, 2000, 0)
    baseplate.Parent = game.Workspace

    game.Players.LocalPlayer.Character:MoveTo(baseplate.Position)
end

local function teleportBack()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 0, 0))
end

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

local Window = Library:CreateWindow("ERV Hub", "Muscle Legends")

local Tab1 = Window:CreateTab("97943845400322")
local Tab2 = Window:CreateTab("133560794251495")
local Tab3 = Window:CreateTab("115717045051419")
local Tab4 = Window:CreateTab("108289467963312")
local Tab5 = Window:CreateTab("108289467963312")
local Tab6 = Window:CreateTab("126732386711554")
local Tab7 = Window:CreateTab("133951071765695")
local Tab8 = Window:CreateTab("104463835309303")
local Tab9 = Window:CreateTab("78413794210216")
local Tab10 = Window:CreateTab("119720224175089")
local Tab12 = Window:CreateTab("91133292164917")
local Tab13 = Window:CreateTab("139340575789519")

Tab1:CreateSection("Kill Farming")
Tab1:CreateToggle(
    "Auto Kill",
    function(state)
        if state then
            autoKill = true
            while autoKill do
                wait()

                local player = game.Players.LocalPlayer
                local character = player.Character

                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end

                for i = 1, 5 do
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                end

                for _, target in pairs(game.Players:GetPlayers()) do
                    if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        local targetChar = target.Character
                        local localHand = character:FindFirstChild("LeftHand")

                        if targetChar and localHand then
                            for _, part in pairs(targetChar:GetChildren()) do
                                if part:IsA("BasePart") then
                                    part.CFrame = localHand.CFrame
                                    part.Transparency = 1
                                    part.CanCollide = false
                                end
                            end

                            for _, item in pairs(targetChar:GetChildren()) do
                                if item:IsA("Accessory") or item:IsA("Hat") or item:IsA("Tool") then
                                    item:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        else
            autoKill = false
            wait(0.5)
            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
        end
    end
)
Tab1:CreateToggle(
    "Safe Auto Kill",
    function(state)
        if state then
            safeAutoKill = true
            teleportToBaseplate()
            while safeAutoKill do
                wait()
                game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 2005, 0))
                local player = game.Players.LocalPlayer
                local character = player.Character

                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end

                for i = 1, 5 do
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                end

                for _, target in pairs(game.Players:GetPlayers()) do
                    if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        local targetChar = target.Character
                        local localHand = character:FindFirstChild("LeftHand")

                        if targetChar and localHand then
                            for _, part in pairs(targetChar:GetChildren()) do
                                if part:IsA("BasePart") then
                                    part.CFrame = localHand.CFrame
                                    part.Transparency = 1
                                    part.CanCollide = false
                                end
                            end

                            for _, item in pairs(targetChar:GetChildren()) do
                                if item:IsA("Accessory") or item:IsA("Hat") or item:IsA("Tool") then
                                    item:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        else
            safeAutoKill = false
            wait(0.5)
            teleportBack()
            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
        end
    end
)
Tab1:CreateSection("Rebirth Farming")
Tab1:CreateToggle(
    "Auto Rebirth",
    function(state)
        if state then
            autoRebirth = true
            while autoRebirth do
                wait()
                local success, err =
                    pcall(
                    function()
                        local rebirthsBefore = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthRemote"):InvokeServer(
                            "rebirthRequest"
                        )
                        local rebirthsAfter = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                        if rebirthsAfter > rebirthsBefore then
                            wait(4)
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(
                                Enum.HumanoidStateType.Jumping
                            )
                        end
                    end
                )
                if not success then
                    autoRebirth = false
                end
            end
        else
            autoRebirth = false
        end
    end
)
Tab1:CreateSection("Rebirth Target Farm")
Tab1:CreateBox(
    "Rebirth Target",
    function(rebamountbb)
        rebamount = tonumber(rebamountbb) or 0
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
                        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthRemote"):InvokeServer(
                            "rebirthRequest"
                        )
                        local rebirthsAfter = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                        if rebirthsAfter > rebirthsBefore then
                            rebirthSuccessful = true
                            rebirthSuccessful = false
                        end
                        if rebirthsAfter >= rebamount then
                            autoRebirthStoppingPoint = false
                        end
                    end
                )
                if not success then
                    autoRebirthStoppingPoint = false
                end
            end
        else
            autoRebirthStoppingPoint = false
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

Tab2:CreateSection("Basic Farm", "Auto farm default exercises")
Tab2:CreateDropdown(
    "Choose Exercise",
    {"Weight", "Pushups", "Handstands", "Situps"},
    function(cbe)
        basicexercise = cbe
    end
)
Tab2:CreateToggle(
    "Auto Train",
    function(state)
        if state then
            if basicexercise == "Weight" then
                autoWeight = true
                while autoWeight do
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Weight" then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                end
            elseif basicexercise == "Pushups" then
                autoPushups = true
                while autoPushups do
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Pushups" then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                end
            elseif basicexercise == "Handstands" then
                autoHandstands = true
                while autoHandstands do
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Handstands" then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                end
            elseif basicexercise == "Situps" then
                autoSitups = true
                while autoSitups do
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Situps" then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                end
            end
        else
            autoWeight = false
            autoPushups = false
            autoHandstands = false
            autoSitups = false
            wait(0.5)
            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
        end
    end
)
Tab2:CreateSection("Safe Basic Farm", "Auto farm default exercises")
Tab2:CreateDropdown(
    "Choose Exercise",
    {"Weight", "Pushups", "Handstands", "Situps"},
    function(cbe)
        safebasicexercise = cbe
    end
)
Tab2:CreateToggle(
    "Auto Train",
    function(state)
        if state then
            if safebasicexercise == "Weight" then
                safeAutoWeight = true
                teleportToBaseplate()
                while safeAutoWeight do
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Weight" then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                end
            elseif safebasicexercise == "Pushups" then
                safeAutoPushups = true
                teleportToBaseplate()
                while safeAutoPushups do
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Pushups" then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                end
            elseif safebasicexercise == "Handstands" then
                safeAutoHandstands = true
                teleportToBaseplate()
                while safeAutoHandstands do
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Handstands" then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                end
            elseif safebasicexercise == "Situps" then
                safeAutoSitups = true
                teleportToBaseplate()
                while safeAutoSitups do
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Situps" then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                end
            end
        else
            safeAutoWeight = false
            safeAutoPushups = false
            safeAutoHandstands = false
            safeAutoSitups = false
            teleportBack()
            wait(0.5)
            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
        end
    end
)
Tab2:CreateSection("Beach Gym Farm", "Auto farm beach gym exercises")
Tab2:CreateDropdown(
    "Choose Lift",
    {"Squat Rack", "Bench Press", "Pullups", "Deadlift", "Boulder Throw"},
    function(cgl)
        beachgymlift = cgl
    end
)
Tab2:CreateToggle(
    "Auto Train",
    function(state)
        if state then
            if beachgymlift == "Squat Rack" then
                autoBeachSquatRack = true
                while autoBeachSquatRack do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1000 then
                        wait()
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                232.627625,
                                3.67689133,
                                96.3039856,
                                -0.963445187,
                                -7.78685845e-08,
                                -0.267905563,
                                -7.92865222e-08,
                                1,
                                -5.52570167e-09,
                                0.267905563,
                                1.5917589e-08,
                                -0.963445187
                            )
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                        )
                    end
                end
            elseif beachgymlift == "Bench Press" then
                autoBeachBenchPress = true
                while autoBeachBenchPress do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 150 then
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                -241.827469,
                                7.91391563,
                                346.321808,
                                0.811665356,
                                -1.43794319e-08,
                                -0.584122717,
                                -3.94010407e-08,
                                1,
                                -7.93666999e-08,
                                0.584122717,
                                8.74342447e-08,
                                0.811665356
                            )
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder["Bench Press"].interactSeat
                        )
                    end
                end
            elseif beachgymlift == "Pullups" then
                autoBeachPullups = true
                while autoBeachPullups do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1000 then
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                -185.157745,
                                5.81071186,
                                104.747154,
                                0.227061391,
                                -8.2363325e-09,
                                0.97388047,
                                5.58502826e-08,
                                1,
                                -4.56432803e-09,
                                -0.97388047,
                                5.54278827e-08,
                                0.227061391
                            )
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
                        )
                    end
                end
            elseif beachgymlift == "Deadlift" then
                autoBeachDeadlift = true
                while autoBeachDeadlift do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1500 then
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                136.606216,
                                3.67689133,
                                97.661499,
                                -0.974106729,
                                -1.89495477e-08,
                                0.226088539,
                                -1.78365624e-08,
                                1,
                                6.96555214e-09,
                                -0.226088539,
                                2.75254886e-09,
                                -0.974106729
                            )
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                        )
                    end
                end
            elseif beachgymlift == "Boulder Throw" then
                autoBeachBoulderThrow = true
                while autoBeachBoulderThrow do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 3000 then
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                -91.6730804,
                                3.67689133,
                                -292.42868,
                                -0.221022144,
                                -2.21041621e-08,
                                -0.975268781,
                                1.21414407e-08,
                                1,
                                -2.54162646e-08,
                                0.975268781,
                                -1.7458726e-08,
                                -0.221022144
                            )
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                        )
                    end
                end
            end
        else
            autoBeachSquatRack = false
            autoBeachBenchPress = false
            autoBeachPullups = false
            autoBeachDeadlift = false
            autoBeachBoulderThrow = false
            wait(0.5)
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
)
Tab2:CreateSection("Frost Gym Farm", "Auto farm frost gym exercises")
Tab2:CreateDropdown(
    "Choose Lift",
    {"Squat Rack", "Bench Press", "Deadlift"},
    function(cgl)
        frostgymlift = cgl
    end
)
Tab2:CreateToggle(
    "Auto Train",
    function(state)
        if state then
            if frostgymlift == "Squat Rack" then
                autoFrostSquatRack = true
                while autoFrostSquatRack do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 4000 then
                        wait()
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                -2629.13818,
                                3.36860609,
                                -609.827454,
                                -0.995664716,
                                -2.67296816e-08,
                                -0.0930150598,
                                -1.90042453e-08,
                                1,
                                -8.39415222e-08,
                                0.0930150598,
                                -8.18099295e-08,
                                -0.995664716
                            )
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                        )
                    end
                end
            elseif frostgymlift == "Bench Press" then
                autoFrostBenchPress = true
                while autoFrostBenchPress do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 7500 then
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                -3020.7019,
                                32.5691414,
                                -194.773117,
                                0.924556971,
                                2.05821564e-08,
                                0.381043822,
                                -3.5507064e-08,
                                1,
                                3.21384199e-08,
                                -0.381043822,
                                -4.32435456e-08,
                                0.924556971
                            )
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder["Bench Press"].interactSeat
                        )
                    end
                end
            elseif frostgymlift == "Deadlift" then
                autoFrostDeadlift = true
                while autoFrostDeadlift do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 5000 then
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                -2916.11572,
                                3.67689204,
                                -212.97438,
                                -0.241641939,
                                -6.10995343e-08,
                                0.970365465,
                                6.65890596e-08,
                                1,
                                7.9547597e-08,
                                -0.970365465,
                                8.38377616e-08,
                                -0.241641939
                            )
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                        )
                    end
                end
            end
        else
            autoFrostSquatRack = false
            autoFrostBenchPress = false
            autoFrostDeadlift = false
            wait(0.5)
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
)
Tab2:CreateSection("Mythical Gym Farm", "Auto farm mythical gym exercises")
Tab2:CreateDropdown(
    "Choose Lift",
    {"Pullups", "Bench Press", "Boulder Throw"},
    function(cgl)
        mythicalgymlift = cgl
    end
)
Tab2:CreateToggle(
    "Auto Train",
    function(state)
        if state then
            if mythicalgymlift == "Pullups" then
                autoMythicalPullups = true
                while autoMythicalPullups do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 4000 then
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                2315.82104,
                                5.81071281,
                                847.153076,
                                0.993555248,
                                6.99809632e-08,
                                0.113349125,
                                -7.05298859e-08,
                                1,
                                8.32554692e-10,
                                -0.113349125,
                                -8.82168916e-09,
                                0.993555248
                            )
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
                        )
                    end
                end
            elseif mythicalgymlift == "Bench Press" then
                autoMythicalBenchPress = true
                while autoMythicalBenchPress do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 15000 then
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                2363.95483,
                                42.2141037,
                                1243.50562,
                                -0.944882751,
                                2.18911698e-08,
                                0.32740894,
                                4.06544087e-09,
                                1,
                                -5.51292381e-08,
                                -0.32740894,
                                -5.07596027e-08,
                                -0.944882751
                            )
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder["Bench Press"].interactSeat
                        )
                    end
                end
            elseif mythicalgymlift == "Boulder Throw" then
                autoMythicalBoulderThrow = true
                while autoMythicalBoulderThrow do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 10000 then
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                2486.01733,
                                3.67689276,
                                1237.89331,
                                0.883595645,
                                -2.06135038e-08,
                                -0.468250751,
                                -3.3286871e-09,
                                1,
                                -5.03036404e-08,
                                0.468250751,
                                4.60067362e-08,
                                0.883595645
                            )
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                        )
                    end
                end
            end
        else
            autoMythicalPullups = false
            autoMythicalBenchPress = false
            autoMythicalBoulderThrow = false
            wait(0.5)
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
)
Tab2:CreateSection("Eternal Gym Farm", "Auto farm eternal gym exercises")
Tab2:CreateDropdown(
    "Choose Lift",
    {"Bench Press"},
    function(cgl)
        eternalgymlift = cgl
    end
)
Tab2:CreateToggle(
    "Auto Train",
    function(state)
        if state then
            if eternalgymlift == "Bench Press" then
                autoEternalBenchPress = true
                while autoEternalBenchPress do
                    wait()
                    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 15000 then
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(
                                -7172.77002,
                                48.3923645,
                                -1105.06018,
                                -0.972435296,
                                -4.87620122e-09,
                                0.233172983,
                                -2.76572942e-09,
                                1,
                                9.37805122e-09,
                                -0.233172983,
                                8.47465476e-09,
                                -0.972435296
                            )
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                            "rep",
                            game:GetService("Workspace").machinesFolder["Bench Press"].interactSeat
                        )
                    end
                end
            end
        else
            autoEternalBenchPress = false
            wait(0.5)
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
)
Tab2:CreateSection("Legend Gym Farm", "Auto farm legend gym exercises")
Tab2:CreateDropdown(
    "Choose Lift",
    {"Pullups", "Squat Rack", "Bench Press", "Deadlift", "Boulder Throw"},
    function(cgl)
        legendgymlift = cgl
    end
)
Tab2:CreateToggle(
    "Auto Train",
    function(state)
        if state then
            if legendgymlift == "Pullups" then
                autoLegendPullups = true
                while autoLegendPullups do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(
                            4305.08203,
                            989.963623,
                            -4118.44873,
                            -0.953815758,
                            -7.58000382e-08,
                            -0.30039227,
                            -8.98859724e-08,
                            1,
                            3.30721512e-08,
                            0.30039227,
                            5.85457904e-08,
                            -0.953815758
                        )
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
                    )
                end
            elseif legendgymlift == "Squat Rack" then
                autoLegendSquatRack = true
                while autoLegendSquatRack do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(
                            4443.04443,
                            987.521484,
                            -4061.12988,
                            0.83309716,
                            3.33018835e-09,
                            0.553126693,
                            -2.87759438e-09,
                            1,
                            -1.68654424e-09,
                            -0.553126693,
                            -1.86619012e-10,
                            0.83309716
                        )
                        local vim = game:GetService("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                    )
                end
            elseif legendgymlift == "Bench Press" then
                autoLegendBenchPress = true
                while autoLegendBenchPress do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(
                            4109.81152,
                            1024.02734,
                            -3800.75122,
                            0.446250677,
                            -7.44993258e-08,
                            -0.894908011,
                            -1.94296179e-09,
                            1,
                            -8.4216893e-08,
                            0.894908011,
                            3.93206179e-08,
                            0.446250677
                        )
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder["Bench Press"].interactSeat
                    )
                end
            elseif legendgymlift == "Deadlift" then
                autoLegendDeadlift = true
                while autoLegendDeadlift do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(
                            4538.42627,
                            987.829834,
                            -4008.82007,
                            -0.830109239,
                            2.21324914e-08,
                            0.557600796,
                            8.02302083e-08,
                            1,
                            7.97476361e-08,
                            -0.557600796,
                            1.1093568e-07,
                            -0.830109239
                        )
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                    )
                end
            elseif legendgymlift == "Boulder Throw" then
                autoLegendBoulderThrow = true
                while autoLegendBoulderThrow do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(
                            4189.96143,
                            987.829773,
                            -3903.0166,
                            0.422592968,
                            0,
                            0.906319559,
                            0,
                            1,
                            0,
                            -0.906319559,
                            0,
                            0.422592968
                        )
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                    )
                end
            end
        else
            autoLegendPullups = false
            autoLegendSquatRack = false
            autoLegendBenchPress = false
            autoLegendDeadlift = false
            autoLegendBoulderThrow = false
            wait(0.5)
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
)
Tab2:CreateSection("Muscle King Gym Farm", "Auto farm muscle king gym exercises")
Tab2:CreateDropdown(
    "Choose Lift",
    {"Squat Rack", "Bench Press", "Deadlift", "Boulder Throw"},
    function(cgl)
        musclekinggymlift = cgl
    end
)
Tab2:CreateToggle(
    "Auto Train",
    function(state)
        if state then
            if musclekinggymlift == "Squat Rack" then
                autoMuscleKingSquatRack = true
                while autoMuscleKingSquatRack do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(
                            -8757.37012,
                            13.2186356,
                            -6051.24365,
                            -0.902269304,
                            1.63610299e-08,
                            -0.431172907,
                            1.71076486e-08,
                            1,
                            2.14606288e-09,
                            0.431172907,
                            -5.44002754e-09,
                            -0.902269304
                        )
                        local vim = game:GetService("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                    )
                end
            elseif musclekinggymlift == "Bench Press" then
                autoMuscleKingBenchPress = true
                while autoMuscleKingBenchPress do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(
                            -8592.99805,
                            49.1056519,
                            -6042.80322,
                            -0.975815654,
                            -1.70261014e-08,
                            0.218595073,
                            -1.06326148e-08,
                            1,
                            3.04244203e-08,
                            -0.218595073,
                            2.73643881e-08,
                            -0.975815654
                        )
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder["Bench Press"].interactSeat
                    )
                end
            elseif musclekinggymlift == "Deadlift" then
                autoMuscleKingDeadlift = true
                while autoMuscleKingDeadlift do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(
                            -8768.4375,
                            13.5269203,
                            -5681.62256,
                            -0.997508109,
                            -5.4007393e-10,
                            0.0705519542,
                            1.52984292e-10,
                            1,
                            9.81797044e-09,
                            -0.0705519542,
                            9.80429782e-09,
                            -0.997508109
                        )
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                    )
                end
            elseif musclekinggymlift == "Boulder Throw" then
                autoMuscleKingBoulder = true
                while autoMuscleKingBoulder do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(
                            -8946.12402,
                            20.8987751,
                            -5701.57861,
                            -0.629802942,
                            1.87292315e-08,
                            -0.776754975,
                            6.46146159e-09,
                            1,
                            1.88731129e-08,
                            0.776754975,
                            6.86736934e-09,
                            -0.629802942
                        )
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                    )
                end
            end
        else
            autoMuscleKingSquatRack = false
            autoMuscleKingBenchPress = false
            autoMuscleKingDeadlift = false
            autoMuscleKingBoulder = false
            wait(0.5)
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
)
Tab2:CreateSection("Jungle Gym Farm", "Auto farm jungle gym exercises")
Tab2:CreateDropdown(
    "Choose Lift",
    {"Bench Press", "Deadlift", "Squat Rack", "Boulder Throw"},
    function(cgl)
        junglegymlift = cgl
    end
)
Tab2:CreateToggle(
    "Auto Train",
    function(state)
        if state then
            if junglegymlift == "Bench Press" then
                autoJungleBenchPress = true
                while autoJungleBenchPress do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(-8178, 66, 1929)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder["Jungle Bench"].interactSeat
                    )
                end
            elseif junglegymlift == "Deadlift" then
                autoJungleDeadlift = true
                while autoJungleDeadlift do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(-8658, 9, 2085)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder["Jungle Bar Lift"].interactSeat
                    )
                end
            elseif junglegymlift == "Squat Rack" then
                autoJungleSquatRack = true
                while autoJungleSquatRack do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(-8391, 9, 2911)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder["Jungle Squat"].interactSeat
                    )
                end
            elseif junglegymlift == "Boulder Throw" then
                autoJungleBoulderThrow = true
                while autoJungleBoulderThrow do
                    wait()
                    if game.Players.LocalPlayer.machineInUse.Value == nil then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                            CFrame.new(-8612, 9, 2685)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                        "rep",
                        game:GetService("Workspace").machinesFolder["Jungle Boulder"].interactSeat
                    )
                end
            end
        else
            autoJungleBenchPress = false
            autoJungleDeadlift = false
            autoJungleSquatRack = false
            autoJungleBoulderThrow = false
            wait(0.5)
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
)

Tab3:CreateSection("Durability Rock Farm", "Auto farm durability rocks")
Tab3:CreateToggle(
    "0 Durability",
    function(state)
        if state then
            auto0DbRock = true
            while auto0DbRock do
                wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                    CFrame.new(
                    7.60643005,
                    4.02632904,
                    2104.54004,
                    -0.23040159,
                    -8.53662385e-08,
                    -0.973095655,
                    -4.68743764e-08,
                    1,
                    -7.66279342e-08,
                    0.973095655,
                    2.79580536e-08,
                    -0.23040159
                )
            end
        end
        auto0DbRock = false
        wait(0.5)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
    end
)
Tab3:CreateToggle(
    "10 Durability",
    function(state)
        if state then
            auto10DbRock = true
            while auto10DbRock do
                wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                    CFrame.new(
                    -157.680908,
                    3.72453046,
                    434.871185,
                    0.923298299,
                    -1.81774684e-09,
                    -0.384083599,
                    3.45247031e-09,
                    1,
                    3.56670582e-09,
                    0.384083599,
                    -4.61917082e-09,
                    0.923298299
                )
            end
        end
        auto10DbRock = false
        wait(0.5)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
    end
)
Tab3:CreateToggle(
    "100 Durability",
    function(state)
        if state then
            auto100DbRock = true
            while auto100DbRock do
                wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                    CFrame.new(
                    162.233673,
                    3.66615629,
                    -164.686783,
                    -0.921312928,
                    -1.80826774e-07,
                    -0.38882193,
                    -9.13036544e-08,
                    1,
                    -2.48719346e-07,
                    0.38882193,
                    -1.93647494e-07,
                    -0.921312928
                )
            end
        end
        auto100DbRock = false
        wait(0.5)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
    end
)
Tab3:CreateToggle(
    "5K Durability",
    function(state)
        if state then
            auto5KDbRock = true
            while auto5KDbRock do
                wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                    CFrame.new(
                    329.831482,
                    3.66450214,
                    -618.48407,
                    -0.806075394,
                    -8.67358096e-08,
                    0.591812849,
                    -1.05715522e-07,
                    1,
                    2.57029176e-09,
                    -0.591812849,
                    -6.04919563e-08,
                    -0.806075394
                )
            end
        end
        auto5KDbRock = false
        wait(0.5)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
    end
)
Tab3:CreateToggle(
    "150K Durability",
    function(state)
        if state then
            auto150KDbRock = true
            while auto150KDbRock do
                wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                    CFrame.new(
                    -2566.78076,
                    3.97019577,
                    -277.503235,
                    -0.923934579,
                    -4.11600105e-08,
                    -0.382550538,
                    -3.38838042e-08,
                    1,
                    -2.57576183e-08,
                    0.382550538,
                    -1.08360858e-08,
                    -0.923934579
                )
            end
        end
        auto150KDbRock = false
        wait(0.5)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
    end
)
Tab3:CreateToggle(
    "400K Durability",
    function(state)
        if state then
            auto400KDbRock = true
            while auto400KDbRock do
                wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                    CFrame.new(
                    2155.61743,
                    3.79830337,
                    1227.06482,
                    -0.551303148,
                    -9.16796949e-09,
                    -0.834304988,
                    -5.61318245e-08,
                    1,
                    2.61027839e-08,
                    0.834304988,
                    6.12216127e-08,
                    -0.551303148
                )
            end
        end
        auto400KDbRock = false
        wait(0.5)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
    end
)
Tab3:CreateToggle(
    "750K Durability",
    function(state)
        if state then
            auto750KDbRock = true
            while auto750KDbRock do
                wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                    CFrame.new(
                    -7285.6499,
                    3.66624784,
                    -1228.27417,
                    0.857643783,
                    -1.58175091e-08,
                    -0.514244199,
                    -1.22581563e-08,
                    1,
                    -5.12025977e-08,
                    0.514244199,
                    5.02172774e-08,
                    0.857643783
                )
            end
        end
        auto750KDbRock = false
        wait(0.5)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
    end
)
Tab3:CreateToggle(
    "1M Durability",
    function(state)
        if state then
            auto1MDbRock = true
            while auto1MDbRock do
                wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                    CFrame.new(
                    4160.87109,
                    987.829102,
                    -4136.64502,
                    -0.893115997,
                    1.25481356e-05,
                    0.44982639,
                    5.02490684e-06,
                    1,
                    -1.79187136e-05,
                    -0.44982639,
                    -1.37431543e-05,
                    -0.893115997
                )
            end
        end
        auto1MDbRock = false
        wait(0.5)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
    end
)
Tab3:CreateToggle(
    "5M Durability",
    function(state)
        if state then
            auto5MDbRock = true
            while auto5MDbRock do
                wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                    CFrame.new(
                    -8957.54395,
                    5.53625107,
                    -6126.90186,
                    -0.803919137,
                    6.6065212e-08,
                    0.594738603,
                    -8.93136143e-09,
                    1,
                    -1.23155459e-07,
                    -0.594738603,
                    -1.04318865e-07,
                    -0.803919137
                )
            end
        end
        auto5MDbRock = false
        wait(0.5)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
    end
)
Tab3:CreateToggle(
    "10M Durability",
    function(state)
        if state then
            auto10MDbRock = true
            while auto10MDbRock do
                wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-7635, 7, 3011)
            end
        end
        auto10MDbRock = false
        wait(0.5)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
    end
)

Tab4:CreateSection("Hatch Basic Pets")
Tab4:CreateToggle(
    "Blue Birdie",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Blue Birdie"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Orange Hedgehog",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Orange Hedgehog"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Red Kitty",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red Kitty")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Blue Bunny",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Blue Bunny")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateSection("Hatch Advanced Pets")
Tab4:CreateToggle(
    "Dark Vampy",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Dark Vampy")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Yellow Butterfly",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Yellow Butterfly"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateSection("Hatch Rare Pets")
Tab4:CreateToggle(
    "Purple Falcon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Purple Falcon"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Red Dragon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red Dragon")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "White Pegasus",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "White Pegasus"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Purple Dragon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Purple Dragon"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Orange Pegasus",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Orange Pegasus"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Frostwave Legends Pinguin",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Frostwave Legends Pinguin"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Phantom Genesis Dragon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Phantom Genesis Dragon"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Eternal Strike Leviathan",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Eternal Strike Leviathan"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateSection("Hatch Epic Pets")
Tab4:CreateToggle(
    "Blue Firecaster",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Blue Firecaster"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Golden Pheonix",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Golden Pheonix"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Red Firecaster",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Red Firecaster"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Blue Pheonix",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Blue Pheonix"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Dark Legends Manticore",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Dark Legends Manticore"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Ultimate Supernova Pegasus",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Ultimate Supernova Pegasus"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Lightning Strike Phantom",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Lightning Strike Phantom"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Golden Viking",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Golden Viking"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateSection("Hatch Unique Pets")
Tab4:CreateToggle(
    "Aether Spirit Bunny",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Aether Spirit Bunny"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Cybernetic Showdown Dragon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Cybernetic Showdown Dragon"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Infernal Dragon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Infernal Dragon"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Darkstar Hunter",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Darkstar Hunter"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Muscle Sensei",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Muscle Sensei"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab4:CreateToggle(
    "Neon Guardian",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Neon Guardian"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateSection("Evolve Basic Pets")
Tab5:CreateToggle(
    "Blue Birdie",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Blue Birdie"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Orange Hedgehog",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Orange Hedgehog"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Red Kitty",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Red Kitty"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Blue Bunny",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Blue Bunny"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateSection("Evolve Advanced Pets")
Tab5:CreateToggle(
    "Dark Vampy",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Dark Vampy"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Yellow Butterfly",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Yellow Butterfly"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateSection("Evolve Rare Pets")
Tab5:CreateToggle(
    "Purple Falcon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Purple Falcon"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Red Dragon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Red Dragon"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "White Pegasus",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "White Pegasus"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Purple Dragon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Purple Dragon"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Orange Pegasus",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Orange Pegasus"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Frostwave Legends Pinguin",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Frostwave Legends Pinguin"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Phantom Genesis Dragon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Phantom Genesis Dragon"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Eternal Strike Leviathan",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Eternal Strike Leviathan"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateSection("Evolve Epic Pets")
Tab5:CreateToggle(
    "Blue Firecaster",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Blue Firecaster"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Golden Pheonix",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Golden Pheonix"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Red Firecaster",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Red Firecaster"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Blue Pheonix",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Blue Pheonix"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Dark Legends Manticore",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Dark Legends Manticore"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Ultimate Supernova Pegasus",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Ultimate Supernova Pegasus"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Lightning Strike Phantom",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Lightning Strike Phantom"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Golden Viking",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Golden Viking"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateSection("Evolve Unique Pets")
Tab5:CreateToggle(
    "Aether Spirit Bunny",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Aether Spirit Bunny"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Cybernetic Showdown Dragon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Cybernetic Showdown Dragon"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Infernal Dragon",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Infernal Dragon"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Darkstar Hunter",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Darkstar Hunter"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Muscle Sensei",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Muscle Sensei"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)
Tab5:CreateToggle(
    "Neon Guardian",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "evolvePet",
                    [2] = "Neon Guardian"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(
                    unpack(args)
                )
            end
        else
            _G.loop = false
        end
    end
)

Tab6:CreateSection("Crystals")
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
                game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab6:CreateToggle(
    "Green Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()

                local args = {
                    [1] = "openCrystal",
                    [2] = "Green Crystal"
                }

                game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab6:CreateToggle(
    "Mythical Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Mythical Crystal"
                }

                game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab6:CreateToggle(
    "Frost Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Frost Crystal"
                }

                game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
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

                game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab6:CreateToggle(
    "Legends Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Legends Crystal"
                }

                game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab6:CreateToggle(
    "Muscle Elite Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Muscle Elite Crystal"
                }

                game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab6:CreateToggle(
    "Galaxy Oracle Crystal",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = "openCrystal",
                    [2] = "Galaxy Oracle Crystal"
                }

                game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
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

                game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)

Tab7:CreateSection("Hatch Basic Aura's")
Tab7:CreateToggle(
    "Yellow Aura",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Yellow Aura"
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
    "Purple Aura",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Purple Aura"
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
    "Green Aura",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Green Aura")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Blue Aura",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Blue Aura")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Red Aura",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red Aura")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)

Tab7:CreateSection("Hatch Advanced Aura's")
Tab7:CreateToggle(
    "Electro",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Electro")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Purple Nova",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Purple Nova"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateSection("Hatch Rare Aura's")
Tab7:CreateToggle(
    "Astral Electro",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Astral Electro"
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
    "Dark Electro",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Dark Electro"
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
    "Supernova",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Supernova")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Power Lightning",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Power Lightning"
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
    "Ultra Inferno",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Ultra Inferno"
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
    "Ultra Mirage",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Ultra Mirage"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)

Tab7:CreateSection("Hatch Epic Aura's")
Tab7:CreateToggle(
    "Enchanted Mirage",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Enchanted Mirage"
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
    "Unstable Mirage",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Unstable Mirage"
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
    "Lightning",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Lightning")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Azure Tundra",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Azure Tundra"
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
    "Grand Supernova Aura",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Grand Supernova Aura"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateSection("Hatch Unique Aura's")
Tab7:CreateToggle(
    "Inferno",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Inferno")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Dark Storm",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Dark Storm")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab7:CreateToggle(
    "Dark Lightning",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Dark Lightning"
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
    "Muscle King",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Muscle King"
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
    "Eternal Megastrike Aura",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Eternal Megastrike Aura"
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
    "Entropic Blast Aura",
    function(state)
        if state then
            _G.loop = true
            while _G.loop == true do
                wait()
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(
                        "Entropic Blast Aura"
                    )
                }
                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
            end
        else
            _G.loop = false
        end
    end
)
Tab8:CreateSection("Game Upgrades")
Tab8:CreateButton(
    "+5% Rep Speed",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "+5% Rep Speed"
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
    "Muscle Mind",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Muscle Mind"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Jungle Swift",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Jungle Swift"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Infernal Health",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Infernal Health"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Galaxy Gains",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Galaxy Gains"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Demon Damage",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Demon Damage"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)
Tab8:CreateButton(
    "Golden Rebirth",
    function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Golden Rebirth"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(
            unpack(args)
        )
    end
)

Tab9:CreateSection("Main Teleports")
Tab9:CreateButton(
    "Beach Gym",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -57.1439056,
            7.38249874,
            311.925446,
            0.998239815,
            1.62942975e-08,
            -0.0593064278,
            -1.64620033e-08,
            1,
            -2.33921171e-09,
            0.0593064278,
            3.31139693e-09,
            0.998239815
        )
    end
)
Tab9:CreateButton(
    "Tiny Gym",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -36.9063606,
            7.53582478,
            1879.46631,
            -0.997119308,
            5.31786242e-08,
            0.0758490562,
            5.21852961e-08,
            1,
            -1.50780437e-08,
            -0.0758490562,
            -1.10764029e-08,
            -0.997119308
        )
    end
)
Tab9:CreateButton(
    "Frost Gym",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -2623.02222,
            7.38249826,
            -409.073334,
            3.98158673e-10,
            5.45164192e-10,
            1,
            1.87618454e-09,
            1,
            -5.45164192e-10,
            -1,
            1.87618454e-09,
            3.98158673e-10
        )
    end
)
Tab9:CreateButton(
    "Mythical Gym",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            2250.77808,
            7.38249826,
            1073.22668,
            -1.64267142e-11,
            1.70486025e-08,
            -1,
            2.15084892e-08,
            1,
            1.70486025e-08,
            1,
            -2.15084892e-08,
            -1.64270802e-11
        )
    end
)
Tab9:CreateButton(
    "Eternal Gym",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -6758.96387,
            7.38251305,
            -1284.9187,
            -7.71708114e-11,
            4.81217057e-08,
            1,
            -7.21120452e-09,
            1,
            -4.81217057e-08,
            -1,
            -7.21120452e-09,
            -7.71704645e-11
        )
    end
)
Tab9:CreateButton(
    "Legends Gym",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            4603.28174,
            991.560547,
            -3897.86572,
            -0.173624292,
            -8.37344416e-08,
            0.984811962,
            1.40068535e-08,
            1,
            8.7495259e-08,
            -0.984811962,
            2.89854185e-08,
            -0.173624292
        )
    end
)
Tab9:CreateButton(
    "Muscle King",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -8625.93164,
            17.2325287,
            -5730.47314,
            0.765763402,
            1.55031827e-08,
            0.643122375,
            1.08738378e-08,
            1,
            -3.70535567e-08,
            -0.643122375,
            3.53674672e-08,
            0.765763402
        )
    end
)
Tab9:CreateButton(
    "Jungle Gym",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8691, 9, 2390)
    end
)

Tab9:CreateSection("Other Teleports")
Tab9:CreateButton(
    "Boxing Ring",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -1839.30945,
            103.632477,
            -5878.37451,
            0.99926281,
            -1.95332195e-08,
            0.0383901037,
            1.7886963e-08,
            1,
            4.32257785e-08,
            -0.0383901037,
            -4.25072315e-08,
            0.99926281
        )
    end
)
Tab9:CreateButton(
    "Desert Ring",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            941.311462,
            103.632477,
            -6997.45508,
            0.986855686,
            -7.73859128e-08,
            0.161603943,
            8.39755572e-08,
            1,
            -3.39462183e-08,
            -0.161603943,
            4.70707988e-08,
            0.986855686
        )
    end
)
Tab9:CreateButton(
    "Magma Ring",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            4442.30273,
            103.632492,
            -8401.64453,
            0.999876678,
            7.90023691e-09,
            0.0157060623,
            -7.82622678e-09,
            1,
            -4.77366058e-09,
            -0.0157060623,
            4.65015271e-09,
            0.999876678
        )
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

Tab12:CreateSection("Player Stats")
Tab12.statsLabel1 = Tab12:CreateLabel("Strength: ")
Tab12.statsLabel2 = Tab12:CreateLabel("Rebirths: ")
Tab12.statsLabel3 = Tab12:CreateLabel("Kills: ")
Tab12.statsLabel4 = Tab12:CreateLabel("Brawls: ")

Tab12:CreateSection("Other Stats")
Tab12.playerLabel1 = Tab12:CreateLabel("Durability: ")
Tab12.playerLabel2 = Tab12:CreateLabel("Agility: ")
Tab12.playerLabel3 = Tab12:CreateLabel("Buffness: ")
Tab12.playerLabel4 = Tab12:CreateLabel("Height: ")
Tab12.playerLabel5 = Tab12:CreateLabel("Good Karma: ")
Tab12.playerLabel6 = Tab12:CreateLabel("Evil Karma: ")

local function updateStats()
    local player = game.Players.LocalPlayer
    local leaderstats = player:FindFirstChild("leaderstats")

    repeat
        wait()
    until player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("gameGui")

    local playerMenu = player.PlayerGui.gameGui:FindFirstChild("statsMenu")
    if not playerMenu then
        return
    end

    local statsList = playerMenu:FindFirstChild("statsList")
    if not statsList then
        return
    end

    local playerDurabilityLabel = statsList:FindFirstChild("durabilityFrame"):FindFirstChild("amountLabel")
    local playerAgilityLabel = statsList:FindFirstChild("agilityFrame"):FindFirstChild("amountLabel")
    local playerBuffnessLabel = statsList:FindFirstChild("buffnessFrame"):FindFirstChild("amountLabel")
    local playerHeightLabel = statsList:FindFirstChild("heightFrame"):FindFirstChild("amountLabel")
    local playerGoodKarmaLabel = playerMenu:FindFirstChild("goodKarmaFrame"):FindFirstChild("amountLabel")
    local playerEvilKarmaLabel = playerMenu:FindFirstChild("evilKarmaFrame"):FindFirstChild("amountLabel")

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
            if leaderstats:FindFirstChild("Strength") then
                Tab12.statsLabel1.SetText("Strength: " .. leaderstats.Strength.Value)
            end
            if leaderstats:FindFirstChild("Rebirths") then
                Tab12.statsLabel2.SetText("Rebirths: " .. leaderstats.Rebirths.Value)
            end
            if leaderstats:FindFirstChild("Kills") then
                Tab12.statsLabel3.SetText("Kills: " .. leaderstats.Kills.Value)
            end
            if leaderstats:FindFirstChild("Brawls") then
                Tab12.statsLabel4.SetText("Brawls: " .. leaderstats.Brawls.Value)
            end
        end

        if playerDurabilityLabel then
            local playerDurability = convertFormattedNumber(playerDurabilityLabel.Text)
            Tab12.playerLabel1.SetText("Durability: " .. playerDurability)
        end
        if playerAgilityLabel then
            local playerAgility = convertFormattedNumber(playerAgilityLabel.Text)
            Tab12.playerLabel2.SetText("Agility: " .. playerAgility)
        end
        if playerBuffnessLabel then
            local playerBuffness = convertFormattedNumber(playerBuffnessLabel.Text)
            Tab12.playerLabel3.SetText("Buffness: " .. playerBuffness)
        end
        if playerHeightLabel then
            local playerHeight = convertFormattedNumber(playerHeightLabel.Text)
            Tab12.playerLabel4.SetText("Height: " .. playerHeight)
        end
        if playerGoodKarmaLabel then
            local playerGoodKarma = convertFormattedNumber(playerGoodKarmaLabel.Text)
            Tab12.playerLabel5.SetText("Good Karma: " .. playerGoodKarma)
        end
        if playerEvilKarmaLabel then
            local playerEvilKarma = convertFormattedNumber(playerEvilKarmaLabel.Text)
            Tab12.playerLabel6.SetText("Evil Karma: " .. playerEvilKarma)
        end
    end

    if leaderstats then
        for _, stat in ipairs(leaderstats:GetChildren()) do
            if stat:IsA("IntValue") or stat:IsA("NumberValue") then
                stat.Changed:Connect(onStatChanged)
            end
        end
    end
    onStatChanged()
end

updateStats()

Tab13:CreateSection("Script Configuration")
Tab13:CreateLabel("Coming soon!")