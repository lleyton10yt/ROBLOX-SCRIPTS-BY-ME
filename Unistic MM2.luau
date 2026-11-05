-- Unistic Menu: Custom Aqua-Themed MM2 Script (Back-Facing Kill All Update)
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

-- Prevent duplicate UI instances
if CoreGui:FindFirstChild("UnisticMenu") then
    CoreGui:FindFirstChild("UnisticMenu"):Destroy()
end

-- ScreenGui Setup
local UnisticMenu = Instance.new("ScreenGui")
UnisticMenu.Name = "UnisticMenu"
UnisticMenu.Parent = CoreGui
UnisticMenu.ResetOnSpawn = false

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 340)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = UnisticMenu

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 220, 220)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- Top Drag Zone / Buffer Bar
local DragZone = Instance.new("Frame")
DragZone.Name = "DragZone"
DragZone.Size = UDim2.new(1, 0, 0, 32)
DragZone.BackgroundTransparency = 1
DragZone.Parent = MainFrame

-- Window Controls Layout
local ControlLayout = Instance.new("UIListLayout")
ControlLayout.Parent = DragZone
ControlLayout.FillDirection = Enum.FillDirection.Horizontal
ControlLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
ControlLayout.SortOrder = Enum.SortOrder.LayoutOrder
ControlLayout.Padding = UDim.new(0, 5)

-- Exit Button
local ExitBtn = Instance.new("TextButton")
ExitBtn.Name = "ExitBtn"
ExitBtn.Size = UDim2.new(0, 35, 1, 0)
ExitBtn.BackgroundTransparency = 1
ExitBtn.Text = "X"
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.TextSize = 14
ExitBtn.TextColor3 = Color3.fromRGB(220, 60, 60)
ExitBtn.LayoutOrder = 2
ExitBtn.Parent = DragZone

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Name = "MinBtn"
MinBtn.Size = UDim2.new(0, 35, 1, 0)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "-"
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 18
MinBtn.TextColor3 = Color3.fromRGB(0, 220, 220)
MinBtn.LayoutOrder = 1
MinBtn.Parent = DragZone

-- Sidebar Frame
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 135, 1, -32)
Sidebar.Position = UDim2.new(0, 0, 0, 32)
Sidebar.BackgroundColor3 = Color3.fromRGB(10, 13, 16)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

-- Unistic Header Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "UNISTIC"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(0, 255, 255)
Title.Parent = Sidebar

-- Sidebar Button Container
local SidebarBtnContainer = Instance.new("Frame")
SidebarBtnContainer.Size = UDim2.new(1, 0, 1, -95)
SidebarBtnContainer.Position = UDim2.new(0, 0, 0, 45)
SidebarBtnContainer.BackgroundTransparency = 1
SidebarBtnContainer.Parent = Sidebar

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Parent = SidebarBtnContainer
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 6)
SidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Main Content Container
local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -155, 1, -45)
Container.Position = UDim2.new(0, 145, 0, 40)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local tabs = {}
local activeTab = nil
local currentKeybind = Enum.KeyCode.Insert
local isListeningForKey = false

-- Core Navigation Layout Function
local function CreateTab(name, optionalParent)
    local targetParent = optionalParent or SidebarBtnContainer
    local Button = Instance.new("TextButton")
    Button.Name = name .. "Btn"
    Button.Size = UDim2.new(0.9, 0, 0, 34)
    Button.BackgroundColor3 = Color3.fromRGB(20, 25, 32)
    Button.BorderSizePixel = 0
    Button.Text = name
    Button.Font = Enum.Font.GothamSemibold
    Button.TextSize = 13
    Button.TextColor3 = Color3.fromRGB(120, 140, 140)
    Button.Parent = targetParent

    local Page = Instance.new("ScrollingFrame")
    Page.Name = name .. "Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ScrollBarThickness = 4
    Page.BorderSizePixel = 0
    Page.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 255)
    Page.Parent = Container

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = Page
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Padding = UDim.new(0, 10)

    local function select()
        if activeTab then
            activeTab.Page.Visible = false
            TweenService:Create(activeTab.Button, TweenInfo.new(0.2), {
                TextColor3 = Color3.fromRGB(120, 140, 140),
                BackgroundColor3 = Color3.fromRGB(20, 25, 32)
            }):Play()
        end
        activeTab = {Page = Page, Button = Button}
        Page.Visible = true
        TweenService:Create(Button, TweenInfo.new(0.2), {
            TextColor3 = Color3.fromRGB(0, 255, 255),
            BackgroundColor3 = Color3.fromRGB(25, 45, 55)
        }):Play()
    end

    Button.MouseButton1Click:Connect(select)
    tabs[name] = {Page = Page, Button = Button, Select = select}
    return Page
end

-- Toggle Element Creator
local function AddToggle(page, text, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.95, 0, 0, 42)
    frame.BackgroundColor3 = Color3.fromRGB(22, 28, 35)
    frame.BorderSizePixel = 0
    frame.Parent = page

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 13
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local toggleBg = Instance.new("TextButton")
    toggleBg.Size = UDim2.new(0, 42, 0, 20)
    toggleBg.Position = UDim2.new(1, -54, 0.5, -10)
    toggleBg.BackgroundColor3 = Color3.fromRGB(40, 45, 50)
    toggleBg.BorderSizePixel = 0
    toggleBg.Text = ""
    toggleBg.Parent = frame

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 16, 0, 16)
    circle.Position = UDim2.new(0, 2, 0.5, -8)
    circle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    circle.BorderSizePixel = 0
    circle.Parent = toggleBg

    local enabled = false
    toggleBg.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            TweenService:Create(toggleBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 180, 180)}):Play()
            TweenService:Create(circle, TweenInfo.new(0.2), {Position = UDim2.new(1, -18, 0.5, -8), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        else
            TweenService:Create(toggleBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 45, 50)}):Play()
            TweenService:Create(circle, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -8), BackgroundColor3 = Color3.fromRGB(200, 200, 200)}):Play()
        end
        task.spawn(callback, enabled)
    end)
end

-- Section Title Creator Helper
local function AddSectionLabel(page, text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.95, 0, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = "--- " .. text .. " ---"
    label.Font = Enum.Font.GothamBold
    label.TextSize = 13
    label.TextColor3 = Color3.fromRGB(0, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = page
end

-- Custom UI Button Creator Helper
local function AddButton(page, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 42)
    btn.BackgroundColor3 = Color3.fromRGB(25, 32, 40)
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 13
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Parent = page

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 45, 55)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25, 32, 40)}):Play()
    end)
    btn.MouseButton1Click:Connect(callback)
end

-- Visual Spacer Creator Helper
local function AddSpacer(page, height)
    local spacer = Instance.new("Frame")
    spacer.Size = UDim2.new(0.95, 0, 0, height)
    spacer.BackgroundTransparency = 1
    spacer.Parent = page
end

-- ========================================================
-- GENERATING BUILD INTERFACES
-- ========================================================
local HomePage = CreateTab("Home")
local GamePage = CreateTab("Game")
local OPPage   = CreateTab("OP Stuff")

-- Fixed Bottom Area for Settings Tab
local SettingsAnchor = Instance.new("Frame")
SettingsAnchor.Name = "SettingsAnchor"
SettingsAnchor.Size = UDim2.new(1, 0, 0, 45)
SettingsAnchor.Position = UDim2.new(0, 6, 1, -45)
SettingsAnchor.BackgroundTransparency = 1
SettingsAnchor.Parent = Sidebar

local SettingsPage = CreateTab("Settings", SettingsAnchor)
tabs["Settings"].Button.Size = UDim2.new(0.9, 0, 0, 36)

tabs["Home"].Select()

-- 1. HOME PAGE: Announcement Text Layout
local HomeText = Instance.new("TextLabel")
HomeText.Size = UDim2.new(0.95, 0, 0, 60)
HomeText.BackgroundTransparency = 1
HomeText.Text = "Welcome to Unistic\nA keyless script for mm2"
HomeText.Font = Enum.Font.GothamBold
HomeText.TextSize = 15
HomeText.TextColor3 = Color3.fromRGB(0, 230, 230)
HomeText.TextXAlignment = Enum.TextXAlignment.Left
HomeText.Parent = HomePage
-- Clean Visual Setup Helpers for Tags
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function CleanVisuals(char)
    if char:FindFirstChild("RoleTag") then char.RoleTag:Destroy() end
    if char:FindFirstChild("RoleHighlight") then char.RoleHighlight:Destroy() end
end

-- Round module (loaded lazily, never errors)
local CurrentRoundClient = nil
local lastWarn = nil

local function warnOnce(msg)
    if lastWarn ~= msg then
        lastWarn = msg
        warn("[Role ESP] " .. msg)
    end
end

local function loadRoundModule()
    if CurrentRoundClient then return CurrentRoundClient end

    local modules = ReplicatedStorage:FindFirstChild("Modules")
    local mod = modules and modules:FindFirstChild("CurrentRoundClient")
    if not mod then
        warnOnce("Round module not found (round not loaded?), using Knife/Gun detection")
        return nil
    end

    local ok, result = pcall(require, mod)
    if not ok or type(result) ~= "table" then
        warnOnce("Failed to require round module, using Knife/Gun detection")
        return nil
    end

    CurrentRoundClient = result
    return CurrentRoundClient
end

-- Returns the Role string for a player, or nil if round data isn't available
local function getRoleFromData(pl)
    local round = loadRoundModule()
    if not round then return nil end

    local data = round.PlayerData
    if type(data) ~= "table" or next(data) == nil then
        if type(round.GetLatestPlayerData) == "function" then
            local ok, fetched = pcall(round.GetLatestPlayerData)
            data = ok and fetched or nil
        end
    end

    if type(data) ~= "table" or next(data) == nil then
        warnOnce("Round data is empty (round not started?), using Knife/Gun detection")
        return nil
    end

    lastWarn = nil -- data is good again, allow future warnings

    local entry = data[pl.Name] or data[pl.UserId] or data[tostring(pl.UserId)] or data[pl]
    if type(entry) == "table" and entry.Role then
        return tostring(entry.Role)
    end
    return nil
end

-- GAME PAGE: Role ESP
local roleEspActive = false
AddToggle(GamePage, "Role ESP Scan System", function(state)
    roleEspActive = state
    if not roleEspActive then
        for _, pl in pairs(Players:GetPlayers()) do
            if pl.Character then CleanVisuals(pl.Character) end
        end
        return
    end

    while roleEspActive do
        for _, pl in pairs(Players:GetPlayers()) do
            if pl ~= LocalPlayer and pl.Character and pl.Character:FindFirstChild("Head") then
                local char = pl.Character
                local head = char.Head

                -- Role detection: round module first, tools as fallback
                local role = getRoleFromData(pl)
                local roleLower = role and role:lower() or nil

                local isMurderer, isSheriff
                if roleLower then
                    isMurderer = roleLower:find("murder") ~= nil
                    isSheriff = roleLower:find("sheriff") ~= nil or roleLower:find("hero") ~= nil
                else
                    local backpack = pl:FindFirstChild("Backpack")
                    isMurderer = (backpack and backpack:FindFirstChild("Knife")) or char:FindFirstChild("Knife")
                    isSheriff = (backpack and backpack:FindFirstChild("Gun")) or char:FindFirstChild("Gun")
                end

                local tagText = "Innocent"
                local highlightColor = Color3.fromRGB(0, 255, 0)
                if isMurderer then
                    tagText = "Murderer"
                    highlightColor = Color3.fromRGB(255, 0, 0)
                elseif isSheriff then
                    tagText = "Sheriff"
                    highlightColor = Color3.fromRGB(0, 30, 150)
                end

                -- Tag above the head
                local tag = char:FindFirstChild("RoleTag")
                if not tag then
                    tag = Instance.new("BillboardGui")
                    tag.Name = "RoleTag"
                    tag.Size = UDim2.new(0, 150, 0, 50)
                    tag.AlwaysOnTop = true
                    tag.StudsOffset = Vector3.new(0, 3, 0)
                    tag.Adornee = head

                    local layout = Instance.new("UIListLayout")
                    layout.SortOrder = Enum.SortOrder.LayoutOrder
                    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    layout.Parent = tag

                    local rl = Instance.new("TextLabel")
                    rl.Name = "RoleLabel"
                    rl.Size = UDim2.new(1, 0, 0.5, 0)
                    rl.BackgroundTransparency = 1
                    rl.Font = Enum.Font.GothamBold
                    rl.TextSize = 14
                    rl.TextStrokeTransparency = 0.3
                    rl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    rl.LayoutOrder = 1
                    rl.Parent = tag

                    local nl = Instance.new("TextLabel")
                    nl.Name = "NameLabel"
                    nl.Size = UDim2.new(1, 0, 0.5, 0)
                    nl.BackgroundTransparency = 1
                    nl.Font = Enum.Font.GothamBold
                    nl.TextSize = 12
                    nl.TextColor3 = Color3.fromRGB(255, 255, 255)
                    nl.TextStrokeTransparency = 0.3
                    nl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    nl.LayoutOrder = 2
                    nl.Text = pl.DisplayName or pl.Name
                    nl.Parent = tag

                    tag.Parent = char
                end
                tag.Adornee = head
                tag.RoleLabel.Text = tagText
                tag.RoleLabel.TextColor3 = highlightColor

                -- Body highlight
                local high = char:FindFirstChild("RoleHighlight")
                if not high then
                    high = Instance.new("Highlight")
                    high.Name = "RoleHighlight"
                    high.FillTransparency = 0.5
                    high.OutlineColor = Color3.fromRGB(255, 255, 255)
                    high.Parent = char
                end
                high.FillColor = highlightColor
            end
        end
        task.wait(1.0)
    end
end)
-- 3. OP STUFF PAGE: Organized Murderer & Hero Functions
local bringAllActive = false
local anchoredRoots = {}
AddSectionLabel(OPPage, "Murder Stuff")
AddToggle(OPPage, "Bring All to Me", function(state)
    bringAllActive = state

    if not bringAllActive then
        -- Release everyone
        for root in pairs(anchoredRoots) do
            if root and root.Parent then
                root.Anchored = false
            end
        end
        anchoredRoots = {}
        return
    end

    while bringAllActive do
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")

        if hrp then
            -- All players share this one spot, 4 studs in front of you
            local targetCFrame = hrp.CFrame * CFrame.new(0, 0, -4)

            for _, pl in pairs(Players:GetPlayers()) do
                if pl ~= LocalPlayer and pl.Character then
                    local root = pl.Character:FindFirstChild("HumanoidRootPart")
                    local hum = pl.Character:FindFirstChildOfClass("Humanoid")
                    if root and hum and hum.Health > 0 then
                        root.Anchored = true
                        root.AssemblyLinearVelocity = Vector3.zero
                        root.CFrame = targetCFrame
                        anchoredRoots[root] = true
                    end
                end
            end
        end

        task.wait(0.05)
    end
end)
AddSpacer(OPPage, 20)
AddSectionLabel(OPPage, "Hero Stuff")
AddButton(OPPage, "Bring Dropped Gun to Me", function()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then
        warn("[Gun] Your character isn't loaded")
        return
    end

    -- Find the dropped gun anywhere in workspace
    local targetGun = nil
    for _, desc in pairs(workspace:GetDescendants()) do
        if desc.Name == "GunDrop" and (desc:IsA("BasePart") or desc:IsA("Model")) then
            targetGun = desc
            break
        end
    end

    if not targetGun then
        warn("[Gun] No dropped gun found (nobody has dropped it yet)")
        return
    end

    -- Move the gun onto the player
    if targetGun:IsA("Model") then
        targetGun:PivotTo(hrp.CFrame)
    else
        targetGun.CFrame = hrp.CFrame
    end

    -- Trigger the pickup touch if the executor supports it
    if firetouchinterest then
        local touchPart = targetGun:IsA("BasePart") and targetGun
            or targetGun.PrimaryPart
            or targetGun:FindFirstChildWhichIsA("BasePart", true)
        if touchPart then
            firetouchinterest(hrp, touchPart, 0)
            task.wait()
            firetouchinterest(hrp, touchPart, 1)
        end
    end
end)

-- 4. SETTINGS PAGE: Keybind Configuration Module
local bindFrame = Instance.new("Frame")
bindFrame.Size = UDim2.new(0.95, 0, 0, 42)
bindFrame.BackgroundColor3 = Color3.fromRGB(22, 28, 35)
bindFrame.BorderSizePixel = 0
bindFrame.Parent = SettingsPage

local bindLabel = Instance.new("TextLabel")
bindLabel.Size = UDim2.new(0.5, 0, 1, 0)
bindLabel.Position = UDim2.new(0, 12, 0, 0)
bindLabel.BackgroundTransparency = 1
bindLabel.Text = "Menu Toggle Key"
bindLabel.Font = Enum.Font.GothamSemibold
bindLabel.TextSize = 13
bindLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
bindLabel.TextXAlignment = Enum.TextXAlignment.Left
bindLabel.Parent = bindFrame

local bindBtn = Instance.new("TextButton")
bindBtn.Size = UDim2.new(0, 90, 0, 24)
bindBtn.Position = UDim2.new(1, -102, 0.5, -12)
bindBtn.BackgroundColor3 = Color3.fromRGB(35, 42, 50)
bindBtn.BorderSizePixel = 0
bindBtn.Text = "Insert"
bindBtn.Font = Enum.Font.GothamBold
bindBtn.TextSize = 12
bindBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
bindBtn.Parent = bindFrame

bindBtn.MouseButton1Click:Connect(function()
    isListeningForKey = true
    bindBtn.Text = "..."
    bindBtn.TextColor3 = Color3.fromRGB(200, 200, 100)
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if isListeningForKey and input.UserInputType == Enum.UserInputType.Keyboard then
        currentKeybind = input.KeyCode
        bindBtn.Text = input.KeyCode.Name
        bindBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
        isListeningForKey = false
    elseif not processed and input.KeyCode == currentKeybind then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
-- ========================================================
-- WINDOW INTERACTION SERVICES (Minimize & Exit Controls)
-- ========================================================
local isMinimized = false
MinBtn.MouseButton1Click:Connect(function()
isMinimized = not isMinimized
if isMinimized then
Sidebar.Visible = false
Container.Visible = false
ExitBtn.Visible = false
MinBtn.Text = "+"
MainFrame.Size = UDim2.new(0, 45, 0, 32)
else
Sidebar.Visible = true
Container.Visible = true
ExitBtn.Visible = true
MinBtn.Text = "-"
MainFrame.Size = UDim2.new(0, 520, 0, 340)
end
end)
ExitBtn.MouseButton1Click:Connect(function()
roleEspActive = false
task.wait(0.1)
for _, pl in pairs(Players:GetPlayers()) do
if pl.Character then CleanVisuals(pl.Character) end
end
UnisticMenu:Destroy()
end)