local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local gui = Instance.new("ScreenGui")
gui.Name = "ModuleEditor"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0.55, 0, 0.6, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Parent = gui

local sizeConstraint = Instance.new("UISizeConstraint")
sizeConstraint.MinSize = Vector2.new(450, 300) 
sizeConstraint.MaxSize = Vector2.new(850, 550) 
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
pathBox.Text = "Enter the path of the module script here to edit it."
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

local editor = Instance.new("TextBox")
editor.Size = UDim2.new(1, -6, 1, 0)
editor.BackgroundTransparency = 1
editor.TextColor3 = Color3.new(1, 1, 1)
editor.Font = Enum.Font.Code
editor.TextSize = 13
editor.MultiLine = true
editor.TextXAlignment = Enum.TextXAlignment.Left
editor.TextYAlignment = Enum.TextYAlignment.Top
editor.Text = ""
editor.ClearTextOnFocus = false
editor.TextWrapped = false
editor.ClipsDescendants = false
editor.Parent = scroll

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
	local lines = #string.split(editor.Text, "\n")
	scroll.CanvasSize = UDim2.new(0, 1000, 0, lines * 18)
end

local function toggleVisibility()
	isVisible = not isVisible
	main.Visible = isVisible
end

local function resolvePath(pathStr)
	local segments = string.split(pathStr, ".")
	local current = game
	local startIdx = 1
	if segments[1] == "game" then startIdx = 2 end
	
	for i = startIdx, #segments do
		local success, found = pcall(function() return current:FindFirstChild(segments[i]) end)
		if success and found then current = found else return nil end
	end
	return current
end

local function getDeltaMemorySequence(module)
	local orderMap = {}
	local getgcFunc = getgc or nil
	if not getgcFunc then return orderMap end
	
	local success, objects = pcall(getgcFunc)
	if not success or type(objects) ~= "table" then return orderMap end
	
	for _, obj in pairs(objects) do
		if type(obj) == "function" and islclosure(obj) then
			local info = debug.getinfo(obj)
			if info and info.source and string.find(info.source, module.Name) then
				local idx = 1
				while true do
					local name, val = debug.getupvalue(obj, idx)
					if not name then break end
					if type(val) == "string" and not orderMap[val] then
						table.insert(orderMap, val)
						orderMap[val] = #orderMap
					end
					idx = idx + 1
				end
			end
		end
	end
	return orderMap
end

local function buildTableText(t, sequenceMap, depth)
	depth = depth or 0
	if type(t) ~= "table" then return tostring(t) end
	local indent = string.rep("  ", depth)
	local result = "{\n"
	
	local keys = {}
	for k, _ in pairs(t) do
		table.insert(keys, k)
	end
	
	if sequenceMap and next(sequenceMap) ~= nil then
		table.sort(keys, function(a, b)
			local rankA = sequenceMap[tostring(a)] or 9999
			local rankB = sequenceMap[tostring(b)] or 9999
			return rankA < rankB
		end)
	end
	
	for _, k in ipairs(keys) do
		local v = t[k]
		local key = type(k) == "string" and k or "["..tostring(k).."]"
		result = result .. indent .. "  " .. key .. " = "
		if type(v) == "table" then 
			result = result .. buildTableText(v, sequenceMap, depth + 1)
		elseif type(v) == "string" then 
			result = result .. '"' .. v .. '"'
		else 
			result = result .. tostring(v) 
		end
		result = result .. ",\n"
	end
	return result .. indent .. "}"
end

loadBtn.MouseButton1Click:Connect(function()
	local path = pathBox.Text
	local module = resolvePath(path)
	if not module or not module:IsA("ModuleScript") then
		status.Text = "Invalid module path"
		return
	end
	
	local sequenceMap = getDeltaMemorySequence(module)
	local success, data = pcall(require, module)
	
	if success and type(data) == "table" then
		editor.Text = "return " .. buildTableText(data, sequenceMap)
		currentModule = module
		updateScroll()
		status.Text = "Loaded Structure: " .. module.Name
	else
		status.Text = "Module doesn't return a table"
	end
end)

saveBtn.MouseButton1Click:Connect(function()
	if not currentModule then
		status.Text = "No module loaded"
		return
	end
	
	local execName = (identifyexecutor or getexecutorname or function() return "Unknown" end)()
	if string.find(string.lower(execName), "xeno") then
		status.TextColor3 = Color3.fromRGB(255, 75, 75)
		status.Text = "BLOCKED: Saving on Xeno crashes your game client!"
		return
	end

	local textData = editor.Text
	local function parseTableText(str)
		local loadFunc = loadstring or false
		if loadFunc then
			local cleanStr = string.gsub(str, "^%s*return%s*", "")
			local formatFunc = loadFunc("return " .. cleanStr)
			if formatFunc then return pcall(formatFunc) end
		end
		return false, "Loadstring context disabled."
	end
	local success, newData = parseTableText(textData)
	if not success then
		status.Text = "Invalid table format"
		return
	end
	local moduleData = require(currentModule)
	if type(moduleData) == "table" then
		for k in pairs(moduleData) do moduleData[k] = nil end
		for k, v in pairs(newData) do moduleData[k] = v end
		status.Text = "Saved successfully"
	else
		status.Text = "Save failed"
	end
end)

editor:GetPropertyChangedSignal("Text"):Connect(updateScroll)

UserInputService.InputBegan:Connect(function(input, processed)
	if not processed and input.KeyCode == Enum.KeyCode.Home then
		toggleVisibility()
	end
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
			startPos.X.Scale, 
			startPos.X.Offset + delta.X, 
			startPos.Y.Scale, 
			startPos.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

local normalPosition = UDim2.new(0.5, 0, 0.5, 0)
local typingPosition = UDim2.new(0.5, 0, 0.5, 45)

UserInputService.TextBoxFocused:Connect(function(textBox)
	if textBox == editor or textBox == pathBox then
		if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
			main.Position = typingPosition
		end
	end
end)

UserInputService.TextBoxFocusReleased:Connect(function(textBox)
	if textBox == editor or textBox == pathBox then
		if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
			main.Position = normalPosition
		end
	end
end)

local function checkEnvironment()
	local execName = (identifyexecutor or getexecutorname or function() return "Unknown" end)()
	if string.find(string.lower(execName), "xeno") then
		status.TextColor3 = Color3.fromRGB(255, 100, 100)
		status.Font = Enum.Font.GothamBold
		status.Text = "⚠️ WARNING: Xeno detected. Saving crashes client!"
	else
		status.Text = "Ready (" .. execName .. " checked)"
	end
end
checkEnvironment()
