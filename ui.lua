local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local lastTime = tick()
local function getFPS()
	local currentTime = tick()
	local deltaTime = currentTime - lastTime
	local fps = 1 / deltaTime
	lastTime = currentTime
	wait(1)
	return fps
end
local lib = {
	vars = {}
}

function lib:init(tb)
	local name = tb.name or "???"
	local ver = tb.ver or "not provided"
	local user = tb.user or game:GetService("Players").LocalPlayer.Name
	local gamename = tb.gamename or game.Name
	local watermark = {
		params = {
			name = true,
			user = true,
			ver = true,
			fps = false,
			ping = false,
			gamename = false
		},
		text = "",
	}
	local base = {}
	base["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
	base["1"]["Name"] = [[screengui]]
	base["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	base["1"]["IgnoreGuiInset"] = true


	base["scale"] = Instance.new("UIScale", base["1"])

	base["2"] = Instance.new("Frame", base["1"]);
	base["2"]["ZIndex"] = 2;
	base["2"]["BorderSizePixel"] = 0;
	base["2"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
	base["2"]["Size"] = UDim2.new(0, 560, 0, 400);
	base["2"]["Position"] = UDim2.new(0, 399, 0, 202);
	base["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	base["2"]["Name"] = [[ui]];
	local gui = base["2"]
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

	base["3"] = Instance.new("UICorner", base["2"]);
	base["3"]["Name"] = [[uicorner]];
	base["3"]["CornerRadius"] = UDim.new(0, 4);

	base["4"] = Instance.new("Frame", base["2"]);
	base["4"]["BorderSizePixel"] = 0;
	base["4"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
	base["4"]["Size"] = UDim2.new(0, 544, 0, 32);
	base["4"]["Position"] = UDim2.new(0, 8, 0, 360);
	base["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	base["4"]["Name"] = [[bottom]];

	base["5"] = Instance.new("UICorner", base["4"]);
	base["5"]["Name"] = [[uicorner]];
	base["5"]["CornerRadius"] = UDim.new(0, 4);

	base["6"] = Instance.new("TextLabel", base["4"]);
	base["6"]["BorderSizePixel"] = 0;
	base["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	base["6"]["TextSize"] = 16;
	base["6"]["FontFace"] = Font.new([[rbxassetid://11702779409]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
	base["6"]["TextColor3"] = Color3.fromRGB(194, 164, 164);
	base["6"]["BackgroundTransparency"] = 1;
	base["6"]["Size"] = UDim2.new(0, 80, 0, 32);
	base["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	base["6"]["Text"] = [[rojunkies]];
	base["6"]["Name"] = [[label]];

	base["7"] = Instance.new("UIStroke", base["4"]);
	base["7"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	base["7"]["Name"] = [[uistroke]];
	base["7"]["Color"] = Color3.fromRGB(131, 111, 111);

	base["8"] = Instance.new("Frame", base["4"]);
	base["8"]["BorderSizePixel"] = 0;
	base["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	base["8"]["Size"] = UDim2.new(0, 464, 0, 32);
	base["8"]["Position"] = UDim2.new(0, 80, 0, 0);
	base["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	base["8"]["Name"] = [[tabbuttlist]];
	base["8"]["BackgroundTransparency"] = 1;

	base["9"] = Instance.new("UIListLayout", base["8"]);
	base["9"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
	base["9"]["Padding"] = UDim.new(0, 8);
	base["9"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
	base["9"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	base["9"]["FillDirection"] = Enum.FillDirection.Horizontal;

	base["1a"] = Instance.new("Frame", base["2"]);
	base["1a"]["BorderSizePixel"] = 0;
	base["1a"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
	base["1a"]["Size"] = UDim2.new(0, 544, 0, 344);
	base["1a"]["Position"] = UDim2.new(0, 8, 0, 8);
	base["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	base["1a"]["Name"] = [[center]];

	base["1b"] = Instance.new("UICorner", base["1a"]);
	base["1b"]["Name"] = [[uicorner]];
	base["1b"]["CornerRadius"] = UDim.new(0, 4);

	base["1c"] = Instance.new("UIStroke", base["1a"]);
	base["1c"]["Name"] = [[uistroke]];
	base["1c"]["Color"] = Color3.fromRGB(131, 111, 111);

	local activetab = nil
	local function changetab(tab)
		activetab[1]["TextColor3"] = Color3.fromRGB(194, 164, 164);
		activetab[1]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		activetab[2]["Visible"] = false
		activetab = tab
		tab[1]["TextColor3"] = Color3.fromRGB(30, 30, 30);
		tab[1]["BackgroundColor3"] = Color3.fromRGB(130, 110, 110);
		tab[2]["Visible"] = true
	end
	local function newtab(name,sections)
		local tab = {}
		lib["vars"][name] = {}

		tab["1"] = Instance.new("TextButton", base["8"]);
		tab["1"]["BorderSizePixel"] = 0;
		tab["1"]["AutoButtonColor"] = false;
		tab["1"]["TextSize"] = 16;
		tab["1"]["TextColor3"] = Color3.fromRGB(194, 164, 164);
		tab["1"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		tab["1"]["FontFace"] = Font.new([[rbxassetid://11702779409]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
		tab["1"]["Size"] = UDim2.new(0, 108, 0, 24);
		tab["1"]["Name"] = name..[[_tabbut]];
		tab["1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		tab["1"]["Text"] = name;
		
		tab["2"] = Instance.new("UICorner", tab["1"]);
		tab["2"]["Name"] = [[uicorner]];
		tab["2"]["CornerRadius"] = UDim.new(0, 4);

		tab["3"] = Instance.new("UIStroke", tab["1"]);
		tab["3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
		tab["3"]["Name"] = [[uistroke]];
		tab["3"]["Color"] = Color3.fromRGB(131, 111, 111);

		tab["4"] = Instance.new("Frame", base["1a"]);
		tab["4"]["BorderSizePixel"] = 0;
		tab["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		tab["4"]["Size"] = UDim2.new(0, 544, 0, 344);
		tab["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		tab["4"]["Name"] = name..[[_tabframe]];
		tab["4"]["BackgroundTransparency"] = 1;
		tab["1"]["MouseButton1Click"]:Connect(function()
			changetab({tab["1"],tab["4"]})
		end)

		-- StarterGui.screengui.ui.center.visual_tabframe.left_sideframe
		tab["left"] = Instance.new("ScrollingFrame", tab["4"]);
		tab["left"]["Active"] = true;
		tab["left"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
		tab["left"]["BorderSizePixel"] = 0;
		tab["left"]["CanvasSize"] = UDim2.new(0, 0, 1, -2);
		tab["left"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		tab["left"]["Name"] = [[left_sideframe]];
		tab["left"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
		tab["left"]["Size"] = UDim2.new(0, 272, 0, 344);
		tab["left"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		tab["left"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		tab["left"]["ScrollBarThickness"] = 0;
		tab["left"]["BackgroundTransparency"] = 1;

        tab["6"] = Instance.new("UIListLayout", tab["left"]);
		tab["6"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		tab["6"]["Padding"] = UDim.new(0, 8);
		tab["6"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		tab["6"]["Name"] = [[uilistlayout]];

		tab["right"] = Instance.new("ScrollingFrame", tab["4"]);
		tab["right"]["Active"] = true;
		tab["right"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
		tab["right"]["BorderSizePixel"] = 0;
		tab["right"]["CanvasSize"] = UDim2.new(0, 0, 1, -2);
        tab["right"]["Position"] = UDim2.new(0.5, 0, 0, 0);
		tab["right"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		tab["right"]["Name"] = [[right_sideframe]];
		tab["right"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
		tab["right"]["Size"] = UDim2.new(0, 272, 0, 344);
		tab["right"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		tab["right"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		tab["right"]["ScrollBarThickness"] = 0;
		tab["right"]["BackgroundTransparency"] = 1;

		tab["8"] = Instance.new("UIListLayout", tab["right"]);
		tab["8"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		tab["8"]["Padding"] = UDim.new(0, 8);
		tab["8"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		tab["8"]["Name"] = [[uilistlayout]];

        tab["9"] = Instance.new("UIPadding", tab["left"]);
        tab["9"]["PaddingTop"] = UDim.new(0, 8);
        tab["9"]["PaddingBottom"] = UDim.new(0, 8);

        tab["1a"] = Instance.new("UIPadding", tab["right"]);
        tab["1a"]["PaddingTop"] = UDim.new(0, 8);
        tab["1a"]["PaddingBottom"] = UDim.new(0, 8);

		if activetab == nil then
			activetab = {tab["1"],tab["4"]}
			tab["1"]["TextColor3"] = Color3.fromRGB(30, 30, 30);
			tab["1"]["BackgroundColor3"] = Color3.fromRGB(130, 110, 110);
		end
        for name,section in pairs(sections) do
            local section = section or {side=nil}
            if section.side ~= nil then
                section["1"] = Instance.new("Frame", tab[section.side]);
                section["1"]["BorderSizePixel"] = 0;
                section["1"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
                section["1"]["AutomaticSize"] = Enum.AutomaticSize.Y;
                section["1"]["Size"] = UDim2.new(0, 236, 0, 280);
                section["1"]["Position"] = UDim2.new(0, 18, 0, 0);
                section["1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                section["1"]["Name"] = name..[[_section]];


                -- StarterGui.screengui.ui.center.visual_tabframe.left_sideframe.world_section.uistroke
                section["2"] = Instance.new("UIStroke", section["1"]);
                section["2"]["Name"] = [[uistroke]];
                section["2"]["Color"] = Color3.fromRGB(131, 111, 111);


                -- StarterGui.screengui.ui.center.visual_tabframe.left_sideframe.world_section.uicorner
                section["3"] = Instance.new("UICorner", section["1"]);
                section["3"]["Name"] = [[uicorner]];
                section["3"]["CornerRadius"] = UDim.new(0, 4);


                -- StarterGui.screengui.ui.center.visual_tabframe.left_sideframe.world_section.section_name
                section["4"] = Instance.new("TextLabel", section["1"]);
                section["4"]["BorderSizePixel"] = 0;
                section["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                section["4"]["TextSize"] = 14;
                section["4"]["FontFace"] = Font.new([[rbxassetid://11702779409]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
                section["4"]["TextColor3"] = Color3.fromRGB(194, 164, 164);
                section["4"]["BackgroundTransparency"] = 1;
                section["4"]["AnchorPoint"] = Vector2.new(1, 1);
                section["4"]["Size"] = UDim2.new(0, 236, 0, 24);
                section["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                section["4"]["Text"] = name;
                section["4"]["LayoutOrder"] = -999999999;
                section["4"]["Name"] = [[section_name]];
                section["4"]["Position"] = UDim2.new(0, 236, 0, 24);


                -- StarterGui.screengui.ui.center.visual_tabframe.left_sideframe.world_section.section_name.Frame
                section["5"] = Instance.new("Frame", section["4"]);
                section["5"]["BorderSizePixel"] = 0;
                section["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                section["5"]["Size"] = UDim2.new(0, 236, 0, 0);
                section["5"]["Position"] = UDim2.new(0, 0, 0, 23);
                section["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


                -- StarterGui.screengui.ui.center.visual_tabframe.left_sideframe.world_section.section_name.Frame.UIStroke
                section["6"] = Instance.new("UIStroke", section["5"]);
                section["6"]["Color"] = Color3.fromRGB(131, 111, 111);


                -- StarterGui.screengui.ui.center.visual_tabframe.left_sideframe.world_section.elemenlistframe
                section["7"] = Instance.new("Frame", section["1"]);
                section["7"]["BorderSizePixel"] = 0;
                section["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                section["7"]["AutomaticSize"] = Enum.AutomaticSize.Y;
                section["7"]["Size"] = UDim2.new(0, 236, 0, 252);
                section["7"]["Position"] = UDim2.new(0, 0, 0, 1);
                section["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                section["7"]["Name"] = [[elemenlistframe]];
                section["7"]["BackgroundTransparency"] = 1;


                -- StarterGui.screengui.ui.center.visual_tabframe.left_sideframe.world_section.elemenlistframe.uilistlayout
                section["8"] = Instance.new("UIListLayout", section["7"]);
                section["8"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
                section["8"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
                section["8"]["Name"] = [[uilistlayout]];

                -- StarterGui.screengui.ui.center.visual_tabframe.left_sideframe.world_section.elemenlistframe.UIPadding
                section["9"] = Instance.new("UIPadding", section["1"]);
                section["9"]["PaddingBottom"] = UDim.new(0, 8);

            else
                print("[rojunkies] no section side? tab: "..name)
            end
        end
	end

	for i,v in pairs(tb.tree) do
		newtab(i,v)
	end

	if tb["watermark"] == true then
		watermark["1"] = Instance.new("Frame", base["1"])
		watermark["1"]["ZIndex"] = 2
		watermark["1"]["BorderSizePixel"] = 0
		watermark["1"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
		watermark["1"]["AnchorPoint"] = Vector2.new(1, 0)
		watermark["1"]["AutomaticSize"] = Enum.AutomaticSize.X
		watermark["1"]["Size"] = UDim2.new(0, 0, 0, 24)
		watermark["1"]["Position"] = UDim2.new(1, -65, 0, 8)
		watermark["1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		watermark["1"]["Name"] = [[watermark]]

		watermark["2"] = Instance.new("UICorner", watermark["1"])
		watermark["2"]["Name"] = [[uicorner]]
		watermark["2"]["CornerRadius"] = UDim.new(0, 4)

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
		function updateWatermark()
			if watermark["1"]["Position"]["X"]["Offset"] < -workspace.CurrentCamera.ViewportSize.X/2 then
				watermark["1"]["AnchorPoint"] = Vector2.new(0, 0)
				watermark["3"]["TextXAlignment"] = Enum.TextXAlignment.Left
			else
				watermark["1"]["AnchorPoint"] = Vector2.new(1, 0)
				watermark["3"]["TextXAlignment"] = Enum.TextXAlignment.Right
			end

			local text = [[<font color="#c1a3a3">rojunkies</font>]]
			if watermark.params.user then
				text = text .. string.format([[ | <font color="#828282">user:</font> <font color="#c1a3a3">%s</font>]], user)
			end
			if watermark.params.ver then
				text = text .. [[ | <font color="#828282">version:</font> <font color="#c1a3a3">]] .. ver .. [[</font>]]
			end
			if watermark.params.fps then
				local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
				text = text .. string.format([[ | <font color="#828282">fps:</font> <font color="#c1a3a3">%s</font>]], fps)
			end
			if watermark.params.ping then
				text = text .. string.format([[ | <font color="#828282">ping:</font> <font color="#c1a3a3">%s</font>]], math.floor(game.Stats.PerformanceStats.Ping:GetValue()))
			end
			if watermark.params.gamename then
				text = text .. string.format([[ | <font color="#828282">game:</font> <font color="#c1a3a3">%s</font>]], gamename)
			end
			watermark["3"].Text = text
		end
		local gui = watermark["1"]
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
		updateWatermark()
	end)
	return base
end

-- return lib

local window = lib:init({
	name = "rojunkies", -- display project name
	ver = "debug", -- version of project
	user = "shitcodeboy", -- username
	gamename = "baseplate", -- if no gamename, then "Game"
	watermark = true,
	tree = {
		["tab 1"] = {
			["section 1"] = {
				side = "left",
				elements = {
					["toggle 1 "] = {
						var = "toggle 1",
						defval = false,
						callback = function(var)print("toggle value - "..tostring(var))end
					},
				}
			}
		},
		["settings"] = {
			["config"] = {
				"blalvavl"
			}
		}
	}
})