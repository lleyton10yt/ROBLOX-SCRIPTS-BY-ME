local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local gui = Instance.new("ScreenGui")
gui.Name = "ModuleEditor"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0.65, 0, 0.45, 0)
main.Position = UDim2.new(0.5, 0, 0.25, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Active = true
main.Parent = gui

local sizeConstraint = Instance.new("UISizeConstraint")
sizeConstraint.MinSize = Vector2.new(450, 200) 
sizeConstraint.MaxSize = Vector2.new(850, 450) 
sizeConstraint.Parent = main

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 30)
header.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
header.BorderSizePixel = 0
header.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.5, -10, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 13
title.TextXAlignment = Enum.TextXAlignment.Left
title.Text = "ModuleScript Editor."
title.Parent = header

local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(0.5, -10, 1, 0)
credit.Position = UDim2.new(1, -10, 0, 0)
credit.AnchorPoint = Vector2.new(1, 0)
credit.BackgroundTransparency = 1
credit.TextColor3 = Color3.fromRGB(180, 180, 180)
credit.Font = Enum.Font.Gotham
credit.TextSize = 11
credit.TextXAlignment = Enum.TextXAlignment.Right
credit.Text = "Improved By LL3YTz."
credit.Parent = header

local pathBox = Instance.new("TextBox")
pathBox.Size = UDim2.new(1, -190, 0, 25)
pathBox.Position = UDim2.new(0, 10, 0, 40)
pathBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
pathBox.TextColor3 = Color3.new(1, 1, 1)
pathBox.Font = Enum.Font.Code
pathBox.TextSize = 12
pathBox.Text = ""
pathBox.PlaceholderText = "Enter path here (e.g. replicatedstorage.modulescript)"
pathBox.ClearTextOnFocus = false
pathBox.Parent = main

local loadBtn = Instance.new("TextButton")
loadBtn.Size = UDim2.new(0, 50, 0, 25)
loadBtn.Position = UDim2.new(1, -170, 0, 40)
loadBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
loadBtn.TextColor3 = Color3.new(1, 1, 1)
loadBtn.Text = "Load"
loadBtn.Parent = main

local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0, 50, 0, 25)
saveBtn.Position = UDim2.new(1, -110, 0, 40)
saveBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
saveBtn.TextColor3 = Color3.new(1, 1, 1)
saveBtn.Text = "Save"
saveBtn.Parent = main

local exit = Instance.new("TextButton")
exit.Size = UDim2.new(0, 50, 0, 25)
exit.Position = UDim2.new(1, -53, 0, 40)
exit.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
exit.TextColor3 = Color3.new(1, 1, 1)
exit.Text = "Exit"
exit.Parent = main
exit.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 1, -100)
scroll.Position = UDim2.new(0, 10, 0, 75)
scroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scroll.ScrollBarThickness = 6
scroll.Parent = main

local editorCanvas = Instance.new("TextLabel")
editorCanvas.Size = UDim2.new(1, -6, 1, 0)
editorCanvas.BackgroundTransparency = 1
editorCanvas.TextColor3 = Color3.new(1, 1, 1)
editorCanvas.Font = Enum.Font.Code
editorCanvas.TextSize = 13
editorCanvas.TextXAlignment = Enum.TextXAlignment.Left
editorCanvas.TextYAlignment = Enum.TextYAlignment.Top
editorCanvas.Text = ""
editorCanvas.Parent = scroll

local proxyTrigger = Instance.new("TextButton")
proxyTrigger.Size = UDim2.new(1, 0, 1, 0)
proxyTrigger.BackgroundTransparency = 1
proxyTrigger.Text = ""
proxyTrigger.Parent = scroll

local fullScreenContainer = Instance.new("Frame")
fullScreenContainer.Size = UDim2.new(1, 0, 1, 0)
fullScreenContainer.Position = UDim2.new(0, 0, 0, 0)
fullScreenContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
fullScreenContainer.BackgroundTransparency = 1
fullScreenContainer.BorderSizePixel = 0
fullScreenContainer.Visible = false
fullScreenContainer.ZIndex = 10
fullScreenContainer.Parent = gui

local proxyBox = Instance.new("TextBox")
proxyBox.Size = UDim2.new(1, 0, 0.25, 0)
proxyBox.Position = UDim2.new(0, 0, 0, 0)
proxyBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
proxyBox.TextColor3 = Color3.new(1, 1, 1)
proxyBox.Font = Enum.Font.Code
proxyBox.TextSize = 14
proxyBox.ClearTextOnFocus = false
proxyBox.MultiLine = true
proxyBox.TextXAlignment = Enum.TextXAlignment.Left
proxyBox.TextYAlignment = Enum.TextYAlignment.Top
proxyBox.BorderSizePixel = 0
proxyBox.ZIndex = 11
proxyBox.Parent = fullScreenContainer

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -20, 0, 15)
status.Position = UDim2.new(0, 10, 1, -20)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(150, 150, 150)
status.Font = Enum.Font.Code
status.TextSize = 12
status.Text = "Ready"
status.Parent = main

local currentModule
local isVisible = true

local function updateScroll()
	local lines = #string.split(editorCanvas.Text, "\n")
	scroll.CanvasSize = UDim2.new(0, 1000, 0, lines * 18)
end

local function toggleVisibility()
	isVisible = not isVisible
	main.Visible = isVisible
end

local function resolvePath(pathStr)
	local cleanPath = string.gsub(pathStr, "^%s+", "")
	cleanPath = string.gsub(cleanPath, "%s+$", "")
	
	if not string.find(string.lower(cleanPath), "^game") then
		cleanPath = "game." .. cleanPath
	end
	
	local segments = string.split(cleanPath, ".")
	local current = game
	local startIdx = 2
	
	for i = startIdx, #segments do
		local targetName = string.lower(segments[i])
		local foundChild = nil
		
		local childrenSuccess, children = pcall(function() return current:GetChildren() end)
		if childrenSuccess and children then
			for _, child in ipairs(children) do
				if string.lower(child.Name) == targetName then
					foundChild = child
					break
				end
			end
		end
		
		if foundChild then
			current = foundChild
		else
			return nil
		end
	end
	return current
end

local function tableToStringFallback(t, depth)
	depth = depth or 0
	if type(t) ~= "table" then return tostring(t) end
	local indent = string.rep("  ", depth)
	local result = "{\n"
	
	local sortedKeys = {}
	for k in pairs(t) do
		table.insert(sortedKeys, k)
	end
	
	table.sort(sortedKeys, function(a, b)
		return tostring(a) < tostring(b)
	end)
	
	for _, k in ipairs(sortedKeys) do
		local v = t[k]
		local key = type(k) == "string" and k or "["..tostring(k).."]"
		result = result .. indent .. "  " .. key .. " = "
		if type(v) == "table" then 
			result = result .. tableToStringFallback(v, depth + 1)
		elseif type(v) == "string" then 
			result = result .. '"' .. v .. '"'
		else 
			result = result .. tostring(v) 
		end
		result = result .. ",\n"
	end
	return result .. indent .. "}"
end

local function syncActiveEditorView(text)
	editorCanvas.Text = text
	proxyBox.Text = text
	updateScroll()
end

loadBtn.MouseButton1Click:Connect(function()
	local path = pathBox.Text
	local module = resolvePath(path)
	if not module or not module:IsA("ModuleScript") then
		status.Text = "Invalid module path"
		return
	end
	
	local sourceText = nil
	pcall(function() sourceText = module.Source end)
	
	if not sourceText or sourceText == "" then
		local decompileFunc = decompile or extract_script_source or nil
		if decompileFunc then
			local decompSuccess, decompResult = pcall(function() 
				return decompileFunc(module) 
			end)
			if decompSuccess and decompResult and decompResult ~= "" then
				sourceText = decompResult
			end
		end
	end
	
	if sourceText and sourceText ~= "" and not string.find(sourceText, "decompilation panicked") then
		currentModule = module
		syncActiveEditorView(sourceText)
		status.Text = "Loaded Raw Source: " .. module.Name
	else
		local success, data = pcall(require, module)
		if success and type(data) == "table" then
			local output = "return " .. tableToStringFallback(data)
			currentModule = module
			syncActiveEditorView(output)
			status.Text = "Loaded Memory Fallback: " .. module.Name
		else
			status.Text = "Decompiler panicked and runtime require failed"
		end
	end
end)

saveBtn.MouseButton1Click:Connect(function()
	if not currentModule then
		status.Text = "No module loaded"
		return
	end
	
	local execName = (identifyexecutor or getexecutorname or function() return "Unknown" end)()
	if string.find(string.lower(execName), "xeno") or (Xeno and type(Xeno) == "table") then
		status.TextColor3 = Color3.fromRGB(255, 75, 75)
		status.Text = "BLOCKED: Saving on Xeno crashes your game client!"
		return
	end

	local textData = proxyBox.Text
	local success, _ = pcall(function()
		currentModule.Source = textData
	end)
	
	if success then
		status.Text = "Saved raw text successfully!"
	else
		status.Text = "Delta write protection error on current context"
	end
end)

proxyTrigger.MouseButton1Click:Connect(function()
	local mouseLocation = UserInputService:GetMouseLocation()
	local interfaceY = mouseLocation.Y - scroll.AbsolutePosition.Y + scroll.CanvasPosition.Y
	local targetLineIndex = math.clamp(math.floor(interfaceY / 18) + 1, 1, #string.split(proxyBox.Text, "\n"))
	
	main.Visible = false
	fullScreenContainer.Visible = true
	proxyBox:CaptureFocus()
	
	local textLines = string.split(proxyBox.Text, "\n")
	local calculatedCursorSlot = 0
	for i = 1, targetLineIndex - 1 do
		calculatedCursorSlot = calculatedCursorSlot + string.len(textLines[i]) + 1
	end
	
	proxyBox.CursorPosition = calculatedCursorSlot + 1
end)

proxyBox:GetPropertyChangedSignal("Text"):Connect(function()
	editorCanvas.Text = proxyBox.Text
	updateScroll()
end)

proxyBox.FocusLost:Connect(function()
	fullScreenContainer.Visible = false
	main.Visible = true
end)

local dragging, dragStart, startPos
header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
local delta = input.Position - dragStart
main.Position = UDim2.new(
startPos.X.Scale, startPos.X.Offset + delta.X,
startPos.Y.Scale, startPos.Y.Offset + delta.Y
)
end
end)
UserInputService.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = false
end
end)
local function checkEnvironment()
local execName = (identifyexecutor or getexecutorname or function() return "Unknown" end)()
if string.find(string.lower(execName), "xeno") or (Xeno and type(Xeno) == "table") then
status.TextColor3 = Color3.fromRGB(255, 100, 100)
status.Font = Enum.Font.GothamBold
status.Text = "⚠️ WARNING: Xeno detected. Saving crashes client!"
else
status.Text = "Ready (" .. execName .. " checked)"
end
end
checkEnvironment()
