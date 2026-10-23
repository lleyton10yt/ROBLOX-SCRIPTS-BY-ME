local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer or Players:GetService("Players").LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui") or player:WaitForChild("PlayerGui", 1)

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CSS_v13_Gui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 9999999

local menuFrame = Instance.new("Frame")
menuFrame.Name = "MainMenuFrame"
menuFrame.Position = UDim2.new(0.5, isMobile and -190 or -260, 0.5, isMobile and -115 or -160)
menuFrame.BackgroundColor3 = Color3.fromRGB(20, 10, 35)
menuFrame.BackgroundTransparency = 0.25
menuFrame.Active = true
menuFrame.Draggable = true
menuFrame.ClipsDescendants = true
menuFrame.Parent = screenGui

local defaultSize = isMobile and UDim2.new(0, 380, 0, 230) or UDim2.new(0, 520, 0, 320)
menuFrame.Size = defaultSize

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(130, 60, 220)
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0.3
uiStroke.Parent = menuFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = isMobile and UDim2.new(1, 0, 0, 35) or UDim2.new(1, 0, 0, 55)
titleLabel.BackgroundColor3 = Color3.fromRGB(35, 15, 60)
titleLabel.BackgroundTransparency = 0.4
titleLabel.Text = "  Juwl Menu v1.0" 
titleLabel.TextSize = isMobile and 14 or 20
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BorderSizePixel = 0
titleLabel.Parent = menuFrame

-- da rainbow text
task.spawn(function()
	local speed = 0.3
	RunService.Heartbeat:Connect(function()
		
		local hue = (os.clock() * speed) % 1
		titleLabel.TextColor3 = Color3.fromHSV(hue, 1, 1)
	end)
end)


local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = isMobile and UDim2.new(0, 30, 0, 30) or UDim2.new(0, 35, 0, 35)
closeButton.Position = UDim2.new(1, isMobile and -32 or -35, 0, isMobile and 2 or 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeButton.BackgroundTransparency = 0.2
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = isMobile and 14 or 18
closeButton.Font = Enum.Font.SourceSansBold
closeButton.BorderSizePixel = 0
closeButton.ZIndex = 12
closeButton.Parent = menuFrame

closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = isMobile and UDim2.new(0, 30, 0, 30) or UDim2.new(0, 35, 0, 35)
minimizeButton.Position = UDim2.new(1, isMobile and -64 or -72, 0, isMobile and 2 or 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
minimizeButton.BackgroundTransparency = 0.2
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextSize = isMobile and 16 or 20
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.BorderSizePixel = 0
minimizeButton.ZIndex = 12
minimizeButton.Parent = menuFrame

local sideBar = Instance.new("ScrollingFrame")
sideBar.Name = "SideBar"
sideBar.Size = isMobile and UDim2.new(0, 100, 1, -35) or UDim2.new(0, 120, 1, -55)
sideBar.Position = isMobile and UDim2.new(0, 0, 0, 35) or UDim2.new(0, 0, 0, 55)
sideBar.BackgroundColor3 = Color3.fromRGB(15, 5, 25)
sideBar.BackgroundTransparency = 0.5
sideBar.BorderSizePixel = 0
sideBar.ScrollBarThickness = 4
sideBar.ScrollBarImageColor3 = Color3.fromRGB(130, 60, 220)
sideBar.CanvasSize = UDim2.new(0, 0, 0, 550)
sideBar.ScrollingDirection = Enum.ScrollingDirection.Y
sideBar.ClipsDescendants = true
sideBar.Parent = menuFrame

local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
sidebarLayout.Padding = UDim.new(0, 0)
sidebarLayout.Parent = sideBar

local tabContentFrame = Instance.new("Frame")
tabContentFrame.Size = isMobile and UDim2.new(1, -100, 1, -35) or UDim2.new(1, -120, 1, -55)
tabContentFrame.Position = isMobile and UDim2.new(0, 100, 0, 35) or UDim2.new(0, 120, 0, 55)
tabContentFrame.BackgroundTransparency = 1
tabContentFrame.BorderSizePixel = 0
tabContentFrame.ClipsDescendants = true
tabContentFrame.Parent = menuFrame

local resizeHandle = Instance.new("ImageLabel")
resizeHandle.Name = "ResizeHandleSquare"
resizeHandle.Size = UDim2.new(0, 15, 0, 15)
resizeHandle.Position = UDim2.new(1, -15, 1, -15)
resizeHandle.BackgroundColor3 = Color3.fromRGB(130, 60, 220)
resizeHandle.BackgroundTransparency = 0.4
resizeHandle.BorderSizePixel = 0
resizeHandle.ZIndex = 14
resizeHandle.Visible = false
resizeHandle.Parent = menuFrame

local maxSquare = Instance.new("Frame")
maxSquare.Name = "MaximizeSquare"
maxSquare.Size = UDim2.new(0, 40, 0, 40)
maxSquare.BackgroundColor3 = Color3.fromRGB(130, 60, 220)
maxSquare.BackgroundTransparency = 0.25
maxSquare.Active = true
maxSquare.Draggable = true
maxSquare.Visible = false
maxSquare.Parent = screenGui

local maxSquareStroke = Instance.new("UIStroke")
maxSquareStroke.Color = Color3.fromRGB(130, 60, 220)
maxSquareStroke.Thickness = 1.5
maxSquareStroke.Transparency = 0.3
maxSquareStroke.Parent = maxSquare

local maxButton = Instance.new("TextButton")
maxButton.Name = "MaximizeButton"
maxButton.Size = UDim2.new(0.5, 0, 1, 0)
maxButton.Position = UDim2.new(0.5, 0, 0, 0)
maxButton.BackgroundColor3 = Color3.fromRGB(20, 10, 35)
maxButton.BackgroundTransparency = 0.25
maxButton.Text = "+"
maxButton.TextColor3 = Color3.fromRGB(255, 255, 255)
maxButton.TextSize = 20
maxButton.Font = Enum.Font.SourceSansBold
maxButton.BorderSizePixel = 0
maxButton.Parent = maxSquare

local views, currentKeybind, isBinding = {}, nil, false

minimizeButton.MouseButton1Click:Connect(function()
	maxSquare.Position = menuFrame.Position
	menuFrame.Visible = false
	maxSquare.Visible = true
end)

maxButton.MouseButton1Click:Connect(function()
	menuFrame.Position = maxSquare.Position
	maxSquare.Visible = false
	menuFrame.Visible = true
end)

local function createTab(name, order, visible)
	local btn = Instance.new("TextButton")
	btn.Size = isMobile and UDim2.new(1, 0, 0, 35) or UDim2.new(1, 0, 0, 45)
	btn.LayoutOrder = order
	btn.BorderSizePixel = 0
	btn.Text = name
	btn.TextSize = isMobile and 12 or 16
	btn.Font = Enum.Font.SourceSansBold
	btn.Parent = sideBar

	local view = Instance.new("Frame")
	view.Size = UDim2.new(1, 0, 1, 0)
	view.BackgroundTransparency = 1
	view.BorderSizePixel = 0
	view.Visible = visible
	view.ClipsDescendants = true
	view.Parent = tabContentFrame

	views[name] = {btn = btn, view = view}
	btn.BackgroundColor3 = visible and Color3.fromRGB(45, 20, 80) or Color3.fromRGB(25, 10, 45)
	btn.TextColor3 = visible and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)

	btn.MouseButton1Click:Connect(function()
		for tName, tData in pairs(views) do
			local isMatch = (tName == name)
			tData.view.Visible = isMatch
			tData.btn.BackgroundColor3 = isMatch and Color3.fromRGB(45, 20, 80) or Color3.fromRGB(25, 10, 45)
			tData.btn.TextColor3 = isMatch and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)
		end
	end)
	return view
end

-- home view
local homeView = createTab("Home", 1, true)
local gameView = createTab("Game", 2, false) 
local levelMakerView = createTab("Level Creator", 3, false) 
local skinsView = createTab("Become Character", 4, false) 
local speedrunView = createTab("Speedrun", 5, false) 
local removedView = createTab("Removed Features", 6, false) 
local musicView = createTab("Music", 7, false) 
local visualView = createTab("Character Tweaks", 8, false)
local settingsView = createTab("Settings", 9, false) 



local homeText = Instance.new("TextLabel")
homeText.Size = UDim2.new(1, -40, 0, 100)
homeText.Position = isMobile and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 20, 0, 40)
homeText.BackgroundTransparency = 1
homeText.Text = "This is the first release of JUWL 1.0 Thank you for using it.\n\nThe developer's name is ImNull_L"
homeText.TextColor3 = Color3.fromRGB(240, 220, 255)
homeText.TextSize = isMobile and 14 or 18
homeText.Font = Enum.Font.SourceSansBold
homeText.TextWrapped = true
homeText.BorderSizePixel = 0
homeText.Parent = homeView

-- game view
local gameScroll = Instance.new("ScrollingFrame")
gameScroll.Size = UDim2.new(1, 0, 1, 0)
gameScroll.BackgroundTransparency = 1
gameScroll.BorderSizePixel = 0
gameScroll.ScrollBarThickness = 4
gameScroll.ScrollBarImageColor3 = Color3.fromRGB(130, 60, 220)
gameScroll.ScrollingDirection = Enum.ScrollingDirection.Y
gameScroll.ClipsDescendants = true
gameScroll.Parent = gameView

local paddingElement = Instance.new("UIPadding")
paddingElement.PaddingTop = UDim.new(0, 10)
paddingElement.PaddingBottom = UDim.new(0, 10)
paddingElement.Parent = gameScroll

local gameListLayout = Instance.new("UIListLayout")
gameListLayout.SortOrder = Enum.SortOrder.LayoutOrder
gameListLayout.Padding = UDim.new(0, isMobile and 6 or 10)
gameListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
gameListLayout.Parent = gameScroll

gameListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	gameScroll.CanvasSize = UDim2.new(0, 0, 0, gameListLayout.AbsoluteContentSize.Y + 30)
end)

-- FIX GAME BUTTON
local softlockButton = Instance.new("TextButton")
softlockButton.Name = "SoftlockFixButton"
softlockButton.Size = UDim2.new(1, -40, 0, isMobile and 38 or 50)
softlockButton.LayoutOrder = 1
softlockButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
softlockButton.BackgroundTransparency = 0.1
softlockButton.TextColor3 = Color3.fromRGB(255, 255, 255)
softlockButton.Text = "FIX GAME"
softlockButton.TextSize = isMobile and 13 or 16
softlockButton.Font = Enum.Font.SourceSansBold
softlockButton.BorderSizePixel = 0
softlockButton.Parent = gameScroll

-- the gap between fix game and restart stage
local upperGameSpacer = Instance.new("Frame")
upperGameSpacer.Name = "UpperGameSpacer"
upperGameSpacer.Size = UDim2.new(1, 0, 0, isMobile and 10 or 15)
upperGameSpacer.LayoutOrder = 2 
upperGameSpacer.BackgroundTransparency = 1
upperGameSpacer.BorderSizePixel = 0
upperGameSpacer.Parent = gameScroll

-- restart button
local restartStageButton = Instance.new("TextButton")
restartStageButton.Name = "RestartStageButton"
restartStageButton.Size = UDim2.new(1, -40, 0, isMobile and 38 or 50)
restartStageButton.LayoutOrder = 3
restartStageButton.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
restartStageButton.BackgroundTransparency = 0.1
restartStageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
restartStageButton.Text = "Restart Stage"
restartStageButton.TextSize = isMobile and 13 or 16
restartStageButton.Font = Enum.Font.SourceSansBold
restartStageButton.BorderSizePixel = 0
restartStageButton.Parent = gameScroll

restartStageButton.MouseButton1Click:Connect(function()
	
	
	
	local activeGame = playerGui:FindFirstChild("Game")
	local backdrop = activeGame and activeGame:FindFirstChild("Backdrop")
	local mainFrame = backdrop and backdrop:FindFirstChild("Main")
	local engineScript = mainFrame and mainFrame:FindFirstChild("Engine")
	
	if engineScript then
		engineScript.Disabled = true
		engineScript.Disabled = false
		print("[CSS v13 Menu]: Verified restart stuff executed.")
	else
		warn("[Classic Sonic Simulator v13]: Restart Failure .")
	end
end)

-- 3. gap between restart stage and the character select 
local lowerGameSpacer = Instance.new("Frame")
lowerGameSpacer.Name = "LowerGameSpacer"
lowerGameSpacer.Size = UDim2.new(1, 0, 0, isMobile and 10 or 15)
lowerGameSpacer.LayoutOrder = 4 
lowerGameSpacer.BackgroundTransparency = 1
lowerGameSpacer.BorderSizePixel = 0
lowerGameSpacer.Parent = gameScroll

-- CHARACTER SELECTION BAR
local charBarFrame = Instance.new("Frame")
charBarFrame.Name = "CharacterSelectionArea"
charBarFrame.Size = UDim2.new(1, -20, 0, isMobile and 35 or 45)
charBarFrame.LayoutOrder = 5
charBarFrame.BackgroundTransparency = 1
charBarFrame.ClipsDescendants = true
charBarFrame.Parent = gameScroll
local charScroll = Instance.new("ScrollingFrame")
charScroll.Size = UDim2.new(1, 0, 1, 0)
charScroll.BackgroundTransparency = 0.6
charScroll.BackgroundColor3 = Color3.fromRGB(15, 5, 25)
charScroll.BorderSizePixel = 0
charScroll.ScrollBarThickness = 3
charScroll.ScrollBarImageColor3 = Color3.fromRGB(130, 60, 220)
charScroll.CanvasSize = UDim2.new(0, 1100, 0, 0)
charScroll.ScrollingDirection = Enum.ScrollingDirection.X
charScroll.ClipsDescendants = true
charScroll.Parent = charBarFrame
local charLayout = Instance.new("UIListLayout")
charLayout.SortOrder = Enum.SortOrder.LayoutOrder
charLayout.FillDirection = Enum.FillDirection.Horizontal
charLayout.Padding = UDim.new(0, 6)
charLayout.VerticalAlignment = Enum.VerticalAlignment.Center
charLayout.Parent = charScroll
local charPadding = Instance.new("UIPadding")
charPadding.PaddingLeft = UDim.new(0, 6)
charPadding.Parent = charScroll
local selectedCharacterId = 1
local characterButtons = {}
local charList = {
{name = "Sonic S1", id = 1},
{name = "Sonic S2", id = 2},
{name = "Sonic SCD", id = 19},
{name = "Sonic S3", id = 3},
{name = "Tails S3", id = 4},
{name = "Knuckles S3", id = 5},
{name = "Amy", id = 6},
{name = "Metal Sonic", id = 7},
{name = "Rouge S1", id = 8},
{name = "Super Sonic", id = 9},
{name = "Dr. Robotnik", id = 10},
{name = "Shadow S3", id = 12}
}
for index, charData in ipairs(charList) do
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, isMobile and 75 or 85, 0, isMobile and 24 or 32)
btn.LayoutOrder = index
btn.BorderSizePixel = 0
btn.Text = charData.name
btn.TextSize = isMobile and 11 or 13
btn.Font = Enum.Font.SourceSansBold
btn.Parent = charScroll
if charData.id == selectedCharacterId then
btn.BackgroundColor3 = Color3.fromRGB(45, 20, 80)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
else
btn.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
btn.BackgroundTransparency = 0.2
btn.TextColor3 = Color3.fromRGB(220, 200, 245)
end
characterButtons[charData.id] = btn
btn.MouseButton1Click:Connect(function()
selectedCharacterId = charData.id
for id, button in pairs(characterButtons) do
if id == selectedCharacterId then
button.BackgroundColor3 = Color3.fromRGB(45, 20, 80)
button.BackgroundTransparency = 0
button.TextColor3 = Color3.fromRGB(255, 255, 255)
else
button.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
button.BackgroundTransparency = 0.2
button.TextColor3 = Color3.fromRGB(220, 200, 245)
end
end
end)
end
-- STAGE GAP 
local teleportSpacer = Instance.new("Frame")
teleportSpacer.Name = "TeleportSectionSpacer"
teleportSpacer.Size = UDim2.new(1, 0, 0, isMobile and 10 or 15)
teleportSpacer.LayoutOrder = 6
teleportSpacer.BackgroundTransparency = 1
teleportSpacer.BorderSizePixel = 0
teleportSpacer.Parent = gameScroll
local function addTeleportButton(name, zoneArgs, order)
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, -40, 0, isMobile and 35 or 50)
btn.LayoutOrder = order + 10 
btn.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
btn.BackgroundTransparency = 0.1
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Text = "Teleport to " .. name
btn.TextSize = isMobile and 12 or 16
btn.Font = Enum.Font.SourceSansBold
btn.BorderSizePixel = 0
btn.Parent = gameScroll
btn.MouseButton1Click:Connect(function()
local remotesFolder = ReplicatedStorage:FindFirstChild("Remotes")
local loadGameEvent = remotesFolder and remotesFolder:FindFirstChild("LoadGame")
if loadGameEvent then
local targetsToDestroy = {
"Game",
"MainMenu",
"LevelSelect",
"CustomLevelSelect",
"ManageLevels",
"AdventurePlayCustoms",
"AdventureManageGui",
"CustomStageSelect",
"ManageStages"
}
for _, uiName in ipairs(targetsToDestroy) do
local targetUi = playerGui:FindFirstChild(uiName)
if targetUi then
targetUi:Destroy()
end
end
loadGameEvent:FireServer(zoneArgs, selectedCharacterId)
else
warn("[Classic Sonic Simulator v13]: Teleport Error - LoadGame event is missing.")
end
end)
end
addTeleportButton("GGGG Zone", {"????", 1, {133, 487}, 0, "????"}, 1)
addTeleportButton("Virtual Reality Act 1", {"Virtual Reality", 1, {133, 487}, 0, "Virtual Reality"}, 2)
addTeleportButton("Virtual Reality Act 2", {"Virtual Reality", 2, {133, 487}, 0, "Virtual Reality"}, 3)
addTeleportButton("Old Test Act 1", {"Test", 1, {133, 487}, 0, "Test"}, 4)
addTeleportButton("Old Test Act 2", {"Test", 2, {133, 487}, 0, "Test"}, 5)
addTeleportButton("Chemical Plant", {"Chemical Plant", 1, {133, 487}, 0, "Chemical Plant"}, 6)
addTeleportButton("Aquatic Ruin", {"Aquatic Ruin", 1, {133, 487}, 0, "Aquatic Ruin"}, 7)
addTeleportButton("Metropolis", {"Metropolis", 1, {133, 487}, 0, "Metropolis"}, 8)
addTeleportButton("Hydrocity", {"Hydrocity", 1, {133, 487}, 0, "Hydrocity"}, 9)
addTeleportButton("Ice Cap", {"Ice Cap", 1, {133, 487}, 0, "Ice Cap"}, 10)
addTeleportButton("Sandopolis", {"Sandopolis", 1, {133, 487}, 0, "Sandopolis"}, 11)
-- LEVEL CREATOR VIEW
local levelMakerScroll = Instance.new("ScrollingFrame")
levelMakerScroll.Size = UDim2.new(1, 0, 1, 0)
levelMakerScroll.BackgroundTransparency = 1
levelMakerScroll.BorderSizePixel = 0
levelMakerScroll.ScrollBarThickness = 4
levelMakerScroll.ScrollBarImageColor3 = Color3.fromRGB(130, 60, 220)
levelMakerScroll.CanvasSize = UDim2.new(0, 0, 0, 9500) 
levelMakerScroll.ScrollingDirection = Enum.ScrollingDirection.Y
levelMakerScroll.ClipsDescendants = true
levelMakerScroll.Parent = levelMakerView
local levelMakerLayout = Instance.new("UIListLayout")
levelMakerLayout.SortOrder = Enum.SortOrder.LayoutOrder
levelMakerLayout.Padding = UDim.new(0, isMobile and 6 or 10)
levelMakerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
levelMakerLayout.Parent = levelMakerScroll
local levelMakerPadding = Instance.new("UIPadding")
levelMakerPadding.PaddingTop = UDim.new(0, 10)
levelMakerPadding.Parent = levelMakerScroll
local deleteObjectsParagraph = Instance.new("TextLabel")
deleteObjectsParagraph.Name = "DeleteObjectsInstruction"
deleteObjectsParagraph.Size = UDim2.new(1, -40, 0, isMobile and 55 or 75)
deleteObjectsParagraph.LayoutOrder = 1
deleteObjectsParagraph.BackgroundTransparency = 1
deleteObjectsParagraph.Text = "Insert Objects: To insert these objects you need to click one of these objects then go to the single ring place it down then save and exit after entering you should have your object."
deleteObjectsParagraph.TextColor3 = Color3.fromRGB(220, 200, 245)
deleteObjectsParagraph.TextSize = isMobile and 10 or 12
deleteObjectsParagraph.Font = Enum.Font.SourceSansBold
deleteObjectsParagraph.TextWrapped = true
deleteObjectsParagraph.BorderSizePixel = 0
deleteObjectsParagraph.Parent = levelMakerScroll
local houseObjectsHeader = Instance.new("TextLabel")
houseObjectsHeader.Name = "HouseObjectsHeader"
houseObjectsHeader.Size = UDim2.new(1, -40, 0, 25)
houseObjectsHeader.LayoutOrder = 2
houseObjectsHeader.BackgroundTransparency = 1
houseObjectsHeader.Text = "House Objects"
houseObjectsHeader.TextColor3 = Color3.fromRGB(180, 140, 255)
houseObjectsHeader.TextSize = isMobile and 14 or 16
houseObjectsHeader.Font = Enum.Font.SourceSansBold
houseObjectsHeader.BorderSizePixel = 0
houseObjectsHeader.Parent = levelMakerScroll
local function addCreatorObjectButton(labelName, objId, sizeDim, storagePath, layoutIndex)
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, -40, 0, isMobile and 32 or 40)
btn.LayoutOrder = layoutIndex
btn.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
btn.BackgroundTransparency = 0.1
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Text = "Insert " .. labelName
btn.TextSize = isMobile and 12 or 14
btn.Font = Enum.Font.SourceSansBold
btn.BorderSizePixel = 0
btn.Parent = levelMakerScroll
btn.MouseButton1Click:Connect(function()
local levelCreatorGui = playerGui:FindFirstChild("LevelCreator")
local objectsList = levelCreatorGui and levelCreatorGui:FindFirstChild("Backdrop", true) and levelCreatorGui.Backdrop:FindFirstChild("Screen", true) and levelCreatorGui.Backdrop.Screen:FindFirstChild("ObjectsList", true)
local targetRing = objectsList and objectsList:FindFirstChild("Ring") and objectsList.Ring:FindFirstChild("Ring")
if targetRing then
local numVal = Instance.new("NumberValue")
numVal.Parent = targetRing
local oldObjId = targetRing:FindFirstChild("ObjId")
if oldObjId then oldObjId:Destroy() end
numVal.Name = "ObjId"
numVal.Value = objId
if sizeDim then
targetRing.Size = sizeDim
end
local oldSprite = targetRing:FindFirstChild("Sprite")
if oldSprite then oldSprite:Destroy() end
if storagePath then
local assetFolder = ReplicatedStorage:FindFirstChild("Objects")
local targetAsset = assetFolder and assetFolder:FindFirstChild(storagePath)
local sourceSprite = targetAsset and targetAsset:FindFirstChild("Sprite")
if sourceSprite then
local clone = sourceSprite:Clone()
clone.Parent = targetRing
end
end
else
warn("[Classic Sonic Simulator v13]: Level Creator Error - Make sure the Level Creator UI is open and a Ring slot is prepared.")
end
end)
end
addCreatorObjectButton("Big Bookshelf", 224, UDim2.new(0, 16, 0, 80), "HZ__Book_Shelf_Big", 3)
addCreatorObjectButton("Small Bookshelf", 223, UDim2.new(0, 16, 0, 32), "HZ__Book_Shelf_Small", 4)
addCreatorObjectButton("Chao Fruit", 168, UDim2.new(0, 24, 0, 16), "HZ__Fruit_Chao", 5)
addCreatorObjectButton("Picture Frame 1", 169, UDim2.new(0, 24, 0, 16), "HZ__Picture1", 6)
addCreatorObjectButton("Picture Frame 2", 170, UDim2.new(0, 24, 0, 16), "HZ__Picture2", 7)
addCreatorObjectButton("Cake Slice", 167, UDim2.new(0, 24, 0, 16), "HZ__Cake_Slice", 8)
addCreatorObjectButton("Long Table", 166, UDim2.new(0, 96, 0, 16), "HZ__Table2", 9)
addCreatorObjectButton("Short Table", 165, UDim2.new(0, 48, 0, 16), "HZ__Table", 10)
addCreatorObjectButton("Couch", 163, UDim2.new(0, 76, 0, 8), "HZ__Couch", 11)
addCreatorObjectButton("Armchair", 164, UDim2.new(0, 24, 0, 8), "HZ__Couch_Small", 12)
local levelMakerSpacer = Instance.new("Frame")
levelMakerSpacer.Name = "SectionSpacer"
levelMakerSpacer.Size = UDim2.new(1, 0, 0, 15)
levelMakerSpacer.LayoutOrder = 13
levelMakerSpacer.BackgroundTransparency = 1
levelMakerSpacer.BorderSizePixel = 0
levelMakerSpacer.Parent = levelMakerScroll
local unusedObjectsHeader = Instance.new("TextLabel")
unusedObjectsHeader.Name = "UnusedCutObjectsHeader"
unusedObjectsHeader.Size = UDim2.new(1, -40, 0, 25)
unusedObjectsHeader.LayoutOrder = 14
unusedObjectsHeader.BackgroundTransparency = 1
unusedObjectsHeader.Text = "Unused/Cut Objects"
unusedObjectsHeader.TextColor3 = Color3.fromRGB(255, 100, 100)
unusedObjectsHeader.TextSize = isMobile and 14 or 16
unusedObjectsHeader.Font = Enum.Font.SourceSansBold
unusedObjectsHeader.BorderSizePixel = 0
unusedObjectsHeader.Parent = levelMakerScroll
addCreatorObjectButton("Big Angel Island Breakable Rock", 145, UDim2.new(0, 24, 0, 8), "HZ__Couch_Small", 15)
addCreatorObjectButton("Medium Angel Island Breakable Rock", 144, nil, nil, 16)
addCreatorObjectButton("Small Angel Island Breakable Rock (Jump to Break)", 146, nil, nil, 17)
addCreatorObjectButton("Small Angel Island Breakable Rock (Spindash to Break)", 143, nil, nil, 18)
addCreatorObjectButton("ID 440", 440, nil, nil, 19)
addCreatorObjectButton("Solid Wall 4", 373, nil, nil, 20)
addCreatorObjectButton("Solid Wall 5", 374, nil, nil, 21)
addCreatorObjectButton("Triple Rotating Bumpers", 514, nil, nil, 22)
local levelMakerSpacer2 = Instance.new("Frame")
levelMakerSpacer2.Name = "SectionSpacer2"
levelMakerSpacer2.Size = UDim2.new(1, 0, 0, 15)
levelMakerSpacer2.LayoutOrder = 40
levelMakerSpacer2.BackgroundTransparency = 1
levelMakerSpacer2.BorderSizePixel = 0
levelMakerSpacer2.Parent = levelMakerScroll
local mysticCaveHeader = Instance.new("TextLabel")
mysticCaveHeader.Name = "MysticCaveObjectsHeader"
mysticCaveHeader.Size = UDim2.new(1, -40, 0, 25)
mysticCaveHeader.LayoutOrder = 41
mysticCaveHeader.BackgroundTransparency = 1
mysticCaveHeader.Text = "Mystic Cave Objects"
mysticCaveHeader.TextColor3 = Color3.fromRGB(100, 200, 255)
mysticCaveHeader.TextSize = isMobile and 14 or 16
mysticCaveHeader.Font = Enum.Font.SourceSansBold
mysticCaveHeader.BorderSizePixel = 0
mysticCaveHeader.Parent = levelMakerScroll
addCreatorObjectButton("Block", 570, nil, nil, 42)
addCreatorObjectButton("Spike Trap", 571, nil, nil, 43)
addCreatorObjectButton("Crushing Pillar", 572, nil, nil, 44)
addCreatorObjectButton("Rotating Spikeball Chain", 573, nil, nil, 45)
addCreatorObjectButton("Collapsing Bridge", 579, nil, nil, 46)
addCreatorObjectButton("Horizontal Moving Platform", 580, nil, nil, 47)
addCreatorObjectButton("Rotating Crates", 583, nil, nil, 48)
addCreatorObjectButton("Halswing", 585, nil, nil, 49)
addCreatorObjectButton("Vine", 591, nil, nil, 50)
local levelMakerSpacer3 = Instance.new("Frame")
levelMakerSpacer3.Name = "SectionSpacer3"
levelMakerSpacer3.Size = UDim2.new(1, 0, 0, 15)
levelMakerSpacer3.LayoutOrder = 60
levelMakerSpacer3.BackgroundTransparency = 1
levelMakerSpacer3.BorderSizePixel = 0
levelMakerSpacer3.Parent = levelMakerScroll
local globalObjectsHeader = Instance.new("TextLabel")
globalObjectsHeader.Name = "GlobalObjectsHeader"
globalObjectsHeader.Size = UDim2.new(1, -40, 0, 25)
globalObjectsHeader.LayoutOrder = 61
globalObjectsHeader.BackgroundTransparency = 1
globalObjectsHeader.Text = "Global Objects"
globalObjectsHeader.TextColor3 = Color3.fromRGB(120, 235, 160)
globalObjectsHeader.TextSize = isMobile and 14 or 16
globalObjectsHeader.Font = Enum.Font.SourceSansBold
globalObjectsHeader.BorderSizePixel = 0
globalObjectsHeader.Parent = levelMakerScroll
addCreatorObjectButton("Balloon", 34, nil, nil, 62)
addCreatorObjectButton("Dash Panel", 258, nil, nil, 63)
addCreatorObjectButton("Spinning Spike Chain", 124, nil, nil, 64)
addCreatorObjectButton("MGZ Spinning Spikeball", 228, nil, nil, 65)
addCreatorObjectButton("Medium Spike Ball", 136, nil, nil, 66)
addCreatorObjectButton("Big Spike Ball", 137, nil, nil, 67)
addCreatorObjectButton("Locked Door", 147, nil, nil, 68)
addCreatorObjectButton("Locked Chara Door", 152, nil, nil, 69)
addCreatorObjectButton("Arrow", 174, nil, nil, 70)
addCreatorObjectButton("Warning Sign", 180, nil, nil, 71)
addCreatorObjectButton("Path Swapper", 539, nil, nil, 72)
addCreatorObjectButton("Master Emerald", 171, nil, nil, 73)
addCreatorObjectButton("Bridge From Old Test", 120, nil, nil, 74)
addCreatorObjectButton("Conveyor Belt", 142, nil, nil, 75)
addCreatorObjectButton("CD Bumper", 33, nil, nil, 76)
addCreatorObjectButton("Flipper", 322, nil, nil, 77)
local levelMakerSpacer4 = Instance.new("Frame")
levelMakerSpacer4.Name = "SectionSpacer4"
levelMakerSpacer4.Size = UDim2.new(1, 0, 0, 15)
levelMakerSpacer4.LayoutOrder = 90
levelMakerSpacer4.BackgroundTransparency = 1
levelMakerSpacer4.BorderSizePixel = 0
levelMakerSpacer4.Parent = levelMakerScroll
local oldTestHeader = Instance.new("TextLabel")
oldTestHeader.Name = "OldTestObjectsHeader"
oldTestHeader.Size = UDim2.new(1, -40, 0, 25)
oldTestHeader.LayoutOrder = 91
oldTestHeader.BackgroundTransparency = 1
oldTestHeader.Text = "Old Test Objects"
oldTestHeader.TextColor3 = Color3.fromRGB(255, 200, 100)
oldTestHeader.TextSize = isMobile and 14 or 16
oldTestHeader.Font = Enum.Font.SourceSansBold
oldTestHeader.BorderSizePixel = 0
oldTestHeader.Parent = levelMakerScroll
addCreatorObjectButton("Block", 181, nil, nil, 92)
addCreatorObjectButton("Breakable Wall", 192, nil, nil, 93)
addCreatorObjectButton("Rotating Staircase", 232, nil, nil, 94)
addCreatorObjectButton("Swinging Platform", 123, nil, nil, 95)
addCreatorObjectButton("Platform", 115, nil, nil, 96)
addCreatorObjectButton("Bridge", 120, nil, nil, 97)
local testObjectsSpacer = Instance.new("Frame")
testObjectsSpacer.Name = "TestObjectsSectionSpacer"
testObjectsSpacer.Size = UDim2.new(1, 0, 0, 15)
testObjectsSpacer.LayoutOrder = 200
testObjectsSpacer.BackgroundTransparency = 1
testObjectsSpacer.BorderSizePixel = 0
testObjectsSpacer.Parent = levelMakerScroll
local testObjectsHeader = Instance.new("TextLabel")
testObjectsHeader.Name = "TestObjectsHeader"
testObjectsHeader.Size = UDim2.new(1, -40, 0, 25)
testObjectsHeader.LayoutOrder = 201
testObjectsHeader.BackgroundTransparency = 1
testObjectsHeader.Text = "Test Objects"
testObjectsHeader.TextColor3 = Color3.fromRGB(240, 220, 255)
testObjectsHeader.TextSize = isMobile and 14 or 16
testObjectsHeader.Font = Enum.Font.SourceSansBold
testObjectsHeader.BorderSizePixel = 0
testObjectsHeader.Parent = levelMakerScroll
addCreatorObjectButton("Block", 400, nil, nil, 202)
addCreatorObjectButton("Breakable Wall", 401, nil, nil, 203)
addCreatorObjectButton("Collapsing Bridge", 404, nil, nil, 204)
addCreatorObjectButton("Bumper Platform", 405, nil, nil, 205)
addCreatorObjectButton("Breakable Block", 384, nil, nil, 206)
addCreatorObjectButton("Glass Bumper", 385, nil, nil, 207)
addCreatorObjectButton("Fire Wall", 386, nil, nil, 208)
addCreatorObjectButton("Platform", 394, nil, nil, 209)
addCreatorObjectButton("Swinging Platform", 391, nil, nil, 210)
addCreatorObjectButton("Rotating Staircase", 411, nil, nil, 211)
addCreatorObjectButton("Bridge", 496, nil, nil, 212)
addCreatorObjectButton("Interactable Block", 530, nil, nil, 213)
addCreatorObjectButton("S2 Bumper", 413, nil, nil, 214)
addCreatorObjectButton("Bumper Token", 518, nil, nil, 215)
addCreatorObjectButton("Crushing Spiked Pillar", 536, nil, nil, 216)
addCreatorObjectButton("Past Swapper", 539, nil, nil, 217)
addCreatorObjectButton("Rock", 537, nil, nil, 218)
addCreatorObjectButton("Cork", 538, nil, nil, 219)
local greenHillSpacer = Instance.new("Frame")
greenHillSpacer.Name = "GreenHillSectionSpacer"
greenHillSpacer.Size = UDim2.new(1, 0, 0, 15)
greenHillSpacer.LayoutOrder = 300
greenHillSpacer.BackgroundTransparency = 1
greenHillSpacer.BorderSizePixel = 0
greenHillSpacer.Parent = levelMakerScroll
local greenHillHeader = Instance.new("TextLabel")
greenHillHeader.Name = "GreenHillObjectsHeader"
greenHillHeader.Size = UDim2.new(1, -40, 0, 25)
greenHillHeader.LayoutOrder = 301
greenHillHeader.BackgroundTransparency = 1
greenHillHeader.Text = "Green Hill Objects"
greenHillHeader.TextColor3 = Color3.fromRGB(46, 204, 113)
greenHillHeader.TextSize = isMobile and 14 or 16
greenHillHeader.Font = Enum.Font.SourceSansBold
greenHillHeader.BorderSizePixel = 0
greenHillHeader.Parent = levelMakerScroll
addCreatorObjectButton("GHZ Flower 1", 11, nil, nil, 302)
addCreatorObjectButton("GHZ Flower 2", 12, nil, nil, 303)
addCreatorObjectButton("GHZ Tree", 13, nil, nil, 304)
addCreatorObjectButton("GHZ Totem Pole", 14, nil, nil, 305)
addCreatorObjectButton("GHZ Platform", 18, nil, nil, 306)
addCreatorObjectButton("GHZ Collapsing Ledge", 19, nil, nil, 307)
addCreatorObjectButton("GHZ Floating Log", 20, nil, nil, 308)
addCreatorObjectButton("GHZ Bridge Stake", 21, nil, nil, 309)
addCreatorObjectButton("GHZ Bridge Log Planks", 22, nil, nil, 310)
addCreatorObjectButton("GHZ Giant Loop-de-Loop", 25, nil, nil, 311)
addCreatorObjectButton("GHZ Breakable Wall", 26, nil, nil, 312)
addCreatorObjectButton("GHZ Rolling Rock", 28, nil, nil, 313)
addCreatorObjectButton("GHZ Waterfall Splash Mesh", 29, nil, nil, 314)
addCreatorObjectButton("GHZ Vertical Yellow Spring", 31, nil, nil, 315)
addCreatorObjectButton("GHZ Diagonal Yellow Spring", 32, nil, nil, 316)
addCreatorObjectButton("GHZ Hidden Spike Trap", 33, nil, nil, 317)
addCreatorObjectButton("GHZ Swinger Platform Ball", 34, nil, nil, 318)
addCreatorObjectButton("GHZ Checkpoint Lamppost", 35, nil, nil, 319)
local marbleSpacer = Instance.new("Frame")
marbleSpacer.Name = "MarbleSectionSpacer"
marbleSpacer.Size = UDim2.new(1, 0, 0, 15)
marbleSpacer.LayoutOrder = 400
marbleSpacer.BackgroundTransparency = 1
marbleSpacer.BorderSizePixel = 0
marbleSpacer.Parent = levelMakerScroll
local marbleHeader = Instance.new("TextLabel")
marbleHeader.Name = "MarbleObjectsHeader"
marbleHeader.Size = UDim2.new(1, -40, 0, 25)
marbleHeader.LayoutOrder = 401
marbleHeader.BackgroundTransparency = 1
marbleHeader.Text = "Marble Objects"
marbleHeader.TextColor3 = Color3.fromRGB(192, 57, 43)
marbleHeader.TextSize = isMobile and 14 or 16
marbleHeader.Font = Enum.Font.SourceSansBold
marbleHeader.BorderSizePixel = 0
marbleHeader.Parent = levelMakerScroll
addCreatorObjectButton("Block", 199, nil, nil, 402)
addCreatorObjectButton("Platform", 200, nil, nil, 403)
addCreatorObjectButton("Moving Pillar", 208, nil, nil, 404)
addCreatorObjectButton("Falling Block Type A", 211, nil, nil, 405)
addCreatorObjectButton("Falling Block Type B", 212, nil, nil, 406)
addCreatorObjectButton("Bobbing Block", 213, nil, nil, 407)
addCreatorObjectButton("Breakable Block", 230, nil, nil, 408)
addCreatorObjectButton("Fire Wall", 248, nil, nil, 409)
addCreatorObjectButton("Fireball Spawner", 257, nil, nil, 410)
addCreatorObjectButton("Swinging Platform", 263, nil, nil, 411)
addCreatorObjectButton("Interactable Block", 529, nil, nil, 412)
-- SPRING YARD OBJECTS AREA
local springYardSpacer = Instance.new("Frame")
springYardSpacer.Name = "SpringYardSectionSpacer"
springYardSpacer.Size = UDim2.new(1, 0, 0, 15)
springYardSpacer.LayoutOrder = 500
springYardSpacer.BackgroundTransparency = 1
springYardSpacer.BorderSizePixel = 0
springYardSpacer.Parent = levelMakerScroll
local springYardHeader = Instance.new("TextLabel")
springYardHeader.Name = "SpringYardObjectsHeader"
springYardHeader.Size = UDim2.new(1, -40, 0, 25)
springYardHeader.LayoutOrder = 501
springYardHeader.BackgroundTransparency = 1
springYardHeader.Text = "Spring Yard Objects"
springYardHeader.TextColor3 = Color3.fromRGB(255, 140, 0)
springYardHeader.TextSize = isMobile and 14 or 16
springYardHeader.Font = Enum.Font.SourceSansBold
springYardHeader.BorderSizePixel = 0
springYardHeader.Parent = levelMakerScroll
addCreatorObjectButton("S1 Bumper", 256, nil, nil, 502)
addCreatorObjectButton("Block", 245, nil, nil, 503)
addCreatorObjectButton("Platform", 286, nil, nil, 504)
addCreatorObjectButton("Moving Square Platform", 246, nil, nil, 505)
-- LABYIRTNH OBJECTS AREA
local labyrinthSpacer = Instance.new("Frame")
labyrinthSpacer.Name = "LabyrinthSectionSpacer"
labyrinthSpacer.Size = UDim2.new(1, 0, 0, 15)
labyrinthSpacer.LayoutOrder = 600
labyrinthSpacer.BackgroundTransparency = 1
labyrinthSpacer.BorderSizePixel = 0
labyrinthSpacer.Parent = levelMakerScroll
local labyrinthHeader = Instance.new("TextLabel")
labyrinthHeader.Name = "LabyrinthObjectsHeader"
labyrinthHeader.Size = UDim2.new(1, -40, 0, 25)
labyrinthHeader.LayoutOrder = 601
labyrinthHeader.BackgroundTransparency = 1
labyrinthHeader.Text = "Labyrinth Objects"
labyrinthHeader.TextColor3 = Color3.fromRGB(0, 190, 150)
labyrinthHeader.TextSize = isMobile and 14 or 16
labyrinthHeader.Font = Enum.Font.SourceSansBold
labyrinthHeader.BorderSizePixel = 0
labyrinthHeader.Parent = levelMakerScroll
addCreatorObjectButton("Collapsing Block", 563, nil, nil, 602)
addCreatorObjectButton("Projectile Launcher", 564, nil, nil, 603)
addCreatorObjectButton("Block", 221, nil, nil, 604)
addCreatorObjectButton("Sponge Block", 524, nil, nil, 605)
addCreatorObjectButton("Platform", 525, nil, nil, 606)
addCreatorObjectButton("Spear", 527, nil, nil, 607)
-- STAR LIGHT OBJECTS AREA
local starLightSpacer = Instance.new("Frame")
starLightSpacer.Name = "StarLightSectionSpacer"
starLightSpacer.Size = UDim2.new(1, 0, 0, 15)
starLightSpacer.LayoutOrder = 700
starLightSpacer.BackgroundTransparency = 1
starLightSpacer.BorderSizePixel = 0
starLightSpacer.Parent = levelMakerScroll
local starLightHeader = Instance.new("TextLabel")
starLightHeader.Name = "StarLightObjectsHeader"
starLightHeader.Size = UDim2.new(1, -40, 0, 25)
starLightHeader.LayoutOrder = 701
starLightHeader.BackgroundTransparency = 1
starLightHeader.Text = "Star Light Objects"
starLightHeader.TextColor3 = Color3.fromRGB(241, 196, 15)
starLightHeader.TextSize = isMobile and 14 or 16
starLightHeader.Font = Enum.Font.SourceSansBold
starLightHeader.BorderSizePixel = 0
starLightHeader.Parent = levelMakerScroll
addCreatorObjectButton("Collapsing Bridge", 310, nil, nil, 702)
addCreatorObjectButton("Rotating Platforms", 311, nil, nil, 703)
addCreatorObjectButton("Descending Staircase", 312, nil, nil, 704)
addCreatorObjectButton("Fire Wall", 314, nil, nil, 705)
addCreatorObjectButton("Swinging Spiked Platform", 320, nil, nil, 706)
addCreatorObjectButton("Breakable Wall", 321, nil, nil, 707)
-- EMERALD HILL OBJECTS AREA
local emeraldHillSpacer = Instance.new("Frame")
emeraldHillSpacer.Name = "EmeraldHillSectionSpacer"
emeraldHillSpacer.Size = UDim2.new(1, 0, 0, 15)
emeraldHillSpacer.LayoutOrder = 800
emeraldHillSpacer.BackgroundTransparency = 1
emeraldHillSpacer.BorderSizePixel = 0
emeraldHillSpacer.Parent = levelMakerScroll
local emeraldHillHeader = Instance.new("TextLabel")
emeraldHillHeader.Name = "EmeraldHillObjectsHeader"
emeraldHillHeader.Size = UDim2.new(1, -40, 0, 25)
emeraldHillHeader.LayoutOrder = 801
emeraldHillHeader.BackgroundTransparency = 1
emeraldHillHeader.Text = "Emerald Hill Objects"
emeraldHillHeader.TextColor3 = Color3.fromRGB(39, 174, 96)
emeraldHillHeader.TextSize = isMobile and 14 or 16
emeraldHillHeader.Font = Enum.Font.SourceSansBold
emeraldHillHeader.BorderSizePixel = 0
emeraldHillHeader.Parent = levelMakerScroll
addCreatorObjectButton("Platform", 217, nil, nil, 802)
addCreatorObjectButton("Bridge", 214, nil, nil, 803)
addCreatorObjectButton("Bridge Support", 532, nil, nil, 804)

-- SKINS VIEW
local skinsScroll = Instance.new("ScrollingFrame")
skinsScroll.Size = UDim2.new(1, 0, 1, 0)
skinsScroll.BackgroundTransparency = 1
skinsScroll.BorderSizePixel = 0
skinsScroll.ScrollBarThickness = 4
skinsScroll.ScrollBarImageColor3 = Color3.fromRGB(130, 60, 220)
skinsScroll.CanvasSize = UDim2.new(0, 0, 0, 750)
skinsScroll.ScrollingDirection = Enum.ScrollingDirection.Y
skinsScroll.ClipsDescendants = true
skinsScroll.Parent = skinsView
local skinsLayout = Instance.new("UIListLayout")
skinsLayout.SortOrder = Enum.SortOrder.LayoutOrder
skinsLayout.Padding = UDim.new(0, isMobile and 6 or 10)
skinsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
skinsLayout.Parent = skinsScroll
local skinsPadding = Instance.new("UIPadding")
skinsPadding.PaddingTop = UDim.new(0, 10)
skinsPadding.Parent = skinsScroll
local customLevelsWarning = Instance.new("TextLabel")
customLevelsWarning.Name = "CustomLevelsWarningLabel"
customLevelsWarning.Size = UDim2.new(1, -40, 0, 25)
customLevelsWarning.LayoutOrder = 1
customLevelsWarning.BackgroundTransparency = 1
customLevelsWarning.Text = "Only use in custom levels"
customLevelsWarning.TextColor3 = Color3.fromRGB(255, 60, 60)
customLevelsWarning.TextSize = isMobile and 13 or 15
customLevelsWarning.Font = Enum.Font.SourceSansBold
customLevelsWarning.BorderSizePixel = 0
customLevelsWarning.Parent = skinsScroll
local skinsSpacer = Instance.new("Frame")
skinsSpacer.Name = "SkinsLayoutSpacer"
skinsSpacer.Size = UDim2.new(1, 0, 0, 10)
skinsSpacer.LayoutOrder = 2
skinsSpacer.BackgroundTransparency = 1
skinsSpacer.BorderSizePixel = 0
skinsSpacer.Parent = skinsScroll
local function addSkinButton(textLabel, characterId, layoutIndex)
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, -40, 0, isMobile and 32 or 40)
btn.LayoutOrder = layoutIndex + 2
btn.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
btn.BackgroundTransparency = 0.1
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Text = "Become " .. textLabel
btn.TextSize = isMobile and 12 or 14
btn.Font = Enum.Font.SourceSansBold
btn.BorderSizePixel = 0
btn.Parent = skinsScroll
btn.MouseButton1Click:Connect(function()
local loadGameEvent = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("LoadGame")
if loadGameEvent then
local activeGameGui = playerGui:FindFirstChild("Game")
if activeGameGui then activeGameGui:Destroy() end
loadGameEvent:FireServer({"Title Screen", 1, {628, 462}, 2, "Title Screen"}, characterId)
pcall(function() ReplicatedStorage.Remotes.GetPlayerSettings:InvokeServer() end)
pcall(function() ReplicatedStorage.Remotes.GetMasterData:InvokeServer() end)
end
end)
end
addSkinButton("Sonic S1", 1, 1)
addSkinButton("Sonic S2", 2, 2)
addSkinButton("Sonic SCD", 19, 3)
addSkinButton("Sonic S3", 3, 4)
addSkinButton("Tails S3", 4, 5)
addSkinButton("Knuckles S3", 5, 6)
addSkinButton("Amy", 6, 7)
addSkinButton("Metal Sonic", 7, 8)
addSkinButton("Rouge S1", 8, 9)
addSkinButton("Super Sonic", 9, 10)
addSkinButton("Dr. Robotnik", 10, 11)
addSkinButton("Shadow S3", 12, 12)
-- SPEEDRUN VIEW
local testingWarningLabel = Instance.new("TextLabel")
testingWarningLabel.Name = "TestingWarningLabel"
testingWarningLabel.Size = UDim2.new(1, -40, 0, isMobile and 35 or 45)
testingWarningLabel.Position = UDim2.new(0, 20, 0, 15)
testingWarningLabel.BackgroundTransparency = 1
testingWarningLabel.Text = "This is still being tested, don't expect flawless work."
testingWarningLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
testingWarningLabel.TextSize = isMobile and 11 or 14
testingWarningLabel.Font = Enum.Font.SourceSansBold
testingWarningLabel.TextWrapped = true
testingWarningLabel.BorderSizePixel = 0
testingWarningLabel.Parent = speedrunView
local coordinatesDisplay = Instance.new("TextLabel")
coordinatesDisplay.Name = "CoordinatesDisplayLabel"
coordinatesDisplay.Size = UDim2.new(1, -40, 0, isMobile and 35 or 45)
coordinatesDisplay.Position = UDim2.new(0, 20, 0, isMobile and 60 or 70)
coordinatesDisplay.BackgroundColor3 = Color3.fromRGB(35, 15, 60)
coordinatesDisplay.BackgroundTransparency = 0.4
coordinatesDisplay.Text = "X: ---- | Y: ----"
coordinatesDisplay.TextColor3 = Color3.fromRGB(240, 220, 255)
coordinatesDisplay.TextSize = isMobile and 13 or 16
coordinatesDisplay.Font = Enum.Font.SourceSansBold
coordinatesDisplay.BorderSizePixel = 0
coordinatesDisplay.Parent = speedrunView
local trackButton = Instance.new("TextButton")
trackButton.Name = "ToggleTrackingButton"
trackButton.Size = UDim2.new(1, -40, 0, isMobile and 35 or 45)
trackButton.Position = UDim2.new(0, 20, 0, isMobile and 105 or 125)
trackButton.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
trackButton.BackgroundTransparency = 0.1
trackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
trackButton.Text = "Start Tracking"
trackButton.TextSize = isMobile and 13 or 16
trackButton.Font = Enum.Font.SourceSansBold
trackButton.BorderSizePixel = 0
trackButton.Parent = speedrunView
local goalRingButton = Instance.new("TextButton")
goalRingButton.Name = "TeleportGoalRingButton"
goalRingButton.Size = UDim2.new(1, -40, 0, isMobile and 35 or 45)
goalRingButton.Position = UDim2.new(0, 20, 0, isMobile and 150 or 180)
goalRingButton.BackgroundColor3 = Color3.fromRGB(45, 20, 80)
goalRingButton.BackgroundTransparency = 0.15
goalRingButton.TextColor3 = Color3.fromRGB(240, 220, 255)
goalRingButton.Text = "Teleport Goal Ring"
goalRingButton.TextSize = isMobile and 13 or 16
goalRingButton.Font = Enum.Font.SourceSansBold
goalRingButton.BorderSizePixel = 0
goalRingButton.Parent = speedrunView
local trackingConnection = nil
local isTracking = false
trackButton.MouseButton1Click:Connect(function()
if isTracking then
isTracking = false
trackButton.Text = "Start Tracking"
trackButton.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
coordinatesDisplay.Text = "X: ---- | Y: ----"
if trackingConnection then
trackingConnection:Disconnect()
trackingConnection = nil
end
else
isTracking = true
trackButton.Text = "Stop Tracking"
trackButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
trackingConnection = RunService.Heartbeat:Connect(function()
local storagePlayers = ReplicatedStorage:FindFirstChild("Players")
local targetFolder = storagePlayers and storagePlayers:FindFirstChild(player.Name)
local xValueObj = targetFolder and targetFolder:FindFirstChild("X")
local yValueObj = targetFolder and targetFolder:FindFirstChild("Y")
if xValueObj and yValueObj then
coordinatesDisplay.Text = string.format("X: %.2f | Y: %.2f", xValueObj.Value, yValueObj.Value)
else
coordinatesDisplay.Text = "X: N/A | Y: N/A"
end
end)
end
end)
local scanLoopConnection = nil
local isScanningGoalRing = false
goalRingButton.MouseButton1Click:Connect(function()
local currentGui = player:FindFirstChild("PlayerGui")
if not currentGui then
warn("[Framework Error]: .")
return
end
if isScanningGoalRing then
isScanningGoalRing = false
goalRingButton.Text = "Teleport Goal Ring"
goalRingButton.BackgroundColor3 = Color3.fromRGB(45, 20, 80)
if scanLoopConnection then
scanLoopConnection:Disconnect()
scanLoopConnection = nil
end
else
isScanningGoalRing = true
goalRingButton.Text = "Stop Scanning"
goalRingButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
scanLoopConnection = RunService.Heartbeat:Connect(function()
local activeGameUi = currentGui:FindFirstChild("Game")
local backdrop = activeGameUi and activeGameUi:FindFirstChild("Backdrop")
local mainFrame = backdrop and backdrop:FindFirstChild("Main")
local worldSpace = mainFrame and mainFrame:FindFirstChild("World")
local objectsFolder = worldSpace and worldSpace:FindFirstChild("Objects")
local targetGoalRing = objectsFolder and objectsFolder:FindFirstChild("Ring_Goal")
if targetGoalRing then

local storagePlayers = ReplicatedStorage:FindFirstChild("Players")
local personalFolder = storagePlayers and storagePlayers:FindFirstChild(player.Name)
local playerX = personalFolder and personalFolder:FindFirstChild("X")
local playerY = personalFolder and personalFolder:FindFirstChild("Y")
if playerX and playerY then
local ringX = targetGoalRing:FindFirstChild("Xpo") or targetGoalRing:FindFirstChild("xpo")
local ringY = targetGoalRing:FindFirstChild("Ypo") or targetGoalRing:FindFirstChild("ypo")
if ringX and ringY then
ringX.Value = playerX.Value
ringY.Value = playerY.Value
end
if targetGoalRing:IsA("GuiObject") then
targetGoalRing.Position = UDim2.new(0, playerX.Value, 0, playerY.Value)
elseif targetGoalRing:IsA("Model") then
targetGoalRing:MoveTo(Vector3.new(playerX.Value, playerY.Value, targetGoalRing:GetPivot().Position.Z))
elseif targetGoalRing:IsA("BasePart") then
targetGoalRing.Position = Vector3.new(playerX.Value, playerY.Value, targetGoalRing.Position.Z)
end
end
end
end)
end
end)
-- REMOVED FEATURES VIEW
local warningLabel = Instance.new("TextLabel")
warningLabel.Name = "IllustrationWarning"
warningLabel.Size = UDim2.new(1, -20, 0, 30)
warningLabel.Position = isMobile and UDim2.new(0, 10, 0, 5) or UDim2.new(0, 10, 0, 15)
warningLabel.BackgroundTransparency = 1
warningLabel.Text = "Never press this button unless in the MainMenu if so it can mess things up."
warningLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
warningLabel.TextSize = isMobile and 10 or 12
warningLabel.Font = Enum.Font.SourceSansBold
warningLabel.TextWrapped = true
warningLabel.BorderSizePixel = 0
warningLabel.Parent = removedView
local textButton = Instance.new("TextButton")
textButton.Name = "LoadAnimationButton"
textButton.Size = isMobile and UDim2.new(1, -40, 0, 45) or UDim2.new(1, -40, 0, 65)
textButton.Position = isMobile and UDim2.new(0, 20, 0, 45) or UDim2.new(0, 20, 0, 60)
textButton.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
textButton.BackgroundTransparency = 0.1
textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton.Text = isMobile and "Inject Animation GUI (unsupported on mobile)" or "Inject Animation GUI"
textButton.TextSize = isMobile and 11 or 18
textButton.TextScaled = isMobile
textButton.Font = Enum.Font.SourceSansBold
textButton.BorderSizePixel = 0
textButton.Parent = removedView

-- MUSIC VIEW
local minusButton = Instance.new("TextButton")
minusButton.Name = "MinusButton"
minusButton.Size = isMobile and UDim2.new(0, 35, 0, 35) or UDim2.new(0, 45, 0, 45)
minusButton.Position = isMobile and UDim2.new(0, 15, 0, 20) or UDim2.new(0, 20, 0, 25)
minusButton.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
minusButton.BackgroundTransparency = 0.1
minusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minusButton.Text = "-"
minusButton.TextSize = isMobile and 18 or 24
minusButton.Font = Enum.Font.SourceSansBold
minusButton.BorderSizePixel = 0
minusButton.Parent = musicView

local pitchDisplay = Instance.new("TextLabel")
pitchDisplay.Name = "PitchDisplay"
pitchDisplay.Size = isMobile and UDim2.new(0, 170, 0, 35) or UDim2.new(0, 230, 0, 45)
pitchDisplay.Position = isMobile and UDim2.new(0, 55, 0, 20) or UDim2.new(0, 75, 0, 25)
pitchDisplay.BackgroundColor3 = Color3.fromRGB(35, 15, 60)
pitchDisplay.BackgroundTransparency = 0.4
pitchDisplay.Text = "Music Pitch: 1.0x"
pitchDisplay.TextColor3 = Color3.fromRGB(240, 220, 255)
pitchDisplay.TextSize = isMobile and 13 or 16
pitchDisplay.Font = Enum.Font.SourceSansBold
pitchDisplay.BorderSizePixel = 0
pitchDisplay.Parent = musicView

local plusButton = Instance.new("TextButton")
plusButton.Name = "PlusButton"
plusButton.Size = isMobile and UDim2.new(0, 35, 0, 35) or UDim2.new(0, 45, 0, 45)
plusButton.Position = isMobile and UDim2.new(0, 230, 0, 20) or UDim2.new(0, 315, 0, 25)
plusButton.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
plusButton.BackgroundTransparency = 0.1
plusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
plusButton.Text = "+"
plusButton.TextSize = isMobile and 18 or 24
plusButton.Font = Enum.Font.SourceSansBold
plusButton.BorderSizePixel = 0
plusButton.Parent = musicView

local muteButton = Instance.new("TextButton")
muteButton.Name = "ToggleMuteButton"
muteButton.Size = isMobile and UDim2.new(1, -30, 0, 40) or UDim2.new(1, -40, 0, 50)
muteButton.Position = isMobile and UDim2.new(0, 15, 0, 70) or UDim2.new(0, 20, 0, 85)
muteButton.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
muteButton.BackgroundTransparency = 0.1
muteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
muteButton.Text = "Music Status: Unmuted"
muteButton.TextSize = isMobile and 13 or 16
muteButton.Font = Enum.Font.SourceSansBold
muteButton.BorderSizePixel = 0
muteButton.Parent = musicView

-- TAB 9: VISUAL VIEW PANEL INTERFACE
local visualScroll = Instance.new("ScrollingFrame")
visualScroll.Size = UDim2.new(1, 0, 1, 0)
visualScroll.BackgroundTransparency = 1
visualScroll.BorderSizePixel = 0
visualScroll.ScrollBarThickness = 4
visualScroll.ScrollBarImageColor3 = Color3.fromRGB(130, 60, 220)
visualScroll.CanvasSize = UDim2.new(0, 0, 0, 400)
visualScroll.ScrollingDirection = Enum.ScrollingDirection.Y
visualScroll.ClipsDescendants = true
visualScroll.Parent = visualView 

local visualLayout = Instance.new("UIListLayout")
visualLayout.SortOrder = Enum.SortOrder.LayoutOrder
visualLayout.Padding = UDim.new(0, isMobile and 6 or 10)
visualLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
visualLayout.Parent = visualScroll

local visualPadding = Instance.new("UIPadding")
visualPadding.PaddingTop = UDim.new(0, 10)
visualPadding.Parent = visualScroll

-- 1. PEELOUT TOGGLE SWITCH
local peeloutActive = false
local peeloutButton = Instance.new("TextButton")
peeloutButton.Name = "ToggleAllCharactersPeeloutButton"
peeloutButton.Size = UDim2.new(1, -40, 0, isMobile and 38 or 50)
peeloutButton.LayoutOrder = 3
peeloutButton.BackgroundColor3 = Color3.fromRGB(80, 20, 140) 
peeloutButton.BackgroundTransparency = 0.1
peeloutButton.TextColor3 = Color3.fromRGB(200, 200, 200)
peeloutButton.Text = "All Characters Peelout: OFF"
peeloutButton.Font = Enum.Font.SourceSansBold
peeloutButton.TextSize = isMobile and 13 or 16
peeloutButton.BorderSizePixel = 0
peeloutButton.Parent = visualScroll

peeloutButton.MouseButton1Click:Connect(function()
	peeloutActive = not peeloutActive
	
	-- Update button visuals based on the toggle switch state
	peeloutButton.Text = peeloutActive and "All Characters Peelout: ON" or "All Characters Peelout: OFF"
	peeloutButton.BackgroundColor3 = peeloutActive and Color3.fromRGB(140, 40, 230) or Color3.fromRGB(80, 20, 140)
	peeloutButton.TextColor3 = peeloutActive and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)

	local AbilityData = require(game.ReplicatedStorage.Modules.CharacterProperties)
	if AbilityData and AbilityData.tbl then
		for charName, charTable in pairs(AbilityData.tbl) do
			if charName ~= "Sonic_SCD" and type(charTable) == "table" then
				charTable.CanUsePeelout = peeloutActive
			end
		end
		print("[Juwl Menu Visuals]: Peelout toggle switched to: " .. tostring(peeloutActive))
	end
end)

-- 2. INSTA-SHIELD TOGGLE SWITCH
local instaShieldActive = false
local instaShieldButton = Instance.new("TextButton")
instaShieldButton.Name = "ToggleSomeCharactersInstaShieldButton"
instaShieldButton.Size = UDim2.new(1, -40, 0, isMobile and 38 or 50)
instaShieldButton.LayoutOrder = 4
instaShieldButton.BackgroundColor3 = Color3.fromRGB(80, 20, 140)
instaShieldButton.BackgroundTransparency = 0.1
instaShieldButton.TextColor3 = Color3.fromRGB(200, 200, 200)
instaShieldButton.Text = "Some Characters Insta-Shield: OFF"
instaShieldButton.Font = Enum.Font.SourceSansBold
instaShieldButton.TextSize = isMobile and 13 or 16
instaShieldButton.BorderSizePixel = 0
instaShieldButton.Parent = visualScroll

instaShieldButton.MouseButton1Click:Connect(function()
	instaShieldActive = not instaShieldActive
	
	instaShieldButton.Text = instaShieldActive and "Some Characters Insta-Shield: ON" or "Some Characters Insta-Shield: OFF"
	instaShieldButton.BackgroundColor3 = instaShieldActive and Color3.fromRGB(140, 40, 230) or Color3.fromRGB(80, 20, 140)
	instaShieldButton.TextColor3 = instaShieldActive and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)

	local AbilityData = require(game.ReplicatedStorage.Modules.CharacterProperties)
	if AbilityData and AbilityData.tbl then
		local exclusions = {
			["Sonic_S3"] = true, ["Tails_S3"] = true, ["Knuckles_S3"] = true,
			["Amy"] = true, ["Metal_Sonic"] = true, ["Rouge_S1"] = true, ["Dr_Robotnik"] = true
		}
		for charName, charTable in pairs(AbilityData.tbl) do
			if not exclusions[charName] and type(charTable) == "table" then
				charTable.CanInstaShield = instaShieldActive
			end
		end
		print("[Juwl Menu Visuals]: Insta-Shield toggle switched to: " .. tostring(instaShieldActive))
	end
end)

-- NOTE
local visualNoteLabel2 = Instance.new("TextLabel")
visualNoteLabel2.Name = "EXECUTORWARNING"
visualNoteLabel2.Size = UDim2.new(1, -40, 0, isMobile and 45 or 55)
visualNoteLabel2.LayoutOrder = 1
visualNoteLabel2.BackgroundTransparency = 1
visualNoteLabel2.Text = "THESE ONLY WORK ON DELTA ANY OTHER EXECUTOR CRASHES THE GAME"
visualNoteLabel2.TextColor3 = Color3.fromRGB(255, 0, 0)
visualNoteLabel2.TextSize = isMobile and 11 or 13
visualNoteLabel2.Font = Enum.Font.SourceSansBold
visualNoteLabel2.TextWrapped = true
visualNoteLabel2.BorderSizePixel = 0
visualNoteLabel2.Parent = visualScroll

-- NOTE
local visualNoteLabel = Instance.new("TextLabel")
visualNoteLabel.Name = "VisualAbilityNoteLabel"
visualNoteLabel.Size = UDim2.new(1, -40, 0, isMobile and 45 or 55)
visualNoteLabel.LayoutOrder = 2
visualNoteLabel.BackgroundTransparency = 1
visualNoteLabel.Text = "Insta-shield overrides flying and gliding to prevent this some characters wont have insta-shield."
visualNoteLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
visualNoteLabel.TextSize = isMobile and 11 or 13
visualNoteLabel.Font = Enum.Font.SourceSansBold
visualNoteLabel.TextWrapped = true
visualNoteLabel.BorderSizePixel = 0
visualNoteLabel.Parent = visualScroll


	



-- SETTINGS VIEW
local keybindLabel = Instance.new("TextLabel")
keybindLabel.Size = isMobile and UDim2.new(0, 110, 0, 40) or UDim2.new(0, 150, 0, 50)
keybindLabel.Position = isMobile and UDim2.new(0, 10, 0, 20) or UDim2.new(0, 20, 0, 35)
keybindLabel.BackgroundTransparency = 1
keybindLabel.Text = "Hide/Show Key:"
keybindLabel.TextColor3 = Color3.fromRGB(240, 220, 255)
keybindLabel.TextSize = isMobile and 14 or 18
keybindLabel.Font = Enum.Font.SourceSansBold
keybindLabel.TextXAlignment = Enum.TextXAlignment.Left
keybindLabel.BorderSizePixel = 0
keybindLabel.Parent = settingsView

local bindButton = Instance.new("TextButton")
bindButton.Size = isMobile and UDim2.new(0, 140, 0, 35) or UDim2.new(0, 200, 0, 45)
bindButton.Position = isMobile and UDim2.new(0, 115, 0, 22) or UDim2.new(0, 170, 0, 37)
bindButton.BackgroundColor3 = Color3.fromRGB(110, 40, 190)
bindButton.BackgroundTransparency = 0.1
bindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
bindButton.Text = isMobile and "N/A (PC Only)" or "Click to Bind Key"
bindButton.TextSize = isMobile and 13 or 16
bindButton.Font = Enum.Font.SourceSansBold
bindButton.BorderSizePixel = 0
bindButton.Parent = settingsView

-- mobile or pc detection ig
if not isMobile then
	bindButton.MouseButton1Click:Connect(function()
		isBinding = true
		bindButton.Text = "Press any key..."
		bindButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
	end)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if isBinding and input.UserInputType == Enum.UserInputType.Keyboard then
		currentKeybind = input.KeyCode
		isBinding = false
		bindButton.Text, bindButton.BackgroundColor3 = tostring(currentKeybind.Name), Color3.fromRGB(110, 40, 190)
		return
	end
	if currentKeybind and not gameProcessed and input.KeyCode == currentKeybind then
		screenGui.Enabled = not screenGui.Enabled
	end
end)

textButton.MouseButton1Click:Connect(function()
	if isMobile then return end
	local currentGui = playerGui:FindFirstChild("AnimationGui")
	if currentGui then
		currentGui:Destroy()
		return
	end
	if playerGui then
		local mMenu = playerGui:FindFirstChild("MainMenu")
		if mMenu then mMenu:Destroy() else
			local lSel = playerGui:FindFirstChild("LevelSelect")
			if lSel then lSel:Destroy() end
		end
	end
	local anim = ReplicatedStorage:FindFirstChild("AnimationGui") or ReplicatedStorage:WaitForChild("AnimationGui", 1)
	if anim then
		local clone = anim:Clone()
		if clone:IsA("ScreenGui") then
			clone.Enabled = true
			clone.DisplayOrder = 9999990
		elseif clone:IsA("GuiObject") then
			clone.Visible = true
		end
		clone.Parent = playerGui
	else
		warn("[Classic Sonic Simulator v13]: Error - Can't find anything named 'AnimationGui' inside ReplicatedStorage.")
	end
end)

softlockButton.MouseButton1Click:Connect(function()
	local targetsToDestroy = {
		"MainMenu",
		"LevelSelect",
		"Game",
		"CustomStageSelect",
		"ManageStages",
		"CustomLevelSelect",
		"ManageLevels",
		"AdventurePlayCustoms",
		"AdventureManageGui"
	}
	for i = 1, 3 do
		for _, uiName in ipairs(targetsToDestroy) do
			local badGui = playerGui:FindFirstChild(uiName)
			if badGui then
				badGui:Destroy()
			end
		end
		task.wait(0.05)
	end
	local backupMenu = ReplicatedStorage:FindFirstChild("MainMenu")
	if backupMenu then
		local freshClone = backupMenu:Clone()
		freshClone.Parent = playerGui
	else
		warn("[Classic Sonic Simulator v13]: UI Reset Failure - Backup 'MainMenu' is missing from ReplicatedStorage.")
	end
end)

local function getActiveSounds()
	local sounds = {}
	local handler = playerGui:FindFirstChild("MusicHandler")
	local scriptObj = handler and handler:FindFirstChild("Music Script")
	if scriptObj then
		local intro = scriptObj:FindFirstChild("Intro")
		local loop = scriptObj:FindFirstChild("Loop")
		if intro and intro:IsA("Sound") then table.insert(sounds, intro) end
		if loop and loop:IsA("Sound") then table.insert(sounds, loop) end
	end
	return sounds
end

local currentPitchValue = 1.0
local function applyPitchChange(amount)
	currentPitchValue = math.clamp(math.round((currentPitchValue + amount) * 10) / 10, 0.1, 3.0)
	pitchDisplay.Text = "Music Pitch: " .. string.format("%.1f", currentPitchValue) .. "x"
	for _, sound in ipairs(getActiveSounds()) do sound.PlaybackSpeed = currentPitchValue end
end

minusButton.MouseButton1Click:Connect(function() applyPitchChange(-0.1) end)
plusButton.MouseButton1Click:Connect(function() applyPitchChange(0.1) end)

local isMuted = false
muteButton.MouseButton1Click:Connect(function()
	isMuted = not isMuted
	local targetVolume = isMuted and 0 or 0.5
	muteButton.Text = isMuted and "Music Status: Muted" or "Music Status: Unmuted"
	muteButton.BackgroundColor3 = isMuted and Color3.fromRGB(45, 20, 80) or Color3.fromRGB(110, 40, 190)
	for _, sound in ipairs(getActiveSounds()) do sound.Volume = targetVolume end
end)



task.spawn(function()
	local targetScreen = playerGui:FindFirstChild("MainMenu")
	if targetScreen then applyInjectedTextLabel(targetScreen) end
end)

task.spawn(function()
	local targetScreen = ReplicatedStorage:FindFirstChild("MainMenu")
	if targetScreen then applyInjectedTextLabel(targetScreen) end
end)

local function spawnStrictBlackBarFix(targetRoot)
	if not targetRoot then return end
	if not targetRoot:FindFirstChild("Black Bar fix") then
		local fixFrame = Instance.new("Frame")
		fixFrame.Name = "Black Bar fix"
		fixFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		fixFrame.Position = UDim2.new(0.5, -770, 0.5, -1290)
		fixFrame.Size = UDim2.new(1, 5, 0, 900)
		fixFrame.BorderSizePixel = 0
		fixFrame.ZIndex = -100
		fixFrame.Parent = targetRoot
	end
end

task.spawn(function() pcall(function() spawnStrictBlackBarFix(ReplicatedStorage:FindFirstChild("AnimationGui")) end) end)
task.spawn(function() pcall(function() spawnStrictBlackBarFix(playerGui:FindFirstChild("AnimationGui")) end) end)
pcall(function() screenGui.Parent = playerGui end)
