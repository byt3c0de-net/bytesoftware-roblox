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

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = game.Players.LocalPlayer
local SoundService = game:GetService("SoundService")
local HttpService = game:GetService("HttpService")

if game.CoreGui:FindFirstChild("Library") then
    game.CoreGui:FindFirstChild("Library"):Destroy()
end

local Library = {}
function Library:CreateWindow(Title, Description)
    local uiOpen = true

    local Library = Instance.new("ScreenGui")
    local Main_1 = Instance.new("Frame")
    local UICorner_1 = Instance.new("UICorner")
    local TabsHolder_1 = Instance.new("Frame")
    local Tabs_1 = Instance.new("ScrollingFrame")
    local UIListLayout_1 = Instance.new("UIListLayout")
    local UIPadding_1 = Instance.new("UIPadding")
    local TopBar_1 = Instance.new("Frame")
    local Title_1 = Instance.new("TextLabel")
    local UIPadding_2 = Instance.new("UIPadding")
    local Description_1 = Instance.new("TextLabel")
    local UIPadding_3 = Instance.new("UIPadding")
    local Logo_1 = Instance.new("Frame")
    local LogoImage_1 = Instance.new("ImageLabel")
    local Line_1 = Instance.new("Frame")
    local Line_2 = Instance.new("Frame")
    local Line_3 = Instance.new("Frame")
    local BottomBar_1 = Instance.new("Frame")
    local Title_2 = Instance.new("TextLabel")
    local UIPadding_4 = Instance.new("UIPadding")
    local Discord_1 = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local DiscordButton_1 = Instance.new("TextButton")
    local Line_4 = Instance.new("Frame")
    local UIStroke_1 = Instance.new("UIStroke")
    local ElementsHolder_1 = Instance.new("Frame")
    local UIToggle_1 = Instance.new("Frame")
    local UICorner_5 = Instance.new("UICorner")
    local UIStroke_4 = Instance.new("UIStroke")
    local UIToggleButton_1 = Instance.new("ImageButton")

    Library.Name = "Library"
    Library.Parent = game.CoreGui
    Library.Enabled = true

    Main_1.Name = "Main"
    Main_1.Parent = Library
    Main_1.AnchorPoint = Vector2.new(0.5, 0.5)
    Main_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Main_1.BackgroundTransparency = 0.3499999940395355
    Main_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main_1.BorderSizePixel = 0
    Main_1.Position = UDim2.new(0.5, 0, 2.5, 0)
    Main_1.Size = UDim2.new(0, 378, 0, 237)
    Main_1.Active = true

    UICorner_1.Parent = Main_1

    TabsHolder_1.Name = "TabsHolder"
    TabsHolder_1.Parent = Main_1
    TabsHolder_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabsHolder_1.BackgroundTransparency = 1
    TabsHolder_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabsHolder_1.BorderSizePixel = 0
    TabsHolder_1.Position = UDim2.new(0, 0, 0.210970461, 0)
    TabsHolder_1.Size = UDim2.new(0, 48, 0, 187)

    Tabs_1.Name = "Tabs"
    Tabs_1.Parent = TabsHolder_1
    Tabs_1.Active = true
    Tabs_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs_1.BackgroundTransparency = 1
    Tabs_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs_1.BorderSizePixel = 0
    Tabs_1.Position = UDim2.new(0, 0, 0.0199999474, 0)
    Tabs_1.Size = UDim2.new(0, 48, 0, 176)
    Tabs_1.ClipsDescendants = true
    Tabs_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Tabs_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
    Tabs_1.CanvasPosition = Vector2.new(0, 0)
    Tabs_1.CanvasSize = UDim2.new(0, 0, 0.5, 0)
    Tabs_1.ElasticBehavior = Enum.ElasticBehavior.Never
    Tabs_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
    Tabs_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    Tabs_1.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
    Tabs_1.ScrollBarImageTransparency = 1
    Tabs_1.ScrollBarThickness = 1
    Tabs_1.ScrollingDirection = Enum.ScrollingDirection.Y
    Tabs_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
    Tabs_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
    Tabs_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

    UIListLayout_1.Parent = Tabs_1
    UIListLayout_1.Padding = UDim.new(0, 14)
    UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder

    UIPadding_1.Parent = Tabs_1
    UIPadding_1.PaddingBottom = UDim.new(0, 6)
    UIPadding_1.PaddingLeft = UDim.new(0, 13)
    UIPadding_1.PaddingTop = UDim.new(0, 8)

    TopBar_1.Name = "TopBar"
    TopBar_1.Parent = Main_1
    TopBar_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopBar_1.BackgroundTransparency = 1
    TopBar_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TopBar_1.BorderSizePixel = 0
    TopBar_1.Position = UDim2.new(0.126984134, 0, 0, 0)
    TopBar_1.Size = UDim2.new(0, 330, 0, 28)

    Title_1.Name = "Title"
    Title_1.Parent = TopBar_1
    Title_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_1.BackgroundTransparency = 1
    Title_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_1.BorderSizePixel = 0
    Title_1.Size = UDim2.new(0, 127, 0, 27)
    Title_1.Font = Enum.Font.ArialBold
    Title_1.RichText = true
    Title_1.Text = Title
    Title_1.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title_1.TextSize = 12
    Title_1.TextTruncate = Enum.TextTruncate.AtEnd
    Title_1.TextXAlignment = Enum.TextXAlignment.Left

    UIPadding_2.Parent = Title_1
    UIPadding_2.PaddingLeft = UDim.new(0, 9)
    UIPadding_2.PaddingTop = UDim.new(0, 2)

    Description_1.Name = "Description"
    Description_1.Parent = TopBar_1
    Description_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description_1.BackgroundTransparency = 1
    Description_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Description_1.BorderSizePixel = 0
    Description_1.Position = UDim2.new(0.384848475, 0, 0, 0)
    Description_1.Size = UDim2.new(0, 202, 0, 27)
    Description_1.Font = Enum.Font.Arial
    Description_1.Text = Description
    Description_1.TextColor3 = Color3.fromRGB(150, 150, 150)
    Description_1.TextSize = 12
    Description_1.TextTransparency = 0.5
    Description_1.TextTruncate = Enum.TextTruncate.AtEnd
    Description_1.TextXAlignment = Enum.TextXAlignment.Right

    UIPadding_3.Parent = Description_1
    UIPadding_3.PaddingRight = UDim.new(0, 9)
    UIPadding_3.PaddingTop = UDim.new(0, 2)

    Logo_1.Name = "Logo"
    Logo_1.Parent = Main_1
    Logo_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo_1.BackgroundTransparency = 1
    Logo_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo_1.BorderSizePixel = 0
    Logo_1.Size = UDim2.new(0, 48, 0, 50)

    LogoImage_1.Name = "LogoImage"
    LogoImage_1.Parent = Logo_1
    LogoImage_1.AnchorPoint = Vector2.new(0.5, 0.5)
    LogoImage_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LogoImage_1.BackgroundTransparency = 1
    LogoImage_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LogoImage_1.BorderSizePixel = 0
    LogoImage_1.Position = UDim2.new(0.5, 0, 0.5, 0)
    LogoImage_1.Size = UDim2.new(0, 30, 0, 30)
    LogoImage_1.Image = "rbxassetid://136753018621195"

    Line_1.Name = "Line"
    Line_1.Parent = Main_1
    Line_1.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
    Line_1.BackgroundTransparency = 0.800000011920929
    Line_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Line_1.BorderSizePixel = 0
    Line_1.Position = UDim2.new(0.127000004, 0, 0, 0)
    Line_1.Size = UDim2.new(0, 1, 0, 237)

    Line_2.Name = "Line"
    Line_2.Parent = Main_1
    Line_2.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
    Line_2.BackgroundTransparency = 0.800000011920929
    Line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Line_2.BorderSizePixel = 0
    Line_2.Position = UDim2.new(0.127000004, 0, 0, 28)
    Line_2.Size = UDim2.new(0, 329, 0, 1)

    Line_3.Name = "Line"
    Line_3.Parent = Main_1
    Line_3.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
    Line_3.BackgroundTransparency = 0.800000011920929
    Line_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Line_3.BorderSizePixel = 0
    Line_3.Position = UDim2.new(0, 0, 0.207000002, 0)
    Line_3.Size = UDim2.new(0, 48, 0, 1)

    BottomBar_1.Name = "BottomBar"
    BottomBar_1.Parent = Main_1
    BottomBar_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BottomBar_1.BackgroundTransparency = 1
    BottomBar_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    BottomBar_1.BorderSizePixel = 0
    BottomBar_1.Position = UDim2.new(0.126984134, 0, 0.902953565, 0)
    BottomBar_1.Size = UDim2.new(0, 330, 0, 23)

    Title_2.Name = "Title"
    Title_2.Parent = BottomBar_1
    Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_2.BackgroundTransparency = 1
    Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_2.BorderSizePixel = 0
    Title_2.Size = UDim2.new(0, 169, 0, 23)
    Title_2.Font = Enum.Font.Arial
    Title_2.Text = "Developed by byt3c0de_net"
    Title_2.TextColor3 = Color3.fromRGB(150, 150, 150)
    Title_2.TextSize = 12
    Title_2.TextTransparency = 0.5
    Title_2.TextTruncate = Enum.TextTruncate.AtEnd
    Title_2.TextXAlignment = Enum.TextXAlignment.Left

    UIPadding_4.Parent = Title_2
    UIPadding_4.PaddingLeft = UDim.new(0, 8)

    Discord_1.Name = "Discord"
    Discord_1.Parent = BottomBar_1
    Discord_1.AnchorPoint = Vector2.new(0, 0.5)
    Discord_1.BackgroundColor3 = Color3.fromRGB(119, 133, 204)
    Discord_1.BackgroundTransparency = 0.30000001192092896
    Discord_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Discord_1.BorderSizePixel = 0
    Discord_1.Position = UDim2.new(0.819999993, 0, 0.49000001, 0)
    Discord_1.Size = UDim2.new(0, 50, 0, 14)

    UICorner_2.Parent = Discord_1
    UICorner_2.CornerRadius = UDim.new(0, 4)

    DiscordButton_1.Name = "DiscordButton"
    DiscordButton_1.Parent = Discord_1
    DiscordButton_1.Active = true
    DiscordButton_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DiscordButton_1.BackgroundTransparency = 1
    DiscordButton_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    DiscordButton_1.BorderSizePixel = 0
    DiscordButton_1.Size = UDim2.new(0, 50, 0, 14)
    DiscordButton_1.Font = Enum.Font.ArialBold
    DiscordButton_1.RichText = true
    DiscordButton_1.Text = "Join Us!"
    DiscordButton_1.TextColor3 = Color3.fromRGB(255, 255, 255)
    DiscordButton_1.TextSize = 9

    DiscordButton_1.MouseButton1Click:Connect(
        function()
            local Tween3 =
                TweenService:Create(DiscordButton_1, TweenInfo.new(0.1), {TextColor3 = Color3.fromRGB(170, 170, 170)})
            Tween3:Play()
            Tween3.Completed:Connect(
                function()
                    local Tween4 =
                        TweenService:Create(
                        DiscordButton_1,
                        TweenInfo.new(0.2),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)}
                    )
                    Tween4:Play()
                end
            )
            setclipboard("https://discord.gg/bytesoftware")
        end
    )

    Line_4.Name = "Line"
    Line_4.Parent = Main_1
    Line_4.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
    Line_4.BackgroundTransparency = 0.800000011920929
    Line_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Line_4.BorderSizePixel = 0
    Line_4.Position = UDim2.new(0.129999995, 0, 0, 213)
    Line_4.Size = UDim2.new(0, 329, 0, 1)

    UIStroke_1.Parent = Main_1
    UIStroke_1.Color = Color3.fromRGB(170, 170, 170)
    UIStroke_1.Thickness = 1
    UIStroke_1.Transparency = 0.8

    ElementsHolder_1.Name = "ElementsHolder"
    ElementsHolder_1.Parent = Main_1
    ElementsHolder_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ElementsHolder_1.BackgroundTransparency = 1
    ElementsHolder_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ElementsHolder_1.BorderSizePixel = 0
    ElementsHolder_1.Position = UDim2.new(0.129629627, 0, 0.122362867, 0)
    ElementsHolder_1.Size = UDim2.new(0, 328, 0, 184)

    local gui = Main_1
    local dragging
    local dragInput
    local dragStart
    local startPos
    function Lerp(a, b, m)
        return a + (b - a) * m
    end
    local lastMousePos
    local lastGoalPos
    local DRAG_SPEED = (8)
    function Update(dt)
        if not (startPos) then
            return
        end
        if not (dragging) and (lastGoalPos) then
            gui.Position =
                UDim2.new(
                startPos.X.Scale,
                Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED),
                startPos.Y.Scale,
                Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED)
            )
            return
        end

        local delta = (lastMousePos - UserInputService:GetMouseLocation())
        local xGoal = (startPos.X.Offset - delta.X)
        local yGoal = (startPos.Y.Offset - delta.Y)
        lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
        gui.Position =
            UDim2.new(
            startPos.X.Scale,
            Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED),
            startPos.Y.Scale,
            Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED)
        )
    end
    gui.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position
                lastMousePos = UserInputService:GetMouseLocation()

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end
                )
            end
        end
    )
    gui.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
             then
                dragInput = input
            end
        end
    )
    runService.Heartbeat:Connect(Update)

    UIToggle_1.Name = "UIToggle"
    UIToggle_1.Parent = Library
    UIToggle_1.AnchorPoint = Vector2.new(0.5, 0.5)
    UIToggle_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    UIToggle_1.BackgroundTransparency = 0.3499999940395355
    UIToggle_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    UIToggle_1.BorderSizePixel = 0
    UIToggle_1.Position = UDim2.new(0.5, 0, -1, 0)
    UIToggle_1.Size = UDim2.new(0, 30, 0, 30)

    UICorner_5.Parent = UIToggle_1

    UIStroke_4.Parent = UIToggle_1
    UIStroke_4.Color = Color3.fromRGB(170, 170, 170)
    UIStroke_4.Thickness = 1
    UIStroke_4.Transparency = 0.8

    UIToggleButton_1.Name = "UIToggleButton"
    UIToggleButton_1.Parent = UIToggle_1
    UIToggleButton_1.Active = true
    UIToggleButton_1.AnchorPoint = Vector2.new(0.5, 0.5)
    UIToggleButton_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UIToggleButton_1.BackgroundTransparency = 1
    UIToggleButton_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    UIToggleButton_1.BorderSizePixel = 0
    UIToggleButton_1.Position = UDim2.new(0.5, 0, 0.5, 0)
    UIToggleButton_1.Size = UDim2.new(0, 22, 0, 22)
    UIToggleButton_1.Image = "rbxassetid://136753018621195"

    UIToggleButton_1.MouseButton1Click:Connect(
        function()
            if uiOpen then
                uiOpen = false

                local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local goal = {Position = UDim2.new(0.5, 0, 2.2, 0)}
                local tween = TweenService:Create(Main_1, tweenInfo, goal)
                tween:Play()
                dragging = false
                lastGoalPos = nil
                startPos = nil
            else
                uiOpen = true

                local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local goal = {Position = UDim2.new(0.5, 0, 0.5, 0)}
                local tween = TweenService:Create(Main_1, tweenInfo, goal)
                tween:Play()
                dragging = false
                lastGoalPos = nil
                startPos = nil
            end
        end
    )

    wait(0.8)

    local tweenInfoUIToggle = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local goaluitoggle = {Position = UDim2.new(0.5, 0, 0.02, 0)}
    local tweenuitoggle = TweenService:Create(UIToggle_1, tweenInfoUIToggle, goaluitoggle)
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local goal = {Position = UDim2.new(0.5, 0, 0.5, 0)}
    local tween = TweenService:Create(Main_1, tweenInfo, goal)
    tween:Play()
    tweenuitoggle:Play()

    local Tabs = {}
    local first = true
    local currentTab = nil
    function Tabs:CreateTab(Image)
        local Elements_1 = Instance.new("Frame")
        local Items_1 = Instance.new("ScrollingFrame")
        local UIListLayout_2 = Instance.new("UIListLayout")
        local UIPadding_5 = Instance.new("UIPadding")
        local TabButton_1 = Instance.new("ImageButton")

        Elements_1.Name = "Elements"
        Elements_1.Parent = ElementsHolder_1
        Elements_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Elements_1.BackgroundTransparency = 1
        Elements_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Elements_1.BorderSizePixel = 0
        Elements_1.Size = UDim2.new(0, 328, 0, 184)

        Items_1.Name = "Items"
        Items_1.Parent = Elements_1
        Items_1.Active = true
        Items_1.AnchorPoint = Vector2.new(0.5, 0.5)
        Items_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Items_1.BackgroundTransparency = 1
        Items_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Items_1.BorderSizePixel = 0
        Items_1.Position = UDim2.new(0.5, 0, 0.5, 0)
        Items_1.Size = UDim2.new(0, 324, 0, 175)
        Items_1.ClipsDescendants = true
        Items_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Items_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
        Items_1.CanvasPosition = Vector2.new(0, 68)
        Items_1.CanvasSize = UDim2.new(0, 0, 0.5, 0)
        Items_1.ElasticBehavior = Enum.ElasticBehavior.Never
        Items_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
        Items_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Items_1.ScrollBarImageColor3 = Color3.fromRGB(170, 170, 170)
        Items_1.ScrollBarImageTransparency = 0.800000011920929
        Items_1.ScrollBarThickness = 2
        Items_1.ScrollingDirection = Enum.ScrollingDirection.Y
        Items_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
        Items_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
        Items_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

        UIListLayout_2.Parent = Items_1
        UIListLayout_2.Padding = UDim.new(0, 6)
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

        UIPadding_5.Parent = Items_1
        UIPadding_5.PaddingBottom = UDim.new(0, 3)
        UIPadding_5.PaddingLeft = UDim.new(0, 5)
        UIPadding_5.PaddingTop = UDim.new(0, 3)

        TabButton_1.Name = "TabButton"
        TabButton_1.Parent = Tabs_1
        TabButton_1.Active = true
        TabButton_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton_1.BackgroundTransparency = 1
        TabButton_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabButton_1.BorderSizePixel = 0
        TabButton_1.Size = UDim2.new(0, 22, 0, 22)
        TabButton_1.Image = "rbxassetid://" .. Image
        TabButton_1.ImageColor3 = Color3.fromRGB(170, 170, 170)

        if first then
            first = false
            Elements_1.Visible = true
            currentTab = TabButton_1
            TabButton_1.ImageColor3 = Color3.fromRGB(255, 255, 255)
        else
            Elements_1.Visible = false
        end

        TabButton_1.MouseButton1Click:Connect(
            function()
                if currentTab == TabButton_1 then
                    return
                end
                if currentTab then
                    local prevTabImage = currentTab

                    if prevTabImage then
                        local deactivateTween2 =
                            TweenService:Create(
                            prevTabImage,
                            TweenInfo.new(0.2),
                            {ImageColor3 = Color3.fromRGB(170, 170, 170)}
                        )
                        deactivateTween2:Play()
                    end
                end
                local activateTween2 =
                    TweenService:Create(TabButton_1, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(255, 255, 255)})
                activateTween2:Play()
                currentTab = TabButton_1
                for i, v in next, ElementsHolder_1:GetChildren() do
                    v.Visible = false
                end
                Elements_1.Visible = true
            end
        )

        local Elements = {}
        function Elements:CreateSection(Title)
            local Section_1 = Instance.new("Frame")
            local Title_3 = Instance.new("TextLabel")
            local UIPadding_6 = Instance.new("UIPadding")

            Section_1.Name = "Section"
            Section_1.Parent = Items_1
            Section_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Section_1.BackgroundTransparency = 1
            Section_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Section_1.BorderSizePixel = 0
            Section_1.Size = UDim2.new(0, 312, 0, 18)

            Title_3.Name = "Title"
            Title_3.Parent = Section_1
            Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_3.BackgroundTransparency = 1
            Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_3.BorderSizePixel = 0
            Title_3.Size = UDim2.new(0, 312, 0, 18)
            Title_3.Font = Enum.Font.Arial
            Title_3.Text = Title
            Title_3.TextColor3 = Color3.fromRGB(150, 150, 150)
            Title_3.TextSize = 12
            Title_3.TextTransparency = 0.30000001192092896
            Title_3.TextTruncate = Enum.TextTruncate.AtEnd
            Title_3.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_6.Parent = Title_3
            UIPadding_6.PaddingTop = UDim.new(0, 2)
        end
        function Elements:CreateLabel(Title)
            local Label_1 = Instance.new("Frame")
            local UIStroke_10 = Instance.new("UIStroke")
            local UICorner_13 = Instance.new("UICorner")
            local Title_9 = Instance.new("TextLabel")
            local UIPadding_16 = Instance.new("UIPadding")

            Label_1.Name = "Label"
            Label_1.Parent = Items_1
            Label_1.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
            Label_1.BackgroundTransparency = 0.800000011920929
            Label_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Label_1.BorderSizePixel = 0
            Label_1.Size = UDim2.new(0, 312, 0, 20)

            UIStroke_10.Parent = Label_1
            UIStroke_10.Color = Color3.fromRGB(170, 170, 170)
            UIStroke_10.Thickness = 1
            UIStroke_10.Transparency = 0.8

            UICorner_13.Parent = Label_1
            UICorner_13.CornerRadius = UDim.new(0, 4)

            Title_9.Name = "Title"
            Title_9.Parent = Label_1
            Title_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_9.BackgroundTransparency = 1
            Title_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_9.BorderSizePixel = 0
            Title_9.Size = UDim2.new(0, 312, 0, 20)
            Title_9.Font = Enum.Font.Arial
            Title_9.Text = Title
            Title_9.TextColor3 = Color3.fromRGB(170, 170, 170)
            Title_9.TextSize = 12
            Title_9.TextTransparency = 0.30000001192092896
            Title_9.TextTruncate = Enum.TextTruncate.AtEnd

            UIPadding_16.Parent = Title_9
            UIPadding_16.PaddingTop = UDim.new(0, 1)

            local dynamicLabel = {}
            dynamicLabel.SetText = function(newText)
                Title_9.Text = newText
            end
            return dynamicLabel
        end
        function Elements:CreateButton(Title, Callback)
            local Button_1 = Instance.new("Frame")
            local UIStroke_7 = Instance.new("UIStroke")
            local UICorner_10 = Instance.new("UICorner")
            local Title_7 = Instance.new("TextButton")
            local UIPadding_12 = Instance.new("UIPadding")
            local Description_2 = Instance.new("TextLabel")
            local UIPadding_13 = Instance.new("UIPadding")

            Button_1.Name = "Button"
            Button_1.Parent = Items_1
            Button_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Button_1.BackgroundTransparency = 0.949999988079071
            Button_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Button_1.BorderSizePixel = 0
            Button_1.Size = UDim2.new(0, 312, 0, 32)

            UIStroke_7.Parent = Button_1
            UIStroke_7.Color = Color3.fromRGB(170, 170, 170)
            UIStroke_7.Thickness = 1
            UIStroke_7.Transparency = 0.8

            UICorner_10.Parent = Button_1
            UICorner_10.CornerRadius = UDim.new(0, 4)

            Title_7.Name = "Title"
            Title_7.Parent = Button_1
            Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_7.BackgroundTransparency = 1
            Title_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_7.BorderSizePixel = 0
            Title_7.Size = UDim2.new(0, 312, 0, 32)
            Title_7.Font = Enum.Font.Arial
            Title_7.Text = Title
            Title_7.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_7.TextSize = 12
            Title_7.TextTransparency = 0.20000000298023224
            Title_7.TextTruncate = Enum.TextTruncate.AtEnd
            Title_7.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_12.Parent = Title_7
            UIPadding_12.PaddingLeft = UDim.new(0, 10)
            UIPadding_12.PaddingTop = UDim.new(0, 2)

            Description_2.Name = "Description"
            Description_2.Parent = Button_1
            Description_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Description_2.BackgroundTransparency = 1
            Description_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Description_2.BorderSizePixel = 0
            Description_2.Position = UDim2.new(0.625, 0, 0, 0)
            Description_2.Size = UDim2.new(0, 117, 0, 32)
            Description_2.Font = Enum.Font.SourceSans
            Description_2.Text = "Click to interact"
            Description_2.TextColor3 = Color3.fromRGB(170, 170, 170)
            Description_2.TextSize = 14
            Description_2.TextTransparency = 0.30000001192092896
            Description_2.TextXAlignment = Enum.TextXAlignment.Right

            UIPadding_13.Parent = Description_2
            UIPadding_13.PaddingRight = UDim.new(0, 10)

            Title_7.MouseButton1Click:Connect(
                function()
                    local Tween1 =
                        TweenService:Create(
                        Description_2,
                        TweenInfo.new(0.1),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)}
                    )
                    Tween1:Play()
                    Tween1.Completed:Connect(
                        function()
                            local Tween2 =
                                TweenService:Create(
                                Description_2,
                                TweenInfo.new(0.2),
                                {TextColor3 = Color3.fromRGB(170, 170, 170)}
                            )
                            Tween2:Play()
                        end
                    )
                    Callback()
                end
            )
        end
        function Elements:CreateToggle(Title, Callback)
            Callback = Callback or function()
                end

            local toggled = false
            local debounce = false

            local Toggle_2 = Instance.new("Frame")
            local UIStroke_4 = Instance.new("UIStroke")
            local UICorner_6 = Instance.new("UICorner")
            local Title_5 = Instance.new("TextLabel")
            local UIPadding_8 = Instance.new("UIPadding")
            local TogglerHolder_2 = Instance.new("Frame")
            local UICorner_7 = Instance.new("UICorner")
            local UIStroke_5 = Instance.new("UIStroke")
            local Toggler_2 = Instance.new("TextButton")
            local TogglerIndicator_2 = Instance.new("Frame")
            local UICorner_8 = Instance.new("UICorner")

            Toggle_2.Name = "Toggle"
            Toggle_2.Parent = Items_1
            Toggle_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Toggle_2.BackgroundTransparency = 0.949999988079071
            Toggle_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Toggle_2.BorderSizePixel = 0
            Toggle_2.Size = UDim2.new(0, 312, 0, 32)

            UIStroke_4.Parent = Toggle_2
            UIStroke_4.Color = Color3.fromRGB(170, 170, 170)
            UIStroke_4.Thickness = 1
            UIStroke_4.Transparency = 0.8

            UICorner_6.Parent = Toggle_2
            UICorner_6.CornerRadius = UDim.new(0, 4)

            Title_5.Name = "Title"
            Title_5.Parent = Toggle_2
            Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_5.BackgroundTransparency = 1
            Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_5.BorderSizePixel = 0
            Title_5.Size = UDim2.new(0, 250, 0, 32)
            Title_5.Font = Enum.Font.Arial
            Title_5.Text = Title
            Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_5.TextSize = 12
            Title_5.TextTransparency = 0.20000000298023224
            Title_5.TextTruncate = Enum.TextTruncate.AtEnd
            Title_5.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_8.Parent = Title_5
            UIPadding_8.PaddingLeft = UDim.new(0, 10)
            UIPadding_8.PaddingTop = UDim.new(0, 2)

            TogglerHolder_2.Name = "TogglerHolder"
            TogglerHolder_2.Parent = Toggle_2
            TogglerHolder_2.AnchorPoint = Vector2.new(0, 0.5)
            TogglerHolder_2.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
            TogglerHolder_2.BackgroundTransparency = 1
            TogglerHolder_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TogglerHolder_2.BorderSizePixel = 0
            TogglerHolder_2.Position = UDim2.new(0.84799999, 0, 0.5, 0)
            TogglerHolder_2.Size = UDim2.new(0, 38, 0, 16)

            UICorner_7.Parent = TogglerHolder_2
            UICorner_7.CornerRadius = UDim.new(0, 15)

            UIStroke_5.Parent = TogglerHolder_2
            UIStroke_5.Color = Color3.fromRGB(170, 170, 170)
            UIStroke_5.Thickness = 1
            UIStroke_5.Transparency = 0.8

            Toggler_2.Name = "Toggler"
            Toggler_2.Parent = TogglerHolder_2
            Toggler_2.Active = true
            Toggler_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Toggler_2.BackgroundTransparency = 1
            Toggler_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Toggler_2.BorderSizePixel = 0
            Toggler_2.Size = UDim2.new(0, 38, 0, 16)
            Toggler_2.Font = Enum.Font.SourceSans
            Toggler_2.Text = ""
            Toggler_2.TextSize = 14

            TogglerIndicator_2.Name = "TogglerIndicator"
            TogglerIndicator_2.Parent = TogglerHolder_2
            TogglerIndicator_2.AnchorPoint = Vector2.new(0, 0.5)
            TogglerIndicator_2.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
            TogglerIndicator_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TogglerIndicator_2.BorderSizePixel = 0
            TogglerIndicator_2.Position = UDim2.new(0, 2, 0.5, 0)
            TogglerIndicator_2.Size = UDim2.new(0, 16, 0, 14)

            UICorner_8.Parent = TogglerIndicator_2
            UICorner_8.CornerRadius = UDim.new(0, 15)

            Toggler_2.MouseButton1Click:Connect(
                function()
                    if debounce == false then
                        if toggled == false then
                            debounce = true
                            local onTween =
                                TweenService:Create(
                                TogglerIndicator_2,
                                TweenInfo.new(0.2),
                                {Position = UDim2.new(0, 20, 0.5, 0)}
                            )
                            local onTween2 =
                                TweenService:Create(TogglerHolder_2, TweenInfo.new(0.2), {BackgroundTransparency = 0.7})
                            onTween:Play()
                            onTween2:Play()
                            debounce = false
                            toggled = true
                            pcall(Callback, toggled)
                        elseif toggled == true then
                            debounce = true
                            local offTween =
                                TweenService:Create(
                                TogglerIndicator_2,
                                TweenInfo.new(0.2),
                                {Position = UDim2.new(0, 2, 0.5, 0)}
                            )
                            local offTween2 =
                                TweenService:Create(TogglerHolder_2, TweenInfo.new(0.2), {BackgroundTransparency = 1})
                            offTween:Play()
                            offTween2:Play()
                            debounce = false
                            toggled = false
                            pcall(Callback, toggled)
                        end
                    end
                end
            )
        end
        function Elements:CreateBox(Title, Callback)
            local Box_1 = Instance.new("Frame")
            local UIStroke_8 = Instance.new("UIStroke")
            local UICorner_11 = Instance.new("UICorner")
            local Title_8 = Instance.new("TextLabel")
            local UIPadding_14 = Instance.new("UIPadding")
            local BoxHolder_1 = Instance.new("Frame")
            local UICorner_12 = Instance.new("UICorner")
            local UIStroke_9 = Instance.new("UIStroke")
            local TextBox_1 = Instance.new("TextBox")
            local UIPadding_15 = Instance.new("UIPadding")

            Box_1.Name = "Box"
            Box_1.Parent = Items_1
            Box_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Box_1.BackgroundTransparency = 0.949999988079071
            Box_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Box_1.BorderSizePixel = 0
            Box_1.Size = UDim2.new(0, 312, 0, 32)

            UIStroke_8.Parent = Box_1
            UIStroke_8.Color = Color3.fromRGB(170, 170, 170)
            UIStroke_8.Thickness = 1
            UIStroke_8.Transparency = 0.8

            UICorner_11.Parent = Box_1
            UICorner_11.CornerRadius = UDim.new(0, 4)

            Title_8.Name = "Title"
            Title_8.Parent = Box_1
            Title_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_8.BackgroundTransparency = 1
            Title_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_8.BorderSizePixel = 0
            Title_8.Size = UDim2.new(0, 215, 0, 32)
            Title_8.Font = Enum.Font.Arial
            Title_8.Text = Title
            Title_8.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_8.TextSize = 12
            Title_8.TextTransparency = 0.20000000298023224
            Title_8.TextTruncate = Enum.TextTruncate.AtEnd
            Title_8.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_14.Parent = Title_8
            UIPadding_14.PaddingLeft = UDim.new(0, 10)
            UIPadding_14.PaddingTop = UDim.new(0, 2)

            BoxHolder_1.Name = "BoxHolder"
            BoxHolder_1.Parent = Box_1
            BoxHolder_1.AnchorPoint = Vector2.new(0, 0.5)
            BoxHolder_1.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
            BoxHolder_1.BackgroundTransparency = 0.800000011920929
            BoxHolder_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            BoxHolder_1.BorderSizePixel = 0
            BoxHolder_1.Position = UDim2.new(0.68910259, 0, 0.5, 0)
            BoxHolder_1.Size = UDim2.new(0, 87, 0, 18)

            UICorner_12.Parent = BoxHolder_1
            UICorner_12.CornerRadius = UDim.new(0, 4)

            UIStroke_9.Parent = BoxHolder_1
            UIStroke_9.Color = Color3.fromRGB(170, 170, 170)
            UIStroke_9.Thickness = 1
            UIStroke_9.Transparency = 0.8

            TextBox_1.Parent = BoxHolder_1
            TextBox_1.Active = true
            TextBox_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBox_1.BackgroundTransparency = 1
            TextBox_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextBox_1.BorderSizePixel = 0
            TextBox_1.CursorPosition = -1
            TextBox_1.Size = UDim2.new(0, 87, 0, 18)
            TextBox_1.Font = Enum.Font.Arial
            TextBox_1.PlaceholderColor3 = Color3.fromRGB(170, 170, 170)
            TextBox_1.PlaceholderText = ""
            TextBox_1.Text = ""
            TextBox_1.TextColor3 = Color3.fromRGB(170, 170, 170)
            TextBox_1.TextSize = 12
            TextBox_1.TextTransparency = 0.30000001192092896
            TextBox_1.TextTruncate = Enum.TextTruncate.AtEnd

            UIPadding_15.Parent = TextBox_1
            UIPadding_15.PaddingLeft = UDim.new(0, 3)
            UIPadding_15.PaddingRight = UDim.new(0, 3)
            UIPadding_15.PaddingTop = UDim.new(0, 1)

            TextBox_1.FocusLost:Connect(
                function()
                    Callback(TextBox_1.Text)
                end
            )
        end
        function Elements:CreateDropdown(Title, Options, Callback)
            local Dropdown_1 = Instance.new("Frame")
            local UIStroke_6 = Instance.new("UIStroke")
            local UICorner_9 = Instance.new("UICorner")
            local A_DropdownHolder_1 = Instance.new("Frame")
            local Title_6 = Instance.new("TextLabel")
            local UIPadding_9 = Instance.new("UIPadding")
            local DropdownButton_1 = Instance.new("ImageButton")
            local Selected_1 = Instance.new("TextLabel")
            local UIPadding_10 = Instance.new("UIPadding")
            local UIListLayout_3 = Instance.new("UIListLayout")
            local B_DropdownHolder_1 = Instance.new("Frame")
            local UIListLayout_4 = Instance.new("UIListLayout")
            local UIPadding_11 = Instance.new("UIPadding")
            local OptionButton_1 = Instance.new("TextButton")

            Dropdown_1.Name = "Dropdown"
            Dropdown_1.Parent = Items_1
            Dropdown_1.AutomaticSize = Enum.AutomaticSize.Y
            Dropdown_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Dropdown_1.BackgroundTransparency = 0.949999988079071
            Dropdown_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Dropdown_1.BorderSizePixel = 0
            Dropdown_1.Size = UDim2.new(0, 312, 0, 35)

            UIStroke_6.Parent = Dropdown_1
            UIStroke_6.Color = Color3.fromRGB(170, 170, 170)
            UIStroke_6.Thickness = 1
            UIStroke_6.Transparency = 0.8

            UICorner_9.Parent = Dropdown_1
            UICorner_9.CornerRadius = UDim.new(0, 4)

            A_DropdownHolder_1.Name = "A_DropdownHolder"
            A_DropdownHolder_1.Parent = Dropdown_1
            A_DropdownHolder_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            A_DropdownHolder_1.BackgroundTransparency = 1
            A_DropdownHolder_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            A_DropdownHolder_1.BorderSizePixel = 0
            A_DropdownHolder_1.Size = UDim2.new(0, 312, 0, 35)

            Title_6.Name = "Title"
            Title_6.Parent = A_DropdownHolder_1
            Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_6.BackgroundTransparency = 1
            Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_6.BorderSizePixel = 0
            Title_6.Size = UDim2.new(0, 148, 0, 35)
            Title_6.Font = Enum.Font.Arial
            Title_6.Text = Title
            Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_6.TextSize = 12
            Title_6.TextTransparency = 0.20000000298023224
            Title_6.TextTruncate = Enum.TextTruncate.AtEnd
            Title_6.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_9.Parent = Title_6
            UIPadding_9.PaddingLeft = UDim.new(0, 10)
            UIPadding_9.PaddingTop = UDim.new(0, 2)

            DropdownButton_1.Name = "DropdownButton"
            DropdownButton_1.Parent = A_DropdownHolder_1
            DropdownButton_1.AnchorPoint = Vector2.new(0, 0.5)
            DropdownButton_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownButton_1.BackgroundTransparency = 1
            DropdownButton_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            DropdownButton_1.BorderSizePixel = 0
            DropdownButton_1.Position = UDim2.new(0.899999976, 0, 0.5, 0)
            DropdownButton_1.Rotation = 90
            DropdownButton_1.Size = UDim2.new(0, 14, 0, 14)
            DropdownButton_1.Image = "rbxassetid://106215592528523"
            DropdownButton_1.ImageColor3 = Color3.fromRGB(170, 170, 170)
            DropdownButton_1.ImageTransparency = 0.30000001192092896

            Selected_1.Name = "Selected"
            Selected_1.Parent = A_DropdownHolder_1
            Selected_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Selected_1.BackgroundTransparency = 1
            Selected_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Selected_1.BorderSizePixel = 0
            Selected_1.Position = UDim2.new(0.474358976, 0, 0, 0)
            Selected_1.Size = UDim2.new(0, 132, 0, 35)
            Selected_1.Font = Enum.Font.Arial
            Selected_1.Text = "None"
            Selected_1.TextColor3 = Color3.fromRGB(170, 170, 170)
            Selected_1.TextSize = 12
            Selected_1.TextTransparency = 0.30000001192092896
            Selected_1.TextTruncate = Enum.TextTruncate.AtEnd
            Selected_1.TextXAlignment = Enum.TextXAlignment.Right

            UIPadding_10.Parent = Selected_1
            UIPadding_10.PaddingLeft = UDim.new(0, 2)
            UIPadding_10.PaddingRight = UDim.new(0, 8)
            UIPadding_10.PaddingTop = UDim.new(0, 2)

            UIListLayout_3.Parent = Dropdown_1
            UIListLayout_3.SortOrder = Enum.SortOrder.Name

            B_DropdownHolder_1.Name = "B_DropdownHolder"
            B_DropdownHolder_1.Parent = Dropdown_1
            B_DropdownHolder_1.AutomaticSize = Enum.AutomaticSize.Y
            B_DropdownHolder_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            B_DropdownHolder_1.BackgroundTransparency = 1
            B_DropdownHolder_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            B_DropdownHolder_1.BorderSizePixel = 0
            B_DropdownHolder_1.Size = UDim2.new(0, 312, 0, 0)
            B_DropdownHolder_1.Visible = false

            UIListLayout_4.Parent = B_DropdownHolder_1
            UIListLayout_4.Padding = UDim.new(0, 2)
            UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

            UIPadding_11.Parent = B_DropdownHolder_1
            UIPadding_11.PaddingBottom = UDim.new(0, 5)
            UIPadding_11.PaddingTop = UDim.new(0, 1)

            local isDropdownOpen = false

            local function ToggleDropdown()
                isDropdownOpen = not isDropdownOpen
                local targetRotation = isDropdownOpen and -90 or 90
                local rotationTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                local rotationTween =
                    TweenService:Create(DropdownButton_1, rotationTweenInfo, {Rotation = targetRotation})
                if isDropdownOpen then
                    B_DropdownHolder_1.Visible = true
                    rotationTween:Play()
                else
                    B_DropdownHolder_1.Visible = false
                    rotationTween:Play()
                end
            end

            DropdownButton_1.MouseButton1Click:Connect(ToggleDropdown)

            for i, optionText in ipairs(Options) do
                local OptionButton_1 = Instance.new("TextButton")
                local UIPadding_22 = Instance.new("UIPadding")

                OptionButton_1.Name = "OptionButton"
                OptionButton_1.Parent = B_DropdownHolder_1
                OptionButton_1.Active = true
                OptionButton_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                OptionButton_1.BackgroundTransparency = 1
                OptionButton_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
                OptionButton_1.BorderSizePixel = 0
                OptionButton_1.Size = UDim2.new(0, 312, 0, 24)
                OptionButton_1.Font = Enum.Font.Arial
                OptionButton_1.Text = optionText
                OptionButton_1.TextColor3 = Color3.fromRGB(170, 170, 170)
                OptionButton_1.TextSize = 12
                OptionButton_1.TextTransparency = 0.30000001192092896

                OptionButton_1.MouseButton1Click:Connect(
                    function()
                        Selected_1.Text = optionText
                        Callback(optionText)
                        ToggleDropdown()
                    end
                )
            end
        end
        return Elements
    end
    return Tabs
end
return Library