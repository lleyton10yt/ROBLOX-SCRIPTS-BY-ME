local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CSS_OP_ScriptHub"
ScreenGui.ResetOnSpawn = false

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game:GetService("CoreGui")
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = game:GetService("CoreGui")
end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 450, 0, 320)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 35, 45)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 8)
TopCorner.Parent = TopBar

local AccentLine = Instance.new("Frame")
AccentLine.Name = "AccentLine"
AccentLine.Size = UDim2.new(1, 0, 0, 2)
AccentLine.Position = UDim2.new(0, 0, 1, -2)
AccentLine.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
AccentLine.BorderSizePixel = 0
AccentLine.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, -60, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "CSS OP SCRIPT HUB"
TitleLabel.TextColor3 = Color3.fromRGB(240, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

local ExitButton = Instance.new("TextButton")
ExitButton.Name = "ExitButton"
ExitButton.Size = UDim2.new(0, 35, 0, 35)
ExitButton.Position = UDim2.new(1, -40, 0.5, -17.5)
ExitButton.BackgroundColor3 = Color3.fromRGB(25, 40, 50)
ExitButton.Text = "X"
ExitButton.TextColor3 = Color3.fromRGB(0, 210, 255)
ExitButton.Font = Enum.Font.GothamBold
ExitButton.TextSize = 16
ExitButton.Parent = TopBar

local ExitCorner = Instance.new("UICorner")
ExitCorner.CornerRadius = UDim.new(0, 6)
ExitCorner.Parent = ExitButton

ExitButton.MouseEnter:Connect(function()
    ExitButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    ExitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

ExitButton.MouseLeave:Connect(function()
    ExitButton.BackgroundColor3 = Color3.fromRGB(25, 40, 50)
    ExitButton.TextColor3 = Color3.fromRGB(0, 210, 255)
end)

ExitButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local ContentScrollingFrame = Instance.new("ScrollingFrame")
ContentScrollingFrame.Name = "ContentScrollingFrame"
ContentScrollingFrame.Size = UDim2.new(1, -24, 1, -65)
ContentScrollingFrame.Position = UDim2.new(0, 12, 0, 55)
ContentScrollingFrame.BackgroundTransparency = 1
ContentScrollingFrame.BorderSizePixel = 0
ContentScrollingFrame.ScrollBarThickness = 4
ContentScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 150, 190)
ContentScrollingFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ContentScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local function CreateButton(text, callback)
    local ButtonFrame = Instance.new("Frame")
    ButtonFrame.Size = UDim2.new(1, 0, 0, 42)
    ButtonFrame.BackgroundTransparency = 1
    ButtonFrame.Parent = ContentScrollingFrame

    local MainButton = Instance.new("TextButton")
    MainButton.Name = "ButtonInstance"
    MainButton.Size = UDim2.new(1, 0, 1, 0)
    MainButton.BackgroundColor3 = Color3.fromRGB(0, 150, 190)
    MainButton.BorderSizePixel = 0
    MainButton.Text = text
    MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainButton.Font = Enum.Font.GothamSemibold
    MainButton.TextSize = 14
    MainButton.Parent = ButtonFrame

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = MainButton

    MainButton.MouseEnter:Connect(function()
        MainButton.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
    end)
    
    MainButton.MouseLeave:Connect(function()
        MainButton.BackgroundColor3 = Color3.fromRGB(0, 150, 190)
    end)

    MainButton.MouseButton1Click:Connect(function()
        callback()
    end)
    
    return ButtonFrame
end

CreateButton("Load CSS Unlocker Updated", function()
    task.spawn(function()
        local success, err = pcall(function()
            local url = loadstring(game:HttpGet("https://pastebin.com/raw/x4rJcJKv"))()
            loadstring(game:HttpGet(url))()
        end)
        if not success then
            warn("Failed to load script: " .. tostring(err))
        end
    end)
    
    ScreenGui:Destroy()
end)

CreateButton("Load Juwl 1.1", function()
    task.spawn(function()
        local success, err = pcall(function()
            local url = loadstring(game:HttpGet("https://raw.githubusercontent.com/lleyton10yt/ROBLOX-SCRIPTS-BY-ME/refs/heads/main/JUWL1.1.luau"))()
            loadstring(game:HttpGet(url))()
        end)
        if not success then
            warn("Failed to load script: " .. tostring(err))
        end
    end)
    
    ScreenGui:Destroy()
end)
