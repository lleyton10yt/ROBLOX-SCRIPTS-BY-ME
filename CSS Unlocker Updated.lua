local PlrGui = game:GetService("Players").LocalPlayer.PlayerGui

local SlotID = 1

local LevelCreateID = 1

local antiError = 1

local ValuePlayerID = nil

local currentBackground = nil

local BackgroundImage = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel

local Ug = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.UIGradient

local El1 = workspace.Misc.CSS.Part.Beam

local El2 = workspace.Misc.CSS:GetChildren()[4].Beam

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BeatLevelInst = {
	["Cmd"] = "Cleared",
	["Replay"] = {
		[1] = {
			[1] = "falling",
			[2] = 424,
			[3] = 416
		}
	}
}

local Library, SaveManager, InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/lleyton10yt/ROBLOX-SCRIPTS-BY-ME/refs/heads/main/Fluent%20Plus%20Updated.lua"))()

local Vars = {
	SelectedZone = nil,
	SelectedAct = nil,
	Chara2Number = 0,
	ZoomValue = nil,
	ExistSound = 0,
	SplitPercent = nil
}

local Characters = {
	"Sonic_S1","Sonic_S2","Sonic_S3","Tails_S3","Knuckles_S3","Amy","Metal_Sonic","Dr_Robotnik","Super_Sonic","Shadow_S3","Rouge_S1","Sonic_SCD"
}

local Window = Library:CreateWindow{
	Title = "Classic Sonic Simulator UnLocker",
	SubTitle = "By EnGenie",
	TabWidth = 160,
	Size = UDim2.fromOffset(620, 520),
	Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
	Theme = "Arctic",
	MinimizeKey = Enum.KeyCode.RightControl, -- Used when theres no MinimizeKeybind
    Icon = "cpu",
--  Image = "rbxassetid://120605334883359", -- "" .. tostring(UIImg),
    BackgroundImage = "rbxassetid://85631097968904",
    BackgroundImageTransparency = 1,
    UserInfo = true,
    UserInfoTitle = "    Welcome To",
    UserInfoSubtitle = "   CSS UnLocker!"
}	
--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
	Teleport = Window:AddTab{ 
		Title = "Teleport", 
		Icon = "waves" 
	},
	Game = Window:AddTab{ 
		Title = "Game", 
		Icon = "gamepad-2" 
	},
	MakeLevel = Window:AddTab{ 
		Title = "Make Level", 
		Icon = "plus" 
	},
	Subject = Window:AddTab{ 
		Title = "Into Subject", 
		Icon = "paintbrush" 
	},
	Functions = Window:AddTab{ 
		Title = "Sounds+", 
		Icon = "music-2" 
	},
	LevelCreator = Window:AddTab{ 
		Title = "Level Creator", 
		Icon = "package-plus" 
	},

	Chara = Window:AddTab{ 
		Title = "OP Functions", 
		Icon = "flame" 
	},
	NewMusic3 = Window:AddTab{
		Title = "New Custom Music", 
		Icon = "music-4" 
	},
	NewMusic2 = Window:AddTab{ 
		Title = "New Intro Music", 
		Icon = "music-2" 
	},
	NewMusic = Window:AddTab{ 
		Title = "New Loop Music", 
		Icon = "music" 
    },
    Change = Window:AddTab{ 
		Title = "Customization", 
		Icon = "headphones" 
    },
    Skins = Window:AddTab{
        Title = "Client-Sided Skins",
        Icon = "user-plus"
    },
    Visual = Window:AddTab{ 
		Title = "Visual", 
		Icon = "eye" 
	},
	Info = Window:AddTab{ 
		Title = "Info", 
		Icon = "info" 
	},
	HotScripts = Window:AddTab{ 
		Title = "Hot-Scripts", 
		Icon = "scroll" 
	},

	Settings = Window:AddTab{ 
		Title = "Settings", 
		Icon = "settings" 
	},

	Omega = Window:AddTab{ 
		Title = "DEBUG Functions", 
		Icon = "command" 
	}

}

local funcs = {
	PlaySound = function(snd)
		for i,v in pairs(ReplicatedStorage:GetDescendants()) do
			if v.Name == snd and v:IsA("Sound") then
				Vars.ExistSound = Vars.ExistSound + 1
				v:Play()
				break
			end
		end
		if Vars.ExistSound == 0 then
			Library:Notify{
				Title = "CSS UnLocker",
				Content = "Sound " .. snd .. " not found across game.",
				Duration = 5 -- Set to nil to make the notification not disappear
			}
		end
		Vars.ExistSound = 0
	end,
	FindSubject = function(findsbj)
		PlrGui:FindFirstChild(findsbj)
	end,
}

funcs.PlaySound("lshieldget")

local Options = Library.Options

do
	Library:Notify{
		Title = "CSS UnLocker",
		Content = "New CSS Script Edition",
		SubContent = "Please Wait, Script Loading...", -- Optional
		Duration = 6 -- Set to nil to make the notification not disappear
	}
	Tabs.Teleport:AddParagraph({
		Title = "How to correct teleport to unused zones",
		Content = "Use this functions only on Main Menu"
	})
	local SelectTeleportCharacter = Tabs.Teleport:AddDropdown("Dropdown8", {
		Title = "Select Character",
		Values = {unpack(Characters)},
		Multi = false,
		Default = "Sonic_S1",
	})

	SelectTeleportCharacter:OnChanged(function(tpzonechara)
		if tpzonechara == "Sonic_S1" then
			Vars.Chara2Number = 1
		elseif tpzonechara == "Sonic_S2" then
			Vars.Chara2Number = 2
		elseif tpzonechara == "Sonic_S3" then
			Vars.Chara2Number = 3
		elseif tpzonechara == "Tails_S3" then
			Vars.Chara2Number = 4
		elseif tpzonechara == "Knuckles_S3" then
			Vars.Chara2Number = 5
		elseif tpzonechara == "Amy" then
			Vars.Chara2Number = 6
		elseif tpzonechara == "Metal_Sonic" then
			Vars.Chara2Number = 7
		elseif tpzonechara == "Dr_Robotnik" then
			Vars.Chara2Number = 10
		elseif tpzonechara == "Super_Sonic" then
			Vars.Chara2Number = 9
		elseif tpzonechara == "Shadow_S3" then
			Vars.Chara2Number = 12
		elseif tpzonechara == "Rouge_S1" then
			Vars.Chara2Number = 8
		elseif tpzonechara == "Sonic_SCD" then
			Vars.Chara2Number = 19
		end
	end)
	
	Tabs.Teleport:AddButton({
		Title = "Teleport To The Title Screen",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 3, 
					[5] = "Title Screen"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	
	Tabs.Teleport:AddButton({
		Title = "Teleport To GGGG Zone",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "????", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "????"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	
	Tabs.Teleport:AddButton({
		Title = "Teleport To Virtual Reality Zone Act 1",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "Virtual Reality", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 3, 
					[5] = "Virtual Reality"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	Tabs.Teleport:AddButton({
		Title = "Teleport To Virtual Reality Zone Act 2",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "Virtual Reality", 
					[2] = 2, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Virtual Reality"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	
	Tabs.Teleport:AddButton({
		Title = "Teleport To Old Test Zone Act 1",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "Test", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Test"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	
	Tabs.Teleport:AddButton({
		Title = "Teleport To Old Test Zone Act 2",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "Test", 
					[2] = 2, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 3, 
					[5] = "Test"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	
	Tabs.Teleport:AddButton({
		Title = "Teleport To Chemical Plant Zone",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "Chemical Plant", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Chemical Plant"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	Tabs.Teleport:AddButton({
		Title = "Teleport To Aquatic Ruin Zone",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "Aquatic Ruin", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Aquatic Ruin"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	
	Tabs.Teleport:AddButton({
		Title = "Teleport To Metropolis Zone",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "Metropolis", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Metropolis"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	
		Tabs.Teleport:AddButton({
		Title = "Teleport To Hydrocity Zone",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "Hydrocity", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Hydrocity"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	
	Tabs.Teleport:AddButton({
		Title = "Teleport To Ice Cap Zone",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "Ice Cap", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Ice Cap"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	
	Tabs.Teleport:AddButton({
		Title = "Teleport To Sandopolis Zone",
		Callback = function()
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			funcs.PlaySound("Warp")
			local A_1 = 
				{
					[1] = "Sandopolis", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Sandopolis"
				}
			local A_2 = tonumber(Vars.Chara2Number)
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.MainMenu:Destroy()
		end 
	})
	

	
	
	

    
	Tabs.Game:AddSection("Zoom")

	local Dropdown8 = Tabs.Game:AddDropdown("Dropdown8", {
		Title = "Select Zoom (2-0.01)",
		Values = {"Default", "2", "1", "0.75", "0.5", "0.25", "0.10", "0.05", "0.01"},
		Multi = false,
		Default = "Default",
	})

	Dropdown8:OnChanged(function(ZoomValueing)
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game")
		Vars.ZoomValue = ZoomValueing
		print(ZoomValueing)
		if Vars.ZoomValue == "Default" then
			if PlrGui:FindFirstChild("Game") then
				PlrGui:WaitForChild("Game").Backdrop.Main.UIScale.Scale = 3.095
			end
		end
		if Vars.ZoomValue == "2" then
			PlrGui:WaitForChild("Game").Backdrop.Main.UIScale.Scale = 2
		end
		if Vars.ZoomValue == "1" then
			PlrGui:WaitForChild("Game").Backdrop.Main.UIScale.Scale = 1
		end
		if Vars.ZoomValue == "0.75" then
			PlrGui:WaitForChild("Game").Backdrop.Main.UIScale.Scale = 0.75
		end
		if Vars.ZoomValue == "0.5" then
			PlrGui:WaitForChild("Game").Backdrop.Main.UIScale.Scale = 0.5
		end
		if Vars.ZoomValue == "0.25" then
			PlrGui:WaitForChild("Game").Backdrop.Main.UIScale.Scale = 0.25
		end
		if Vars.ZoomValue == "0.10" then
			PlrGui:WaitForChild("Game").Backdrop.Main.UIScale.Scale = 0.10
		end
		if Vars.ZoomValue == "0.05" then
			PlrGui:WaitForChild("Game").Backdrop.Main.UIScale.Scale = 0.05
		end
		if Vars.ZoomValue == "0.01" then
			PlrGui:WaitForChild("Game").Backdrop.Main.UIScale.Scale = 0.01
		end
	end)

	Tabs.Game:AddParagraph({
		Title = "Log in again to reset"
	})
	Tabs.Game:AddButton({
		Title = "Show Objects Abroad",
		Callback = function()
			funcs.PlaySound("token")
			PlrGui:FindFirstChild("Game"):FindFirstChild("Backdrop"):FindFirstChild("Main").ClipsDescendants = false
		end 
	})

	Tabs.Game:AddParagraph({
		Title = "WARNING!!!",
		Content = "if you go into the editor with this function, the screen freezes, if you want to fix it, use Into Subject.This feature only works in the game itself"
	})
	local Toggle = Tabs.Game:AddToggle("MyToggle", {Title = "Badnik To Ring", Default = false })
	Toggle:OnChanged(function(ToggleGame)
		if ToggleGame == true then
			funcs.PlaySound("shieldget")
			ReplicatedStorage.Objects.Asteron.Name = "ASteron" 
			ReplicatedStorage.Objects.Ballhog.Name = "BAllhog"
			ReplicatedStorage.Objects.Batbrain.Name = "BAtbrain"
			ReplicatedStorage.Objects.Blaster.Name = "BLaster"
			ReplicatedStorage.Objects.Blastoid.Name = "BLastoid"
			ReplicatedStorage.Objects.Bloominator.Name = "BLoominator"
			ReplicatedStorage.Objects.Bomb.Name = "BOmb"
			ReplicatedStorage.Objects.Buzz_Bomber.Name = "BUzz_Bomber"
			ReplicatedStorage.Objects.ChopChop.Name = "CHopChop"
			ReplicatedStorage.Objects.Chopper.Name = "CHopper"
			ReplicatedStorage.Objects.Crabmeat.Name = "CRabmeat"
			ReplicatedStorage.Objects.Jawz.Name = "JAwz"
			ReplicatedStorage.Objects.Leon.Name = "LEon"
			ReplicatedStorage.Objects.Masher.Name = "MAsher"
			ReplicatedStorage.Objects.Motobug.Name = "MOtobug"
			ReplicatedStorage.Objects.Octus.Name = "OCtus"
			ReplicatedStorage.Objects.Pogohopper.Name = "POgohopper"
			ReplicatedStorage.Objects.Spiker.Name = "SPiker"
		end 
		if ToggleGame == false then
			if game.ReplicatedStorage.Objects:FindFirstChild("ASteron") then
				ReplicatedStorage.Objects.ASteron.Name = "Asteron" 
				ReplicatedStorage.Objects.BAllhog.Name = "Ballhog" 
				ReplicatedStorage.Objects.BAtbrain.Name = "Batbrain" 
				ReplicatedStorage.Objects.BLaster.Name = "Blaster" 
				ReplicatedStorage.Objects.BLastoid.Name = "Blastoid" 
				ReplicatedStorage.Objects.BLoominator.Name = "Bloominator" 
				ReplicatedStorage.Objects.BOmb.Name = "Bomb" 
				ReplicatedStorage.Objects.BUzz_Bomber.Name = "Buzz_Bomber" 
				ReplicatedStorage.Objects.CHopChop.Name = "ChopChop" 
				ReplicatedStorage.Objects.CHopper.Name = "Chopper" 
				ReplicatedStorage.Objects.CRabmeat.Name = "Crabmeat" 
				ReplicatedStorage.Objects.JAwz.Name = "Jawz" 
				ReplicatedStorage.Objects.LEon.Name = "Leon" 
				ReplicatedStorage.Objects.MAsher.Name = "Masher" 
				ReplicatedStorage.Objects.MOtobug.Name = "Motobug" 
				ReplicatedStorage.Objects.OCtus.Name = "Octus" 
				ReplicatedStorage.Objects.POgohopper.Name = "Pogohopper" 
				ReplicatedStorage.Objects.SPiker.Name = "Spiker" 
			end
		end
	end)
	
	Tabs.Game:AddSection("Game GUIs")

	local Toggle = Tabs.Game:AddToggle("MyToggle", {Title = "Light Dash Effect", Default = false })
	Toggle:OnChanged(function(ToggleGui)
		if ToggleGui == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("Spring")
			PlrGui:WaitForChild("Game").Backdrop.Main.World:WaitForChild("Ghost1").Visible = true
			PlrGui:WaitForChild("Game").Backdrop.Main.World:WaitForChild("Ghost2").Visible = true
			PlrGui:WaitForChild("Game").Backdrop.Main.World:WaitForChild("Ghost3").Visible = true
			end
		if ToggleGui == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			PlrGui:WaitForChild("Game").Backdrop.Main.World:WaitForChild("Ghost1").Visible = false
			PlrGui:WaitForChild("Game").Backdrop.Main.World:WaitForChild("Ghost2").Visible = false
			PlrGui:WaitForChild("Game").Backdrop.Main.World:WaitForChild("Ghost3").Visible = false
		end
	end)

	local Toggle2 = Tabs.Game:AddToggle("MyToggle2", {Title = "S3 Special Stage GUI", Default = false })
	Toggle2:OnChanged(function(ToggleGui2)
		if ToggleGui2 == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("Spring")
			PlrGui.Game.Backdrop.Main.ParallaxSS3.Visible = true
			PlrGui.Game.Backdrop.Main.WorldSS3.Visible = true
			PlrGui.Game.Backdrop.Main.Hud.SS3.Visible = true
		end
		if ToggleGui2 == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			PlrGui.Game.Backdrop.Main.ParallaxSS3.Visible = false
			PlrGui.Game.Backdrop.Main.WorldSS3.Visible = false
			PlrGui.Game.Backdrop.Main.Hud.SS3.Visible = false
		end
	end)

	local Toggle3 = Tabs.Game:AddToggle("MyToggle3", {Title = "Hitbox Your Character", Default = false })
	Toggle3:OnChanged(function(HitboxChara)
		if HitboxChara == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("Spring")
			PlrGui.Game.Backdrop.Main.World.Objects[game.ReplicatedStorage.Players[game.Players.LocalPlayer.Name].Character.Value].BackgroundTransparency = 1
		end
		if HitboxChara == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			PlrGui.Game.Backdrop.Main.World.Objects[game.ReplicatedStorage.Players[game.Players.LocalPlayer.Name].Character.Value].BackgroundTransparency = 1
		end
	end)

	local Toggle4 = Tabs.Game:AddToggle("MyToggle4", {Title = "Press Start Button", Default = false })
	Toggle4:OnChanged(function(ToggleGui3)
		if ToggleGui3 == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("Spring")
			PlrGui:FindFirstChild("Game").Backdrop.Main.Hud.PressStart.Visible = true
		end
		if ToggleGui3 == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("Spring")
			PlrGui:FindFirstChild("Game").Backdrop.Main.Hud.PressStart.Visible = false
		end
	end)

	local Toggle5 = Tabs.Game:AddToggle("MyToggle5", {Title = "Turn On/Off Background", Default = false })
	Toggle5:OnChanged(function(ToggleGui4)
		if ToggleGui4 == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("Spring")
			PlrGui:FindFirstChild("Game").Backdrop.Main.Parallax.Visible = false
		end
		if ToggleGui4 == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			PlrGui:FindFirstChild("Game").Backdrop.Main.Parallax.Visible = true
		end
	end)

	local Toggle6 = Tabs.Game:AddToggle("MyToggle6", {Title = "Turn On/Off All Objects", Default = false })
	Toggle6:OnChanged(function(ToggleGui5)
		if ToggleGui5 == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("Spring")
			PlrGui:FindFirstChild("Game").Backdrop.Main.World:FindFirstChild("Objects").Visible = false
		end
		if ToggleGui5 == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			PlrGui:FindFirstChild("Game").Backdrop.Main.World:FindFirstChild("Objects").Visible = true
		end
	end)

	Tabs.Game:AddButton({
		Title = "Reset Level",
		Callback = function()
			funcs.PlaySound("break1")
			PlrGui:FindFirstChild("Game").Backdrop.Main.Engine.Disabled = true
			PlrGui:FindFirstChild("Game").Backdrop.Main.Engine.Disabled = false
		end 
	})
	
	Tabs.Game:AddSection("Game Texture Packs")

	local Toggle7 = Tabs.Game:AddToggle("MyToggle7", {Title = "On/Off Basic Texture Pack", Default = false })
	Toggle7:OnChanged(function(ToggleGui6)
		if ToggleGui6 == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("medal")
			ReplicatedStorage.Spritesheets.Objects_General_S3.Value = 8352336106
			ReplicatedStorage.Spritesheets.Objects_General_S2.Value = 8352336106
			ReplicatedStorage.Spritesheets.Objects_General_S1.Value = 8352336106
			ReplicatedStorage.Spritesheets.Objects_General_SCD.Value = 8352336106
		end
		if ToggleGui6 == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			ReplicatedStorage.Spritesheets.Objects_General_S1.Value = 13804826000
			ReplicatedStorage.Spritesheets.Objects_General_S2.Value = 13804828820
			ReplicatedStorage.Spritesheets.Objects_General_S3.Value = 13804830596
			ReplicatedStorage.Spritesheets.Objects_General_SCD.Value = 13804832490
		end
	end)

	local Toggle8 = Tabs.Game:AddToggle("MyToggle8", {Title = "On/Off Sonic 1 Texture Pack", Default = false })
	Toggle8:OnChanged(function(ToggleGui7)
		if ToggleGui7 == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("medal")
			ReplicatedStorage.Spritesheets.Objects_General_S3.Value = 13804826000
			ReplicatedStorage.Spritesheets.Objects_General_S2.Value = 13804826000
			ReplicatedStorage.Spritesheets.Objects_General_S1.Value = 13804826000
			ReplicatedStorage.Spritesheets.Objects_General_SCD.Value = 13804826000
		end
		if ToggleGui7 == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			ReplicatedStorage.Spritesheets.Objects_General_S1.Value = 13804826000
			ReplicatedStorage.Spritesheets.Objects_General_S2.Value = 13804828820
			ReplicatedStorage.Spritesheets.Objects_General_S3.Value = 13804830596
			ReplicatedStorage.Spritesheets.Objects_General_SCD.Value = 13804832490
		end
	end)

	local Toggle9 = Tabs.Game:AddToggle("MyToggle9", {Title = "On/Off Sonic 2 Texture Pack", Default = false })
	Toggle9:OnChanged(function(ToggleGui8)
		if ToggleGui8 == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("medal")
			ReplicatedStorage.Spritesheets.Objects_General_S3.Value = 13804828820
			ReplicatedStorage.Spritesheets.Objects_General_S2.Value = 13804828820
			ReplicatedStorage.Spritesheets.Objects_General_S1.Value = 13804828820
			ReplicatedStorage.Spritesheets.Objects_General_SCD.Value = 13804828820
		end
		if ToggleGui8 == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			ReplicatedStorage.Spritesheets.Objects_General_S1.Value = 13804826000
			ReplicatedStorage.Spritesheets.Objects_General_S2.Value = 13804828820
			ReplicatedStorage.Spritesheets.Objects_General_S3.Value = 13804830596
			ReplicatedStorage.Spritesheets.Objects_General_SCD.Value = 13804832490
		end
	end)

	local Toggle10 = Tabs.Game:AddToggle("MyToggle10", {Title = "On/Off Sonic 3 Texture Pack", Default = false })
	Toggle10:OnChanged(function(ToggleGui9)
		if ToggleGui9 == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("medal")
			ReplicatedStorage.Spritesheets.Objects_General_S3.Value = 13804830596
			ReplicatedStorage.Spritesheets.Objects_General_S2.Value = 13804830596
			ReplicatedStorage.Spritesheets.Objects_General_S1.Value = 13804830596
			ReplicatedStorage.Spritesheets.Objects_General_SCD.Value = 13804830596
		end
		if ToggleGui9 == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			ReplicatedStorage.Spritesheets.Objects_General_S1.Value = 13804826000
			ReplicatedStorage.Spritesheets.Objects_General_S2.Value = 13804828820
			ReplicatedStorage.Spritesheets.Objects_General_S3.Value = 13804830596
			ReplicatedStorage.Spritesheets.Objects_General_SCD.Value = 13804832490
		end
	end)

	local Toggle11 = Tabs.Game:AddToggle("MyToggle11", {Title = "On/Off Sonic CD Texture Pack", Default = false })
	Toggle11:OnChanged(function(ToggleGui10)
		if ToggleGui10 == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			funcs.PlaySound("medal")
			ReplicatedStorage.Spritesheets.Objects_General_S3.Value = 13804832490
			ReplicatedStorage.Spritesheets.Objects_General_S2.Value = 13804832490
			ReplicatedStorage.Spritesheets.Objects_General_S1.Value = 13804832490
			ReplicatedStorage.Spritesheets.Objects_General_SCD.Value = 13804832490
		end
		if ToggleGui10 == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			ReplicatedStorage.Spritesheets.Objects_General_S1.Value = 13804826000
			ReplicatedStorage.Spritesheets.Objects_General_S2.Value = 13804828820
			ReplicatedStorage.Spritesheets.Objects_General_S3.Value = 13804830596
			ReplicatedStorage.Spritesheets.Objects_General_SCD.Value = 13804832490
		end
	end)

    
		Tabs.Game:AddSection("Change Character Abilities")

		local Toggle12 = Tabs.Game:AddToggle("MyToggle12", {Title = "Change Characters Abilities", Default = false })
	Toggle12:OnChanged(function(ToggleGui11)
		if ToggleGui11 == true then
			funcs.PlaySound("medal")
		local AbilityData = require(game.ReplicatedStorage.Modules.CharacterProperties)
		AbilityData.tbl = {
        Sonic_S1 = {
            RollSound = "none",
            CanInstaShield = true,
            Camera = "CD",
            CanUseSpindash = true,
			CanUsePeelout = true,
            CanRoll = true,
            CanUseShieldAbilities = true,
            JumpSound = "jump2",
            BrakeSound = "scd_skid",
            SpinRevSound = "spo",
            Palette = "SCD",
            Camera = "CD",
            CanGetCarried = true,
            LifeTheme = { 1 },
            InvincibilityTheme = { 1 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 },
            Emotes = { "pose" }
        },
        Sonic_S2 = {
            RollSound = "none",
            Camera = "CD",
            CanInstaShield = true,
			CanUsePeelout = true,
            CanRoll = true,
            CanUseSpindash = true,
            CanUseShieldAbilities = true,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            Palette = "S2",
            CanGetCarried = true,
            Balancing2 = "balancingf",
            Balancing3 = "balancing3",
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S2",
            LifeTheme = { 1 },
            InvincibilityTheme = { 2 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Sonic_S3 = {
            RollSound = "none",
            Camera = "CD",
            CanRoll = true,
			CanUsePeelout = true,
            CanInstaShield = true,
            CanUseSpindash = true,
            CanUseShieldAbilities = true,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            SpringAnimation = "springing2",
            Palette = "S3",
            CanGetCarried = true,
            Balancing3 = "balancing3",
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S3",
            ExplodeSnd = "explode_S3",
            LifeTheme = { 3, 4 },
            InvincibilityTheme = { 5, 6 },
            ClearTheme = { 4 },
            ShoeTheme = { 1 },
            Emotes = { "pose" }
        },
        Tails_S3 = {
            RollSound = "none",
			CanUsePeelout = true,
            Camera = "CD",
            CanRoll = true,
            CanUseSpindash = true,
            Height = 15,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            Palette = "S3",
            CanGetCarried = true,
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S3",
            ExplodeSnd = "explode_S3",
            LifeTheme = { 3, 4 },
            InvincibilityTheme = { 5, 6 },
            ClearTheme = { 4 },
            ShoeTheme = { 1 },
            Emotes = { "pose" }
        },
        Knuckles_S3 = {
            RollSound = "none",
			CanUsePeelout = true,
            Camera = "CD",
            CanRoll = true,
            CanUseSpindash = true,
            Jump = 6,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            Palette = "S3",
            CanGetCarried = true,
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S3",
            ExplodeSnd = "explode_S3",
            LifeTheme = { 3, 4 },
            InvincibilityTheme = { 5, 6 },
            ClearTheme = { 4 },
            ShoeTheme = { 1 },
            Emotes = {
                "pose",
                "taunt",
                "chuckle",
                "anger"
            }
        },
        Amy = {
            RollSound = "none",
			Camera = "CD",
            CanRoll = true,
            CanUseSpindash = true,
            Height = 18,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            Palette = "S2",
            CanGetCarried = true,
            Balancing2 = "balancingf",
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S2",
            AnimAfterSpring = "fall",
            LifeTheme = { 1 },
            InvincibilityTheme = { 2 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Metal_Sonic = {
            CanRoll = true,
			CanUsePeelout = true,
            CanUseSpindash = true,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            RollSound = "none",
            Palette = "SCD",
            Camera = "CD",
            IgnoreRollJump = true,
            CanGetCarried = true,
            Balancing2 = "balancingf",
            ExplodeAnim = "idle_SCD",
            Explode2Anim = "idle2_SCD",
            ExplodeSnd = "explode_SCD",
            AnimAfterSpring = "fall",
            LifeTheme = { 2 },
            InvincibilityTheme = { 3, 4 },
            ClearTheme = { 2, 3 },
            ShoeTheme = { 2, 3 },
            Emotes = { "pose" }
        },
        Rouge_S1 = {
            RollSound = "none",
			CanUsePeelout = true,
            Camera = "CD",
            CanRoll = true,
            CanUseSpindash = true,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            Palette = "SCD",
            CanGetCarried = true,
            LifeTheme = { 1 },
            InvincibilityTheme = { 1 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Super_Sonic = {
            Camera = "CD",
            RollSound = "none",
			CanUsePeelout = true,
            CanInstaShield = true,
            CanRoll = true,
            CanUseSpindash = true,
            Acc = 0.1875,
            Top = 10,
            Jump = 8,
            Air = 0.375,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            Palette = "S2",
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S2",
            LifeTheme = { 1 },
            InvincibilityTheme = { 2 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Dr_Robotnik = {
			CanUsePeelout = true,
            Camera = "CD",
            Height = 25,
            Jump = 5.25,
            Acc = 0.03515625,
            Air = 0.0703125,
            JumpSound = "jump3",
            Palette = "S3",
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S3",
            ExplodeSnd = "explode_S3",
            AnimAfterSpring = "fall",
            LifeTheme = { 3, 4 },
            InvincibilityTheme = { 5, 6 },
            ClearTheme = { 4 },
            ShoeTheme = { 1 }
        },
        Baldi = {
            Height = 51,
            Jump = 12,
            Top = 4,
            Dec = 4,
            Acc = 4,
            Frc = 4,
            Grv = 4,
            JumpSound = "jump",
            HideName = true,
            Palette = "S1",
            LifeTheme = { 1 },
            InvincibilityTheme = { 1 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Shadow_S3 = {
			CanUsePeelout = true,
            Camera = "CD",
            CanRoll = true,
            CanInstaShield = true,
            CanUseSpindash = true,
            CanUseShieldAbilities = true,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            RollSound = "none",
            Palette = "S3",
            CanGetCarried = true,
            Balancing3 = "balancing3",
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S3",
            ExplodeSnd = "explode_S3",
            AnimAfterSpring = "fall",
            LifeTheme = { 3, 4 },
            InvincibilityTheme = { 5, 6 },
            ClearTheme = { 4 },
            ShoeTheme = { 1 }
        },
        Sonic_EXE = {
            CanRoll = true,
            CanUseSpindash = true,
            CanUsePeelout = true,
            CanUseShieldAbilities = true,
            JumpSound = "jump",
            SpinRevSound = "spinrev",
            BrakeSound = "skid",
            HideName = true,
            Palette = "S1",
            Balancing2 = "balancingf",
            LifeTheme = { 1 },
            InvincibilityTheme = { 1 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Sonic_Tiny = {
            CanRoll = true,
            CanUseSpindash = true,
            CanUsePeelout = true,
            CanUseShieldAbilities = true,
            Height = 10,
            JumpSound = "jump2",
            SpinRevSound = "spinrev",
            BrakeSound = "scd_skid",
            Camera = "CD",
            IgnoreRollJump = true,
            Palette = "SCD",
            ExplodeAnim = "idle_SCD",
            Explode2Anim = "idle2_SCD",
            ExplodeSnd = "explode_SCD",
            LifeTheme = { 2 },
            InvincibilityTheme = { 3, 4 },
            ClearTheme = { 2, 3 },
            ShoeTheme = { 2, 3 }
        },
        Mushroom_Orange = {
            CanUseShieldAbilities = true,
            Height = 20,
            JumpSound = "jump2",
            Top = 2,
            Frc = 0.2,
            Acc = 0.2,
            Jump = 7,
            Grv = 0.328125,
            FallOff = true,
            HideName = true,
            Palette = "S1",
            LifeTheme = { 1 },
            InvincibilityTheme = { 1 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Sonic_SCD = {
            CanRoll = true,
            CanUseSpindash = true,
            CanInstaSheild = true,
            CanUseShieldAbilities = true,
            CanUsePeelout = true,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            RollSound = "none",
            Camera = "CD",
            IgnoreRollJump = true,
            Palette = "SCD",
            CanGetCarried = true,
            Balancing2 = "balancingf",
            ExplodeAnim = "idle_SCD",
            Explode2Anim = "idle2_SCD",
            ExplodeSnd = "explode_SCD",
            LifeTheme = { 2 },
            InvincibilityTheme = { 3, 4 },
            ClearTheme = { 2, 3 },
            ShoeTheme = { 2, 3 },
            Emotes = { "pose" }
        }
    }
		end
		if ToggleGui11 == false then
		local AbilityData2 = require(game.ReplicatedStorage.Modules.CharacterProperties)
		AbilityData2.tbl = {
        Sonic_S1 = {
            CanRoll = true,
            CanUseShieldAbilities = true,
            JumpSound = "jump",
            BrakeSound = "skid",
            Palette = "S1",
            Camera = "S1",
            CanGetCarried = true,
            LifeTheme = { 1 },
            InvincibilityTheme = { 1 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 },
            Emotes = { "pose" }
        },
        Sonic_S2 = {
            CanRoll = true,
            CanUseSpindash = true,
            CanUseShieldAbilities = true,
            JumpSound = "jump",
            SpinRevSound = "spinrev",
            BrakeSound = "skid",
            Palette = "S2",
            CanGetCarried = true,
            Balancing2 = "balancingf",
            Balancing3 = "balancing3",
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S2",
            LifeTheme = { 1 },
            InvincibilityTheme = { 2 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Sonic_S3 = {
            CanRoll = true,
            CanInstaShield = true,
            CanUseSpindash = true,
            CanUseShieldAbilities = true,
            JumpSound = "jump",
            SpinRevSound = "spinrev2",
            BrakeSound = "skid",
            SpringAnimation = "springing2",
            Palette = "S3",
            CanGetCarried = true,
            Balancing3 = "balancing3",
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S3",
            ExplodeSnd = "explode_S3",
            LifeTheme = { 3, 4 },
            InvincibilityTheme = { 5, 6 },
            ClearTheme = { 4 },
            ShoeTheme = { 1 },
            Emotes = { "pose" }
        },
        Tails_S3 = {
            CanRoll = true,
            CanUseSpindash = true,
            Height = 15,
            JumpSound = "jump",
            SpinRevSound = "spinrev2",
            BrakeSound = "skid",
            Palette = "S3",
            CanGetCarried = true,
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S3",
            ExplodeSnd = "explode_S3",
            LifeTheme = { 3, 4 },
            InvincibilityTheme = { 5, 6 },
            ClearTheme = { 4 },
            ShoeTheme = { 1 },
            Emotes = { "pose" }
        },
        Knuckles_S3 = {
            CanRoll = true,
            CanUseSpindash = true,
            Jump = 6,
            JumpSound = "jump",
            SpinRevSound = "spinrev2",
            BrakeSound = "skid",
            Palette = "S3",
            CanGetCarried = true,
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S3",
            ExplodeSnd = "explode_S3",
            LifeTheme = { 3, 4 },
            InvincibilityTheme = { 5, 6 },
            ClearTheme = { 4 },
            ShoeTheme = { 1 },
            Emotes = {
                "pose",
                "taunt",
                "chuckle",
                "anger"
            }
        },
        Amy = {
            CanRoll = true,
            CanUseSpindash = true,
            Height = 18,
            JumpSound = "jump",
            SpinRevSound = "spinrev",
            BrakeSound = "skid",
            Palette = "S2",
            CanGetCarried = true,
            Balancing2 = "balancingf",
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S2",
            AnimAfterSpring = "fall",
            LifeTheme = { 1 },
            InvincibilityTheme = { 2 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Metal_Sonic = {
            CanRoll = true,
            CanUseSpindash = true,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            Palette = "SCD",
            Camera = "CD",
            IgnoreRollJump = true,
            CanGetCarried = true,
            Balancing2 = "balancingf",
            ExplodeAnim = "idle_SCD",
            Explode2Anim = "idle2_SCD",
            ExplodeSnd = "explode_SCD",
            AnimAfterSpring = "fall",
            LifeTheme = { 2 },
            InvincibilityTheme = { 3, 4 },
            ClearTheme = { 2, 3 },
            ShoeTheme = { 2, 3 },
            Emotes = { "pose" }
        },
        Rouge_S1 = {
            CanRoll = true,
            CanUseSpindash = true,
            JumpSound = "jump",
            SpinRevSound = "spinrev",
            BrakeSound = "skid",
            Palette = "S1",
            CanGetCarried = true,
            LifeTheme = { 1 },
            InvincibilityTheme = { 1 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Super_Sonic = {
            CanRoll = true,
            CanUseSpindash = true,
            Acc = 0.1875,
            Top = 10,
            Jump = 8,
            Air = 0.375,
            JumpSound = "jump",
            SpinRevSound = "spinrev",
            Palette = "S2",
            SkidDust = true,
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S2",
            LifeTheme = { 1 },
            InvincibilityTheme = { 2 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Dr_Robotnik = {
            Height = 25,
            Jump = 5.25,
            Acc = 0.03515625,
            Air = 0.0703125,
            JumpSound = "jump3",
            Palette = "S3",
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S3",
            ExplodeSnd = "explode_S3",
            AnimAfterSpring = "fall",
            LifeTheme = { 3, 4 },
            InvincibilityTheme = { 5, 6 },
            ClearTheme = { 4 },
            ShoeTheme = { 1 }
        },
        Baldi = {
            Height = 51,
            Jump = 12,
            Top = 4,
            Dec = 4,
            Acc = 4,
            Frc = 4,
            Grv = 4,
            JumpSound = "jump",
            HideName = true,
            Palette = "S1",
            LifeTheme = { 1 },
            InvincibilityTheme = { 1 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Shadow_S3 = {
            CanRoll = true,
            CanInstaShield = true,
            CanUseSpindash = true,
            CanUseShieldAbilities = true,
            JumpSound = "jump",
            SpinRevSound = "spinrev2",
            BrakeSound = "skid",
            Palette = "S3",
            CanGetCarried = true,
            Balancing3 = "balancing3",
            ExplodeAnim = "idle_S2",
            Explode2Anim = "idle2_S3",
            ExplodeSnd = "explode_S3",
            AnimAfterSpring = "fall",
            LifeTheme = { 3, 4 },
            InvincibilityTheme = { 5, 6 },
            ClearTheme = { 4 },
            ShoeTheme = { 1 }
        },
        Sonic_EXE = {
            CanRoll = true,
            CanUseSpindash = true,
            CanUsePeelout = true,
            CanUseShieldAbilities = true,
            JumpSound = "jump",
            SpinRevSound = "spinrev",
            BrakeSound = "skid",
            HideName = true,
            Palette = "S1",
            Balancing2 = "balancingf",
            LifeTheme = { 1 },
            InvincibilityTheme = { 1 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Sonic_Tiny = {
            CanRoll = true,
            CanUseSpindash = true,
            CanUsePeelout = true,
            CanUseShieldAbilities = true,
            Height = 10,
            JumpSound = "jump2",
            SpinRevSound = "spinrev",
            BrakeSound = "scd_skid",
            Camera = "CD",
            IgnoreRollJump = true,
            Palette = "SCD",
            ExplodeAnim = "idle_SCD",
            Explode2Anim = "idle2_SCD",
            ExplodeSnd = "explode_SCD",
            LifeTheme = { 2 },
            InvincibilityTheme = { 3, 4 },
            ClearTheme = { 2, 3 },
            ShoeTheme = { 2, 3 }
        },
        Mushroom_Orange = {
            CanUseShieldAbilities = true,
            Height = 20,
            JumpSound = "jump2",
            Top = 2,
            Frc = 0.2,
            Acc = 0.2,
            Jump = 7,
            Grv = 0.328125,
            FallOff = true,
            HideName = true,
            Palette = "S1",
            LifeTheme = { 1 },
            InvincibilityTheme = { 1 },
            ClearTheme = { 1 },
            ShoeTheme = { 1 }
        },
        Sonic_SCD = {
            CanRoll = true,
            CanUseSpindash = true,
            CanUseShieldAbilities = true,
            CanUsePeelout = true,
            JumpSound = "jump2",
            SpinRevSound = "spo",
            BrakeSound = "scd_skid",
            RollSound = "none",
            Camera = "CD",
            IgnoreRollJump = true,
            Palette = "SCD",
            CanGetCarried = true,
            Balancing2 = "balancingf",
            ExplodeAnim = "idle_SCD",
            Explode2Anim = "idle2_SCD",
            ExplodeSnd = "explode_SCD",
            LifeTheme = { 2 },
            InvincibilityTheme = { 3, 4 },
            ClearTheme = { 2, 3 },
            ShoeTheme = { 2, 3 },
            Emotes = { "pose" }
        }
    }
		end
	end)

	
	Tabs.Subject:AddParagraph({
		Title = "WARNING!!!",
		Content = "If you launch any subject while in the creator, the progress of changing/creating the level will be reset"
	})
	Tabs.Subject:AddParagraph({
		Title = "What is subject i should select?",
		Content = "MainMenu - Menu, LevelSelect - Level Select, ManageLevels - Manage Your Custom Levels, ManageStages - Manage Your Custom Stages, AdventureCreator - Adventure Creator, AdventureManageGui - Manage Your Custom Adventure, AnimationsGui - Museum Of Sprites"
	})
	--[[
	local Dropdown6 = Tabs.Subject:AddDropdown("Dropdown6", {
		Title = "Select Your Subject",
		Values = {"MainMenu", "Game", "LevelSelect", "LevelCreator", "S3SSCreator", "ManageLevels", "ManageStages", "AdventureCreator", "AdventureManageGui"},
		Multi = false,
		Default = "MainMenu",
	})

	Dropdown6:OnChanged(function(SubjectID)
		OldSubjectID = SubjectID
		print(SubjectID)
	end)
	--]]

	local Dropdown7 = Tabs.Subject:AddDropdown("Dropdown7", {
		Title = "Select New Subject",
		Values = {"MainMenu", "LevelSelect", "ManageLevels", "ManageStages", "AdventureManageGui", "AnimationGui"},
		Multi = false,
		Default = "MainMenu",
	})

	Dropdown7:OnChanged(function(SubjectID2)
		NewSubjectID = SubjectID2
		print(SubjectID2)
	end)

	--[[

	Tabs.Subject:AddButton({
		Title = "Load New Subject",
		Callback = function()
			funcs.PlaySound("medal")
			local clone = game.ReplicatedStorage[tostring(NewSubjectID)]:Clone()  
			clone.Parent = PlrGui
			if PlrGui:FindFirstChild(tostring(OldSubjectID)) then
				PlrGui[tostring(OldSubjectID)]:Destroy()
			end
		end 
	})
	
	--]]

	Tabs.Subject:AddButton({
		Title = "Load New Subject + clean all your other subjects",
		Callback = function()
			funcs.PlaySound("checkpoint")
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if v.Name ~= "FakeTopBar" and v.Name ~= "MusicHandler" and v.Name ~= "TouchGui" then
					v:Destroy()
				end
			end
			game.ReplicatedStorage[tostring(NewSubjectID)]:Clone().Parent = PlrGui
		end 
	})

	local Dropdown4 = Tabs.MakeLevel:AddDropdown("Dropdown4", {
		Title = "Select Slot Your Level",
		Values = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32"},
		Multi = false,
		Default = 1,
	})

	Dropdown4:OnChanged(function(SlotLevelID)
		SlotID = SlotLevelID
		print(SlotLevelID)
	end)

	Tabs.MakeLevel:AddParagraph({
		Title = "What is ID Levels i should select?",
		Content = "1 - Old Test, 2 - Green Hill, 3 - Marble, 4 - Labyrinth, 5 - Emerald Hill, 6 - Metropolis, 7 - Spring Yard, 8 - Star Light, 9 - New Test, 10 - Mystic Cave"
	})
	local Dropdown5 = Tabs.MakeLevel:AddDropdown("Dropdown5", {
		Title = "Select ID Level",
		Values = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"},
		Multi = false,
		Default = 1,
	})

	Dropdown5:OnChanged(function(LevelID)
		LevelCreateID = LevelID
		print(LevelID)
	end)

	Tabs.MakeLevel:AddButton({
		Title = "Create Level",
		Callback = function()
			funcs.PlaySound("medal")
			local CreateLevel = ReplicatedStorage.Remotes.CreateNewLevel
			CreateLevel:FireServer(tonumber(LevelCreateID), tonumber(SlotID))
			print(LevelCreateID)
			print(SlotID)
			wait(2)
			PlrGui.ManageLevels:Destroy()
		end 
	})
	
	Tabs.Functions:AddSection("CSS Sounds")

	Tabs.Functions:AddButton({
		Title = "Play Sound Back",
		Callback = function()
			funcs.PlaySound("bork")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Warp",
		Callback = function()
			funcs.PlaySound("warp")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Illegal",
		Callback = function()
			funcs.PlaySound("buzzer")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Checkpoint",
		Callback = function()
			funcs.PlaySound("checkpoint")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Sonic Can Super Sonic",
		Callback = function()
			funcs.PlaySound("medal")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Level Select Selecting",
		Callback = function()
			funcs.PlaySound("Ring")
		end
	})
	Tabs.Functions:AddSection("Baldi's Sounds")
	Tabs.Functions:AddButton({
		Title = "Play Sound Oh, Hi",
		Callback = function()
			funcs.PlaySound("baldihi")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Slap Ruler",
		Callback = function()
			funcs.PlaySound("baldislap")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Baldi Jumpscare",
		Callback = function()
			funcs.PlaySound("baldiscare")
		end
	})
	Tabs.Functions:AddSection("Sonic CD Sounds")
	Tabs.Functions:AddButton({
		Title = "Play Sound Jump",
		Callback = function()
			funcs.PlaySound("jump2")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Yes",
		Callback = function()
			funcs.PlaySound("ExtraLifeCD")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Drown",
		Callback = function()
			funcs.PlaySound("scd_drown")
		end
	})
	Tabs.Functions:AddSection("Sonic 1 Sounds")
	Tabs.Functions:AddButton({
		Title = "Play Sound Sonic GAME OVER",
		Callback = function()
			funcs.PlaySound("GameOverS1")
		end
	})
	Tabs.Functions:AddSection("Sonic 3 Sounds")
	Tabs.Functions:AddButton({
		Title = "Play Sound Tails Fly",
		Callback = function()
			ReplicatedStorage.Game.Backdrop.Main.Engine.fly.Playing = true
		end
	})
	Tabs.Functions:AddButton({
		Title = "Stop Sound Tails Fly",
		Callback = function()
			ReplicatedStorage.Game.Backdrop.Main.Engine.fly.Playing = false
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Tails Tfly",
		Callback = function()
			ReplicatedStorage.Game.Backdrop.Main.Engine.tfly.Playing = true
		end
	})
	Tabs.Functions:AddButton({
		Title = "Stop Sound Tails Tfly",
		Callback = function()
			ReplicatedStorage.Game.Backdrop.Main.Engine.tfly.Playing = false
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound AIZ Rock Break",
		Callback = function()
			funcs.PlaySound("Break")
		end
	})
	Tabs.Functions:AddSection("Other Sounds")
	Tabs.Functions:AddButton({
		Title = "Play Sound Jump",
		Callback = function()
			funcs.PlaySound("jump")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Sonic.EXE Laugh",
		Callback = function()
			funcs.PlaySound("SonicExeLaugh")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Sonic.EXE Exit",
		Callback = function()
			funcs.PlaySound("die2")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Bumper",
		Callback = function()
			funcs.PlaySound("Bumper")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Ring",
		Callback = function()
			funcs.PlaySound("ring")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Died On Spikes",
		Callback = function()
			funcs.PlaySound("spike_hit")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Losed Ring",
		Callback = function()
			funcs.PlaySound("RingLose")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Blue Sphere Eat",
		Callback = function()
			funcs.PlaySound("Sphere")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound House Zone Moving Face",
		Callback = function()
			funcs.PlaySound("face_move")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Glass Bumper Crash",
		Callback = function()
			funcs.PlaySound("crash")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Dead Sound",
		Callback = function()
			funcs.PlaySound("oof")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Eggman Jump",
		Callback = function()
			funcs.PlaySound("jump3")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Point",
		Callback = function()
			funcs.PlaySound("point")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Warp 2",
		Callback = function()
			funcs.PlaySound("warp")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Spring",
		Callback = function()
			funcs.PlaySound("spring")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Break",
		Callback = function()
			funcs.PlaySound("break2")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Electric Shield",
		Callback = function()
			funcs.PlaySound("lshield")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Get Electric Shield",
		Callback = function()
			funcs.PlaySound("lshieldget")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Flame Shield",
		Callback = function()
			funcs.PlaySound("fshield")
		end
	})
	Tabs.Functions:AddButton({
		Title = "Play Sound Get Flame Shield",
		Callback = function()
			funcs.PlaySound("fshieldget")
		end
	})
	--[[
	Tabs.Functions:AddParagraph({
		Title = "Delete Objects"
	})
	Tabs.Functions:AddButton({
		Title = "Delete All Objects Without Player",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects.Amy.Sprite.SpriteDirY:Clone().Parent = game.ReplicatedStorage.Objects.Ring.Sprite
			for i,v in pairs(game.ReplicatedStorage.Objects:GetChildren()) do
				if v.Name ~= "Sonic_S1" and v.Name ~= "PathSwapper" and v.Name ~= "PathSwapper2" and v.Name ~= "Ring_Spark" and v.Name ~= "Ring_Goal" and v.Name ~= "Ring_Bouncing" and v.Name ~= "Ring" and v.Name ~= "Sonic_S1_Rose" and v.Name ~= "Sonic_S2" and v.Name ~= "Sonic_S2_Ashura" and v.Name ~= "Sonic_S3" and v.Name ~= "Sonic_S3_Red" and v.Name ~= "Tails_S3" and v.Name ~= "Knuckles_S3" and v.Name ~= "Knuckles_S3_Blue" and v.Name ~= "Metal_Sonic" and v.Name ~= "Rouge_S1" and v.Name ~= "Dr_Robotnik" and v.Name ~= "Shadow_S3" and v.Name ~= "Sonic_SCD" and v.Name ~= "Sonic_SCD_Rose" and v.Name ~= "Super_Sonic" then
					v:Destroy()
				end
			end
		end,
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Pushable Block",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Block_Pushable"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Collapsing Bridge",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Collapsing_Bridge"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Bridge 8 Logs",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Bridge_08"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Bridge 12 Logs",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Bridge_12"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Platform Collapse",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Platform_Collapse"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Staircase",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Staircase"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Staircase 2",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Staircase_Rotating_1004"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Staircase 4",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Staircase_Rotating_1234"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Platform Bumper Up-Down 256px",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Platform_Bumper_R256"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Platform Bumper Up-Down 128px",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Platform_Bumper_D128"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Platform Bumper Right-Left 128px",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Platform_Bumper_R128"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Breakable Wall Middle",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Breakable_Wall_Middle"]:Destroy()
		end
	})
	Tabs.Functions:AddButton({
		Title = "Delete Test Platform",
		Callback = function()
			game.ReplicatedStorage.Game.Backdrop.Main.Engine["break1"]")
			ReplicatedStorage.Objects["TZ__Platform"]:Destroy()
		end
	})
	--]]
	Tabs.LevelCreator:AddSection("Secret Functions")
	local Toggle12 = Tabs.LevelCreator:AddToggle("MyToggle12", {Title = "Water Transfare On/Off", Default = false })
	Toggle12:OnChanged(function(ToggleGui11)
		if ToggleGui11 == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("LevelCreator") then
			funcs.PlaySound("pop")
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Water.Frame.Holder.WaterTrans.Visible = true
		end
		if ToggleGui11 == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("LevelCreator") then
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Water.Frame.Holder.WaterTrans.Visible = false
		end
	end)
	local Toggle13 = Tabs.LevelCreator:AddToggle("MyToggle13", {Title = "Rise Speed On/Off", Default = false })
	Toggle13:OnChanged(function(ToggleGui12)
		if ToggleGui12 == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("LevelCreator") then
			funcs.PlaySound("pop")
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Water.Frame.Holder.RiseSpeed.Visible = true
		end
		if ToggleGui12 == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("LevelCreator") then
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Water.Frame.Holder.RiseSpeed.Visible = false
		end
	end)
	Tabs.LevelCreator:AddSection("Insert Unused/Cutted Objects")
	--[[
	Tabs.LevelCreator:AddParagraph({
		Title = "Insert Unused/Cutted Objects"
	})
	--]]
	Tabs.LevelCreator:AddParagraph({
		Title = "Delete Objects",
		Content = "First, click on the button on which you want to insert the object, then, pull the ring out of the object list, put it on, then click on the button in the game (Save & Exit) then select the level at which you put the ring, and it will become the object you clicked on"
	})
	Tabs.LevelCreator:AddSection("House Objects")
	Tabs.LevelCreator:AddButton({
		Title = "Insert Big Bookshelf",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 224
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 16, 0, 80)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.HZ__Book_Shelf_Big.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Small Bookshelf",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 223
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 16, 0, 32)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.HZ__Book_Shelf_Small.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Chao Fruit",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 168
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 24, 0, 16)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.HZ__Fruit_Chao.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Picture Frame 1",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 169
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 24, 0, 16)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.HZ__Picture1.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Picture Frame 2",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 170
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 24, 0, 16)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.HZ__Picture2.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Cake Slice",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 167
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 24, 0, 16)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.HZ__Cake_Slice.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Long Table",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 166
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 96, 0, 16)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.HZ__Table2.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Table",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 165
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 48, 0, 16)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.HZ__Table.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Couch",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 163
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 76, 0, 8)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.HZ__Couch.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Armchair",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 164
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 24, 0, 8)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.HZ__Couch_Small.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddSection("Unused/Cutted Objects")
	Tabs.LevelCreator:AddButton({
		Title = "Insert Big Angel Island Breakable Rock",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 145
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 46, 0, 78)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.AIZ_Rock_Breakable_Big.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Medium Angel Island Breakable Rock",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 144
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 46, 0, 46)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.AIZ_Rock_Breakable_Med.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Small Angel Island Breakable Rock (Jump to Break)",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 146
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 46, 0, 32)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.AIZ_Rock_Smashable.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Small Angel Island Breakable Rock (Spindash to Break)",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 143
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 46, 0, 32)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone = ReplicatedStorage.Objects.AIZ_Rock_Breakable_Small.Sprite:Clone()  
			clone.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Solid Wall 4",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 373
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 16, 0, 64)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone1 = ReplicatedStorage.Objects.GHZ_Wall_7:GetChildren()[6]:Clone()
            local clone2 = ReplicatedStorage.Objects.GHZ_Wall_7.Sprite:Clone()
            local clone3 = ReplicatedStorage.Objects.GHZ_Wall_7:GetChildren()[5]:Clone()
            local clone4 = ReplicatedStorage.Objects.GHZ_Wall_7:GetChildren()[4]:Clone()
			clone1.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            clone2.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            clone3.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            clone4.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Solid Wall 5",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 374
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 16, 0, 64)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite:Destroy()
			local clone1 = ReplicatedStorage.Objects.GHZ_Wall_8:GetChildren()[6]:Clone()
            local clone2 = ReplicatedStorage.Objects.GHZ_Wall_8.Sprite:Clone()
            local clone3 = ReplicatedStorage.Objects.GHZ_Wall_8:GetChildren()[5]:Clone()
            local clone4 = ReplicatedStorage.Objects.GHZ_Wall_8:GetChildren()[4]:Clone()
			clone1.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            clone2.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            clone3.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            clone4.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = true
		end 
	})
Tabs.LevelCreator:AddButton({
    Title = "Insert Triple Rotating Bumpers",
    Callback = function()
        funcs.PlaySound("Ring")
        if PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring:FindFirstChild("Hitboxes") then
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Hitboxes:Destroy()
            if PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring:FindFirstChild("Delete") then
                PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Delete:Destroy()
            end
            return
        end

        Instance.new("NumberValue", PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
        PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
        PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
        PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 514
        PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Size = UDim2.new(0, 16, 0, 16)

        local clone1 = ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Hitboxes:Clone()
        local clone2 = ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Delete:Clone()
        clone1.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring
        clone2.Parent = PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring

        if PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring:FindFirstChild("Hitboxes") and PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Hitboxes:FindFirstChild("1") then
            PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Hitboxes["1"].Image = "rbxassetid://113799670647725"
    PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Sprite.Visible = false
        end
    end
})
	Tabs.LevelCreator:AddSection("Objects From Mystic Cave")
	Tabs.LevelCreator:AddButton({
		Title = "Insert Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 570
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Spike Trap",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 571
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Crushing Pillar",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 572
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Rotating Spikeball Chain",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 573
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Collapsing Bridge",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 579
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Horizontal Moving Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 580
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Rotating Crates",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 583
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Halswing",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 585
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Vine",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 591
		end 
	})
	Tabs.LevelCreator:AddSection("Global Objects, for each editor's zone!")
	Tabs.LevelCreator:AddButton({
		Title = "Insert Bridge From Old Test",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 120
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Conveyor Belt",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 142
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert CD Bumper",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 33
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Flipper",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 322
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Balloon",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 33
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Dash Panel",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 258
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Spinning Spike Chain",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 124
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert MGZ Spinning Spikeball",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 228
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Medium Spike Ball",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 136
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Big Spike Ball",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 137
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Locked Door",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 147
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Locked Chara Door",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 152
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Arrow",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 174
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Warning Sign",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 180
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Path Swapper",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 539
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Master Emerald",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 171
		end 
	})
	Tabs.LevelCreator:AddSection("Objects From Old Test")
	Tabs.LevelCreator:AddButton({
		Title = "Insert Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 181
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Breakable Wall",
		Callback = function()
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 192
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Rotating Staircase",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 232
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Swinging Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 123
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 115
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Bridge",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 120
		end 
	})
	Tabs.LevelCreator:AddParagraph({
		Title = "Objects From Test"
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 400
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Breakable Wall",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 401
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Collapsing Bridge",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 404
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Bumper Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 405
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Breakable Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 384
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Glass Bumper",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 385
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Fire Wall",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 386
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 394
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Swinging Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 391
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Rotating Staircase",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 411
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Bridge",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 496
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Interactable Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 530
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert S2 Bumper",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 413
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Bumper Token",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 518
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Crushing Spiked Pillar",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 536
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Past Swapper",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 539
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Rock",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 537
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Cork",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 538
		end 
	})
	Tabs.LevelCreator:AddParagraph({
		Title = "Objects From Green Hill"
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Collapsing Ledge",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 379
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Palmatree Panic Ghost Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 372
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Bridge",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 203
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Bridge Support",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 244
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Vertical Moving Tall Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 233
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Breakable Wall",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 189
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 202
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Swinging Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 293
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Non-Solid Wall",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 186
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Solid Wall",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 183
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Rock",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 182
		end 
	})
	Tabs.LevelCreator:AddSection("Objects From Marble")
	Tabs.LevelCreator:AddButton({
		Title = "Insert Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 199
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Falling Block Type A",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 211
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Falling Block Type B",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 212
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Bobbing Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 213
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 200
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Swinging Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 263
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Moving Pillar",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 208
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Breakable Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 230
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Fire Wall",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 248
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Fireball Spawner",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 257
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Interactable Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 529
		end 
	})
	Tabs.LevelCreator:AddSection("Objects From Spring Yard")
	Tabs.LevelCreator:AddButton({
		Title = "Insert S1 Bumper",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 256
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 245
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 286
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Moving Square Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 246
		end 
	})
	Tabs.LevelCreator:AddSection("Objects From Labyrinth")
	Tabs.LevelCreator:AddButton({
		Title = "Insert Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 221
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Sponge Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 524
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 525
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Spear",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 527
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Collapsing Block",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 563
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Projectile Launcher",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 564
		end 
	})
	Tabs.LevelCreator:AddSection("Objects From Star Light")
	Tabs.LevelCreator:AddButton({
		Title = "Insert Collapsing Bridge",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 310
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Rotating Platforms",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 311
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Descending Staircase",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 312
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Fire Wall",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 314
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Swinging Spiked Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 320
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Breakable Wall",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 321
		end 
	})
	Tabs.LevelCreator:AddSection("Objects From Emerald Hill")
	Tabs.LevelCreator:AddButton({
		Title = "Insert Platform",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 217
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Bridge",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 214
		end 
	})
	Tabs.LevelCreator:AddButton({
		Title = "Insert Bridge Support",
		Callback = function()
			funcs.PlaySound("Ring")
			Instance.new("NumberValue",PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring)
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId:Destroy()
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.Value.Name = "ObjId"
			PlrGui.LevelCreator.Backdrop.Screen.ObjectsList.Ring.Ring.ObjId.Value = 532
		end 
	})
	Tabs.Chara:AddParagraph({
		Title = "WARNING!!!",
		Content = "Be careful with these global functions!"
	})
	Tabs.Chara:AddButton({
		Title = "To Be Sonic_S1",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 1
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddButton({
		Title = "To Be Sonic_S2",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 2
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddButton({
		Title = "To Be Sonic_S3",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 3
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddButton({
		Title = "To Be Tails_S3",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 4
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddButton({
		Title = "To Be Knuckles_S3",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 5
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddButton({
		Title = "To Be Amy",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 6
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddButton({
		Title = "To Be Metal_Sonic",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 7
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddButton({
		Title = "To Be Rouge_S1",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 8
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddButton({
		Title = "To Be Super_Sonic",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 9
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddButton({
		Title = "To Be Dr_Robotnik",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 10
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddButton({
		Title = "To Be Shadow_S3",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 12
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddButton({
		Title = "To Be Sonic_SCD",
		Callback = function()
			funcs.PlaySound("bshieldget")
			local A_1 = 
				{
					[1] = "Title Screen", 
					[2] = 1, 
					[3] = 
					{
						[1] = 628, 
						[2] = 462
					}, 
					[4] = 2, 
					[5] = "Title Screen"
				}
			local A_2 = 19
			local Event = ReplicatedStorage.Remotes.LoadGame
			Event:FireServer(A_1, A_2)
			local Event = ReplicatedStorage.Remotes.GetPlayerSettings
			Event:InvokeServer()
			local Event = ReplicatedStorage.Remotes.GetMasterData
			Event:InvokeServer()
			PlrGui.Game:Destroy()
		end 
	})
	Tabs.Chara:AddParagraph({
		Title = "Magnitaze To Player",
		Content = "Use the Reset Level in the Game tab"
	})
	local Input = Tabs.Chara:AddInput("Input", {
		Title = "Write a Username",
		Default = "",
		Placeholder = "None",
		Numeric = false, -- Only allows numbers
		Finished = false, -- Only calls Callback when you press enter
		Callback = function(ValuePlayerID)
			VPlayerID = ValuePlayerID
			print(ValuePlayerID)
		end
	})
	Tabs.Chara:AddButton({
		Title = "Magnetize To Player",
		Callback = function(ValuePlayerID)
			funcs.PlaySound("lshieldget")
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
				if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
					v:WaitForChild("Player").Value = tostring(VPlayerID)
				end
			end
		end
	})
	Tabs.Omega:AddButton({
		Title = "Spoof Developer",
		Callback = function()
			funcs.PlaySound("lshieldget")
			local OldName = Instance.new("StringValue", workspace)
			OldName.Value = tostring(game.Players.LocalPlayer.Name)

			game.Players.LocalPlayer.Name = "AkikoDev"

			while wait(0.1) do
				game.ReplicatedStorage.Players:WaitForChild(OldName.Value).Name = "AkikoDev"
			end
		end
	})
	local Input = Tabs.Omega:AddInput("Input", {
		Title = "Do An Animation (in debug)",
		Default = "debugging",
		Placeholder = "None",
		Numeric = false, -- Only allows numbers
		Finished = false, -- Only calls Callback when you press enter
		Callback = function(AnID)
			AnimationID = AnID
			print(AnID)
		end
	})
	Tabs.Omega:AddParagraph({
		Title = "Animations",
		Content = "All Animations : hide, debugging, walking, walking2, walking, walking4, flying, flytired, flyswim, flyswimtired, flyswimup, peelout, sprinting, sprinting2, sprinting3, sprinting4, running, running2, running3, running4, lightdashing, lightdashing2, lightdashing3, lightdashing4, glinding, glinding2, glinding3, glidefall, climbing, climbingmove, land, slide, getup, jumping, jump, jump2, jumpfall, jetpack, hammering, rolling, pushing, balancing, balancing3, balancingf, spindash, dead, drown, bubble, ducking, lookup, hurting, fall, springing, springing2, standing, braking, pose, door_enter, door_leave, carried, vine"
	})
	Tabs.Omega:AddButton({
		Title = "Do Animation",
		Callback = function()
			funcs.PlaySound("lshieldget")
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
				if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
					v:WaitForChild("Sprite"):WaitForChild("Frame").Value = "1"
				end
			end
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
				if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
					v:WaitForChild("Sprite"):WaitForChild("Animation").Value = "" .. tostring(AnimationID)
				end
			end
		end
	})
	local Toggle = Tabs.Omega:AddToggle("MyToggle", {Title = "Flip Player (in debug)", Default = false })
	Toggle:OnChanged(function(ToggleY)
		if ToggleY == true and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
				if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
					v:WaitForChild("Sprite"):WaitForChild("SpriteDirY").Value = "-1"
				end
			end
		end
		if ToggleY == false and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Game") then
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
				if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
					v:WaitForChild("Sprite"):WaitForChild("SpriteDirY").Value = "1"
				end
			end
		end
	end)
	Tabs.NewMusic3:AddParagraph({
		Title = "How to listen cutten music",
		Content = "First, go in Level Creator and click on the red music on topbar, click on buttons in script and songs id put automatically"
	})
	Tabs.NewMusic3:AddParagraph({
		Title = "Your music may be different",
		Content = "All you need to do is join the CSS GENIE Hub Discord channel in the Channels tab, and send your username and music id on the custom music channel"
	})
	Tabs.NewMusic3:AddSection("Music Founded By CSS-FLOUNT")
	Tabs.NewMusic3:AddButton({
		Title = "Tidal Wave",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "5409360995"
		end 
	})
	Tabs.NewMusic3:AddButton({
		Title = "Bensley - Vex",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7023635858"
		end 
	})
	Tabs.NewMusic3:AddButton({
		Title = "Bensley - All Night",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "5410082273"
		end 
	})
	Tabs.NewMusic3:AddButton({
		Title = "Yellow Stock",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1838980746"
		end 
	})
	Tabs.NewMusic3:AddButton({
		Title = "Carnival Night Zone Act 1",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "10622068114178"
		end 
	})
	Tabs.NewMusic3:AddButton({
		Title = "Launch Base Zone Act 1",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "137526862616290"
		end 
	})
	Tabs.NewMusic3:AddButton({
		Title = "Sandstorm",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1840434705"
		end 
	})
	Tabs.NewMusic3:AddSection("Music Founded By Cotiru_Official")
	Tabs.NewMusic3:AddButton({
		Title = "September Walk",
		Callback = function(await)
		game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1846192146"
		end 
	})
	Tabs.NewMusic3:AddButton({
		Title = "Travelling",
		Callback = function()
		game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1846192304"
		end 
	})
	Tabs.NewMusic3:AddButton({
		Title = "Into The Light",
		Callback = function()
		game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1846191932"
		end 
	})
	Tabs.NewMusic2:AddParagraph({
		Title = "How to listen cutten music",
		Content = "First, go in Level Creator and click on the red music on topbar, click on buttons in script and songs id put automatically"
	})
	Tabs.NewMusic2:AddSection("Undertale")
	Tabs.NewMusic2:AddButton({
		Title = "Asgore",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "360710833"
		end
	})
	Tabs.NewMusic2:AddButton({
		Title = "Finale",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "321055859"
		end
	})
	Tabs.NewMusic2:AddButton({
		Title = "Gaster's Theme",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "582435097"
		end
	})
	Tabs.NewMusic2:AddButton({
		Title = "Ghost Fight",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "473070704"
		end
	})
	Tabs.NewMusic2:AddButton({
		Title = "Hopes and Dreams",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "382688081"
		end
	})
	Tabs.NewMusic2:AddSection("Dr.Robotnik's Mean Bean Machine")
	Tabs.NewMusic2:AddButton({
		Title = "Multiplayer Versus",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "242610564"
		end
	})
	Tabs.NewMusic2:AddSection("Sonic The Hedgehog")
	Tabs.NewMusic2:AddButton({
		Title = "Invincibility",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7456592788"
		end
	})
	Tabs.NewMusic2:AddSection("Sonic The Hedgehog 2")
	Tabs.NewMusic2:AddButton({
		Title = "Hidden Palace Zone",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "429388470"
		end
	})
	Tabs.NewMusic2:AddButton({
		Title = "Invincibility",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7456627572"
		end
	})
	Tabs.NewMusic2:AddSection("Sonic & Knuckles")
	Tabs.NewMusic2:AddButton({
		Title = "Invincibility",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7456394306"
		end
	})
	Tabs.NewMusic2:AddSection("Fabian Del Priore Rapture")
	Tabs.NewMusic2:AddButton({
		Title = "A Dash From Freedom",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "2413255224"
		end
	})
	Tabs.NewMusic2:AddSection("Rapina Bros")
	Tabs.NewMusic2:AddButton({
		Title = "Reach To The Top",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "2543292816"
		end
	})
	Tabs.NewMusic2:AddSection("Xinon")
	Tabs.NewMusic2:AddButton({
		Title = "Heart Warming Story",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "291899899"
		end
	})
	Tabs.NewMusic2:AddSection("Kitsune 2")
	Tabs.NewMusic2:AddButton({
		Title = "Goodnight (Ducktales)",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "230440878"
		end
	})
	Tabs.NewMusic2:AddButton({
		Title = "Rainbow Tylenol",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "318790284"
		end
	})
	Tabs.NewMusic2:AddSection("Knuckle Joe")
	Tabs.NewMusic2:AddButton({
		Title = "The Time We Had",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "291050847"
		end
	})
	Tabs.NewMusic:AddParagraph({
		Title = "How to listen cutten music",
		Content = "First, go in Level Creator and click on the red music on topbar, click on buttons in script and songs id put automatically"
	})
	Tabs.NewMusic:AddSection("House Zone")
	Tabs.NewMusic:AddButton({
		Title = "House Music 1",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1551374958"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "House Music 2",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "150110636"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "House Music 3",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1551374073"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "House Music 4",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1551374625"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "House Music 5",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1553436267"
		end 
	})
	Tabs.NewMusic:AddSection("Dr.Robotnik's Mean Bean Machine")
	Tabs.NewMusic:AddButton({
		Title = "Multiplayer Versus",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "242610832"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Exercise Mode",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "284747270"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Stages 1-4",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "284750073"
		end 
	})
	Tabs.NewMusic:AddSection("Final Fantasy X")
	Tabs.NewMusic:AddButton({
		Title = "Battle",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "287414770"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Between Ordeals",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "287414770"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Blitz Off",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "287414770"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Challenge",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "287414770"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Hopeless Desire",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "287414770"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Otherworld",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "287414770"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Seymour Battle",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "287414770"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Silence Before The Storm",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "287414770"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Someday The Dream Will End",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "287414770"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Victory Fanfare",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "287414770"
		end 
	})
	Tabs.NewMusic:AddSection("Fabian Del Priore Rapture")
	Tabs.NewMusic:AddButton({
		Title = "A Dash For Freedom",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "2413255944"
		end 
	})
    Tabs.NewMusic:AddSection("Undertale")
	Tabs.NewMusic:AddButton({
		Title = "Asgore",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "360710888"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Finale",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "321055906"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Gaster's Theme",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "582435167"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Ghost Fight",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "473070704"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Hopes and Dreams",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "382688202"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Run",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "461923735"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Dog Song",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "429383704"
		end 
	})
	Tabs.NewMusic:AddSection("Sonic The Hedgehog")
	Tabs.NewMusic:AddButton({
		Title = "Invincibility",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7456593376"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Act Clear",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "314059232"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Title Screen",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "347479590"
		end 
	})
	Tabs.NewMusic:AddSection("Sonic The Hedgehog 2")
	Tabs.NewMusic:AddButton({
		Title = "Invincibility",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7456628353"
		end 
	})
	Tabs.NewMusic:AddSection("Sonic & Knuckles")
	Tabs.NewMusic:AddButton({
		Title = "Invincibility",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7456394738"
		end 
	})
	Tabs.NewMusic:AddSection("Sonic 3 & Knuckles")
	Tabs.NewMusic:AddButton({
		Title = "Drown",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "314059552"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Emerald",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "304801042"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Act Cleared",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "295636697"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Invincibility",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7456630275"
		end 
	})
	Tabs.NewMusic:AddSection("Sonic The Hedgehog CD")
	Tabs.NewMusic:AddButton({
		Title = "Game Over (US)",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "302428675"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Speed Up",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7354973962"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Super Sneakers",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7354988616"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Zone Clear",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7423170639"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Stage Clear",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7423204753"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Invincible",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7471698482"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Invincibility",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "7471720264"
		end 
	})
	Tabs.NewMusic:AddSection("CSS Music")
	Tabs.NewMusic:AddButton({
		Title = "Title Screen",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "313139233"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Build Theme",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "3524195336"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Main Menu",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "4623689274"
		end 
	})
    Tabs.NewMusic:AddSection("Rapina Bros")
	Tabs.NewMusic:AddButton({
		Title = "Reach To The Top",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "2544859859"
		end 
	})
    Tabs.NewMusic:AddSection("Xinon")
	Tabs.NewMusic:AddButton({
		Title = "Heart Warming Story",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "291899990"
		end 
	})
	Tabs.NewMusic:AddSection("Kitsune 2")
	Tabs.NewMusic:AddButton({
		Title = "Goodnight (Ducktales)",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "230440993"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Rainbow Tylenol",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "318790343"
		end 
	})
	Tabs.NewMusic:AddSection("Knuckle Joe")
	Tabs.NewMusic:AddButton({
		Title = "The Times We Had",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "291053059"
		end 
	})
	Tabs.NewMusic:AddSection("TOREINA")
	Tabs.NewMusic:AddButton({
		Title = "Pulse Fighter",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "298773973"
		end 
	})
	Tabs.NewMusic:AddSection("OMORI")
	Tabs.NewMusic:AddButton({
		Title = "Three Bar Logos",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "11196728830"
		end 
	})
	Tabs.NewMusic:AddSection("Secret Base")
	Tabs.NewMusic:AddButton({
		Title = "Tanuki Remix",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "324431321"
		end 
	})
	Tabs.NewMusic:AddSection("Tag Underground")
	Tabs.NewMusic:AddButton({
		Title = "Posseission",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "360710810"
		end 
	})
	Tabs.NewMusic:AddSection("Tudd")
	Tabs.NewMusic:AddButton({
		Title = "Ruby Rampage Zone",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1557595099"
		end 
	})
	Tabs.NewMusic:AddSection("Sonic R")
	Tabs.NewMusic:AddButton({
		Title = "Livin' In The City (Radical City)",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "508029551"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Super Sonic Racing",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "4584143727"
		end 
	})
	Tabs.NewMusic:AddSection("Final Fantasy X-2")
	Tabs.NewMusic:AddButton({
		Title = "Eternity",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "397610035"
		end 
	})
	Tabs.NewMusic:AddSection("Anotsu")
	Tabs.NewMusic:AddButton({
		Title = "Man On The Run",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "332517296"
		end 
	})
	Tabs.NewMusic:AddSection("ETIA")
	Tabs.NewMusic:AddButton({
		Title = "Tsugaru Rainbow",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "2885366262"
		end 
	})
	Tabs.NewMusic:AddSection("Cittan")
	Tabs.NewMusic:AddButton({
		Title = "Little Wish",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "500763290"
		end 
	})
	Tabs.NewMusic:AddSection("Kyary Pamyu Pamyu")
	Tabs.NewMusic:AddButton({
		Title = "Candy Candy",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "502997918"
		end 
	})
	Tabs.NewMusic:AddSection("Halloween")
	Tabs.NewMusic:AddButton({
		Title = "Dark Magic",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1837467285"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Halloween Horror Waltz",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1836009626"
		end 
	})
	Tabs.NewMusic:AddSection("Sabrepulse")
		Tabs.NewMusic:AddButton({
		Title = "Skyfire Ace",
		Callback = function()
		game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "318790130"
		end 
	})
	Tabs.NewMusic:AddSection("Under Night In-Birth")
		Tabs.NewMusic:AddButton({
		Title = "Blood Drain -Again-",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "497761787"
		end 
	})
	Tabs.NewMusic:AddButton({
		Title = "Sky Scraper High",
		Callback = function()
			game.Players.LocalPlayer.PlayerGui.LevelCreator.Backdrop.Screen.Windows.Music.Frame.Custom.Text = "1250585615"
		end 
	})
    Tabs.Change:AddSection("Customize CSS")
    Tabs.Change:AddParagraph({
		Title = "Customize the CSS background for yourself",
        Content = "It is better to use functions in the main menu"
	})
    Tabs.Change:AddSection("Customize Background Gradient")
    Tabs.Change:AddSection("Customize Background Element 1")
    Tabs.Change:AddSection("Customize Background Element 2")
    Tabs.Change:AddSection("Customize Character")
    Tabs.Change:AddButton({
        Title = "Sonic On Background",
        Callback = function()
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local sonicID = "rbxassetid://4508545299"
            
            imageLabel.Position = UDim2.new(0.5, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 128, 0, 128)

            if imageLabel.Image == sonicID then
                return
            end
        
            imageLabel.Image = sonicID
            currentBackground = "Sonic"
        end
    })
    Tabs.Change:AddButton({
        Title = "Tails On Background",
        Callback = function()
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local tailsID = "rbxassetid://124111498905432"
            
            imageLabel.Position = UDim2.new(0.502, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 128, 0, 128)

            if imageLabel.Image == tailsID then
                return
            end
        
            imageLabel.Image = tailsID
            currentBackground = "Tails"
        end
    })
    Tabs.Change:AddButton({
        Title = "Knuckles On Background",
        Callback = function()
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local knucklesID = "rbxassetid://98220094742880"
            
            imageLabel.Position = UDim2.new(0.5, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 128, 0, 128)

            if imageLabel.Image == knucklesID then
                return
            end
        
            imageLabel.Image = knucklesID
            currentBackground = "Knuckles"
        end
    })
    Tabs.Change:AddButton({
        Title = "Amy On Background",
        Callback = function()
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local amyID = "rbxassetid://77889917273256"
            
            imageLabel.Position = UDim2.new(0.496, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 136, 0, 136)

            if imageLabel.Image == amyID then
                return
            end
        
            imageLabel.Image = amyID
            currentBackground = "Amy"
        end
    })
    Tabs.Change:AddButton({
        Title = "Metal Sonic On Background",
        Callback = function()
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local metalsonicID = "rbxassetid://114396730092664"
            
            imageLabel.Position = UDim2.new(0.5, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 136, 0, 136)

            if imageLabel.Image == metalsonicID then
                return
            end
        
            imageLabel.Image = metalsonicID
            currentBackground = "Metal Sonic"
        end
    })
    Tabs.Change:AddButton({
        Title = "Dr Robotnik On Background",
        Callback = function()
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local drrobotnikID = "rbxassetid://111541726029480"
        
            imageLabel.Position = UDim2.new(0.4934, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 156, 0, 156)

            if imageLabel.Image == drrobotnikID then
                return
            end
        
            imageLabel.Image = drrobotnikID
            currentBackground = "Dr Robotnik"
        end
    })
    Tabs.Change:AddParagraph({
		Title = "Change music in Main Menu and Level Creator!",
        Content = "Use 10th menu music in CSS settings to change Main Menu music"
	})
    local Input = Tabs.Change:AddInput("Input", {
		Title = "Write a Music ID For Main Menu",
		Default = "",
		Placeholder = "Write Here",
		Numeric = true, -- Only allows numbers
		Finished = false, -- Only calls Callback when you press enter
		Callback = function(ValueMenuMusicID)
			game:GetService("ReplicatedStorage").Music["Sonic Heroes"]["System Screen Select"].Loop.Value = tonumber(ValueMenuMusicID)
		end
	})
    local Input = Tabs.Change:AddInput("Input", {
		Title = "Write a Music ID For LevelCreator",
		Default = "",
		Placeholder = "Write Here",
		Numeric = true, -- Only allows numbers
		Finished = false, -- Only calls Callback when you press enter
		Callback = function(ValueLevelCreatorMusicID)
			game:GetService("ReplicatedStorage").Music["Sonic Mega Collection"]["Extra & History Menu"].Loop.Value = tonumber(ValueLevelCreatorMusicID)
		end
	})
    Tabs.Change:AddButton({
		Title = "Reset Music ID",
		Callback = function()
			game:GetService("ReplicatedStorage").Music["Sonic Heroes"]["System Screen Select"].Loop.Value = "4623689274"
            game:GetService("ReplicatedStorage").Music["Sonic Mega Collection"]["Extra & History Menu"].Loop.Value = "3524195336"
		end 
	})
    Tabs.Visual:AddSection("Main Menu Theme's")
        Tabs.Visual:AddButton({
            Title = "Sonic Theme (Main)",
            Callback = function()
            BackgroundImage.ImageColor3 = Color3.fromRGB(35, 152, 255)
            Ug.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 64, 255)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(12, 64, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 247))
            })
            El1.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 40, 40)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 40, 40))
            })
            El2.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 0))
            })
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local sonicID = "rbxassetid://4508545299"
            imageLabel.Position = UDim2.new(0.502, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 128, 0, 128)
            if imageLabel.Image == sonicID then
                return
            end
            imageLabel.Image = sonicID
            currentBackground = "Sonic"
        end
    })
        Tabs.Visual:AddButton({
            Title = "Tails Theme",
            Callback = function()
            BackgroundImage.ImageColor3 = Color3.fromRGB(255, 200, 50)
            Ug.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 120, 20)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 160, 30)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 50))
            })
            El1.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 40, 40)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 40, 40))
            })
            El2.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 150, 40)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 150, 40))
            })
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local tailsID = "rbxassetid://124111498905432"
            imageLabel.Position = UDim2.new(0.502, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 128, 0, 128)
            if imageLabel.Image == tailsID then
                return
            end
            imageLabel.Image = tailsID
            currentBackground = "Tails"
        end
    })
        Tabs.Visual:AddButton({
            Title = "Knuckles Theme",
            Callback = function()
            BackgroundImage.ImageColor3 = Color3.fromRGB(60, 200, 60)
            Ug.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 80, 20)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 150, 30)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 200, 60))
            })
            El1.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 40, 40)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 40, 40))
            })
            El2.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 0))
            })
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local knucklesID = "rbxassetid://98220094742880"
            imageLabel.Position = UDim2.new(0.5, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 128, 0, 128)
            if imageLabel.Image == knucklesID then
                return
            end
            imageLabel.Image = knucklesID
            currentBackground = "Knuckles"
        end
    })
        Tabs.Visual:AddButton({
            Title = "Amy Theme",
            Callback = function()
            BackgroundImage.ImageColor3 = Color3.fromRGB(255, 200, 210)
            Ug.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 100, 140)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 150, 180)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 210))
            })
            El1.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 40, 40)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 40, 40))
            })
            El2.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 0))
            })
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local amyID = "rbxassetid://77889917273256"
            imageLabel.Position = UDim2.new(0.496, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 136, 0, 136)
            if imageLabel.Image == amyID then
                return
            end
            imageLabel.Image = amyID
            currentBackground = "Amy"
        end
    })
        Tabs.Visual:AddButton({
            Title = "Metal Sonic Theme",
            Callback = function()
            BackgroundImage.ImageColor3 = Color3.fromRGB(30, 100, 220)
            Ug.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 20, 120)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 60, 180)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 100, 220))
            })
            El1.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 40, 40)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 40, 40))
            })
            El2.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 0))
            })
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local metalsonicID = "rbxassetid://114396730092664"
            imageLabel.Position = UDim2.new(0.5, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 152, 0, 152)
            if imageLabel.Image == metalsonicID then
                return
            end
            imageLabel.Image = metalsonicID
            currentBackground = "Metal Sonic"
        end
    })
        Tabs.Visual:AddButton({
            Title = "Dr Robotnik Theme",
            Callback = function()
            BackgroundImage.ImageColor3 = Color3.fromRGB(200, 60, 60)
            Ug.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 20, 20)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 30, 30))
            })
            El1.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 40, 40)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 40, 40))
            })
            El2.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(230, 140, 40)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(230, 140, 40))
            })
            local imageLabel = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel
            local drrobotnikID = "rbxassetid://111541726029480"
            imageLabel.Position = UDim2.new(0.4934, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 156, 0, 156)
            if imageLabel.Image == drrobotnikID then
                return
            end
            imageLabel.Image = drrobotnikID
            currentBackground = "Dr Robotnik"
        end
    })
	Tabs.Visual:AddParagraph({
		Title = "Load Objects",
        Content = "Local correct sprite's of objects"
	})
	local Toggle = Tabs.Visual:AddToggle("MyToggle", {Title = "Load Old Test Objects", Default = false })
	Toggle:OnChanged(function(ToggleVis)
		if ToggleVis == true then
			funcs.PlaySound("Ring")
			ReplicatedStorage.Objects.____Block:GetChildren()[5].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Block.Sprite.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Block:GetChildren()[3].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Block:GetChildren()[4].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["1"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["2"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["3"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["4"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["5"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["6"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["7"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["8"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["1"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["2"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["3"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["4"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["5"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["6"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["7"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["8"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["1"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["2"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["3"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["4"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["5"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["6"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["7"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["8"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["1"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["2"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["3"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["4"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["5"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["6"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["7"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["8"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["1"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["2"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["3"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["4"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["5"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["6"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["7"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["8"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["9"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["10"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["11"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["12"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform.Sprite.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Collapse.Sprite.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Moving_H.Delete.Sprite.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Moving_H.Sprite.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Moving_V.Delete.Sprite.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Moving_V.Sprite.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_4.Hitboxes.Platform.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_4["1"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_4["2"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_4["3"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_4["4"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_4["5"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_6.Hitboxes.Platform.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_6["1"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_6["2"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_6["3"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_6["4"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_6["5"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_6["6"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_6["7"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_8.Hitboxes.Platform.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_8["1"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_8["2"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_8["3"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_8["4"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_8["5"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_8["6"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_8["7"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_8["8"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Platform_Swinging_8["9"].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_1004.Hitboxes:GetChildren()[2].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_1004.Hitboxes.ImageLabel.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_1234.Hitboxes:GetChildren()[4].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_1234.Hitboxes.ImageLabel.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_1234.Hitboxes:GetChildren()[2].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_1234.Hitboxes:GetChildren()[3].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_4001.Hitboxes:GetChildren()[2].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_4001.Hitboxes.ImageLabel.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_4321.Hitboxes:GetChildren()[4].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_4321.Hitboxes.ImageLabel.Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_4321.Hitboxes:GetChildren()[2].Image = "rbxassetid://7390871278"
			ReplicatedStorage.Objects.____Staircase_Rotating_4321.Hitboxes:GetChildren()[3].Image = "rbxassetid://7390871278"
		end
		if ToggleVis == false then
			ReplicatedStorage.Objects.____Block:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.____Block.Sprite.Image = ""
			ReplicatedStorage.Objects.____Block:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.____Block:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Left.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Middle.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.____Breakable_Wall_Right.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.____Bridge_08.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["9"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["10"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["11"].Image = ""
			ReplicatedStorage.Objects.____Bridge_12.Upboxes["12"].Image = ""
			ReplicatedStorage.Objects.____Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.____Platform_Collapse.Sprite.Image = ""
			ReplicatedStorage.Objects.____Platform_Moving_H.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.____Platform_Moving_H.Sprite.Image = ""
			ReplicatedStorage.Objects.____Platform_Moving_V.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.____Platform_Moving_V.Sprite.Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_4.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_4["1"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_4["2"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_4["3"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_4["4"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_4["5"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_6.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_6["1"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_6["2"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_6["3"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_6["4"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_6["5"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_6["6"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_6["7"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_8.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_8["1"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_8["2"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_8["3"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_8["4"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_8["5"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_8["6"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_8["7"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_8["8"].Image = ""
			ReplicatedStorage.Objects.____Platform_Swinging_8["9"].Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_1004.Hitboxes:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_1004.Hitboxes.ImageLabel.Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_1234.Hitboxes:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_1234.Hitboxes.ImageLabel.Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_1234.Hitboxes:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_1234.Hitboxes:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_4001.Hitboxes:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_4001.Hitboxes.ImageLabel.Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_4321.Hitboxes:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_4321.Hitboxes.ImageLabel.Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_4321.Hitboxes:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.____Staircase_Rotating_4321.Hitboxes:GetChildren()[3].Image = ""
		end
	end)
	local Toggle = Tabs.Visual:AddToggle("MyToggle", {Title = "Load Green Hill Objects", Default = false })
	Toggle:OnChanged(function(ToggleVis3)
		if ToggleVis3 == true then
			funcs.PlaySound("Ring")
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["1"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["2"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["3"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["4"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["5"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["6"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["7"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["8"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["1"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["2"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["3"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["4"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["5"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["6"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["7"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["8"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["1"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["2"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["3"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["4"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["5"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["6"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["7"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["8"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["1"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["2"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["3"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["4"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["5"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["6"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["7"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["8"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["1"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["2"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["3"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["4"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["5"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["6"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["7"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["8"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["9"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["10"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["11"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["12"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Bridge_Support.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["1"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["2"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["3"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[15].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[14].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["4"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["5"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[18].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[19].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["6"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[21].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["7"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[23].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["8"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[26].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[25].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[28].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["9"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[2].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["10"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[3].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[5].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["11"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["12"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[7].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[8].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["13"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["14"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[11].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Ghost_Platform.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Ghost_Platform_2.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Log1.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Log2.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Log3.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Log4.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Log5.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Log6.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Log7.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Log8.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform2.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Moving_H.Delete.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Moving_H.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Moving_V.Delete.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Moving_V.Delete:GetChildren()[3].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Moving_V.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4.Hitboxes.Platform.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4.Delete:GetChildren()[2].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4["1"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4["2"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4["3"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4["4"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4["5"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5.Hitboxes.Platform.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5.Delete:GetChildren()[2].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["1"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["2"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["3"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["4"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["5"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["6"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6.Hitboxes.Platform.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6.Delete:GetChildren()[2].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["1"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["2"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["3"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["4"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["5"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["6"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["7"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8.Hitboxes.Platform.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8.Delete:GetChildren()[2].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["1"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["2"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["3"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["4"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["5"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["6"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["7"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["8"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["9"].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Rock.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_1:GetChildren()[6].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_1.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_1:GetChildren()[5].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_1:GetChildren()[4].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_10:GetChildren()[6].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_10.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_10:GetChildren()[5].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_10:GetChildren()[4].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_2:GetChildren()[6].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_2.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_2:GetChildren()[5].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_2:GetChildren()[4].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_3:GetChildren()[6].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_3.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_3:GetChildren()[5].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_3:GetChildren()[4].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_4:GetChildren()[6].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_4.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_4:GetChildren()[5].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_4:GetChildren()[4].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_5:GetChildren()[6].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_5.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_5:GetChildren()[5].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_5:GetChildren()[4].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_6:GetChildren()[6].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_6.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_6:GetChildren()[5].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_6:GetChildren()[4].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_7:GetChildren()[6].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_7.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_7:GetChildren()[5].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_7:GetChildren()[4].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_8:GetChildren()[6].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_8.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_8:GetChildren()[5].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_8:GetChildren()[4].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_9:GetChildren()[6].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_9.Sprite.Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_9:GetChildren()[5].Image = "rbxassetid://8333480321"
			ReplicatedStorage.Objects.GHZ_Wall_9:GetChildren()[4].Image = "rbxassetid://8333480321"
		end
		if ToggleVis3 == false then
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Left.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Middle.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.GHZ_Breakable_Wall_Right.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_08.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["9"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["10"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["11"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_12.Upboxes["12"].Image = ""
			ReplicatedStorage.Objects.GHZ_Bridge_Support.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[15].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[14].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[18].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[19].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[21].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[23].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[26].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[25].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[28].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["9"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["10"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["11"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["12"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[7].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[8].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["13"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes["14"].Image = ""
			ReplicatedStorage.Objects.GHZ_Collapsing_Cliff.Upboxes:GetChildren()[11].Image = ""
			ReplicatedStorage.Objects.GHZ_Ghost_Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Ghost_Platform_2.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Log1.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Log2.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Log3.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Log4.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Log5.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Log6.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Log7.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Log8.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Platform2.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Moving_H.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Moving_H.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Moving_V.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Moving_V.Delete:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Moving_V.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4["1"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4["2"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4["3"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4["4"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_4["5"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["1"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["2"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["3"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["4"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["5"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_5["6"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["1"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["2"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["3"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["4"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["5"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["6"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_6["7"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["1"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["2"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["3"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["4"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["5"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["6"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["7"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["8"].Image = ""
			ReplicatedStorage.Objects.GHZ_Platform_Swinging_8["9"].Image = ""
			ReplicatedStorage.Objects.GHZ_Rock.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_1:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_1.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_1:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_1:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_10:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_10.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_10:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_10:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_2:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_2.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_2:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_2:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_3:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_3.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_3:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_3:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_4:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_4.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_4:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_4:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_5:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_5.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_5:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_5:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_6:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_6.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_6:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_6:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_7:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_7.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_7:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_7:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_8:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_8.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_8:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_8:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_9:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_9.Sprite.Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_9:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.GHZ_Wall_9:GetChildren()[4].Image = ""
		end
	end)
	local Toggle = Tabs.Visual:AddToggle("MyToggle", {Title = "Load Marble Objects", Default = false })
	Toggle:OnChanged(function(ToggleVis4)
		if ToggleVis4 == true then
			funcs.PlaySound("Ring")
			ReplicatedStorage.Objects.MZ__Block.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_2.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_2:GetChildren()[2].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_3.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_4.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_5.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_Breakable.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_Breakable_Broken.Upboxes["1"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_Breakable_Broken.Upboxes["2"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_Breakable_Broken.Upboxes["3"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_Breakable_Broken.Upboxes["4"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_Platform.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Block_Pushable.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["1"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["2"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["3"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["4"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["5"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["6"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["7"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["8"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__FireWall_H.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__FireWall_V.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform2_V.Hitboxes.Block.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform2_V.Hitboxes.Shine.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform2_V.Delete.Delete.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform2_V.Delete:GetChildren()[2].Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete:GetChildren()[7].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete:GetChildren()[4].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete:GetChildren()[2].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete:GetChildren()[5].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete:GetChildren()[6].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048:GetChildren()[7].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048:GetChildren()[5].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4.Hitboxes.Platform.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4.Delete:GetChildren()[2].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4["1"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4["2"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4["3"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4["4"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4["5"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5.Hitboxes.Platform.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5.Delete.Platform.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["1"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["2"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["3"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["4"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["5"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["6"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6.Hitboxes.Platform.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6.Delete:GetChildren()[2].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["1"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["2"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["3"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["4"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["5"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["6"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["7"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8.Hitboxes.Platform.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8.Delete.Platform.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["1"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["2"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["3"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["4"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["5"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["6"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["7"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["8"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["9"].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_V.Delete.Sprite.Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_V.Delete:GetChildren()[3].Image = "rbxassetid://100434127274024"
			ReplicatedStorage.Objects.MZ__Platform_V.Sprite.Image = "rbxassetid://100434127274024"
		end
		if ToggleVis4 == false then
			ReplicatedStorage.Objects.MZ__Block.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Block_2.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Block_2:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MZ__Block_3.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Block_4.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Block_5.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Block_Breakable.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Block_Breakable_Broken.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.MZ__Block_Breakable_Broken.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.MZ__Block_Breakable_Broken.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.MZ__Block_Breakable_Broken.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.MZ__Block_Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Block_Pushable.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.MZ__Collapsing_Bridge.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.MZ__FireWall_H.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__FireWall_V.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Platform2_V.Hitboxes.Block.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Platform2_V.Hitboxes.Shine.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Platform2_V.Delete.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Platform2_V.Delete:GetChildren()[2].Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete:GetChildren()[7].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Delete:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048:GetChildren()[7].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Moving_HB0048:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4["1"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4["2"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4["3"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4["4"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_4["5"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["1"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["2"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["3"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["4"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["5"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_5["6"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["1"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["2"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["3"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["4"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["5"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["6"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_6["7"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["1"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["2"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["3"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["4"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["5"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["6"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["7"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["8"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_Swinging_8["9"].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_V.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.MZ__Platform_V.Delete:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.MZ__Platform_V.Sprite.Image = ""
		end
	end)
	local Toggle = Tabs.Visual:AddToggle("MyToggle", {Title = "Load Spring Yard Objects", Default = false })
	Toggle:OnChanged(function(ToggleVis6)
		if ToggleVis6 == true then
			funcs.PlaySound("Ring")
			ReplicatedStorage.Objects.SYZ_Block.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Block_Moving_H128.Delete:GetChildren()[4].Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Block_Moving_H128.Delete.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Block_Moving_H128.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Block_Moving_H64.Delete:GetChildren()[4].Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Block_Moving_H64.Delete.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Block_Moving_H64.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Bumper.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Light.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Moving_H.Delete.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Moving_H.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Moving_V.Delete.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Moving_V.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Square_D.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Square_D:GetChildren()[3].Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Square_D:GetChildren()[5].Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Square_D:GetChildren()[4].Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Square_U.Sprite.Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Square_U:GetChildren()[3].Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Square_U:GetChildren()[5].Image = "rbxassetid://5627680707"
			ReplicatedStorage.Objects.SYZ_Platform_Square_U:GetChildren()[4].Image = "rbxassetid://5627680707"
		end
		if ToggleVis6 == false then
			ReplicatedStorage.Objects.SYZ_Block.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Block_Moving_H128.Delete:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.SYZ_Block_Moving_H128.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Block_Moving_H128.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Block_Moving_H64.Delete:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.SYZ_Block_Moving_H64.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Block_Moving_H64.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Bumper.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Light.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Moving_H.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Moving_H.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Moving_V.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Moving_V.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Square_D.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Square_D:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Square_D:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Square_D:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Square_U.Sprite.Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Square_U:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Square_U:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.SYZ_Platform_Square_U:GetChildren()[4].Image = ""
		end
	end)
	local Toggle = Tabs.Visual:AddToggle("MyToggle", {Title = "Load Labyrinth Objects", Default = false })
	Toggle:OnChanged(function(ToggleVis7)
		if ToggleVis7 == true then
			funcs.PlaySound("Ring")
			ReplicatedStorage.Objects.LZ__Block.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Block_Collapse.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Platform.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Platform2.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Projectile.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_120.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_150.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_180.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_30.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_60.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_90.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Rotating_Wheel.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__SpearH.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__SpearV.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__Sponge.Sprite.Image = "rbxassetid://13338104993"
			ReplicatedStorage.Objects.LZ__WaterSplash.Sprite.Image = "rbxassetid://13338104993"
		end
		if ToggleVis7 == false then
			ReplicatedStorage.Objects.LZ__Block.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Block_Collapse.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Platform2.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Projectile.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_120.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_150.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_180.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_30.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_60.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Projectile_Launcher_90.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Rotating_Wheel.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__SpearH.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__SpearV.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__Sponge.Sprite.Image = ""
			ReplicatedStorage.Objects.LZ__WaterSplash.Sprite.Image = ""
		end
	end)
	local Toggle = Tabs.Visual:AddToggle("MyToggle", {Title = "Load Star Light Objects", Default = false })
	Toggle:OnChanged(function(ToggleVis8)
		if ToggleVis8 == true then
			funcs.PlaySound("Ring")
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["1"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["2"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["3"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["4"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["5"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["6"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["7"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["8"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["1"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["2"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["3"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["4"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["5"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["6"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["7"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["8"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_FireWall_H.Sprite.Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_2.Hitboxes["1"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_2.Hitboxes["3"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_4.Hitboxes["1"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_4.Hitboxes["2"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_4.Hitboxes["3"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_4.Hitboxes["4"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6.Hitboxes.Platform.Sprite.Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["1"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["2"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["3"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["4"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["5"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["6"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["7"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Staircase.Hitboxes["1"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Staircase.Hitboxes["2"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Staircase.Hitboxes["3"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Staircase.Hitboxes["4"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Staircase.Delete["1"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Staircase.Delete["2"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Staircase.Delete["3"].Image = "rbxassetid://5803211744"
			ReplicatedStorage.Objects.SLZ_Staircase.Delete["4"].Image = "rbxassetid://5803211744"
		end
		if ToggleVis8 == false then
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.SLZ_Breakable_Wall_Middle.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.SLZ_Collapsing_Bridge.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.SLZ_FireWall_H.Sprite.Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_2.Hitboxes["1"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_2.Hitboxes["3"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_4.Hitboxes["1"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_4.Hitboxes["2"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_4.Hitboxes["3"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Rotating_4.Hitboxes["4"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6.Hitboxes.Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["1"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["2"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["3"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["4"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["5"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["6"].Image = ""
			ReplicatedStorage.Objects.SLZ_Platform_Swinging_6["7"].Image = ""
			ReplicatedStorage.Objects.SLZ_Staircase.Hitboxes["1"].Image = ""
			ReplicatedStorage.Objects.SLZ_Staircase.Hitboxes["2"].Image = ""
			ReplicatedStorage.Objects.SLZ_Staircase.Hitboxes["3"].Image = ""
			ReplicatedStorage.Objects.SLZ_Staircase.Hitboxes["4"].Image = ""
			ReplicatedStorage.Objects.SLZ_Staircase.Delete["1"].Image = ""
			ReplicatedStorage.Objects.SLZ_Staircase.Delete["2"].Image = ""
			ReplicatedStorage.Objects.SLZ_Staircase.Delete["3"].Image = ""
			ReplicatedStorage.Objects.SLZ_Staircase.Delete["4"].Image = ""
		end
	end)
	local Toggle = Tabs.Visual:AddToggle("MyToggle", {Title = "Load Emerald Hill Objects", Default = false })
	Toggle:OnChanged(function(ToggleVis9)
		if ToggleVis9 == true then
			funcs.PlaySound("Ring")
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["1"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["2"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["3"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["4"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["5"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["6"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["7"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["8"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["1"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["2"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["3"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["4"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["5"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["6"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["7"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["8"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["9"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["10"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["1"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["2"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["3"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["4"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["5"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["6"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["7"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["8"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["9"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["10"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["11"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["12"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["1"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["2"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["3"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["4"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["5"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["6"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["7"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["8"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["9"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["10"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["11"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["12"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["13"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["14"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["15"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["16"].Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Bridge_Support.Sprite.Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Platform.Sprite.Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Platform_Moving_H.Delete.Sprite.Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Platform_Moving_H.Sprite.Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Platform_Moving_V.Delete.Sprite.Image = "rbxassetid://8626969813"
			ReplicatedStorage.Objects.EHZ_Platform_Moving_V.Sprite.Image = "rbxassetid://8626969813"
		end
		if ToggleVis9 == false then
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_08.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["9"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_10.Upboxes["10"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["9"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["10"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["11"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_12.Upboxes["12"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["9"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["10"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["11"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["12"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["13"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["14"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["15"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_16.Upboxes["16"].Image = ""
			ReplicatedStorage.Objects.EHZ_Bridge_Support.Sprite.Image = ""
			ReplicatedStorage.Objects.EHZ_Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.EHZ_Platform_Moving_H.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.EHZ_Platform_Moving_H.Sprite.Image = ""
			ReplicatedStorage.Objects.EHZ_Platform_Moving_V.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.EHZ_Platform_Moving_V.Sprite.Image = ""
		end
	end)
    local Toggle = Tabs.Visual:AddToggle("MyToggle", {Title = "Load Test Objects", Default = false })
	Toggle:OnChanged(function(ToggleVis2)
		if ToggleVis2 == true then
			funcs.PlaySound("Ring")
			ReplicatedStorage.Objects.TZ__Block.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block:GetChildren()[3].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block:GetChildren()[2].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block:GetChildren()[4].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block_Breakable:GetChildren()[4].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block_Breakable.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block_Breakable:GetChildren()[2].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block_Breakable:GetChildren()[3].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block_Breakable_Broken.Upboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block_Breakable_Broken.Upboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block_Breakable_Broken.Upboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block_Breakable_Broken.Upboxes["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Block_Pushable.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["8"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["8"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["8"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["8"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["8"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["9"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["10"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["11"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["12"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bumper.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bumper_Moving_H48.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bumper_Moving_H48.Delete.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bumper_Moving_V48.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bumper_Moving_V48.Delete.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Hitboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Hitboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Hitboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Delete:GetChildren()[2].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Delete.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["8"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["8"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__FireWall_H.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__GlassBumper.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Cork.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__CrushingPillar.Delete.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__CrushingPillar.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Bumper_D128.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Bumper_D256.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Bumper_R128.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Bumper_R256.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Collapse.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Moving_H.Delete.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Moving_H.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Moving_V.Delete.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Moving_V.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4.Hitboxes.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4.Delete.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL.Hitboxes.PlatformConveyor.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL.Delete.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR.Hitboxes.PlatformConveyor.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR.Delete.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6.Hitboxes.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6.Delete.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL.Hitboxes.PlatformConveyor.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL.Delete.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR.Hitboxes.PlatformConveyor.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR.Delete.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8.Hitboxes.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8.Delete.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["8"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["9"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL.Hitboxes.PlatformConveyor.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL.Delete.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["8"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["9"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR.Hitboxes.PlatformConveyor.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR.Delete.Platform.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["5"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["6"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["7"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["8"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["9"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__PointTargetH.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__PointTargetH2.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__PointTargetH3.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__PointTargetV.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__PointTargetV2.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__PointTargetV3.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Rock.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Rock_Breakable_T.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Rock_Flying.Sprite.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase.Hitboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase.Hitboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase.Hitboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase.Hitboxes["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase.Delete["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase.Delete["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase.Delete["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase.Delete["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1004.Hitboxes:GetChildren()[2].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1004.Hitboxes.ImageLabel.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1234.Hitboxes:GetChildren()[4].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1234.Hitboxes.ImageLabel.Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1234.Hitboxes:GetChildren()[2].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1234.Hitboxes:GetChildren()[3].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__WaterfallHi_128X128.Upboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__WaterfallHi_128X128.Upboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__WaterfallHi_128X128.Upboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__WaterfallHi_128X128.Upboxes["4"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__WaterfallLo_128X128.Upboxes["1"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__WaterfallLo_128X128.Upboxes["2"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__WaterfallLo_128X128.Upboxes["3"].Image = "rbxassetid://105235464590461"
			ReplicatedStorage.Objects.TZ__WaterfallLo_128X128.Upboxes["4"].Image = "rbxassetid://105235464590461"
		end
		if ToggleVis2 == false then
			ReplicatedStorage.Objects.TZ__Block.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Block:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.TZ__Block:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.TZ__Block:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.TZ__Block_Breakable:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.TZ__Block_Breakable.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Block_Breakable:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.TZ__Block_Breakable:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.TZ__Block_Breakable_Broken.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Block_Breakable_Broken.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Block_Breakable_Broken.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Block_Breakable_Broken.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Block_Pushable.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Left.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Middle.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Breakable_Wall_Right.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_08.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["9"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["10"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["11"].Image = ""
			ReplicatedStorage.Objects.TZ__Bridge_12.Upboxes["12"].Image = ""
			ReplicatedStorage.Objects.TZ__Bumper.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Bumper_Moving_H48.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Bumper_Moving_H48.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Bumper_Moving_V48.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Bumper_Moving_V48.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Hitboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Hitboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Hitboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.TZ__Bumper_Rotating_3064.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Collapsing_Bridge2.Upboxes["8"].Image = ""
			ReplicatedStorage.Objects.TZ__FireWall_H.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__GlassBumper.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Cork.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__CrushingPillar.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__CrushingPillar.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Bumper_D128.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Bumper_D256.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Bumper_R128.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Bumper_R256.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Collapse.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Moving_H.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Moving_H.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Moving_V.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Moving_V.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL.Hitboxes.PlatformConveyor.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CL["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR.Hitboxes.PlatformConveyor.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_4CR["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL.Hitboxes.PlatformConveyor.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CL["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR.Hitboxes.PlatformConveyor.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_6CR["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8.Hitboxes.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["8"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8["9"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL.Hitboxes.PlatformConveyor.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["8"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CL["9"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR.Hitboxes.PlatformConveyor.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["5"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["6"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["7"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["8"].Image = ""
			ReplicatedStorage.Objects.TZ__Platform_Swinging_8CR["9"].Image = ""
			ReplicatedStorage.Objects.TZ__PointTargetH.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__PointTargetH2.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__PointTargetH3.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__PointTargetV.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__PointTargetV2.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__PointTargetV3.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Rock.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Rock_Breakable_T.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Rock_Flying.Sprite.Image = ""
			ReplicatedStorage.Objects.TZ__Staircase.Hitboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Staircase.Hitboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Staircase.Hitboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Staircase.Hitboxes["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Staircase.Delete["1"].Image = ""
			ReplicatedStorage.Objects.TZ__Staircase.Delete["2"].Image = ""
			ReplicatedStorage.Objects.TZ__Staircase.Delete["3"].Image = ""
			ReplicatedStorage.Objects.TZ__Staircase.Delete["4"].Image = ""
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1004.Hitboxes:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1004.Hitboxes.ImageLabel.Image = ""
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1234.Hitboxes:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1234.Hitboxes.ImageLabel.Image = ""
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1234.Hitboxes:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.TZ__Staircase_Rotating_1234.Hitboxes:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.TZ__WaterfallHi_128X128.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__WaterfallHi_128X128.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__WaterfallHi_128X128.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__WaterfallHi_128X128.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.TZ__WaterfallLo_128X128.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.TZ__WaterfallLo_128X128.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.TZ__WaterfallLo_128X128.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.TZ__WaterfallLo_128X128.Upboxes["4"].Image = ""
		end
	end)
    local Toggle = Tabs.Visual:AddToggle("MyToggle", {Title = "Load Mystic Cave Objects", Default = false })
	Toggle:OnChanged(function(ToggleVis10)
		if ToggleVis10 == true then
			funcs.PlaySound("Ring")
			ReplicatedStorage.Objects.MCZ_Block.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["6"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Crate.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes:GetChildren()[3].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes:GetChildren()[2].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_CrushingPillar.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4.Hitboxes.Platform.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4.Leaf.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6.Hitboxes.Platform.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["6"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["7"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6.Leaf.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8.Hitboxes.Platform.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["6"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["7"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["8"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["9"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8.Leaf.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4.Hitboxes.Platform.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4.Leaf.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6.Hitboxes.Platform.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["6"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["7"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6.Leaf.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8.Hitboxes.Platform.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["6"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["7"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["8"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["9"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8.Leaf.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H080.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H144.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H208.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes:GetChildren()[2].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes:GetChildren()[2].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_SpikeTrap.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_40.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_40["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_40["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_40["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_40["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_41.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_41["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_41["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_41["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_41["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_42.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_42["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_42["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_42["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_42["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_43.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_43["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_43["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_43["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_43["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_44.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_44["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_44["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_44["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_44["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_45.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_45["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_45["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_45["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_45["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["6"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["6"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["6"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["6"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["6"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65.Hitboxes.Hurt.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["1"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["2"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["3"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["4"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["5"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["6"].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever.Main.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever:GetChildren()[7].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever:GetChildren()[4].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever.Vine.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever:GetChildren()[5].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever:GetChildren()[6].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever:GetChildren()[3].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever.Main.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever:GetChildren()[7].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever:GetChildren()[4].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever.Vine.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever:GetChildren()[5].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever:GetChildren()[6].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever:GetChildren()[3].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4.Delete:GetChildren()[2].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6.Delete:GetChildren()[2].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8.Delete:GetChildren()[2].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4.Delete.Platform.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6.Delete:GetChildren()[2].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8.Delete:GetChildren()[2].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_SpikeTrap.Delete.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_CrushingPillar.Delete.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H080.Delete.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H144.Delete.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H208.Delete.Sprite.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete:GetChildren()[2].Main.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete:GetChildren()[2].Vine.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete.Lever.Main.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete.Lever:GetChildren()[4].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete.Lever.Vine.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete.Lever:GetChildren()[3].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete:GetChildren()[2].Main.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete:GetChildren()[2].Vine.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete.Lever.Main.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete.Lever:GetChildren()[4].Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete.Lever.Vine.Image = "rbxassetid://122230675903018"
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete.Lever:GetChildren()[3].Image = "rbxassetid://122230675903018"
		end
		if ToggleVis10 == false then
			ReplicatedStorage.Objects.MCZ_Block.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Collapsing_Bridge.Upboxes["6"].Image = ""
			ReplicatedStorage.Objects.MCZ_Crate.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MCZ_CrushingPillar.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4.Hitboxes.Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4.Leaf.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6.Hitboxes.Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["6"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6["7"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6.Leaf.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8.Hitboxes.Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["6"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["7"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["8"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8["9"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8.Leaf.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4.Hitboxes.Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4.Leaf.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6.Hitboxes.Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["6"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6["7"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6.Leaf.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8.Hitboxes.Platform.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["6"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["7"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["8"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8["9"].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8.Leaf.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H080.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H144.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H208.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Rotating_Crates.Hitboxes:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MCZ_SpikeTrap.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_40.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_40["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_40["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_40["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_40["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_41.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_41["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_41["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_41["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_41["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_42.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_42["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_42["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_42["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_42["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_43.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_43["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_43["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_43["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_43["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_44.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_44["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_44["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_44["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_44["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_45.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_45["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_45["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_45["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_45["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_60["6"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_61["6"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_62["6"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_63["6"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_64["6"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65.Hitboxes.Hurt.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["1"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["2"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["3"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["4"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["5"].Image = ""
			ReplicatedStorage.Objects.MCZ_Spikeball_Chain_65["6"].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever.Main.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever:GetChildren()[7].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever.Vine.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Hitboxes.Lever:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever.Main.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever:GetChildren()[7].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever.Vine.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever:GetChildren()[5].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever:GetChildren()[6].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Hitboxes.Lever:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_4.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_6.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing2_8.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__4.Delete.Platform.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__6.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Halfswing__8.Delete:GetChildren()[2].Image = ""
			ReplicatedStorage.Objects.MCZ_SpikeTrap.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_CrushingPillar.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H080.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H144.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Platform_Moving_H208.Delete.Sprite.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete:GetChildren()[2].Main.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete:GetChildren()[2].Vine.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete.Lever.Main.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete.Lever:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete.Lever.Vine.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_D.Delete.Lever:GetChildren()[3].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete:GetChildren()[2].Main.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete:GetChildren()[2].Vine.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete.Lever.Main.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete.Lever:GetChildren()[4].Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete.Lever.Vine.Image = ""
			ReplicatedStorage.Objects.MCZ_Vine_U.Delete.Lever:GetChildren()[3].Image = ""
		end
	end)
	Tabs.Visual:AddParagraph({
		Title = "Local Name Title",
        Content = "Change your name title status"
	})
	Tabs.Visual:AddButton({
		Title = "Player Title",
		Callback = function()
			funcs.PlaySound("spike2")
			game.ReplicatedStorage.Players:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Admin")
			game.ReplicatedStorage.Players[game.Players.LocalPlayer.Name].Admin.Value = "0"
		end 
	})
	Tabs.Visual:AddButton({
		Title = "Dev Zone Title",
		Callback = function()
			funcs.PlaySound("spike2")
			game.ReplicatedStorage.Players:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Admin")
			game.ReplicatedStorage.Players[game.Players.LocalPlayer.Name].Admin.Value = "1"
		end 
	})
	Tabs.Visual:AddButton({
		Title = "Dev Title",
		Callback = function()
			funcs.PlaySound("spike2")
			game.ReplicatedStorage.Players:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Admin")
			game.ReplicatedStorage.Players[game.Players.LocalPlayer.Name].Admin.Value = "3"
		end 
	})
	Tabs.Skins:AddButton({
		Title = "Sonic_S1 To Sonic_S1_Rose",
		Callback = function()
			funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do  
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
						v:WaitForChild("Sprite").Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeIcon.Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://11916868414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://11916868414"
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                            break
                            end
					    end
				    end
			    end
		    end
        end
	})
	Tabs.Skins:AddButton({
		Title = "Sonic_S1 To Sonic_S1_PP",
		Callback = function()
			funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do  
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
						v:WaitForChild("Sprite").Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeIcon.Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://14697104690"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://14697104690"
                            if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                                break
                            end
					    end
				    end
			    end
		    end
        end
	})
	Tabs.Skins:AddButton({
		Title = "Sonic_SCD To Sonic_SCD_Rose",
		Callback = function()
			funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do  
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
						v:WaitForChild("Sprite").Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeIcon.Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://11916949150"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://11916949150"
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                            break
                            end
					    end
				    end
			    end
		    end
        end
	})
	Tabs.Skins:AddButton({
		Title = "Sonic_SCD To Sonic_SCD_PP",
		Callback = function()
			funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do  
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
						v:WaitForChild("Sprite").Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeIcon.Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://14697133708"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://14697133708"
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                            break
                            end
					    end
				    end
			    end
		    end
        end
	})
	Tabs.Skins:AddButton({
		Title = "Sonic_S2 To Sonic_S2_Ashura",
		Callback = function()
			funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do  
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
						v:WaitForChild("Sprite").Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeIcon.Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://8351048024"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://8351048024"
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                            break
                            end
					    end
				    end
			    end
		    end
        end
	})
	Tabs.Skins:AddButton({
		Title = "Sonic_S3 To Sonic_S3_Red",
		Callback = function()
			funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do  
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
						v:WaitForChild("Sprite").Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeIcon.Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://8351050153"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://8351050153"
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                            break
                            end
					    end
				    end
			    end
		    end
        end
	})
	Tabs.Skins:AddButton({
		Title = "Knuckles_S3 To Knuckles_S3_Blue",
		Callback = function()
			funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do  
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
						v:WaitForChild("Sprite").Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeIcon.Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://8713090433"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://8713090433"
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                            break
                            end
					    end
				    end
			    end
		    end
        end
	})
    Tabs.Skins:AddParagraph({
		Title = "ABSG Skins"
	})
    Tabs.Skins:AddButton({
		Title = "Knuckles_S3 To Knuckles_S3_Rival",
		Callback = function()
			funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do  
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
						v:WaitForChild("Sprite").Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeIcon.Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://74363875406477"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://74363875406477"
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                            break
                            end
					    end
				    end
			    end
		    end
        end
	})
    Tabs.Skins:AddButton({
		Title = "Knuckles_S3 To Knuckles_S3_Tikal",
		Callback = function()
			funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do  
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
						v:WaitForChild("Sprite").Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeIcon.Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://123761079084608"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://123761079084608"
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                            break
                            end
					    end
				    end
			    end
		    end
        end
	})
    Tabs.Skins:AddButton({
		Title = "Sonic_S3 To Sonic_S3_Espio",
		Callback = function()
			funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do  
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
						v:WaitForChild("Sprite").Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeIcon.Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://115029377851670"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://115029377851670"
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                            break
                            end
					    end
				    end
			    end
		    end
        end
	})
    Tabs.Skins:AddButton({
		Title = "Sonic_S3 To Sonic_S3_Silver",
		Callback = function()
			funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do  
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name then
						v:WaitForChild("Sprite").Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeIcon.Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://84556288538189"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://84556288538189"
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                            break
                            end
					    end
				    end
			    end
		    end
        end
	})
    Tabs.Skins:AddButton({
		Title = "Tails_S3 To Tails_S3_Ray",
		Callback = function()
	funcs.PlaySound("warp")
        PlrGui:WaitForChild("Game") do
			while wait(0) do
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Game.Backdrop.Main.World.Objects:GetChildren()) do
					if v:FindFirstChild("Player") and v:WaitForChild("Player").Value == game.Players.LocalPlayer.Name and ReplicatedStorage.Players:FindFirstChild(game.Players.LocalPlayer.Name).Character.Value == "Tails_S3" then
						v:WaitForChild("Sprite").Image = "rbxassetid://138533771906414"
                        v:WaitForChild("Tail").Image = "rbxassetid://138533771906414"
                        PlrGui.Game.Backdrop.Main.PlayerList:WaitForChild(game.Players.LocalPlayer.Name).Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter.Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["2"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.LifeCounter["3"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main:WaitForChild("LifeIcon").Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter.Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["1"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["2"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.RingCounter["3"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.Rings.Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.Score.Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter.Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["1"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["2"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["3"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["4"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["5"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["6"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.ScoreCounter["7"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.Time.Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter.Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["\""].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["1"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["2"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["3"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["4"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["5"].Image = "rbxassetid://138533771906414"
						PlrGui.Game.Backdrop.Main.Hud.Main.TimeCounter["6"].Image = "rbxassetid://138533771906414"
                if v:WaitForChild("Sprite"):WaitForChild("Animation").Value == "dead" and v:WaitForChild("Sprite"):WaitForChild("Animation").Value == "drown" then do
                    if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                    if game.Players.LocalPlayer.PlayerGui:WaitForChild("CustomLevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelSelect") and game.Players.LocalPlayer.PlayerGui:WaitForChild("LevelCreator") then
                        break
                    end
                    end
                end
			end
		        end
            end
	    end
            end
        end
	})
	Tabs.Skins:AddParagraph({
		Title = "Admin Skins"
	})
	local AdminCharaToggle1 = Tabs.Skins:AddToggle("AdminCharaToggle1", {Title = "Sonic_SCD To Sonic_EXE", Default = false })
	AdminCharaToggle1:OnChanged(function(AdminCharaToggle1)
		if AdminCharaToggle1 == true then
			funcs.PlaySound("pop")
            ReplicatedStorage.Objects["Sonic_SCD"].Sprite.Image = "rbxassetid://8351052419"
		end
		if AdminCharaToggle1 == false then
    		ReplicatedStorage.Objects["Sonic_SCD"].Sprite.Image = "rbxassetid://108504600343511"
		end
	end)
	local AdminCharaToggle2 = Tabs.Skins:AddToggle("AdminCharaToggle2", {Title = "Dr_Robotnik To Baldi", Default = false })
	AdminCharaToggle2:OnChanged(function(AdminCharaToggle2)
		if AdminCharaToggle2 == true then
			funcs.PlaySound("pop")
			ReplicatedStorage.Objects.Dr_Robotnik.Sprite.Image = "rbxassetid://8351074422"
			ReplicatedStorage.Animations["Baldi"].Name = "Dr_Robotnik"
			ReplicatedStorage.Animations["Dr_Robotnik"].Name = "Baldi"
		end
		if AdminCharaToggle2 == false then
			ReplicatedStorage.Objects.Dr_Robotnik.Sprite.Image = "rbxassetid://8351086842"
			ReplicatedStorage.Animations["Dr_Robotnik"].Name = "Baldi"
			ReplicatedStorage.Animations["Baldi"].Name = "Dr_Robotnik"
		end
	end)
	local AdminCharaToggle3 = Tabs.Skins:AddToggle("AdminCharaToggle3", {Title = "Shadow_S3 To Mushroom_Orange", Default = false })
	AdminCharaToggle3:OnChanged(function(AdminCharaToggle3)
		if AdminCharaToggle3 == true then 
			funcs.PlaySound("pop")
			ReplicatedStorage.Objects["Mushroom_Orange"].Name = "Shadow_S3"
			ReplicatedStorage.Objects["Shadow_S3"].Name = "Mushroom_Orange"
			ReplicatedStorage.Animations["Mushroom_Orange"].Name = "Shadow_S3"
			ReplicatedStorage.Animations["Shadow_S3"].Name = "Mushroom_Orange"
		end
		if AdminCharaToggle3 == false then
			ReplicatedStorage.Objects["Shadow_S3"].Name = "Mushroom_Orange"
			ReplicatedStorage.Objects["Mushroom_Orange"].Name = "Shadow_S3"
			ReplicatedStorage.Animations["Shadow_S3"].Name = "Mushroom_Orange"
			ReplicatedStorage.Animations["Mushroom_Orange"].Name = "Shadow_S3"
		end
	end)
	
	Tabs.Info:AddParagraph({
		Title = "Many thanks to Gamer_Player for correcting the script in past versions!",
        Content = "You're no longer a developer, you're a memory, I won't forget you"
	})
	Tabs.Info:AddParagraph({
		Title = "Version 21426-8 'Developer Build'",
		Content = "From Classic Sonic Simulator V13.2 - V13.3"
	})
	Tabs.Info:AddParagraph({
		Title = "Developer Of Script",
		Content = "EnGenie"
	})
	Tabs.Info:AddParagraph({
		Title = "Editor Of This Version",
		Content = "LL3YTz."
	})

	Tabs.Info:AddParagraph({
		Title = "Name Of Script UI",
		Content = "Fluent-Plus-Updated"
	})
	
	Tabs.HotScripts:AddButton({
		Title = "Open Dex Explorer",
		Callback = function()
			funcs.PlaySound("lshieldget")
			loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua", true))()
		end 
	})

	Tabs.HotScripts:AddButton({
		Title = "Open Infinite Yield",
		Callback = function()
			funcs.PlaySound("lshieldget")
			loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
		end 
	})
	
	
	local Dropdown67 = Tabs.Settings:AddDropdown("Dropdown67", {
		Title = "Select Image",
		Values = {"Sonic", "Tails", "Knuckles"},
		Multi = false,
		Default = "Sonic",
	})

	Dropdown67:OnChanged(function(UIImage)
	end)
    Tabs.Settings:AddButton({
		Title = "Change Image",
		Callback = function()
    	    if UIImage == "Sonic" then
                UIImg = "rbxassetid://120605334883359"
            elseif UIImage == "Tails" then
                UIImg = "rbxassetid://73132913357853"
            elseif UIImage == "Knuckles" then
                UIImg = "rbxassetid://112198605633307"
        end
    end
})
	-- Addons:
	-- SaveManager (Allows you to have a configuration system)
	-- InterfaceManager (Allows you to have a interface managment system)

	-- Hand the library over to our managers
	SaveManager:SetLibrary(Library)
	InterfaceManager:SetLibrary(Library)

	-- Ignore keys that are used by ThemeManager.
	-- (we dont want configs to save themes, do we?)
	SaveManager:IgnoreThemeSettings()

	-- You can add indexes of elements the save manager should ignore
	SaveManager:SetIgnoreIndexes{}

	-- use case for doing it this way:
	-- a script hub could have themes in a global folder
	-- and game configs in a separate folder per game
	InterfaceManager:SetFolder("FluentScriptHub")
	SaveManager:SetFolder("FluentScriptHub/specific-game")

	InterfaceManager:BuildInterfaceSection(Tabs.Settings)
	SaveManager:BuildConfigSection(Tabs.Settings)


	Window:SelectTab(1)

	-- You can use the SaveManager:LoadAutoloadConfig() to load a config
	-- which has been marked to be one that auto loads!
	SaveManager:LoadAutoloadConfig()
	Library:Notify{
		Title = "CSS GENIE",
		Content = "Script Loaded!",
		Duration = 4
	}
end
