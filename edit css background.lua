local BackgroundImage = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.ImageLabel -- Image

local Ug = workspace.Misc.CSS:GetChildren()[3].SurfaceGui.Frame.UIGradient -- Background

local El1 = workspace.Misc.CSS.Part.Beam -- Left background element

local El2 = workspace.Misc.CSS:GetChildren()[4].Beam -- Bottom background element

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
            local imageID = "rbxassetid://77759172272380"
            imageLabel.Position = UDim2.new(0.502, 48, 0.5, 0)
            imageLabel.Size = UDim2.new(0, 128, 0, 128)
            if imageLabel.Image == imageID then
                return
            end
            imageLabel.Image = imageID
