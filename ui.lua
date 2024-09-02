local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local lastTime = tick()
local function getFPS()
	local currentTime = tick()
	local deltaTime = currentTime - lastTime
	local fps = 1 / deltaTime

	lastTime = currentTime

	return fps
end
local lib = {}

function lib:init(tb)
	local name = tb.name or "???"
	local ver = tb.ver or "not provided"
	local user = tb.user or game:GetService("Players").LocalPlayer.Name
	local gamename = tb.gamename or game.Name
	local base = {}

	base["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
	base["1"]["Name"] = [[screengui]]
	base["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	base["1"]["IgnoreGuiInset"] = true

	local watermark = {
		params = {
			name = true,
			user = true,
			ver = true,
			fps = true,
			ping = true,
			gamename = true
		},
		text = "",
	}

	if tb["watermark"] == true then
		watermark["1"] = Instance.new("Frame", base["1"])
		watermark["1"]["ZIndex"] = 2
		watermark["1"]["BorderSizePixel"] = 0
		watermark["1"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
		watermark["1"]["AnchorPoint"] = Vector2.new(1, 0)
		watermark["1"]["AutomaticSize"] = Enum.AutomaticSize.X
		watermark["1"]["Size"] = UDim2.new(0, 0, 0, 24)
		-- watermark["1"]["Position"] = UDim2.new(0, 1351, 0, 8)
        watermark["1"]["Position"] = UDim2.new(1, -42, 0, 8)
		watermark["1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		watermark["1"]["Name"] = [[watermark]]

		-- UICorner
		watermark["2"] = Instance.new("UICorner", watermark["1"])
		watermark["2"]["Name"] = [[uicorner]]
		watermark["2"]["CornerRadius"] = UDim.new(0, 4)

		-- TextLabel
		watermark["3"] = Instance.new("TextLabel", watermark["1"])
		watermark["3"]["ZIndex"] = -1
		watermark["3"]["BorderSizePixel"] = 0
		watermark["3"]["TextXAlignment"] = Enum.TextXAlignment.Right
		watermark["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		watermark["3"]["TextSize"] = 16
		watermark["3"]["FontFace"] = Font.new([[rbxassetid://11702779409]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
		watermark["3"]["TextColor3"] = Color3.fromRGB(62, 62, 62)
		watermark["3"]["BackgroundTransparency"] = 1
		watermark["3"]["RichText"] = true
		watermark["3"]["Size"] = UDim2.new(0, 0, 0, 24)
		watermark["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		watermark["3"]["AutomaticSize"] = Enum.AutomaticSize.X
		watermark["3"]["Name"] = [[label]]

		watermark["4"] = Instance.new("UIStroke", watermark["1"])
		watermark["4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
		watermark["4"]["Name"] = [[uistroke]]
		watermark["4"]["Color"] = Color3.fromRGB(131, 111, 111)

		watermark["5"] = Instance.new("UIPadding", watermark["1"])
		watermark["5"]["PaddingRight"] = UDim.new(0, 8)
		watermark["5"]["PaddingLeft"] = UDim.new(0, 8)

		local gui = watermark["1"]

		function updateWatermark(a)
			local text = [[<font color="#c1a3a3">rojunkies</font>]]
			if watermark.params.user then
				text = text .. string.format([[ | <font color="#828282">user:</font> <font color="#c1a3a3">%s</font>]], user)
			end
			if watermark.params.ver then
				text = text .. [[ | <font color="#828282">version:</font> <font color="#c1a3a3">]] .. ver .. [[</font>]]
			end
			if watermark.params.fps then
				text = text .. string.format([[ | <font color="#828282">fps:</font> <font color="#c1a3a3">999</font>]], a)
			end
			if watermark.params.ping then
				text = text .. string.format([[ | <font color="#828282">ping:</font> <font color="#c1a3a3">%s</font>]], math.floor(game.Stats.PerformanceStats.Ping:GetValue()))
			end
			if watermark.params.gamename then
				text = text .. string.format([[ | <font color="#828282">game:</font> <font color="#c1a3a3">%s</font>]], gamename)
			end
			watermark["3"].Text = text
		end
		
		-- Перетаскивание
		local dragging
		local dragInput
		local dragStart
		local startPos

		local function update(input)
			local delta = input.Position - dragStart
			gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end

		gui.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if dragging then
				update(input)
			end
		end)
	end
	RunService.Heartbeat:Connect(function()
		local fps = getFPS()
		updateWatermark(fps)
	end)
	return base
end

return lib