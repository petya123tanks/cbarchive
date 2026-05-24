-- // neroware by desktop (why not desktopissigmaware :sob:)

-- // version: 2.1.6

-- // luraph macros (required)
if not LPH_OBFUSCATED then
    LPH_JIT_MAX = function(...) return ... end;
    LPH_JIT_ULTRA = function(...) return ... end;
    LPH_NO_VIRTUALIZE = function(...) return ... end;
end;

t1 = tick()
local RageTarget 
local players = game:GetService("Players") 
local localPlayer = players.LocalPlayer 
local Players = game:GetService("Players") 
local LocalPlayer = Players.LocalPlayer 
local Vec2 = Vector2.new
local frames_stuff = {}
local ragebot_target = nil
local ragebot_wallbang = false
local Vec3 = Vector3.new
local CF = CFrame.new
local INST = Instance.new
local COL3RGB = Color3.fromRGB
local FLOOR = math.floor
local RANDOM = math.random
local MIN = math.min
local LEN = string.len
local SUB = string.sub
local RAY = Ray.new
local INSERT = table.insert
local TBLFIND = table.find
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local mouse = game.Players.LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local fps
local killls
local health
local speed
local localPlayer = game.Players.LocalPlayer
local Players = game:service'Players'
local score
local runService = game:service'RunService'
local UserInputService = game:GetService('UserInputService')
local camera = workspace.CurrentCamera
local Client = getsenv(game.Players.LocalPlayer.PlayerGui.Client)
local client = getsenv(localPlayer.PlayerGui.Client)

local oldSkybox
 
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local ts = game:GetService("TweenService")
local plrs = game:GetService("Players")
local cas = game:GetService("ContextActionService")
local stats = game:GetService("Stats")
local utility = {}
local lplr = game.Players.LocalPlayer
local othershit = Instance.new("Folder", workspace)
local ftfolder = Instance.new("Folder", workspace)
local btfolder = Instance.new("Folder", workspace)

-- Functions start[
local function IsAlive(player)
    if player and player.Character and player.Character.FindFirstChild(player.Character, "Humanoid") and player.Character.Humanoid.Health > 0 then
        return true
    end

    return false -- hallo nigger
end
-- // utility
local utility = {}

   properties = properties or {}

    function utility:RoundVector(vector)
        return Vector2.new(math.floor(vector.X), math.floor(vector.Y))
    end
    function utility:Connect(connection, func)
        local con = connection:Connect(func)
        table.insert(library.connections, con)
        return con
    end

    function utility:BindToRenderStep(name, priority, func)
        local fake_connection = {}

        function fake_connection:Disconnect()
            rs:UnbindFromRenderStep(name)
        end

        rs:BindToRenderStep(name, priority, func)

        return fake_connection
    end

    function utility:Combine(t1, t2)
        local t3 = {}
        for i, v in pairs(t1) do
            table.insert(t3, v)
        end
        for i, v in pairs(t2) do
            table.insert(t3, v)
        end
        return t3
    end


    function utility:RemoveItem(tbl, item)
        local newtbl = {}
        for i, v in pairs(tbl) do
            if v ~= item then
                table.insert(newtbl, v)
            end
        end
        return newtbl
    end

local function CreateThread(func, ...) -- pasted from bbot fr
    local thread = coroutine.create(func)
    coroutine.resume(thread, ...)
    return thread
end

local function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function getDamageMultiplier(p)
    return p.Name:find("Head") and 4 or (p.Name:find("Leg") or p.Name:find("Foot")) and 0.75 or (p.Name:find("Arm") or p.Name:find("Hand") or p.Name == "LowerTorso") and 1 or p.Name == "UpperTorso" and 1.25 or p.Parent == ftfolder and 4 or p.Parent == btfolder and 4 or p.Parent == othershit and 4 or 0
end

function GetPlayerNames()
    local a = plrs:GetPlayers()
    for i, v in pairs(a) do
        a[i] = tostring(v)
    end
    return a
end

function RandomNumberRange(a)
    return math.random(-a, a)
    
end

function RandomVectorRange(a, b, c)
    return Vector3.new(RandomNumberRange(a), RandomNumberRange(b), RandomNumberRange(c))
end

function isAlive(player)
    if player ~= nil and player.Parent == game.Players and player.Character ~= nil then
        if player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") ~= nil and player.Character.Humanoid.Health > 0 and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("UpperTorso") and player.Character:FindFirstChild("LowerTorso") then
            return true
        end
    end
    return false
end
function indexListing(a)
    local b = {}
    for i, v in pairs(a) do
        table.insert(b, i)
    end
    return b
end

local function RotatePlayer(pos)
	local Gyro = Instance.new('BodyGyro')
	Gyro.D = 0
	Gyro.P = (100 * 100)
	Gyro.MaxTorque = Vector3.new(0, (100 * 100), 0)
	Gyro.Parent = game.Players.LocalPlayer.Character.UpperTorso
	Gyro.CFrame = CFrame.new(Gyro.Parent.Position, pos.Position)
	wait()
	Gyro:Destroy()
end

function isTarget(plr, teammates)
    if IsAlive(plr) then
        if not plr.Neutral and not localPlayer.Neutral then
            if teammates == false then
                return plr.Team ~= localPlayer.Team
            elseif teammates == true then
                return plr ~= localPlayer
            end
        else
            return plr ~= localPlayer
        end
    end
end-- pasted fr
-- Functions end]

local nerowareMessagesTable = {
	"hello its me desktop, help me i coded to much 🔥💯",
	"run 1s u jus got 1Tapped 🥶🧊"
}

local russianMessagesTable = {
	"Он использовал лучший Putinhack, аккуратно нажимая на клавиши, что вызвало потрясающие изменения.",
	"Он активировал лучший Bomb Ukraine hack и виртуозно взломал игру, создав ошеломляющий опыт."
}

local chineseMessagesTable = {
	"他使用了Roblox P100 hack，轻轻地点击着游戏，引发了惊人的变化。",
	"他手指在Roblox上轻轻敲击，画出了华丽的华夏字母，仿佛创造了一个全新的世界。"
}

local cheattable = {
	rage = {
		-- main rage
		rage_enabled = false,
		rage_autofire = false,
		rage_autowall = false,
		rage_hitboxes = "Head",
		rage_hitpart = false,
		rage_infdamage = false,
        -- forward track
		rage_fwt = false,
		rage_fwtdistance = 0,
		-- back track
		rage_backtrack = false,
		rage_backtrackms = 0,
		-- custom tap
		rage_customtap = false,
		rage_customtaphits = 1,
        -- hit scan
		rage_hitscan = false,
		rage_hitscanspeed = 100,
		-- antiaim
		antiaim_enabled = false,
		antiaim_pitch = "None",
		antiaim_yaw = "None",
	},
	misc = {
		-- movement (left)
		movement = false,
		bunnyhop = false,
		bunnyhopspeed = 0,
		walkspeed = false,
		walkspeedspeed = 0,
		-- mods (left)
		infcash = false,
		infammo = false,
		infrange = false,
		norecoil = false,
		automatic = false,
		-- camera (right)
		fov = 90,
		removerecoil = false,
		removegunbob = false,
		removevisualsuppresion = false,
		thirdperson = false,
		thirdpersondistance = 6,
		-- viewmodel (right)
		offsetviewmodel = false,
		offset_x = 0,
		offset_y = 0,
		offset_z = 0,
		offset_roll = 0,
		-- other (right)
		killsay = false,
		chatspam = false,
		messagetype = "",
		custommessage = false,
		--
		hitsound = false,
		hitsounds = "",
		customhitsound = "",
		--
		killsound = false,
		killsounds = "",
		customkillsound = "",
	},
}

local hitsounds = {
    ["gamesense"] = "5447626464",
    ["neverlose"] = "6534948092",
	["primordial"] = "11846281136",
	["call of duty"] = "5952120301",
    ["rust headshot"] = "5043539486",
	["custom"] = cheattable.misc.customhitsound,
}

local killsounds = {
    ["gamesense"] = "5447626464",
    ["neverlose"] = "6534948092",
	["primordial"] = "11846281136",
	["call of duty"] = "5952120301",
    ["rust headshot"] = "5043539486",
	["custom"] = cheattable.misc.customkillsound,
}

repeat wait() until game:IsLoaded()
local library = {
	watermark_1 = nil
}

function library:window(text)
	local ScreenGuiWindow = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Top = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local Name = Instance.new("TextLabel")
	local Main2 = Instance.new("Frame")
	local Top_2 = Instance.new("Frame")
	local UIGradient_2 = Instance.new("UIGradient")
	local Main2Inner = Instance.new("Frame")
	local TabHolder = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")

	ScreenGuiWindow.Parent = game.CoreGui
	ScreenGuiWindow.ZIndexBehavior = Enum.ZIndexBehavior.Global

	game:GetService("UserInputService").InputEnded:Connect(function(k)
		if k.KeyCode == Enum.KeyCode.Insert then
			ScreenGuiWindow.Enabled = not ScreenGuiWindow.Enabled
		end
	end)

	if getgenv().uilib then
		getgenv().uilib:Remove()
	end
	getgenv().uilib = ScreenGuiWindow

	Main.Name = text or 'AnihaxxUI'
	Main.Parent = ScreenGuiWindow
	Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Main.BorderColor3 = Color3.fromRGB(37, 37, 37)
	Main.BorderSizePixel = 2
	Main.Position = UDim2.new(0.5, -225, 0.5, -252)
	Main.Size = UDim2.new(0, 450, 0, 505)
	Main.Active = true
	Main.Draggable = true

	Top.Name = "Top"
	Top.Parent = Main
	Top.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
	Top.BorderSizePixel = 0
	Top.Size = UDim2.new(0, 450, 0, 2)

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 145, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(62, 189, 191)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(111, 210, 255))}
	UIGradient.Rotation = 180
	UIGradient.Parent = Top

	Name.Name = "Name"
	Name.Parent = Main
	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.Position = UDim2.new(0.0155555559, 0, 0.00396039616, 0)
	Name.Size = UDim2.new(0, 200, 0, 17)
	Name.Font = Enum.Font.Code
	Name.Text = text
	Name.TextColor3 = Color3.fromRGB(255, 255, 255)
	Name.TextSize = 15.000
	Name.TextStrokeTransparency = 0.500
	Name.TextXAlignment = Enum.TextXAlignment.Left

	Main2.Name = "Main2"
	Main2.Parent = Main
	Main2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Main2.BorderColor3 = Color3.fromRGB(37, 37, 37)
	Main2.BorderSizePixel = 2
	Main2.Position = UDim2.new(0.460000008, -200, 0.5, -232)
	Main2.Size = UDim2.new(0, 436, 0, 477)

	Top_2.Name = "Top"
	Top_2.Parent = Main2
	Top_2.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
	Top_2.Size = UDim2.new(0, 436, 0, 2)

	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 145, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(62, 189, 191)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(111, 210, 255))}
	UIGradient_2.Rotation = 180
	UIGradient_2.Parent = Top_2

	Main2Inner.Name = "Main2Inner"
	Main2Inner.Parent = Main2
	Main2Inner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main2Inner.BackgroundTransparency = 1.000
	Main2Inner.Position = UDim2.new(0, 0, 0.00899999961, 0)
	Main2Inner.Size = UDim2.new(0, 436, 0, 477)

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = Main2Inner
	TabHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TabHolder.BorderSizePixel = 0
	TabHolder.Size = UDim2.new(0, 436, 0, 35)

	UIListLayout.Parent = TabHolder
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UIPadding.Parent = TabHolder
	UIPadding.PaddingLeft = UDim.new(0, 0)

	local Tab = {}
	local TabButtons = 0

	function Tab:tab(text)
		TabButtons = TabButtons + 1
		local tabb = Instance.new("TextButton")
		local Tabs = Instance.new("Frame")
		local TabsContainer = Instance.new("Frame")
		local Left = Instance.new("Frame")
		local LeftLayout = Instance.new("UIListLayout")
		local LeftPadding = Instance.new("UIPadding")
		local Right = Instance.new("Frame")
		local RightLayout = Instance.new("UIListLayout")
		local RightPadding = Instance.new("UIPadding")
		tabb.Parent = TabHolder
		tabb.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		tabb.BorderSizePixel = 0
		tabb.Position = UDim2.new(0, 0, 0, 0)
		tabb.Size = UDim2.new(0, 100, 0, 35)
		tabb.Font = Enum.Font.Code
		tabb.Text = text or "Tab"
		tabb.TextColor3 = Color3.fromRGB(255, 255, 255)
		tabb.TextSize = 14.000
		tabb.TextStrokeTransparency = 0.500

		TabsContainer.Name = "Tabs"
		TabsContainer.Parent = Main2Inner
		TabsContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabsContainer.BackgroundTransparency = 1.000
		TabsContainer.Position = UDim2.new(0.5, -212, 0.5, -210)
		TabsContainer.Size = UDim2.new(0, 425, 0, 421)
		TabsContainer.Visible = false

		Tabs.Name = text
		Tabs.Parent = TabsContainer
		Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tabs.BackgroundTransparency = 1.000
		Tabs.Position = UDim2.new(0.5, -212, 0.535639405, -210)
		Tabs.Size = UDim2.new(0, 425, 0, 421)

		Left.Name = "Left"
		Left.Parent = Tabs
		Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Left.BackgroundTransparency = 1.000
		Left.Size = UDim2.new(0, 212, 0, 421)

		LeftLayout.Name = "LeftLayout"
		LeftLayout.Parent = Left
		LeftLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
		LeftLayout.Padding = UDim.new(0, 10)

		LeftPadding.Name = "LeftPadding"
		LeftPadding.Parent = Left
		LeftPadding.PaddingTop = UDim.new(0, 2)

		Right.Name = "Right"
		Right.Parent = Tabs
		Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Right.BackgroundTransparency = 1.000
		Right.Position = UDim2.new(0.498823524, 0, 0, 0)
		Right.Size = UDim2.new(0, 212, 0, 421)

		RightLayout.Name = "RightLayout"
		RightLayout.Parent = Right
		RightLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
		RightLayout.Padding = UDim.new(0, 10)

		RightPadding.Name = "RightPadding"
		RightPadding.Parent = Right
		RightPadding.PaddingTop = UDim.new(0, 2)

		for i,v in pairs(TabHolder:GetChildren()) do --skidded from m4tt
			if v.ClassName == "TextButton" then
				v.Size = UDim2.new(1/TabButtons,0,0,35)
			end
		end

		tabb.MouseButton1Click:Connect(function() -- skidded from m4tt
			for i,v in pairs(TabHolder:GetChildren()) do
				if v.ClassName == "TextButton" then
					v.BackgroundColor3 = Color3.fromRGB(29,29,29)
				end
			end


			for i,v in pairs(Main2Inner:GetChildren()) do 
				if v.Name == "Tabs" then
					v.Visible = false
				end
			end


			TabsContainer.Visible = true
			tabb.BackgroundColor3 = Color3.fromRGB(20,20,20)
		end)

		local sections = {}
		function sections:section(text, side)
			if side == "Left" then side = Left else side = Right end
			local section = Instance.new("Frame")
			local Top_3 = Instance.new("Frame")
			local UIGradient_3 = Instance.new("UIGradient")
			local SectionName = Instance.new("TextLabel")
			local sectioninner = Instance.new("Frame")
			local Sectioncontainer = Instance.new("Frame")
			local UIListLayout_3 = Instance.new("UIListLayout")

			section.Name = text
			section.Parent = side
			section.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			section.BorderColor3 = Color3.fromRGB(40, 40, 40)
			section.Size = UDim2.new(0, 205, 0, 15)

			Top_3.Name = "Top"
			Top_3.Parent = section
			Top_3.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
			Top_3.BorderSizePixel = 0
			Top_3.Size = UDim2.new(0, 205, 0, 2)

			UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 145, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(62, 189, 191)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(111, 210, 255))}
			UIGradient_3.Rotation = 180
			UIGradient_3.Parent = Top

			SectionName.Name = "SectionName"
			SectionName.Parent = section
			SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionName.BackgroundTransparency = 1.000
			SectionName.Position = UDim2.new(0.013, 0, 0.015, 2)
			SectionName.Size = UDim2.new(0, 205, 0,10)
			SectionName.Font = Enum.Font.Code
			SectionName.Text = text or 'Section'
			SectionName.TextColor3 = Color3.fromRGB(255, 255, 255)
			SectionName.TextSize = 14.000
			SectionName.TextStrokeTransparency = 0.500
			SectionName.TextXAlignment = Enum.TextXAlignment.Left

			sectioninner.Name = "sectioninner"
			sectioninner.Parent = section
			sectioninner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			sectioninner.BackgroundTransparency = 1
			sectioninner.Position = UDim2.new(0, 0, 0, 5)
			sectioninner.Size = UDim2.new(0, 205, 0, 5)

			Sectioncontainer.Name = "Sectioncontainer"
			Sectioncontainer.Parent = sectioninner
			Sectioncontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sectioncontainer.BackgroundTransparency = 1.000
			Sectioncontainer.Position = UDim2.new(0.5, -100, 0.06, 13)
			Sectioncontainer.Size = UDim2.new({1, -8},{1, -14})

			UIListLayout_3.Parent = Sectioncontainer
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_3.Padding = UDim.new(0, 8)


			local func = {}

			function func:button(text, callback)
				section.Size = section.Size + UDim2.new(0,0,0,24)
				sectioninner.Size = sectioninner.Size + UDim2.new(0,0,0,11)

				callback = callback or function() end

				local Button = Instance.new("TextButton")

				Button.Name = text
				Button.Parent = Sectioncontainer
				Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				Button.BorderColor3 = Color3.fromRGB(60, 60, 60)
				Button.Position = UDim2.new(0.5, -97, 0.5, -12)
				Button.Size = UDim2.new(0, 199, 0, 15)
				Button.Font = Enum.Font.Code
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 14.000
				Button.TextStrokeTransparency = 0.500
				Button.Text = text or 'Button'

				Button.MouseButton1Click:connect(function()
					pcall(callback)
				end)
			end

			function func:toggle(text,default,callback)
				section.Size = section.Size + UDim2.new(0,0,0,19)
				sectioninner.Size = sectioninner.Size + UDim2.new(0,0,0,5)

				callback = callback or function() end

				local toggled = default

				local Toggle = Instance.new("TextButton")
				local ToggleText = Instance.new("TextButton")

				Toggle.Name = text
				Toggle.Parent = Sectioncontainer
				Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				Toggle.BorderColor3 = Color3.fromRGB(60, 60, 60)
				Toggle.Position = UDim2.new(0, 0, 0.195402294, 0)
				Toggle.Size = UDim2.new(0, 10, 0, 10)
				Toggle.Font = Enum.Font.SourceSans
				Toggle.Text = ""
				Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.TextSize = 14.000

				ToggleText.Name = text..' Text'
				ToggleText.Parent = Toggle
				ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleText.BackgroundTransparency = 1.000
				ToggleText.Position = UDim2.new(1.62378569, 0, -0.1656666126, 0)
				ToggleText.Size = UDim2.new(0, 181, 0, 12)
				ToggleText.Font = Enum.Font.Code
				ToggleText.Text = text
				ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
				ToggleText.TextSize = 14.000
				ToggleText.TextStrokeTransparency = 0.500
				ToggleText.TextXAlignment = Enum.TextXAlignment.Left

				local function ChangeState(state)
					toggled = state
					Toggle.BackgroundColor3 = toggled and Color3.fromRGB(0, 85, 255) or Color3.fromRGB(50, 50, 50)
					callback(toggled)
				end

				ChangeState(default)

				Toggle.MouseButton1Click:Connect(function()
					ChangeState(not toggled)
				end)

				ToggleText.InputBegan:Connect(
					function(InputObject)
						if InputObject.UserInputType == Enum.UserInputType.MouseButton1 then
							ChangeState(not toggled)
						end
					end)
			end

			function func:slider(text, minval, maxval, callback)
				section.Size = section.Size + UDim2.new(0,0,0,33)
				sectioninner.Size = sectioninner.Size + UDim2.new(0,0,0,5)

				minval = minval or 0
				maxval = maxval or 100

				callback = callback or function() end

				local mouse = game.Players.LocalPlayer:GetMouse()
				local uis = game:GetService("UserInputService")
				local Value;
				local moveconnection
				local releaseconnection

				local Sliderrr = Instance.new("Frame")
				local SliderText = Instance.new("TextLabel")
				local SliderButton = Instance.new("TextButton")
				local DraggablePartSlider = Instance.new("Frame")
				local SliderNumberVal = Instance.new("TextLabel")

				Sliderrr.Name = "Sliderr"
				Sliderrr.Parent = Sectioncontainer
				Sliderrr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Sliderrr.BackgroundTransparency = 1.000
				Sliderrr.Position = UDim2.new(0, 0, 0.314285725, 0)
				Sliderrr.Size = UDim2.new(0, 100, 0, 25)

				SliderText.Name = "SliderText"
				SliderText.Parent = Sliderrr
				SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderText.BackgroundTransparency = 1.000
				SliderText.Position = UDim2.new(0.00492462236, 0, -0.00904759765, 0)
				SliderText.Size = UDim2.new(0, 199, 0, 15)
				SliderText.ZIndex = 500
				SliderText.Font = Enum.Font.Code
				SliderText.Text = text
				SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderText.TextSize = 14.000
				SliderText.TextStrokeTransparency = 0.500
				SliderText.TextXAlignment = Enum.TextXAlignment.Left

				SliderButton.Name = "SliderButton"
				SliderButton.Parent = SliderText
				SliderButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				SliderButton.BorderSizePixel = 0
				SliderButton.Position = UDim2.new(0, 0, 1.04999995, 0)
				SliderButton.Size = UDim2.new(0, 199, 0, 9)
				SliderButton.ZIndex = 501
				SliderButton.Font = Enum.Font.Code
				SliderButton.Text = ""
				SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				SliderButton.TextSize = 14.000

				DraggablePartSlider.Name = "DraggablePartSlider"
				DraggablePartSlider.Parent = SliderButton
				DraggablePartSlider.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
				DraggablePartSlider.BorderSizePixel = 0
				DraggablePartSlider.Size = UDim2.new(0, 0, 0, 9)
				DraggablePartSlider.ZIndex = 502

				SliderNumberVal.Name = "SliderNumberVal"
				SliderNumberVal.Parent = SliderText
				SliderNumberVal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderNumberVal.BackgroundTransparency = 1.000
				SliderNumberVal.Position = UDim2.new(0.00999995135, 0, 1, 0)
				SliderNumberVal.Size = UDim2.new(0, 200, 0, 9)
				SliderNumberVal.ZIndex = 503
				SliderNumberVal.Font = Enum.Font.Code
				SliderNumberVal.Text = minval .. "/" .. maxval
				SliderNumberVal.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderNumberVal.TextSize = 14.000
				SliderNumberVal.TextStrokeTransparency = 0.500

				SliderButton.MouseButton1Down:Connect(function()
					Value = math.floor((((tonumber(maxval) - tonumber(minval)) / 199) * DraggablePartSlider.AbsoluteSize.X) + tonumber(minval)) or 0
					pcall(function()
						callback(Value)
						SliderNumberVal.Text = Value .. "/" .. maxval
					end)
					DraggablePartSlider.Size = UDim2.new(0, math.clamp(mouse.X - DraggablePartSlider.AbsolutePosition.X, 0, 200), 0, 9)
					moveconnection = mouse.Move:Connect(function()
						SliderNumberVal.Text = Value
						Value = math.floor((((tonumber(maxval) - tonumber(minval)) / 199) * DraggablePartSlider.AbsoluteSize.X) + tonumber(minval))
						pcall(function()
							callback(Value)
							SliderNumberVal.Text = Value .. "/" .. maxval
						end)
						DraggablePartSlider.Size = UDim2.new(0, math.clamp(mouse.X - DraggablePartSlider.AbsolutePosition.X, 0, 200), 0, 9)
					end)
					releaseconnection = uis.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							Value = math.floor((((tonumber(maxval) - tonumber(minval)) / 199) * DraggablePartSlider.AbsoluteSize.X) + tonumber(minval))
							pcall(function()
								callback(Value)
								SliderNumberVal.Text = Value .. "/" .. maxval
							end)
							DraggablePartSlider.Size = UDim2.new(0, math.clamp(mouse.X - DraggablePartSlider.AbsolutePosition.X, 0, 199), 0, 9)
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
						end
					end)
				end)
			end

			function func:textbox(text,callback)
				section.Size = section.Size + UDim2.new(0,0,0,24)
				sectioninner.Size = sectioninner.Size + UDim2.new(0,0,0,10)

				callback = callback or function() end

				local textbox = Instance.new("TextBox")

				textbox.Name = text
				textbox.Parent = Sectioncontainer
				textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				textbox.BorderColor3 = Color3.fromRGB(60, 60, 60)
				textbox.Position = UDim2.new(0, 0, 0.508571446, 0)
				textbox.Size = UDim2.new(0, 199, 0, 15)
				textbox.Font = Enum.Font.Code
				textbox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
				textbox.PlaceholderText = text
				textbox.Text = ""
				textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
				textbox.TextSize = 14.000
				textbox.TextStrokeTransparency = 0.500

				local function changeText(value)
					textbox.Text = value
				end

				textbox:GetPropertyChangedSignal('Text'):Connect(function(val)
					pcall(callback(textbox.Text))
				end)
			end

			function func:dropdown(text,multi,list,callback)
				section.Size = section.Size + UDim2.new(0,0,0,41)
				sectioninner.Size = sectioninner.Size + UDim2.new(0,0,0,10)

				local multiselect = {}

				list = list or {}
				text = text or "{@} Dropdown"
				callback = callback or function() end
				multi = multi or false

				local Dropdown  = Instance.new("Frame")
				local DropText  = Instance.new("TextLabel")
				local DropButton = Instance.new("TextButton")
				local DropMark = Instance.new("TextLabel")
				local DropFrame = Instance.new("Frame")

				Dropdown.Name = "dropdown"
				Dropdown.Parent = Sectioncontainer
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.Position = UDim2.new(0, 0, 0.702857137, 0)
				Dropdown.Size = UDim2.new(0, 199, 0, 35)
				Dropdown.ZIndex = 504

				DropText.Name = "dropdowntext"
				DropText.Parent = Dropdown 
				DropText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropText.BackgroundTransparency = 1.000
				DropText.Position = UDim2.new(0.0124746347, 0, 0, 0)
				DropText.Size = UDim2.new(0, 196, 0, 9)
				DropText.Font = Enum.Font.Code
				DropText.Text = text
				DropText.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropText.TextSize = 14.000
				DropText.TextStrokeTransparency = 0.500
				DropText.TextXAlignment = Enum.TextXAlignment.Left
				DropText.ZIndex = 505


				DropButton.Name = "Dropbutton"
				DropButton.Parent = Dropdown 
				DropButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				DropButton.BorderColor3 = Color3.fromRGB(60, 60, 60)
				DropButton.Position = UDim2.new(0, 0, 0.400000006, 0)
				DropButton.Size = UDim2.new(0, 199, 0, 17)
				DropButton.Font = Enum.Font.Code
				DropButton.Text = " ..."
				DropButton.ZIndex = 506

				if multi then DropButton.Text = " ..." end
				DropButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropButton.TextSize = 14.000
				DropButton.TextStrokeTransparency = 0.500
				DropButton.TextXAlignment = Enum.TextXAlignment.Left

				DropMark.Name = "DropdownSymbol"
				DropMark.Parent = Dropdown 
				DropMark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropMark.BackgroundTransparency = 1.000
				DropMark.Position = UDim2.new(0.899497509, 0, 0.400000006, 0)
				DropMark.Size = UDim2.new(0, 21, 0, 21)
				DropMark.Font = Enum.Font.Code
				DropMark.Text = "-"
				DropMark.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropMark.TextSize = 14.000
				DropMark.TextStrokeTransparency = 0.500
				DropMark.ZIndex = 507

				DropButton.MouseButton1Click:Connect(function() 
					DropFrame.Visible = not DropFrame.Visible; DropMark.Text = DropFrame.Visible and "+" or "-";
					DropMark.Size = DropFrame.Visible and UDim2.new(0, 21, 0, 21) or UDim2.new(0,21,0,21)
				end)

				DropFrame.Name = "DropFrame"
				DropFrame.Parent = Dropdown
				DropFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				DropFrame.BorderSizePixel = 0
				DropFrame.Position = UDim2.new(0, 0, 1, 0)
				DropFrame.Size = UDim2.new(0, 199, 0, 0)
				DropFrame.Visible = false
				DropFrame.ZIndex = 508
				DropFrame.ClipsDescendants = false

				local uilist = Instance.new('UIListLayout')
				uilist.Parent = DropFrame
				uilist.FillDirection = "Vertical"

				local function findIndex(element)
					local index={}
					for k,v in pairs(multiselect) do
						index[v]=k
					end
					return index[element]
				end

				local function newItem(i)
					DropFrame.Size = DropFrame.Size + UDim2.new(0,0,0,25)

					local TextButton = Instance.new("TextButton")
					TextButton.Parent = DropFrame
					TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.BackgroundTransparency = 12.000
					TextButton.Position = UDim2.new(0.0331491716, 0, 0, 0)
					TextButton.Size = UDim2.new(0, 199, 0, 25)
					TextButton.Font = Enum.Font.Code
					TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.TextSize = 14.000
					TextButton.TextStrokeTransparency = 0.000
					TextButton.Text = " "..i
					TextButton.TextXAlignment = Enum.TextXAlignment.Left
					TextButton.AutoButtonColor = false
					TextButton.ZIndex = 509
					TextButton.ClipsDescendants = true
					local currentvaluecock = "None"
					TextButton.MouseButton1Click:Connect(function()
						if not multi then
							for i,v in pairs(DropFrame:GetChildren()) do
								if v.ClassName == "TextButton" then
									v.TextColor3 = Color3.fromRGB(255,255,255)
								end
							end

							TextButton.TextColor3 = Color3.fromRGB(0, 85, 255)
							DropButton.Text = " "..i
							currentvaluecock = i
							callback(i)
							Value = i
						else
							if not table.find(multiselect,i) then
								table.insert(multiselect,i)
								TextButton.TextColor3 = Color3.fromRGB(0, 85, 255)
								DropButton.Text = " ..."
								callback(multiselect)
								Value = multiselect
							else
								table.remove(multiselect,findIndex(i))
								DropButton.Text = " ..."
								TextButton.TextColor3 = Color3.fromRGB(255,255,255)
								callback(multiselect)
								Value = multiselect
							end
						end
					end)
				end

				for i,v in pairs(list) do newItem(v) end
				Set = function(tbl)
					DropButton.Text = " "..tbl.Value
					Value = tbl.Value
				end
			end
			return func
		end
		return sections
	end
	return Tab
end

function library:watermark(text)

	local environeents = Instance.new("ScreenGui")

	local watermarkbackround = Instance.new("Frame")
	local UIGradient_69 = Instance.new("UIGradient")
	local Top_69 = Instance.new("Frame")
	local UIGradient_70 = Instance.new("UIGradient")
	local TextLabel_69 = Instance.new("TextLabel")

	environeents.Name = "environeents"
	environeents.Parent = game.CoreGui

	if getgenv().watermark then
		getgenv().watermark:Remove()
	end
	getgenv().watermark = environeents

	watermarkbackround.Name = "watermarkbackround"
	watermarkbackround.Parent = environeents
	watermarkbackround.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	watermarkbackround.BorderColor3 = Color3.fromRGB(0, 0, 0)
	watermarkbackround.Position = UDim2.new(0.0170250889, 0, 0.0913312659, 0)
	watermarkbackround.ZIndex = 999999998
	watermarkbackround.Active = true
	watermarkbackround.Draggable = true
	library.watermark_1 = environeents 

	UIGradient_69.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(0.43, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
	UIGradient_69.Rotation = 270
	UIGradient_69.Parent = watermarkbackround

	Top_69.Name = "Top_69"
	Top_69.Parent = watermarkbackround
	Top_69.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
	Top_69.BorderSizePixel = 0
	Top_69.Size = UDim2.new(0, 0, 0, 2)
	Top_69.ZIndex = 999999999

	UIGradient_70.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 145, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(62, 189, 191)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(111, 210, 255))}
	UIGradient_70.Rotation = 180
	UIGradient_70.Parent = Top_69

	TextLabel_69.Name = 'TextLabel_69'
	TextLabel_69.Parent = watermarkbackround
	TextLabel_69.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_69.BackgroundTransparency = 1.000
	TextLabel_69.BorderColor3 = Color3.fromRGB(27, 42, 53)
	TextLabel_69.BorderSizePixel = 0
	TextLabel_69.Position = UDim2.new(0.0367346928, 0, 0.0576318353, 0)
	TextLabel_69.Size = UDim2.new(0, 236, 0, 24)
	TextLabel_69.Font = Enum.Font.Code
	TextLabel_69.ZIndex = 999999999

	game:GetService("RunService").RenderStepped:Connect(function(TimeBetween)
		coroutine.wrap(function()
			local FPS = math.floor(1/TimeBetween)
		    TextLabel_69.Text = 'neroware | '..game.Players.LocalPlayer.Name..' | '..'uid: '..game.Players.LocalPlayer.UserId..' | '..FPS..' fps'..' | '..math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())..' ms | '..os.date("%X")..'    '
			watermarkbackround.Size = UDim2.new(0, 7*string.len(TextLabel_69.Text)+13,0,25)
			Top_69.Size = UDim2.new(0, 7*string.len(TextLabel_69.Text)+13,0,2)
		end)()
	end)
	TextLabel_69.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_69.TextSize = 14.000
	TextLabel_69.TextStrokeTransparency = 0.500
	TextLabel_69.TextXAlignment = Enum.TextXAlignment.Left
end

function library:setwatermark(val)
	game.CoreGui['environeents']['watermarkbackround'].Visible = val
end

function library:notify(text, duration)
	local ScreenGui = Instance.new("ScreenGui")
	local notifications = Instance.new("Frame")
	local Notification = Instance.new("Frame")
	local Top = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local notiftext = Instance.new("TextLabel")
	local UIGradient_2 = Instance.new("UIGradient")
	local UIListLayout = Instance.new("UIListLayout")

	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

	notifications.Name = "notifications"
	notifications.Parent = ScreenGui
	notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	notifications.BackgroundTransparency = 1
	notifications.Position = UDim2.new(0.0170250889, 0, 0.0185758509, 0)
	notifications.Size = UDim2.new(0, 235, 0, 80)
	notifications.ZIndex = 9999999

	Notification.Name = "Notification"
	Notification.Parent = game.CoreGui['ScreenGui']['notifications']
	Notification.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Notification.BorderColor3 = Color3.fromRGB(15, 15, 15)
	Notification.Size = UDim2.new(0, 255, 0, 25)

	Top.Name = "Top"
	Top.Parent = Notification
	Top.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
	Top.BorderColor3 = Color3.fromRGB(15, 15, 15)
	Top.Size = UDim2.new(0, 3, 0, 25)

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 145, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(62, 189, 191)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(111, 210, 255))}
	UIGradient.Rotation = 180
	UIGradient.Parent = Top

	notiftext.Name = "notiftext"
	notiftext.Parent = Notification
	notiftext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	notiftext.BackgroundTransparency = 1.000
	notiftext.Position = UDim2.new(0.1, 0, 0, 0)
	notiftext.Size = UDim2.new(0, 226, 0, 25)
	notiftext.Font = Enum.Font.Code
	notiftext.Text = text
	notiftext.TextColor3 = Color3.fromRGB(255, 255, 255)
	notiftext.TextSize = 14.000
	notiftext.TextStrokeTransparency = 0.500
	notiftext.TextXAlignment = Enum.TextXAlignment.Left
	local XBound = notiftext.TextBounds.X + 18

	Notification.Size = UDim2.new(0.01, XBound, 0, 25)

	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(0.43, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
	UIGradient_2.Rotation = 270
	UIGradient_2.Parent = Notification

	UIListLayout.Parent = notifications
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 6)

	local function waitScript()
		for i = 15, 0, -1  do
			Notification.BackgroundTransparency = i/15
			Top.BackgroundTransparency = i/15
			notiftext.TextTransparency = i/15
			wait()
		end
		wait(duration)

		for i = 0, 15 do
			Notification.BackgroundTransparency = i/15
			Top.BackgroundTransparency = i/15
			notiftext.TextTransparency = i/15
			wait()
		end
		Notification:Destroy()
	end
	coroutine.wrap(waitScript)()
end

----------------------------------------------------------------------------------------------------------------------------------------------------

local window = library:window('neroware | '.. os.date('%b, %d, %Y'):lower())

local RageTab = window:tab('rage')
local VisTab = window:tab('visuals')
local MiscTab = window:tab('misc')
local SettingsTab = window:tab('settings')

----------------------------------------------------------------------------------------------------------------------------------------------------

-- Ragebot / Silent
local Silent = RageTab:section('silent aim', 'Left') --'Left' or 'Right'

Silent:toggle('enabled',false,function(val)
	cheattable.rage.rage_enabled = val
end)

Silent:toggle('auto fire',false,function(val)
	cheattable.rage.rage_autofire = val
end)

Silent:toggle('auto wall',false,function(val)
	cheattable.rage.rage_autowall = val
end)

Silent:toggle('hit part',false,function(val)
	cheattable.rage.rage_hitpart = val
end)

Silent:toggle('inf damage',false,function(val)
	cheattable.rage.rage_infdamage = val
end)

Silent:toggle('prediction',false,function(val)
	cheattable.rage.rage_prediction = val
end)

Silent:toggle('resolver',false,function(val)
	cheattable.rage.rage_resolver = val
end)

Silent:toggle('hitscan',false,function(val)
	cheattable.rage.rage_hitscan = val
end)

Silent:dropdown('hitboxes', true, {'Head', 'Torso', 'Arms', 'Legs'},function(val)
	cheattable.rage.rage_hitboxes = val
end)

Silent:toggle('forward track',false,function(val)
	cheattable.rage.rage_fwt = val
end)

Silent:slider('distance',0,15,function(val) 
	cheattable.rage.rage_fwtdistance = val
end)

Silent:toggle('backtrack',false,function(val)
	cheattable.rage.rage_backtrack = val
end)

Silent:slider('ms delay',100,400,function(val)
	cheattable.rage.rage_backtrackms = val
end)

-- Anti Aim
local AntiAim = RageTab:section('anti aim', 'Right')

AntiAim:toggle('enabled',false,function(val)
	cheattable.rage.antiaim_enabled = val

	while cheattable.rage.antiaim_enabled do
		if IsAlive(LocalPlayer) then
			if table.find({"Backwards"}, cheattable.rage.antiaim_yaw) then
				LocalPlayer.Character.Humanoid.AutoRotate = false
				local Angle = (cheattable.rage.antiaim_yaw == "Backwards" and CFrame.new(-4, 0, 0))
				RotatePlayer(workspace.CurrentCamera.CFrame * Angle)
			elseif cheattable.rage.antiaim_yaw == "Spin" then
				LocalPlayer.Character.Humanoid.AutoRotate = false
				LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(100), 0)
			elseif cheattable.rage.antiaim_yaw == "Random" then
				LocalPlayer.Character.Humanoid.AutoRotate = false
                LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(math.random(0, 360)), 0)
			elseif LocalPlayer.Character.Humanoid.AutoRotate == false then
				LocalPlayer.Character.Humanoid.AutoRotate = true
			end
		end
		wait(0.02)
	end
	if IsAlive(LocalPlayer) then
		LocalPlayer.Character.Humanoid.AutoRotate = true
	end
end)

AntiAim:dropdown('pitch', false, {'None', 'Up', 'Zero', 'Down'}, function(val)
	cheattable.rage.antiaim_pitch = val
end)

AntiAim:dropdown('yaw', false, {'None', 'Backwards', 'Spin', 'Random'}, function(val)
	cheattable.rage.antiaim_yaw = val
end)

local oldPitch = cheattable.rage.antiaim_pitch
local oldYaw = cheattable.rage.antiaim_yaw

-- Exploits
local Exploits = RageTab:section('exploits', 'Right')

Exploits:toggle('anti seere',false,function(val)
	
end)

Exploits:toggle('no head',false,function(val)
	
end)

Exploits:toggle('kill all',false,function(val)
	
end)

Exploits:toggle('custom tap',false,function(val)
	cheattable.rage.rage_customtap = val
end)

Exploits:slider('hits',1,30,function(val)
	cheattable.rage.rage_customtaphits = val
end)

local PlayersESP = VisTab:section('esp', 'Left')

----------------------------------------------------------------------------------------------------------------------------------------------------

-- esp
local espLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Sirius/request/library/esp/esp.lua'))()

espLibrary.options.enabled = false
espLibrary.options.teamCheck = false
espLibrary.options.boundingBox = false
espLibrary.options.boxes = false
espLibrary.options.boxesColor = Color3.fromRGB(255, 255, 255)
espLibrary.options.boxFill = false
espLibrary.options.boxFillColor = Color3.fromRGB(255, 255, 255)
espLibrary.options.chams = false
espLibrary.options.chamsFillColor = Color3.fromRGB(31, 69, 222)
espLibrary.options.chamsOutlineColor = Color3.fromRGB(81, 140, 168)
espLibrary.options.chamsOutlineTransparency = 1
espLibrary.options.healthBars = false
espLibrary.options.healthBarsColor = Color3.fromRGB(255, 255, 255)
espLibrary.options.healthText = false
espLibrary.options.healthTextColor = Color3.fromRGB(255, 255, 255)
espLibrary.options.tracers = false
espLibrary.options.tracerColor = Color3.fromRGB(255, 255, 255)
espLibrary.options.names = false
espLibrary.options.nameColor = Color3.fromRGB(255, 255, 255)
espLibrary.options.distance = false
espLibrary.options.distanceColor = Color3.fromRGB(255, 255, 255)
espLibrary.options.outOfViewArrows = false
espLibrary.options.outOfViewArrowsFilled = true
espLibrary.options.outOfViewArrowsSize = 0
espLibrary.options.outOfViewArrowsRadius = 0
espLibrary.options.outOfViewArrowsColor = Color3.fromRGB(255, 255, 255)
espLibrary.options.outOfViewArrowsOutline = false
espLibrary.options.outOfViewArrowsOutlineFilled = false
espLibrary.options.outOfViewArrowsOutlineColor = Color3.fromRGB(255, 255, 255)

PlayersESP:toggle('enabled', false, function(val)
	espLibrary.options.enabled = val
end)

PlayersESP:toggle('teammates', false, function(val)
	if val == true then
        espLibrary.options.teamCheck = false
	else
		espLibrary.options.teamCheck = true
	end
end)

--PlayersESP:toggle('boxes', false, function(val)
--	espLibrary.options.boxes = val
--end)

--PlayersESP:toggle('filled', false, function(val)
--	espLibrary.options.boxFill = val
--end)

PlayersESP:toggle('cham', false, function(val)
	espLibrary.options.chams = val
end)

PlayersESP:toggle('health', false, function(val)
	espLibrary.options.healthBars = val
	espLibrary.options.healthText = val
end)

PlayersESP:toggle('tracer', false, function(val)
	espLibrary.options.tracers = val
end)

PlayersESP:toggle('name', false, function(val)
	espLibrary.options.names = val
end)

PlayersESP:toggle('distance', false, function(val)
	espLibrary.options.distance = val
end)

PlayersESP:toggle('offscreen arrows', false, function(val)
	espLibrary.options.outOfViewArrows = val
end)

PlayersESP:slider('arrow size',1,50,function(val)
	espLibrary.options.outOfViewArrowsSize = val
end)

PlayersESP:slider('arrow radius',1,100,function(val)
	espLibrary.options.outOfViewArrowsRadius = val
end)

espLibrary:Load()

-- Local
local Local = VisTab:section('local', 'Left')

Local:toggle('gun chams', false, function(val)
	
end)

Local:slider('reflectance',0,100,function(val)
	
end)

Local:toggle('arm chams', false, function(val)
	
end)

Local:slider('reflectance',0,100,function(val)
	
end)

Local:toggle('body chams', false, function(val)
	
end)

Local:slider('reflectance',0,100,function(val)
	
end)

-- Camera
local Camera = VisTab:section('camera', 'Right')

Camera:slider('fov',90,120,function(val)
	game.Workspace.CurrentCamera.FieldOfView = val
end)

Camera:toggle('remove camera recoil', false, function(val)
	cheattable.misc.norecoil = val
end)

Camera:toggle('remove camera bob', false, function(val)
	
end)

Camera:toggle('remove gun bob', false, function(val)
	
end)

Camera:toggle('remove visual suppresion', false, function(val)
	
end)

Camera:toggle('third person', false, function(val)
	cheattable.misc.thirdperson = val
end)

Camera:slider('third person distance',6,15,function(val)
	cheattable.misc.thirdpersondistance = val
end)

-- World
local World = VisTab:section('world', 'Right')

World:toggle('hit indicator', false, function(val)
	
end)

World:toggle('bullet tracers', false, function(val)
	
end)

-- Viewmodel
local Viewmodel = VisTab:section('viewmodel', 'Right')

Viewmodel:toggle('offset viewmodel', false, function(val)
	cheattable.misc.offsetviewmodel = val
end)

Viewmodel:slider('offset x',-10,10,function(val)
	cheattable.misc.offset_x = val
end)

Viewmodel:slider('offset y',-10,10,function(val)
	cheattable.misc.offset_x = val
end)

Viewmodel:slider('offset z',-10,10,function(val)
	cheattable.misc.offset_x = val
end)

Viewmodel:slider('roll',-100,100,function(val)
	cheattable.misc.offset_roll = val
end)

----------------------------------------------------------------------------------------------------------------------------------------------------

-- Movement
local Movement = MiscTab:section('movement', 'Left')

Movement:toggle('enabled', false, function(val)
	cheattable.misc.movement = val
end)

Movement:toggle('bunny hop', false, function(val)
	cheattable.misc.bunnyhop = val
end)

Movement:slider('speed',0,100,function(val)
	cheattable.misc.bunnyhopspeed = val
end)

Movement:toggle('walk speed', false, function(val)
	cheattable.misc.walkspeed = val
end)

Movement:slider('speed',0,100,function(val)
	cheattable.misc.walkspeedspeed = val
end)

-- Gun mods
local Gmods = MiscTab:section('modifications', 'Left')

Gmods:toggle('infinite ammo', false, function(val)
	cheattable.misc.infammo = val
end)

Gmods:toggle('infinite range', false, function(val)
	cheattable.misc.infammo = val
end)

Gmods:toggle('infinite cash', false, function(val)
	cheattable.misc.infcash = val
end)

Gmods:toggle('automatic guns', false, function(val)
	cheattable.misc.automatic = val
end)

-- Removals
local Removals = MiscTab:section('removals', 'Right')

Removals:toggle('spread', false, function(val)
	
end)

Removals:toggle('radar', false, function(val)
	
end)

Removals:toggle('radio', false, function(val)
	
end)

Removals:toggle('flash', false, function(val)
	
end)

Removals:toggle('blood', false, function(val)
	
end)

Removals:toggle('gloves', false, function(val)
	
end)

Removals:toggle('sleeves', false, function(val)
	
end)

-- Chatting
local Chatting = MiscTab:section('chatting', 'Left')

Chatting:toggle('enabled', false, function(val)
	
end)

Chatting:toggle('chat spam', false, function(val)
	
end)

Chatting:toggle('kill say', false, function(val)
	
end)

Chatting:dropdown('chat type', false, {'neroware', 'russian', 'chinese', 'custom'}, function(val)
	
end)

Chatting:textbox('custom text',function(val)
	
end)

Chatting:slider('delay',1,10,function(val)
	
end)

-- Other
local Other = MiscTab:section('other', 'Right')
Other:toggle('hitlogs', false, function(val)
	
end)

Other:toggle('joeyyy', false, function(val)
	
end)

-- Sounds
local Sounds = MiscTab:section('sounds', 'Right')

Sounds:toggle('enabled', false, function(val)
	
end)

Sounds:toggle('hitsound', false, function(val)
	
end)

Sounds:dropdown('hitsounds', false, {'gamesense', 'neverlose', 'primordial', 'call of duty', 'rust headshot', 'custom'}, function(val)
	
end)

Sounds:textbox('custom hitsound',function(val)
	
end)

Sounds:toggle('killsound', false, function(val)
	
end)

Sounds:dropdown('killsounds', false, {'gamesense', 'neverlose', 'primordial', 'call of duty', 'rust headshot', 'custom'}, function(val)
	
end)

Sounds:textbox('custom killsound',function(val)
	
end)

-- Config System
local Configs = SettingsTab:section('configs', 'Left')

Configs:textbox('config name', function(val)
	
end)

Configs:button('create config', function()
	
end)

Configs:button('save config', function()
	
end)

Configs:button('load config', function()
	
end)

-- Menu 
local Menu = SettingsTab:section('menu', 'Right')

Menu:dropdown('accent color', false, {'default', 'orange', 'red', 'pink', 'purple', 'green', 'yellow'}, function(val)
	
end)

Menu:button('copy discord link', function()
	
end)

Menu:button('current version', function()
	
end)

Menu:button('unload menu', function()
	
end)
--[[
Silent:dropdown('Dropdown',false,{'yes','no'},function(val)
	print(val)
end)
]]

local GetPlayers = game:GetService("Players")

ping = math.round(game.Stats.PerformanceStats.Ping:GetValue())
function getDamage(hit, plr, dmgmod)

    if isAlive(lplr) and typeof(hit) == "table" and client.gun ~= nil and client.gun:FindFirstChild("DMG") and getDamageMultiplier(hit[1]) ~= nil then
        local dmg = client.gun.DMG.Value * getDamageMultiplier(hit[1]) * (dmgmod or 1)
        if plr:FindFirstChild("Kevlar") then
            dmg = (dmg * 0.01) * client.gun.ArmorPenetration.Value
        end
        dmg = dmg * (client.gun.RangeModifier.Value * 0.01 ^ ((lplr.Character.HumanoidRootPart.Position - hit[2]).Magnitude*0.002)) * 0.01
        return dmg
    end
    return 0
end

local camera = workspace.CurrentCamera
local L_1746_ = true;
local L_142_;

localPlayer.Additionals.TotalDamage:GetPropertyChangedSignal("Value"):Connect(function(val)
    if val == 0 then return end
    local coolrbxasset= "rbxassetid://"
    local hitsoundtoggle = cheattable.misc.hitsound
    local hitsoundid = hitsounds[cheattable.misc.hitsounds]
    local soundEmptyy = soundid == ""
    local hitsoundvolume = 5
    hitsoundtoggle = soundEmptyy and "rbxassetid://6229978482" or hitsoundtoggle
    if hitsoundtoggle and val ~= 0 then
        local marker = Instance.new("Sound")
        marker.Parent = game:GetService("SoundService")
        marker.SoundId = ("rbxassetid://" .. hitsoundid)
        marker.Volume = (hitsoundvolume / 5)
        marker:Play()
    end
end)

localPlayer.Status.Kills:GetPropertyChangedSignal("Value"):Connect(function(val)
    if val == 0 then return end
    local rbxasset= "rbxassetid://"
    local killsoundtoggle = cheattable.misc.killsound
    local killsoundid = killsounds[cheattable.misc.killsounds]
    local soundEmpty = soundid == ""
    local killsoundvolume = 5
    killsoundtoggle = soundEmpty and "rbxassetid://6229978482" or killsoundtoggle
    if killsoundtoggle and val ~= 0 then
        local marker = Instance.new("Sound")
        marker.Parent = game:GetService("SoundService")
        marker.SoundId = ("rbxassetid://" .. killsoundid)
        marker.Volume = (killsoundvolume / 5)
        marker:Play()
    end
	--
    if cheattable.misc.killsay and val ~= 0 then
        if cheattable.misc.messagetype and cheattable.misc.messagetype == 'neroware' then
            game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(nerowareMessagesTable[math.random(1, #nerowareMessagesTable)], false, false, true)
        elseif cheattable.misc.messagetype and cheattable.misc.messagetype == 'russian' then
            game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(russianMessagesTable[math.random(1, #russianMessagesTable)], false, false, true)
        elseif cheattable.misc.messagetype and cheattable.misc.messagetype == 'chinese' then
            game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(chineseMessagesTable[math.random(1, #chineseMessagesTable)], false, false, true)
		elseif cheattable.misc.messagetype and cheattable.misc.messagetype == 'custom' then
            game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(cheattable.misc.custommessage, false, false, true)
        end
    end	--]]
end)

-- {'neroware', 'russian', 'chinese', 'custom'}
runService.Stepped:Connect(function()
    if cheattable.misc.chatspam then
        if cheattable.misc.messagetype and cheattable.misc.messagetype == 'neroware' then
            game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(nerowareMessagesTable[math.random(1, #nerowareMessagesTable)], false, false, true)
        elseif cheattable.misc.messagetype and cheattable.misc.messagetype == 'russian' then
            game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(russianMessagesTable[math.random(1, #russianMessagesTable)], false, false, true)
        elseif cheattable.misc.messagetype and cheattable.misc.messagetype == 'chinese' then
            game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(chineseMessagesTable[math.random(1, #chineseMessagesTable)], false, false, true)
		elseif cheattable.misc.messagetype and cheattable.misc.messagetype == 'custom' then
            game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(cheattable.misc.custommessage, false, false, true)
        end
    end
end)

runService.Stepped:Connect(function()
    ragebot_target = nil

    if isAlive(lplr) then

		if cheattable.misc.movement then
            if cheattable.misc.bunnyhop and uis:IsKeyDown("Space") then
                if lplr.Character:FindFirstChild("jumpcd") then
                    lplr.Character.jumpcd:Destroy()
                end
				
                lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                
                local vel = Vector3.zero
                
                if uis:IsKeyDown("W") then
                    vel = vel + workspace.CurrentCamera.CFrame.LookVector
                end
                if uis:IsKeyDown("S") then
                    vel = vel - workspace.CurrentCamera.CFrame.LookVector
                end
                if uis:IsKeyDown("A") then
                    vel = vel - workspace.CurrentCamera.CFrame.RightVector
                end
                if uis:IsKeyDown("D") then
                    vel = vel + workspace.CurrentCamera.CFrame.RightVector
                end
                
                if vel.Magnitude > 0 then
                    vel = Vector3.new(vel.X, 0, vel.Z)
                    lplr.Character.HumanoidRootPart.Velocity = (vel.Unit * (cheattable.misc.bunnyhopspeed * 1.5)) + Vector3.new(0, lplr.Character.HumanoidRootPart.Velocity.Y, 0) -- 1
                    lplr.Character.Humanoid.Jump = true
                end
            end
		end

		if cheattable.misc.thirdperson then
            workspace.ThirdPerson.Value = true
            if lplr.CameraMinZoomDistance ~= cheattable.misc.thirdpersondistance then
				lplr.CameraMinZoomDistance = cheattable.misc.thirdpersondistance
				lplr.CameraMaxZoomDistance = cheattable.misc.thirdpersondistance
			end
        else
            workspace.ThirdPerson.Value = false
            if lplr.CameraMinZoomDistance ~= 0 then
				lplr.CameraMinZoomDistance = 0
				lplr.CameraMaxZoomDistance = 0
			end
        end

    for _, plr in pairs(plrs:GetPlayers()) do
            if isAlive(plr) then
                if frames_stuff[plr] == nil then
                    frames_stuff[plr] = {}
                end
                frames_stuff[plr][#frames_stuff[plr] + 1] = plr.Character.HumanoidRootPart.Position
            end

            if cheattable.rage.rage_enabled and isTarget(plr, false) and typeof(client.gun) == "Instance" and client.gun:FindFirstChild("Penetration") and not client.DISABLED and not client.gun:FindFirstChild("Melee") and client.gun.Name ~= "C4" then
                local ignore = {workspace.Ray_Ignore, lplr.Character, r6_dummy, workspace.Debris, workspace.CurrentCamera}
                local multipoints = false
                
                local hitboxes = {}
                local ebaniy_hitboksy = {"Head", "Torso"} 
                for i, v in next, (ebaniy_hitboksy) do -- 1
                    if v == "Head" then
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.Head))
                    elseif v == "Torso" then
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.UpperTorso))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LowerTorso))
                    elseif v == "Arms" then
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftUpperArm))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftLowerArm))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftHand))
                        --
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightUpperArm))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightLowerArm))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightHand))
                    elseif v == "Legs" then
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftUpperLeg))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftLowerLeg))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftFoot))
                        --
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightUpperLeg))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightLowerLeg))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightFoot))
                    end
                end


                if cheattable.rage.rage_fwt then -- 1
                    local part = ftfolder:FindFirstChild(plr.Name)
                    if part == nil then
                        part = Instance.new("Part", ftfolder)
                        part.Size = Vector3.new(1, 2, 2)
                        part.CanCollide = false
                        part.Anchored = true
                        part.Name = plr.Name
                        part.Transparency = 1

                    local fwtam = cheattable.rage.rage_fwt
                    local playerpos = plr.Character.HumanoidRootPart.Position
                    local playervel = plr.Character.HumanoidRootPart.Velocity
                    local resultspeed = playervel.Magnitude

                    if resultspeed > 0.15 then 
                        local exst_time = fwtam

                        local prepos = playerpos + playervel * exst_time
                        local exst_pos = prepos + playervel * exst_time

                        local raycast_params = RaycastParams.new()
                        raycast_params.FilterDescendantsInstances = {plr.Character}

                        local finish = workspace:Raycast(playerpos, (exst_pos - playerpos).Unit * 2, raycast_params)

                        if finish then 
                            exst_pos = finish.Position
                        end
                        part.CFrame = CFrame.new(exst_pos)

                    end

                    table.insert(hitboxes, (function(a)
                        return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                    end)(part))
                end
                if #frames_stuff[plr] >= cheattable.rage.rage_backtrackms then
                    local part = btfolder:FindFirstChild(plr.Name)
                      task.synchronize()
                    if part == nil then
                        part = Instance.new("Part", btfolder)
                        part.Size = Vector3.new(4, 4, 3)
                        part.CanCollide = false
                        part.Anchored = true
                        part.Name = plr.Name
                        part.Transparency = 1

                        part.CFrame = CFrame.new(frames_stuff[plr][#frames_stuff[plr] - cheattable.rage.rage_backtrackms])
                        CreateThread(function()
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Multi" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(part))
                        end)
                    end


              local origin = lplr.Character.HumanoidRootPart.Position + Vector3.new(0, 2.5, 0)

            for _, v in pairs(hitboxes) do
                    if ragebot_target ~= nil then break end
                    for _, v2 in next, v[2] do
                        if ragebot_target ~= nil then break end
                      local ray = Ray.new(origin, (v2 - origin).Unit * (v2 - origin).Magnitude)
    
                        local raydata = {workspace:FindPartOnRayWithIgnoreList(ray, ignore, false, true)}

                        -- local penetration = client.gun.Penetration.Value / (100 / library.flags["rage_mod"]) -- 1

                        local penetration = client.gun.Penetration.Value * 0.01

                        local dmgmod = nil

                   if raydata[1] and raydata[1].Parent and raydata[1].Parent == plr.Character or raydata[1].Parent == ftfolder or raydata[1].Parent == btfolder then
                            ragebot_wallbang = true
                            ragebot_target = {v[1], v2}
                        else
                            if cheattable.rage.rage_autowall then --1
                                local temphits, newraydata = {}, {}
                                local temphit

                                repeat
                                    newraydata = {workspace:FindPartOnRayWithIgnoreList(ray, ignore, true, faalse)}
                                    if newraydata[1] and newraydata[1].Parent then
                                        if newraydata[1].Parent == plr.Character or newraydata[1].Parent == ftfolder or newraydata[1].Parent == btfolder then
                                            temphit = newraydata[1]
                                        else
                                            table.insert(ignore, newraydata[1])
                                            table.insert(temphits, newraydata)
                                        end
                                    end
                                until temphit ~= nil or #temphits > 0 or newraydata[1] == nil

                                if temphit and getDamageMultiplier(temphit) ~= nil then
                                    local limit = 0
                                    for i, v in pairs(temphits) do
                                        local mod2 = 1

                                        local formod = {
                                           function(p) return string.split(tostring(p.Material), ".")[1] == "DiamondPlate" and -5 end,
                                                function(p) return table.find({"CorrodedMetal", "Metal", "Concrete", "Brick"}, string.split(tostring(p.Material), ".")[1]) ~= nil and -5 end,
                                                function(p) return table.find({"Wood", "WoodPlanks"}, string.split(tostring(p.Material), ".")[1]) or p.Name == "Grate" and -5 end,
                                                 function(p) return p.Name == "nowallbang" and -5 or p:FindFirstChild("PartModifier") and tonumber(p.PartModifier.Value) or 0 end,
                                                 function(p) return p.Transparency == 1 or not p.CanCollide or p.Name == "Glass" or p.Name == "Capboard" and 0 end
                                        }

                                        for _, v2 in pairs(formod) do
                                            mod2 = v2(v[1]) or mod2
                                        end


                                        local dir = (v[1].Position - v[2]).Unit * math.clamp(client.gun.Range.Value, math.huge)
                                        
                                        if cheattable.rage.rage_hitscan == true then 
                                            ray2 = Ray.new(v[2] + Vector3.new(math.cos(tick() * (50*10)) * (dir/2 + 50/100), math.sin(tick() * (50*10)) * (dir/2 + 50/100), math.sin(tick() * (50*10)) * (dir/2 + 50/100)), dir * -2)
                                            else
                                            ray2 = Ray.new(v[2] + dir)
                                        end

                                        local _, temppos = workspace:FindPartOnRayWithWhitelist(ray2, {v[1]}, true)
                                        if temppos then
                                            pcall(function()
                                                limit = math.min(penetration, limit + ((temppos - v[2]).Magnitude * mod2))
                                            end)
                                            dmgmod = 0 - limit / penetration
                                        end
                                    end

                                    ragebot_wallbang = true
                                    ragebot_target = {v[1], v2}
                                    end
                                end
                        end
                        if ragebot_target and getDamage(ragebot_target, plr, dmgmod) >= 1 then
                            if cheattable.rage.rage_autofire then
				                client.firebullet()
				            end
                        end
                    end
                end
            end
        end
        if cheattable.misc.norecoil and IsAlive(localPlayer) then
            local lplr = game.Players.LocalPlayer
            local client = getsenv(lplr.PlayerGui.Client)
            client.accuracy_sd = 0
        else
            client.accuracy_sd = 0.001
        end
    end
end
end
end)

runService.RenderStepped:Connect(function()
    if cheattable.misc.infcash then
        lplr.Cash.Value = 2 ^ 33
    end

    if cheattable.misc.infammo then 
        for i = 1, 4 do
            setupvalue(client.countammo, 4 + i, 69420)
        end
    end

    local hackspeed = cheattable.misc.walkspeedspeed
    local enabled = cheattable.misc.movement
    local speedenabled = cheattable.misc.walkspeed

    if enabled and IsAlive(localPlayer) then
        if speedenabled then
            local hrp = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp ~= nil then
                local travel = Vector3.new()
                local looking = camera.CFrame.lookVector
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    travel += Vector3.new(looking.x, 0, looking.Z)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    travel -= Vector3.new(looking.x, 0, looking.Z)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    travel += Vector3.new(-looking.Z, 0, looking.x)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    travel += Vector3.new(looking.Z, 0, -looking.x)
                end

                travel = travel.Unit

                local newDir = Vector3.new(travel.x * hackspeed, hrp.Velocity.y, travel.Z * hackspeed)

                if travel.Unit.x == travel.Unit.x then
                    hrp.Velocity = newDir
                end
            end
        end
    end
end)

LPH_JIT_MAX(function() 
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(Self, ...)
        local Args = {...}
        local Meta = getnamecallmethod()
        local Method = Self.Name;

        if Method == "ControlTurn" then
            if cheattable.rage.antiaim_enabled then
            local Pitch = 0
                if cheattable.rage.antiaim_pitch == "Up" then
                    Pitch = 1
                elseif cheattable.rage.antiaim_pitch == "Down" then
                    Pitch = -1
                elseif cheattable.rage.antiaim_pitch == "Random" then
                    local PTCH = math.random(-1,1)
                    Pitch = PTCH
                elseif cheattable.rage.antiaim_pitch == "None" then
                    Pitch = 0
                end
                return oldNamecall(Self, Pitch, select(2, ...)) 
            end
        end;
        return oldNamecall(Self, ...)
    end)
end)();

local oldNamecall

oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if method == "FindPartOnRayWithIgnoreList" and args[2][1] == workspace.Debris then
        if ragebot_target ~= nil and cheattable.rage.rage_enabled then
            local origin = lplr.Character.HumanoidRootPart.Position + Vector3.new(0, 2.5, 0)
            if ragebot_target[1].Parent == ftfolder then
                ragebot_target[2] = plrs[ragebot_target[1].Name].Character.Head.Position
            end
            if ragebot_target[1].Parent == btfolder then
                ragebot_target[2] = plrs[ragebot_target[1].Name].Character.Head.Position
            end
            if ragebot_target[1].Parent == othershit then
                ragebot_target[2] = plrs[ragebot_target[1].Name].Character.Head.Position
            end
            table.insert(args[2], workspace.Map)
            args[1] = Ray.new(origin, (ragebot_target[2] - origin).Unit * (ragebot_target[2] - origin).Magnitude)
        end
        return oldNamecall(self, unpack(args))
    end
    return oldNamecall(self, ...)
end)

function Functions:Draw(Type,Propities)
  if not Type and not Propities then return end
  local drawing = Drawing.new(Type)
  for i,v in pairs(Propities) do
    drawing[i] = v
  end
  table.insert(Esp.Drawings,drawing)
  return drawing
end

local EnabledHitmarker = true
local HitMarkerColor = Color3.fromRGB(255, 255, 255)
local HitMarkerLifetime = 2

local HitPart = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("HitPart")
local namecall

namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod():lower()
    local oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9, oh10, oh11, oh12, oh13, oh14, oh15, oh16, oh17 = ...
    if self == HitPart and method == "fireserver" and cheattable.rage.rage_hitpart then
        oh2 = oh2 + Vector3.new()
        oh3 = Client.gun.Name
        oh4 = -4000
        oh5 = nil
        oh6 = nil
        oh7 = not cheattable.rage.rage_infdamage and 1 or 999e999
        oh8 = false
        oh9 = false
        oh10 = Vector3.new()
        oh11 = -85428592
        oh12 = Vector3.new()
        oh13 = false
        oh14 = nil
        oh15 = nil
        oh16 = nil
        oh17 = nil
        return namecall(self, oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9, oh10, oh11, oh12, oh13, oh14, oh15, oh16, oh17)
	    
		if EnabledHitmarker == true then
            task.spawn(function()
                local HitPos = Vector3.new(0,0,0)
                if oh2 then
					HitPos = oh2
				end

                if type(HitPos) == "vector" then
                    local Vector, onScreen = game.Workspace.CurrentCamera:WorldToViewportPoint(HitPos)
                    local Finished = false
                    local Line1 = Functions:Draw("Line",{Visible=onScreen,Thickness=1.5,Color=HitMarkerColor,Transparency=1,From=Vector2.new(Vector.X-12,Vector.Y -12),To=Vector2.new(Vector.X-7,Vector.Y-7),})
                    local Line2 = Functions:Draw("Line",{Visible=onScreen,Thickness=1.5,Color=HitMarkerColor,Transparency=1,From=Vector2.new(Vector.X+12,Vector.Y-12),To=Vector2.new(Vector.X+7,Vector.Y-7),})
                    local Line3 = Functions:Draw("Line",{Visible=onScreen,Thickness=1.5,Color=HitMarkerColor,Transparency=1,From=Vector2.new(Vector.X-12,Vector.Y+12),To=Vector2.new(Vector.X-7,Vector.Y+7),})
                    local Line4 = Functions:Draw("Line",{Visible=onScreen,Thickness=1.5,Color=HitMarkerColor,Transparency=1,From=Vector2.new(Vector.X+12,Vector.Y+12),To=Vector2.new(Vector.X+7,Vector.Y+7),})
                    local c; c = game:GetService("RunService").RenderStepped:Connect(function()
                        if EnabledHitmarker then
                            if not Finished then
                                local Vector, onScreen = workspace.CurrentCamera:WorldToViewportPoint(HitPos)
                                Line1.Visible = onScreen;Line2.Visible = onScreen;Line3.Visible = onScreen;Line4.Visible = onScreen
                                Line1.From = Vector2.new(Vector.X - 12, Vector.Y - 12);Line1.To = Vector2.new(Vector.X - 7, Vector.Y - 7)
                                Line2.From = Vector2.new(Vector.X + 12, Vector.Y - 12);Line2.To = Vector2.new(Vector.X + 7, Vector.Y - 7)
                                Line3.From = Vector2.new(Vector.X - 12, Vector.Y + 12);Line3.To = Vector2.new(Vector.X - 7, Vector.Y + 7)
                                Line4.From = Vector2.new(Vector.X + 12, Vector.Y + 12);Line4.To = Vector2.new(Vector.X + 7, Vector.Y + 7)
                            else
                                c:Disconnect()
                            end
                        end
                    end)

                    local lines = {Line1, Line2, Line3, Line4}
                    local duration = HitMarkerLifetime
                    local startTime = os.clock()

                    while os.clock() - startTime < duration do
                        local progress = (os.clock() - startTime) / duration
                        for _, line in ipairs(lines) do
          					line.Transparency = 1 - progress
        				end
        				task.wait()
        			end

      				Finished = true;
					Line1:Remove();
					Line2:Remove();
					Line3:Remove();
					Line4:Remove()
    			 end
    		end)
        end
	end
    return namecall(self, ...)
end)

local oldIndex
oldIndex = hookfunc(getrawmetatable(game.Players.LocalPlayer.PlayerGui.Client).__index, newcclosure(function(self, idx)
    if idx == "Value" then
        if self.Name == "Auto" and cheattable.misc.automatic then
            return true
        elseif self.Name == "Range" and cheattable.misc.infrange then
            return 9999
        elseif self.Name == "RangeModifier" and cheattable.misc.infrange then
            return 100
        end
    end
    return oldIndex(self, idx)
end))

local oldIndex33
oldIndex33 = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if not checkcaller() then
        if key == "Velocity" and self.Parent == game.Players.LocalPlayer.Character then
            return Vector3.zero
        end
    end
    return oldIndex33(self, key)
end))

library:watermark('neroware') -- text | plrname | FPS (the fps is kinda fucked XDDDDD)