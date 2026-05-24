		wait(1.2)
		game.StarterGui:SetCore("SendNotification", {
		Title = "Serenity"; -- 
		Text = "Welcome back to greatness; Serenity.win"; -- 
		Icon = "rbxassetid://5676350013"; -- t
		Duration = 15; -- 
		})

		BeforeLoad = tick()
		getgenv().values = {}
		local library = loadstring(game:HttpGet'https://raw.githubusercontent.com/Cr1st1cal/serenity/main/message%20(4).txt')()
		local Watermark = "Dev"
		-- set this ^ to whatever build this is
		if Watermark == "Dev" then
			library:CreateWatermark("Serenity.win | Build: Dev")
			library.theme.accentcolor = Color3.fromRGB(0, 0, 0)
			library.theme.accentcolor2 = Color3.fromRGB(0, 0, 0)
			library.theme.topheight = 45
			library.theme.TextColor = Color3.fromRGB(0, 0, 0)
		end
		if Watermark == "Beta" then
			library:CreateWatermark("Serenity.win | Build: Beta")
			library.theme.accentcolor = Color3.fromRGB(0, 0, 0)
			library.theme.accentcolor2 = Color3.fromRGB(0, 0, 0)
			library.theme.topheight = 45
			library.theme.TextColor = Color3.fromRGB(0, 0, 0)
		end
		if Watermark == "Public" then
			library:CreateWatermark("Serenity.win | Build: Public")
			library.theme.accentcolor = Color3.fromRGB(0, 0, 0)
			library.theme.accentcolor2 = Color3.fromRGB(0, 0, 0)
			library.theme.topheight = 45
			library.theme.TextColor = Color3.fromRGB(0, 0, 0)
		end
		local library = {} 
		local Signal = loadstring(game:HttpGet("https://raw.githubusercontent.com/Cr1st1cal/serenity/main/message%20(5).txt"))() 
		local Drawing3d = loadstring(game:HttpGet("https://raw.githubusercontent.com/Cr1st1cal/serenity/main/message%20(6).txt"))()
		--local Api = loadstring(game:HttpGet("https://pastebin.com/raw/5L3wV43u"))()
		local ConfigSave = Signal.new("ConfigSave") 
		local ConfigLoad = Signal.new("ConfigLoad") 
		underground = false     

		local txt = game:GetService("TextService")      
		local TweenService = game:GetService("TweenService")      
		function library:Tween(...) TweenService:Create(...):Play() end      
		local cfglocation = "Serenity/"      
		makefolder("Serenity")      

	

		local Vec2 = Vector2.new      
		local Vec3 = Vector3.new      
		local CF = CFrame.new      
		local INST = Instance.new      
		local COL3 = Color3.new      
		local COL3RGB = Color3.fromRGB      
		local COL3HSV = Color3.fromHSV      
		local CLAMP = math.clamp      
		local DEG = math.deg      
		local FLOOR = math.floor      
		local ACOS = math.acos      
		local RANDOM = math.random      
		local ATAN2 = math.atan2      
		local HUGE = math.huge      
		local RAD = math.rad      
		local MIN = math.min      
		local POW = math.pow      
		local UDIM2 = UDim2.new      
		local CFAngles = CFrame.Angles      

		local FIND = string.find      
		local LEN = string.len      
		local SUB = string.sub      
		local GSUB = string.gsub      
		local RAY = Ray.new      

		local INSERT = table.insert      
		local TBLFIND = table.find      
		local TBLREMOVE = table.remove      
		local TBLSORT = table.sort      
		local MainUIColor = COL3RGB(28, 101, 223)    


		function rgbtotbl(rgb)      
			return {R = rgb.R, G = rgb.G, B = rgb.B}      
		end      
		function tbltorgb(tbl)      
			return COL3(tbl.R, tbl.G, tbl.B)      
		end      
		local function deepCopy(original)      
			local copy = {}      
			for k, v in pairs(original) do      
				if type(v) == "table" then      
					v = deepCopy(v)      
				end      
				copy[k] = v      
			end      
			return copy      
		end      
		function library:ConfigFix(cfg)      
			local copy = game:GetService("HttpService"):JSONDecode(readfile(cfglocation..cfg..".txt"))      
			for i,Tabs in pairs(copy) do      
				for i,Sectors in pairs(Tabs) do      
					for i,Elements in pairs(Sectors) do      
						if Elements.Color ~= nil then      
							local a = Elements.Color      
							Elements.Color = tbltorgb(a)      
						end      
					end      
				end      
			end      
			return copy      
		end      
		function library:SaveConfig(cfg)      
			local copy = deepCopy(values)      
			for i,Tabs in pairs(copy) do      
				for i,Sectors in pairs(Tabs) do      
					for i,Elements in pairs(Sectors) do      
						if Elements.Color ~= nil then      
							Elements.Color = {R=Elements.Color.R, G=Elements.Color.G, B=Elements.Color.B}      
						end      
					end      
				end      
			end      
			writefile(cfglocation..cfg..".txt", game:GetService("HttpService"):JSONEncode(copy))      
		end      

		function library:New(name)      
			local menu = {}      

			local Ova = INST("ScreenGui")      
			local Menu = INST("ImageLabel")      
			local TextLabel = INST("TextLabel")      
			local TabButtons = INST("Frame")      
			local UIListLayout = INST("UIListLayout")      
			local Tabs = INST("Frame")      

			Ova.Name = "SJ_LOVES_MEN"      
			Ova.ResetOnSpawn = false      
			Ova.ZIndexBehavior = "Global"      
			Ova.DisplayOrder = 420133769      

			local UIScale = INST("UIScale")      
			UIScale.Parent = Ova      

			function menu:SetScale(scale)      
				UIScale.Scale = scale      
			end      

			local but = INST("TextButton")      
			but.Modal = true      
			but.Text = ""      
			but.BackgroundTransparency = 1      
			but.Parent = Ova      

			local cursor = INST("ImageLabel")      
			cursor.Name = "cursor"      
			cursor.Parent = Ova      
			cursor.BackgroundTransparency = 1      
			cursor.Size = UDIM2(0,17,0,17)      
			cursor.Image = "rbxassetid://518398610"      
			cursor.ZIndex = 1000      
			cursor.ImageColor3 = COL3RGB(12,43,142)      

			local Players = game:GetService("Players")      
			local LocalPlayer = Players.LocalPlayer      
			local Mouse = LocalPlayer:GetMouse()      

			game:GetService("RunService").RenderStepped:connect(function()      
				cursor.Visible = Ova.Enabled      
				cursor.Position = UDIM2(0,Mouse.X-3,0,Mouse.Y+1)      
			end)      

			Menu.Name = "Menu"      
			Menu.Parent = Ova      
			Menu.BackgroundColor3 = COL3RGB(15, 15, 15)      
			Menu.Position = UDIM2(0.5, -300, 0.5, -300)      
			Menu.Size = UDIM2(0, 600, 0, 725)      
		   
			     

			library.uiopen = true      

			game:GetService("UserInputService").InputBegan:Connect(function(key)      
				if key.KeyCode == Enum.KeyCode.Insert then      
					Ova.Enabled = not Ova.Enabled      
					library.uiopen = Ova.Enabled      
				end      
			end)      

			local KeybindList = INST("ScreenGui") 
	do 
		local TextLabel = INST("TextLabel") 
		local Frame = INST("Frame") 
		local UIListLayout = INST("UIListLayout") 

		KeybindList.Name = "KeybindList" 
		KeybindList.ZIndexBehavior = Enum.ZIndexBehavior.Global 
		KeybindList.Enabled = false 
 
		if Watermark == "Dev" then
			TextLabel.Parent = KeybindList 
			TextLabel.BackgroundColor3 = COL3RGB(0, 0, 0) 
			TextLabel.BorderColor3 = COL3RGB(1, 1, 113) 
			TextLabel.Transparency = 0
			TextLabel.Position = UDIM2(0, 234, 0.015, -3) 
			TextLabel.Size = UDIM2(0, 170, 0, 27) 
			TextLabel.ZIndex = 2 
			TextLabel.Font = Enum.Font.SourceSansSemibold 
			TextLabel.Text = "Binds" 
			TextLabel.TextColor3 = COL3RGB(255, 255, 255) 
			TextLabel.TextSize = 15.000
		end
		if Watermark == "Beta" then
			TextLabel.Parent = KeybindList 
			TextLabel.BackgroundColor3 = COL3RGB(0, 0, 0) 
			TextLabel.BorderColor3 = COL3RGB(1, 1, 113) 
			TextLabel.Transparency = 0
			TextLabel.Position = UDIM2(0, 242, 0.015, -3) 
			TextLabel.Size = UDIM2(0, 170, 0, 27) 
			TextLabel.ZIndex = 2 
			TextLabel.Font = Enum.Font.SourceSansSemibold 
			TextLabel.Text = "Binds" 
			TextLabel.TextColor3 = COL3RGB(255, 255, 255) 
			TextLabel.TextSize = 15.000
		end
		if Watermark == "Public" then
			TextLabel.Parent = KeybindList 
			TextLabel.BackgroundColor3 = COL3RGB(0, 0, 0) 
			TextLabel.BorderColor3 = COL3RGB(1, 1, 113) 
			TextLabel.Transparency = 0
			TextLabel.Position = UDIM2(0, 258, 0.015, -3) 
			TextLabel.Size = UDIM2(0, 170, 0, 27) 
			TextLabel.ZIndex = 2 
			TextLabel.Font = Enum.Font.SourceSansSemibold 
			TextLabel.Text = "Binds" 
			TextLabel.TextColor3 = COL3RGB(255, 255, 255) 
			TextLabel.TextSize = 15.000
		end
		Frame.Parent = TextLabel 
		Frame.BackgroundColor3 = COL3RGB(0, 0, 0) 
		Frame.BackgroundTransparency = 1
		Frame.Position = UDIM2(0, 0, 1, 1) 
		Frame.Size = UDIM2(1, 0, 1, 0) 

		UIListLayout.Parent = Frame 
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

		KeybindList.Parent = game.CoreGui 
	end 

	function keybindadd(text) 
		if not KeybindList.TextLabel.Frame:FindFirstChild(text) then 
			local TextLabel = INST("TextLabel") 
			TextLabel.BackgroundColor3 = COL3RGB(1, 1, 1) 
			TextLabel.BorderColor3 = COL3RGB(1, 1, 113)
			TextLabel.Transparency = 0.100
			TextLabel.Size = UDIM2(0, 170, 0, 24) 
			TextLabel.ZIndex = 2 
			TextLabel.Font = Enum.Font.SourceSansSemibold 
			TextLabel.Text = text 
			TextLabel.TextColor3 = COL3RGB(255, 255, 255) 
			TextLabel.TextSize = 14.000 
			TextLabel.Name = text 
			TextLabel.Parent = KeybindList.TextLabel.Frame 
		end 
	end 

	function keybindremove(text) 
		if KeybindList.TextLabel.Frame:FindFirstChild(text) then 
			KeybindList.TextLabel.Frame:FindFirstChild(text):Destroy() 
		end 
	end 

	function library:SetKeybindVisible(Joe) 
		KeybindList.Enabled = Joe 
	end 

	library.dragging = true 
	do 
		local UserInputService = game:GetService("UserInputService") 
		local a = Menu 
		local dragInput 
		local dragStart 
		local startPos 
		local function update(input) 
			local delta = input.Position - dragStart 
			a.Position = UDIM2(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
		end 
		a.InputBegan:Connect(function(input) 
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
				library.dragging = true 
				dragStart = input.Position 
				startPos = a.Position 

				input.Changed:Connect(function() 
					if input.UserInputState == Enum.UserInputState.End then 
						library.dragging = false 
					end 
				end) 
			end 
		end) 
		a.InputChanged:Connect(function(input) 
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then 
				dragInput = input 
			end 
		end) 
		UserInputService.InputChanged:Connect(function(input) 
			if input == dragInput and library.dragging then 
				update(input) 
			end 
		end) 
	end 

			TextLabel.Parent = Menu 
		TextLabel.BackgroundColor3 = COL3RGB(1, 1, 1) 
		TextLabel.BackgroundTransparency = 1 
		TextLabel.Position = UDIM2(0, 7, 0, 0) 
		TextLabel.Size = UDIM2(0, 0, 0, 29) 
		TextLabel.Size = UDIM2(0, txt:GetTextSize(name, 15, Enum.Font.SourceSansSemibold, Vec2(700, TextLabel.AbsoluteSize.Y)).X, 0, 29) 
		TextLabel.Font = Enum.Font.SourceSansSemibold 
		TextLabel.Text = name 
		TextLabel.TextColor3 = COL3RGB(28, 101, 223) 
		TextLabel.TextSize = 15.000 
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

		TabButtons.Name = "TabButtons" 
		TabButtons.Parent = Menu 
		TabButtons.BackgroundColor3 = COL3RGB(1, 1, 1) 
		TabButtons.BackgroundTransparency = 1 
		TabButtons.Position = UDIM2(TextLabel.Size.X.Scale, TextLabel.Size.X.Offset+10, 0, 0) 
		TabButtons.Size = UDIM2(TextLabel.Size.X.Scale, 590-TextLabel.Size.X.Offset, 0, 29) 

		UIListLayout.Parent = TabButtons 
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal 
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center 

		Tabs.Name = "Tabs" 
		Tabs.Parent = Menu 
		Tabs.BackgroundColor3 = COL3RGB(1, 1, 1) 
		Tabs.BackgroundTransparency = 1.000 
		Tabs.Position = UDIM2(0, 0, 0, 32) 
		Tabs.Size = UDIM2(0, 600, 0, 568) 

		local first = true 
		local currenttab 

		function menu:Tab(text) 
			local tabname 
			tabname = text 
			local Tab = {} 
			values[tabname] = {} 

			local TextButton = INST("TextButton") 
			TextButton.BackgroundColor3 = COL3RGB(255, 255, 255) 
			TextButton.BackgroundTransparency = 1 
			TextButton.Size = UDIM2(0, txt:GetTextSize(text, 15, Enum.Font.SourceSansSemibold, Vec2(700,700)).X+12, 1, 0) 
			TextButton.Font = Enum.Font.SourceSansSemibold 
			TextButton.Text = text 
			TextButton.TextColor3 = COL3RGB(255, 255, 255) 
			TextButton.TextSize = 15.000 
			TextButton.Parent = TabButtons 

			local TabGui = INST("Frame") 
			local Left = INST("Frame") 
			local UIListLayout = INST("UIListLayout") 
			local Right = INST("Frame") 
			local UIListLayout_2 = INST("UIListLayout") 

			TabGui.Name = "TabGui" 
			TabGui.Parent = Tabs 
			TabGui.BackgroundColor3 = COL3RGB(255, 255, 255) 
			TabGui.BackgroundTransparency = 1.000 
			TabGui.Size = UDIM2(1, 0, 1, 0) 
			TabGui.Visible = false 

			Left.Name = "Left" 
			Left.Parent = TabGui 
			Left.BackgroundColor3 = COL3RGB(255, 255, 255) 
			Left.BackgroundTransparency = 1.000 
			Left.Position = UDIM2(0, 15, 0, 11) 
			Left.Size = UDIM2(0, 279, 0, 543) 

			UIListLayout.Parent = Left 
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
			UIListLayout.Padding = UDim.new(0, 10) 

			Right.Name = "Right" 
			Right.Parent = TabGui 
			Right.BackgroundColor3 = COL3RGB(255, 255, 255) 
			Right.BackgroundTransparency = 1.000 
			Right.Position = UDIM2(0, 303, 0, 11) 
			Right.Size = UDIM2(0, 279, 0, 543) 

			UIListLayout_2.Parent = Right 
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center 
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder 
			UIListLayout_2.Padding = UDim.new(0, 10) 

			if first then 
				TextButton.TextColor3 = COL3RGB(255, 255, 255) 
				currenttab = text 
				TabGui.Visible = true 
				first = false 
			end 

			TextButton.MouseButton1Down:Connect(function() 
				if currenttab ~= text then 
					for i,v in pairs(TabButtons:GetChildren()) do 
						if v:IsA("TextButton") then 
							library:Tween(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) 
						end 
					end 
					for i,v in pairs(Tabs:GetChildren()) do 
						v.Visible = false 
					end 
					library:Tween(TextButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(30, 115, 255)}) 
					currenttab = text 
					TabGui.Visible = true 
				end 
			end) 

				function Tab:MSector(text, side)      
					local sectorname = text      
					local MSector = {}      
					values[tabname][text] = {}      


					local Section = INST("Frame")      
					local SectionText = INST("TextLabel")      
					local Inner = INST("Frame")      
					local sectiontabs = INST("Frame")      
					local UIListLayout_2 = INST("UIListLayout")      

					Section.Name = "Section"      
					Section.Parent = TabGui[side]      
					Section.BackgroundColor3 = COL3RGB(0,0,0)      
					Section.BorderColor3 = COL3RGB(0,0,0)      
					Section.BorderSizePixel = 2  
					Section.Size = UDIM2(1, 0, 0, 33)      

					SectionText.Name = "SectionText"      
					SectionText.Parent = Section      
					SectionText.BackgroundColor3 = COL3RGB(255, 255, 255)      
					SectionText.BackgroundTransparency = 1.000      
					SectionText.Position = UDIM2(0, 7, 0, -12)      
					SectionText.Size = UDIM2(0, 270, 0, 19)      
					SectionText.ZIndex = 2      
					SectionText.Font = Enum.Font.SourceSansSemibold      
					SectionText.Text = text      
					SectionText.TextColor3 = COL3RGB(255, 255, 255)      
					SectionText.TextSize = 15.000      
					SectionText.TextXAlignment = Enum.TextXAlignment.Left      

					Inner.Name = "Inner"      
					Inner.Parent = Section      
					Inner.BackgroundColor3 = COL3RGB(0,0,0)      
					Inner.BorderColor3 = COL3RGB(27, 27, 35)      
					Inner.BorderSizePixel = 3
					Inner.Position = UDIM2(0, 1, 0, 1)      
					Inner.Size = UDIM2(1, -2, 1, -9)      

					sectiontabs.Name = "sectiontabs"      
					sectiontabs.Parent = Section      
					sectiontabs.BackgroundColor3 = COL3RGB(35, 16, 142)      
					sectiontabs.BackgroundTransparency = 1.000      
					sectiontabs.Position = UDIM2(0, 0, 0, 6)      
					sectiontabs.Size = UDIM2(1, 0, 0, 22)      

					UIListLayout_2.Parent = sectiontabs      
					UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal      
					UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center      
					UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder      
					UIListLayout_2.Padding = UDim.new(0,4)      

					local firs = true      
					local selected      
					function MSector:Tab(text)      
						local tab = {}      
						values[tabname][sectorname][text] = {}      
						local tabtext = text      

						local tabsize = UDIM2(1, 0, 0, 44)      

						local tab1 = INST("Frame")      
						local UIPadding = INST("UIPadding")      
						local UIListLayout = INST("UIListLayout")      
						local TextButton = INST("TextButton")      

						tab1.Name = text      
						tab1.Parent = Inner      
						tab1.BackgroundColor3 = COL3RGB(0,0,0)      
						tab1.BorderColor3 = COL3RGB(27, 27, 35)      
						tab1.BorderSizePixel = 2    
						tab1.Position = UDIM2(0, 0, 0, 30)      
						tab1.Size = UDIM2(1, 0, 1, -21)      
						tab1.Name = text      
						tab1.Visible = false      

						UIPadding.Parent = tab1      
						UIPadding.PaddingTop = UDim.new(0, 0)      

						UIListLayout.Parent = tab1      
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      
						UIListLayout.Padding = UDim.new(0, 1)      

						TextButton.Parent = sectiontabs      
						TextButton.BackgroundColor3 = COL3RGB(255, 255, 255)      
						TextButton.BackgroundTransparency = 1.000      
						TextButton.Size = UDIM2(0, txt:GetTextSize(text, 14, Enum.Font.SourceSansSemibold, Vec2(700,700)).X + 2, 1, 0)      
						TextButton.Font = Enum.Font.SourceSansSemibold      
						TextButton.Text = text      
						TextButton.TextColor3 = COL3RGB(200, 200, 200)      
						TextButton.TextSize = 14.000      
						TextButton.Name = text      

						TextButton.MouseButton1Down:Connect(function()      
							for i,v in pairs(Inner:GetChildren()) do      
								v.Visible = false      
							end      
							for i,v in pairs(sectiontabs:GetChildren()) do      
								if v:IsA("TextButton") then      
									library:Tween(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)})      
								end      
							end      
							Section.Size = tabsize      
							tab1.Visible = true      
							library:Tween(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
						end)      

						function tab:Element(type, text, data, callback)      
							local Element = {}      
							data = data or {}      
							callback = callback or function() end      
							values[tabname][sectorname][tabtext][text] = {}      

							if type == "Jumbobox" then      
								tabsize = tabsize + UDIM2(0,0,0, 39)      
								Element.value = {Jumbobox = {}}      
								data.options = data.options or {}      

								local Dropdown = INST("Frame")      
								local Button = INST("TextButton")      
								local TextLabel = INST("TextLabel")      
								local Drop = INST("ScrollingFrame")      
								local Button_2 = INST("TextButton")      
								local TextLabel_2 = INST("TextLabel")      
								local UIListLayout = INST("UIListLayout")      
								local ImageLabel = INST("ImageLabel")      
								local TextLabel_3 = INST("TextLabel")      

								Dropdown.Name = "Dropdown"      
								Dropdown.Parent = tab1      
								Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Dropdown.BackgroundTransparency = 1.000      
								Dropdown.Position = UDIM2(0, 0, 0.255102038, 0)      
								Dropdown.Size = UDIM2(1, 0, 0, 39)      

								Button.Name = "Button"      
								Button.Parent = Dropdown      
								Button.BackgroundColor3 = COL3RGB(0,0,0)      
								Button.BorderColor3 = COL3RGB(27, 27, 35)      
								Button.Position = UDIM2(0, 30, 0, 16)      
								Button.Size = UDIM2(0, 175, 0, 17)      
								Button.AutoButtonColor = false      
								Button.Font = Enum.Font.SourceSans      
								Button.Text = ""      
								Button.TextColor3 = COL3RGB(0, 0, 0)      
								Button.TextSize = 14.000      

								TextLabel.Parent = Button      
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
								TextLabel.BackgroundTransparency = 1.000      
								TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
								TextLabel.Position = UDIM2(0, 5, 0, 0)      
								TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)      
								TextLabel.Font = Enum.Font.SourceSansSemibold      
								TextLabel.Text = "..."      
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
								TextLabel.TextSize = 14.000      
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

								local abcd = TextLabel      

								Drop.Name = "Drop"      
								Drop.Parent = Button      
								Drop.Active = true      
								Drop.BackgroundColor3 = COL3RGB(0,0,0)      
								Drop.BorderColor3 = COL3RGB(27, 27, 35)      
								Drop.Position = UDIM2(0, 0, 1, 1)      
								Drop.Size = UDIM2(1, 0, 0, 20)      
								Drop.Visible = false      
								Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"      
								Drop.CanvasSize = UDIM2(1, 1, 1, 1)      
								Drop.ScrollBarThickness = 0      
								Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"      
								Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"      
								Drop.AutomaticCanvasSize = "Y"      
								Drop.ZIndex = 5      
								Drop.ScrollBarImageColor3 = MainUIColor  

								UIListLayout.Parent = Drop      
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      

								values[tabname][sectorname][tabtext][text] = Element.value      
								local num = #data.options      
								if num > 5 then      
									Drop.Size = UDIM2(1, 0, 0, 85)      
								else      
									Drop.Size = UDIM2(1, 0, 0, 17*num)      
								end      
								local first = true      

								local function updatetext()      
									local old = {}      
									for i,v in ipairs(data.options) do      
										if TBLFIND(Element.value.Jumbobox, v) then      
											INSERT(old, v)      
										else      
										end      
									end      
									local str = ""      


									if #old == 0 then      
										str = "..."      
									else      
										if #old == 1 then      
											str = old[1]      
										else      
											for i,v in ipairs(old) do      
												if i == 1 then      
													str = v      
												else      
													if i > 2 then      
														if i < 4 then      
															str = str..",  ..."      
														end      
													else      
														str = str..",  "..v      
													end      
												end      
											end      
										end      
									end      

									abcd.Text = str      
								end      
								for i,v in ipairs(data.options) do      
									do      
										local Button = INST("TextButton")      
										local TextLabel = INST("TextLabel")      

										Button.Name = v      
										Button.Parent = Drop      
										Button.BackgroundColor3 = COL3RGB(35, 35, 47)      
										Button.BorderColor3 = COL3RGB(27, 27, 35)      
										Button.Position = UDIM2(0, 30, 0, 16)      
										Button.Size = UDIM2(0, 175, 0, 17)      
										Button.AutoButtonColor = false      
										Button.Font = Enum.Font.SourceSans      
										Button.Text = ""      
										Button.TextColor3 = COL3RGB(0, 0, 0)      
										Button.TextSize = 14.000      
										Button.BorderSizePixel = 2     
										Button.ZIndex = 6      

										TextLabel.Parent = Button      
										TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
										TextLabel.BackgroundTransparency = 1.000      
										TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
										TextLabel.Position = UDIM2(0, 5, 0, -1)      
										TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)      
										TextLabel.Font = Enum.Font.SourceSansSemibold      
										TextLabel.Text = v      
										TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
										TextLabel.TextSize = 14.000      
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left      
										TextLabel.ZIndex = 6      

										Button.MouseButton1Down:Connect(function()      
											if TBLFIND(Element.value.Jumbobox, v) then      
												for i,a in pairs(Element.value.Jumbobox) do      
													if a == v then      
														TBLREMOVE(Element.value.Jumbobox, i)      
													end      
												end      
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
											else      
												INSERT(Element.value.Jumbobox, v)      
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor})      
											end      
											updatetext()      

											values[tabname][sectorname][tabtext][text] = Element.value      
											callback(Element.value)      
										end)      
										Button.MouseEnter:Connect(function()      
											if not TBLFIND(Element.value.Jumbobox, v) then      
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
											end      
										end)      
										Button.MouseLeave:Connect(function()      
											if not TBLFIND(Element.value.Jumbobox, v) then      
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
											end      
										end)      

										first = false      
									end      
								end      
								function Element:SetValue(val)      
									Element.value = val      
									for i,v in pairs(Drop:GetChildren()) do      
										if v.Name ~= "UIListLayout" then      
											if TBLFIND(val.Jumbobox, v.Name) then      
												v.TextLabel.TextColor3 = COL3RGB(175, 175, 175)      
											else      
												v.TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
											end      
										end      
									end      
									updatetext()      
									values[tabname][sectorname][tabtext][text] = Element.value      
									callback(val)      
								end      
								if data.default then      
									Element:SetValue(data.default)      
								end      

								ImageLabel.Parent = Button      
								ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
								ImageLabel.BackgroundTransparency = 1.000      
								ImageLabel.Position = UDIM2(0, 165, 0, 6)      
								ImageLabel.Size = UDIM2(0, 6, 0, 4)      
								ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"      

								TextLabel_3.Parent = Dropdown      
								TextLabel_3.BackgroundColor3 = COL3RGB(200, 200, 200)      
								TextLabel_3.BackgroundTransparency = 1.000      
								TextLabel_3.Position = UDIM2(0, 32, 0, -1)      
								TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0)      
								TextLabel_3.Font = Enum.Font.SourceSansSemibold      
								TextLabel_3.Text = text      
								TextLabel_3.TextColor3 = MainUIColor  
								TextLabel_3.TextSize = 14.000      
								TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left      

								Button.MouseButton1Down:Connect(function()      
									Drop.Visible = not Drop.Visible      
									if not Drop.Visible then      
										Drop.CanvasPosition = Vec2(0,0)      
									end      
								end)      
								local indrop = false      
								local ind = false      
								Drop.MouseEnter:Connect(function()      
									indrop = true      
								end)      
								Drop.MouseLeave:Connect(function()      
									indrop = false      
								end)      
								Button.MouseEnter:Connect(function()      
									ind = true      
								end)      
								Button.MouseLeave:Connect(function()      
									ind = false      
								end)      
								game:GetService("UserInputService").InputBegan:Connect(function(input)      
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
										if Drop.Visible == true and not indrop and not ind then      
											Drop.Visible = false      
											Drop.CanvasPosition = Vec2(0,0)      
										end      
									end      
								end)      
							elseif type == "TextBox" then      

							elseif type == "ToggleKeybind" then      
								tabsize = tabsize + UDIM2(0,0,0,16)      
								Element.value = {Toggle = data.default and data.default.Toggle or false, Key, Type = "Always", Active = true}      

								local Toggle = INST("Frame")      
								local Button = INST("TextButton")      
								local Color = INST("Frame")      
								local TextLabel = INST("TextLabel")      

								Toggle.Name = "Toggle"      
								Toggle.Parent = tab1      
								Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Toggle.BackgroundTransparency = 1.000      
								Toggle.Size = UDIM2(1, 0, 0, 15)      

								Button.Name = "Button"      
								Button.Parent = Toggle      
								Button.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Button.BackgroundTransparency = 1.000      
								Button.Size = UDIM2(1, 0, 1, 0)      
								Button.Font = Enum.Font.SourceSans      
								Button.Text = ""      
								Button.TextColor3 = COL3RGB(0, 0, 0)      
								Button.TextSize = 14.000      

								Color.Name = "Color"      
								Color.Parent = Button      
								Color.BackgroundColor3 = COL3RGB(0,0,0)      
								Color.BorderColor3 = COL3RGB(27, 3275, 35)      
								Color.Position = UDIM2(0, 15, 0.5, -5)      
								Color.Size = UDIM2(0, 8, 0, 8)      
								local binding = false      
								TextLabel.Parent = Button      
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
								TextLabel.BackgroundTransparency = 1.000      
								TextLabel.Position = UDIM2(0, 32, 0, -1)      
								TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)      
								TextLabel.Font = Enum.Font.SourceSansSemibold      
								TextLabel.Text = text      
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
								TextLabel.TextSize = 14.000      
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

								local function update()      
									if Element.value.Toggle then      
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor})      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
									else      
										keybindremove(text)      
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(0,0,0)})      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
									end      
									values[tabname][sectorname][tabtext][text] = Element.value      
									callback(Element.value)      
								end      

								Button.MouseButton1Down:Connect(function()      
									if not binding then      
										Element.value.Toggle = not Element.value.Toggle      
										update()      
										values[tabname][sectorname][tabtext][text] = Element.value      
										callback(Element.value)      
									end      
								end)      
								if data.default then      
									update()      
								end      
								values[tabname][sectorname][tabtext][text] = Element.value      
								do      
									local Keybind = INST("TextButton")      
									local Frame = INST("Frame")      
									local Always = INST("TextButton")      
									local UIListLayout = INST("UIListLayout")      
									local Hold = INST("TextButton")      
									local Toggle = INST("TextButton")      

									Keybind.Name = "Keybind"      
									Keybind.Parent = Button      
									Keybind.BackgroundColor3 = COL3RGB(0,0,0)      
									Keybind.BorderColor3 = COL3RGB(27, 27, 35)      
									Keybind.Position = UDIM2(0, 270, 0.5, -6)      
									Keybind.Text = "NONE"      
									Keybind.Size = UDIM2(0, 43, 0, 12)      
									Keybind.Size = UDIM2(0,txt:GetTextSize("NONE", 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12)      
									Keybind.AutoButtonColor = false      
									Keybind.Font = Enum.Font.SourceSansSemibold      
									Keybind.TextColor3 = COL3RGB(200, 200, 200)      
									Keybind.TextSize = 14.000      
									Keybind.AnchorPoint = Vec2(1,0)      
									Keybind.ZIndex = 3      

									Frame.Parent = Keybind      
									Frame.BackgroundColor3 = COL3RGB(0,0,0)      
									Frame.BorderColor3 = COL3RGB(27, 27, 35)      
									Frame.Position = UDIM2(1, -49, 0, 1)      
									Frame.Size = UDIM2(0, 49, 0, 49)      
									Frame.Visible = false      
									Frame.ZIndex = 3      

									Always.Name = "Always"      
									Always.Parent = Frame      
									Always.BackgroundColor3 = COL3RGB(0,0,0)      
									Always.BackgroundTransparency = 1.000      
									Always.BorderColor3 = COL3RGB(27, 27, 35)      
									Always.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)      
									Always.Size = UDIM2(1, 0, 0, 16)      
									Always.AutoButtonColor = false      
									Always.Font = Enum.Font.SourceSansBold      
									Always.Text = "Always"      
									Always.TextColor3 = MainUIColor     
									Always.TextSize = 14.000      
									Always.ZIndex = 3      

									UIListLayout.Parent = Frame      
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      

									Hold.Name = "Hold"      
									Hold.Parent = Frame      
									Hold.BackgroundColor3 = COL3RGB(0,0,0)      
									Hold.BackgroundTransparency = 1.000      
									Hold.BorderColor3 = COL3RGB(27, 27, 35)      
									Hold.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)      
									Hold.Size = UDIM2(1, 0, 0, 16)      
									Hold.AutoButtonColor = false      
									Hold.Font = Enum.Font.SourceSansSemibold      
									Hold.Text = "Hold"      
									Hold.TextColor3 = COL3RGB(200, 200, 200)      
									Hold.TextSize = 14.000      
									Hold.ZIndex = 3      

									Toggle.Name = "Toggle"      
									Toggle.Parent = Frame      
									Toggle.BackgroundColor3 = COL3RGB(0,0,0)      
									Toggle.BackgroundTransparency = 1.000      
									Toggle.BorderColor3 = COL3RGB(27, 27, 35)      
									Toggle.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)      
									Toggle.Size = UDIM2(1, 0, 0, 16)      
									Toggle.AutoButtonColor = false      
									Toggle.Font = Enum.Font.SourceSansSemibold      
									Toggle.Text = "Toggle"      
									Toggle.TextColor3 = COL3RGB(200, 200, 200)      
									Toggle.TextSize = 14.000      
									Toggle.ZIndex = 3      

									for _,button in pairs(Frame:GetChildren()) do      
										if button:IsA("TextButton") then      
											button.MouseButton1Down:Connect(function()      
												Element.value.Type = button.Text      
												Frame.Visible = false      
												Element.value.Active = Element.value.Type == "Always" and true or false      
												if Element.value.Type == "Always" then      
													keybindremove(text)      
												end      
												for _,button in pairs(Frame:GetChildren()) do      
													if button:IsA("TextButton") and button.Text ~= Element.value.Type then      
														button.Font = Enum.Font.SourceSansSemibold      
														library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)})      
													end      
												end      
												button.Font = Enum.Font.SourceSansBold      
												button.TextColor3 = COL3RGB(60, 0, 90)      
												values[tabname][sectorname][tabtext][text] = Element.value      
												callback(Element.value)      
											end)      
											button.MouseEnter:Connect(function()      
												if Element.value.Type ~= button.Text then      
													library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255,255,255)})      
												end      
											end)      
											button.MouseLeave:Connect(function()      
												if Element.value.Type ~= button.Text then      
													library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)})      
												end      
											end)      
										end      
									end      
									Keybind.MouseButton1Down:Connect(function()      
										if not binding then      
											wait()      
											binding = true      
											Keybind.Text = "..."      
											Keybind.Size = UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12)      
										end      
									end)      
									Keybind.MouseButton2Down:Connect(function()      
										if not binding then      
											Frame.Visible = not Frame.Visible      
										end      
									end)      
									local Player = game.Players.LocalPlayer      
									local Mouse = Player:GetMouse()      
									local InFrame = false      
									Frame.MouseEnter:Connect(function()      
										InFrame = true      
									end)      
									Frame.MouseLeave:Connect(function()      
										InFrame = false      
									end)      
									local InFrame2 = false      
									Keybind.MouseEnter:Connect(function()      
										InFrame2 = true      
									end)      
									Keybind.MouseLeave:Connect(function()      
										InFrame2 = false      
									end)      
									game:GetService("UserInputService").InputBegan:Connect(function(input)      
										if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then      
											if Frame.Visible == true and not InFrame and not InFrame2 then      
												Frame.Visible = false      
											end      
										end      
										if binding then      
											binding = false      
											Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper()      
											Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12)      
											Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name      
											if input.KeyCode.Name == "Backspace" then      
												Keybind.Text = "NONE"      
												Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12)      
												Element.value.Key = nil      
											end      
										else      
											if Element.value.Key ~= nil then      
												if FIND(Element.value.Key, "Mouse") then      
													if input.UserInputType == Enum.UserInputType[Element.value.Key] then      
														if Element.value.Type == "Hold" then      
															Element.value.Active = true      
															if Element.value.Active and Element.value.Toggle then      
																keybindadd(text)      
															else      
																keybindremove(text)      
															end      
														elseif Element.value.Type == "Toggle" then      
															Element.value.Active = not Element.value.Active      
															if Element.value.Active and Element.value.Toggle then      
																keybindadd(text)      
															else      
																keybindremove(text)      
															end      
														end      
													end      
												else      
													if input.KeyCode == Enum.KeyCode[Element.value.Key] then      
														if Element.value.Type == "Hold" then      
															Element.value.Active = true      
															if Element.value.Active and Element.value.Toggle then      
																keybindadd(text)      
															else      
																keybindremove(text)      
															end      
														elseif Element.value.Type == "Toggle" then      
															Element.value.Active = not Element.value.Active      
															if Element.value.Active and Element.value.Toggle then      
																keybindadd(text)      
															else      
																keybindremove(text)      
															end      
														end      
													end      
												end      
											else      
												Element.value.Active = true      
											end      
										end      
										values[tabname][sectorname][tabtext][text] = Element.value      
										callback(Element.value)      
									end)      
									game:GetService("UserInputService").InputEnded:Connect(function(input)      
										if Element.value.Key ~= nil then      
											if FIND(Element.value.Key, "Mouse") then      
												if input.UserInputType == Enum.UserInputType[Element.value.Key] then      
													if Element.value.Type == "Hold" then      
														Element.value.Active = false      
														if Element.value.Active and Element.value.Toggle then      
															keybindadd(text)      
														else      
															keybindremove(text)      
														end      
													end      
												end      
											else      
												if input.KeyCode == Enum.KeyCode[Element.value.Key] then      
													if Element.value.Type == "Hold" then      
														Element.value.Active = false      
														if Element.value.Active and Element.value.Toggle then      
															keybindadd(text)      
														else      
															keybindremove(text)      
														end      
													end      
												end      
											end      
										end      
										values[tabname][sectorname][tabtext][text] = Element.value      
										callback(Element.value)      
									end)      
								end      
								function Element:SetValue(value)      
									Element.value = value      
									update()      
								end      
							elseif type == "Toggle" then      
								tabsize = tabsize + UDIM2(0,0,0,16)      
								Element.value = {Toggle = data.default and data.default.Toggle or false}      

								local Toggle = INST("Frame")      
								local Button = INST("TextButton")      
								local Color = INST("Frame")      
								local TextLabel = INST("TextLabel")      

								Toggle.Name = "Toggle"      
								Toggle.Parent = tab1      
								Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Toggle.BackgroundTransparency = 1.000      
								Toggle.Size = UDIM2(1, 0, 0, 15)      

								Button.Name = "Button"      
								Button.Parent = Toggle      
								Button.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Button.BackgroundTransparency = 1.000      
								Button.Size = UDIM2(1, 0, 1, 0)      
								Button.Font = Enum.Font.SourceSans      
								Button.Text = ""      
								Button.TextColor3 = COL3RGB(0, 0, 0)      
								Button.TextSize = 14.000      

								Color.Name = "Color"      
								Color.Parent = Button      
								Color.BackgroundColor3 = COL3RGB(0,0,0)      
								Color.BorderColor3 = COL3RGB(27, 27, 35)      
								Color.Position = UDIM2(0, 15, 0.5, -5)      
								Color.Size = UDIM2(0, 8, 0, 8)      

								TextLabel.Parent = Button      
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
								TextLabel.BackgroundTransparency = 1.000      
								TextLabel.Position = UDIM2(0, 32, 0, -1)      
								TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)      
								TextLabel.Font = Enum.Font.SourceSansSemibold      
								TextLabel.Text = text      
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
								TextLabel.TextSize = 14.000      
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

								local function update()      
									if Element.value.Toggle then      
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor})      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
									else      
										keybindremove(text)      
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(0,0,0)})      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
									end      
									values[tabname][sectorname][tabtext][text] = Element.value      
								end      

								Button.MouseButton1Down:Connect(function()      
									Element.value.Toggle = not Element.value.Toggle      
									update()      
									values[tabname][sectorname][tabtext][text] = Element.value      
									callback(Element.value)      
								end)      
								if data.default then      
									update()      
								end      
								values[tabname][sectorname][tabtext][text] = Element.value      
								function Element:SetValue(value)      
									Element.value = value      
									values[tabname][sectorname][tabtext][text] = Element.value      
									update()      
									callback(Element.value)      
								end      
							elseif type == "ToggleColor" then      
								tabsize = tabsize + UDIM2(0,0,0,16)      
								Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or COL3RGB(255,255,255)}      

								local Toggle = INST("Frame")      
								local Button = INST("TextButton")      
								local Color = INST("Frame")      
								local TextLabel = INST("TextLabel")      

								Toggle.Name = "Toggle"      
								Toggle.Parent = tab1      
								Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Toggle.BackgroundTransparency = 1.000      
								Toggle.Size = UDIM2(1, 0, 0, 15)      

								Button.Name = "Button"      
								Button.Parent = Toggle      
								Button.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Button.BackgroundTransparency = 1.000      
								Button.Size = UDIM2(1, 0, 1, 0)      
								Button.Font = Enum.Font.SourceSans      
								Button.Text = ""      
								Button.TextColor3 = COL3RGB(0, 0, 0)      
								Button.TextSize = 14.000      

								Color.Name = "Color"      
								Color.Parent = Button      
								Color.BackgroundColor3 = COL3RGB(0,0,0)      
								Color.BorderColor3 = COL3RGB(27, 27, 35)      
								Color.Position = UDIM2(0, 15, 0.5, -5)      
								Color.Size = UDIM2(0, 8, 0, 8)      

								TextLabel.Parent = Button      
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
								TextLabel.BackgroundTransparency = 1.000      
								TextLabel.Position = UDIM2(0, 32, 0, -1)      
								TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)      
								TextLabel.Font = Enum.Font.SourceSansSemibold      
								TextLabel.Text = text      
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
								TextLabel.TextSize = 14.000      
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

								local function update()      
									if Element.value.Toggle then      
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 155, 155)})      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
									else      
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(0,0,0)})      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
									end      
									values[tabname][sectorname][tabtext][text] = Element.value      
									callback(Element.value)      
								end      

								local ColorH,ColorS,ColorV      

								local ColorP = INST("TextButton")      
								local Frame = INST("Frame")      
								local Colorpick = INST("ImageButton")      
								local ColorDrag = INST("Frame")      
								local Huepick = INST("ImageButton")      
								local Huedrag = INST("Frame")      

								ColorP.Name = "ColorP"      
								ColorP.Parent = Button      
								ColorP.AnchorPoint = Vec2(1, 0)      
								ColorP.BackgroundColor3 = COL3RGB(255, 0, 0)      
								ColorP.BorderColor3 = COL3RGB(27, 27, 35)      
								ColorP.Position = UDIM2(0, 270, 0.5, -4)      
								ColorP.Size = UDIM2(0, 18, 0, 8)      
								ColorP.AutoButtonColor = false      
								ColorP.Font = Enum.Font.SourceSansSemibold      
								ColorP.Text = ""      
								ColorP.TextColor3 = COL3RGB(200, 200, 200)      
								ColorP.TextSize = 14.000      

								Frame.Parent = ColorP      
								Frame.BackgroundColor3 = COL3RGB(0,0,0)      
								Frame.BorderColor3 = COL3RGB(27, 27, 35)      
								Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0)      
								Frame.Size = UDIM2(0, 200, 0, 170)      
								Frame.Visible = false      
								Frame.ZIndex = 3      

								Colorpick.Name = "Colorpick"      
								Colorpick.Parent = Frame      
								Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Colorpick.BorderColor3 = COL3RGB(27, 27, 35)      
								Colorpick.ClipsDescendants = false      
								Colorpick.Position = UDIM2(0, 40, 0, 10)      
								Colorpick.Size = UDIM2(0, 150, 0, 150)      
								Colorpick.AutoButtonColor = false      
								Colorpick.Image = "rbxassetid://4155801252"      
								Colorpick.ImageColor3 = COL3RGB(255, 0, 0)      
								Colorpick.ZIndex = 3      

								ColorDrag.Name = "ColorDrag"      
								ColorDrag.Parent = Colorpick      
								ColorDrag.AnchorPoint = Vec2(0.5, 0.5)      
								ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255)      
								ColorDrag.BorderColor3 = COL3RGB(27, 27, 35)      
								ColorDrag.Size = UDIM2(0, 4, 0, 4)      
								ColorDrag.ZIndex = 3      

								Huepick.Name = "Huepick"      
								Huepick.Parent = Frame      
								Huepick.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Huepick.BorderColor3 = COL3RGB(27, 27, 35)      
								Huepick.ClipsDescendants = false      
								Huepick.Position = UDIM2(0, 10, 0, 10)      
								Huepick.Size = UDIM2(0, 20, 0, 150)      
								Huepick.AutoButtonColor = false      
								Huepick.Image = "rbxassetid://3641079629"      
								Huepick.ImageColor3 = COL3RGB(255, 0, 0)      
								Huepick.ImageTransparency = 1      
								Huepick.BackgroundTransparency = 0      
								Huepick.ZIndex = 3      

								local HueFrameGradient = INST("UIGradient")      
								HueFrameGradient.Rotation = 90      
								HueFrameGradient.Name = "HueFrameGradient"      
								HueFrameGradient.Parent = Huepick      
								HueFrameGradient.Color = ColorSequence.new {      
									ColorSequenceKeypoint.new(0.00, COL3RGB(255, 0, 0)),      
									ColorSequenceKeypoint.new(0.17, COL3RGB(255, 0, 255)),      
									ColorSequenceKeypoint.new(0.33, COL3RGB(0, 0, 255)),      
									ColorSequenceKeypoint.new(0.50, COL3RGB(0, 255, 255)),      
									ColorSequenceKeypoint.new(0.67, COL3RGB(0, 255, 0)),      
									ColorSequenceKeypoint.new(0.83, COL3RGB(255, 255, 0)),      
									ColorSequenceKeypoint.new(1.00, COL3RGB(255, 0, 0))      
								}	      

								Huedrag.Name = "Huedrag"      
								Huedrag.Parent = Huepick      
								Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Huedrag.BorderColor3 = COL3RGB(27, 27, 35)      
								Huedrag.Size = UDIM2(1, 0, 0, 2)      
								Huedrag.ZIndex = 3      

								ColorP.MouseButton1Down:Connect(function()      
									Frame.Visible = not Frame.Visible      
								end)      
								local abc = false      
								local inCP = false      
								ColorP.MouseEnter:Connect(function()      
									abc = true      
								end)      
								ColorP.MouseLeave:Connect(function()      
									abc = false      
								end)      
								Frame.MouseEnter:Connect(function()      
									inCP = true      
								end)      
								Frame.MouseLeave:Connect(function()      
									inCP = false      
								end)      

								ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y)      
								ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
								ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      

								if data.default.Color ~= nil then      
									ColorH, ColorS, ColorV = data.default.Color:ToHSV()      

									ColorH = CLAMP(ColorH,0,1)      
									ColorS = CLAMP(ColorS,0,1)      
									ColorV = CLAMP(ColorV,0,1)      
									ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)      
									Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      

									ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
									Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)      
								end      

								local mouse = LocalPlayer:GetMouse()      
								game:GetService("UserInputService").InputBegan:Connect(function(input)      
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
										if not dragging and not abc and not inCP then      
											Frame.Visible = false      
										end      
									end      
								end)      

								local function updateColor()      
									local ColorX = (CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
									local ColorY = (CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      
									ColorDrag.Position = UDIM2(ColorX, 0, ColorY, 0)      
									ColorS = 1-ColorX      
									ColorV = 1-ColorY      
									Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
									ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
									values[tabname][sectorname][tabtext][text] = Element.value      
									Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)      
									callback(Element.value)      
								end      
								local function updateHue()      
									local y = CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)      
									Huedrag.Position = UDIM2(0, 0, 0, y)      
									hue = y/148      
									ColorH = 1-hue      
									Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
									ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
									values[tabname][sectorname][tabtext][text] = Element.value      
									Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)      
									callback(Element.value)      
								end      
								Colorpick.MouseButton1Down:Connect(function()      
									updateColor()      
									moveconnection = mouse.Move:Connect(function()      
										updateColor()      
									end)      
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
											updateColor()      
											moveconnection:Disconnect()      
											releaseconnection:Disconnect()      
										end      
									end)      
								end)      
								Huepick.MouseButton1Down:Connect(function()      
									updateHue()      
									moveconnection = mouse.Move:Connect(function()      
										updateHue()      
									end)      
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
											updateHue()      
											moveconnection:Disconnect()      
											releaseconnection:Disconnect()      
										end      
									end)      
								end)      

								Button.MouseButton1Down:Connect(function()      
									Element.value.Toggle = not Element.value.Toggle      
									update()      
									values[tabname][sectorname][tabtext][text] = Element.value      
									callback(Element.value)      
								end)      
								if data.default then      
									update()      
								end      
								values[tabname][sectorname][tabtext][text] = Element.value      
								function Element:SetValue(value)      
									Element.value = value      
									local duplicate = COL3(value.Color.R, value.Color.G, value.Color.B)      
									ColorH, ColorS, ColorV = duplicate:ToHSV()      
									ColorH = CLAMP(ColorH,0,1)      
									ColorS = CLAMP(ColorS,0,1)      
									ColorV = CLAMP(ColorV,0,1)      

									ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)      
									Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
									ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
									update()      
									Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)      
								end      
							elseif type == "ToggleTrans" then      
								tabsize = tabsize + UDIM2(0,0,0,16)      
								Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or COL3RGB(255,255,255), Transparency = data.default and data.default.Transparency or 0}      

								local Toggle = INST("Frame")      
								local Button = INST("TextButton")      
								local Color = INST("Frame")      
								local TextLabel = INST("TextLabel")      

								Toggle.Name = "Toggle"      
								Toggle.Parent = tab1      
								Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Toggle.BackgroundTransparency = 1.000      
								Toggle.Size = UDIM2(1, 0, 0, 15)      

								Button.Name = "Button"      
								Button.Parent = Toggle      
								Button.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Button.BackgroundTransparency = 1.000      
								Button.Size = UDIM2(1, 0, 1, 0)      
								Button.Font = Enum.Font.SourceSans      
								Button.Text = ""      
								Button.TextColor3 = COL3RGB(0, 0, 0)      
								Button.TextSize = 14.000      

								Color.Name = "Color"      
								Color.Parent = Button      
								Color.BackgroundColor3 = COL3RGB(0,0,0)      
								Color.BorderColor3 = COL3RGB(27, 27, 35)      
								Color.Position = UDIM2(0, 15, 0.5, -5)      
								Color.Size = UDIM2(0, 8, 0, 8)      

								TextLabel.Parent = Button      
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
								TextLabel.BackgroundTransparency = 1.000      
								TextLabel.Position = UDIM2(0, 32, 0, -1)      
								TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)      
								TextLabel.Font = Enum.Font.SourceSansSemibold      
								TextLabel.Text = text      
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
								TextLabel.TextSize = 14.000      
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

								local function update()      
									if Element.value.Toggle then      
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 155, 155)})      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
									else      
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(0,0,0)})      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
									end      
									values[tabname][sectorname][tabtext][text] = Element.value      
									callback(Element.value)      
								end      

								local ColorH,ColorS,ColorV      

								local ColorP = INST("TextButton")      
								local Frame = INST("Frame")      
								local Colorpick = INST("ImageButton")      
								local ColorDrag = INST("Frame")      
								local Huepick = INST("ImageButton")      
								local Huedrag = INST("Frame")      

								ColorP.Name = "ColorP"      
								ColorP.Parent = Button      
								ColorP.AnchorPoint = Vec2(1, 0)      
								ColorP.BackgroundColor3 = COL3RGB(255, 0, 0)      
								ColorP.BorderColor3 = COL3RGB(27, 27, 35)      
								ColorP.Position = UDIM2(0, 270, 0.5, -4)      
								ColorP.Size = UDIM2(0, 18, 0, 8)      
								ColorP.AutoButtonColor = false      
								ColorP.Font = Enum.Font.SourceSansSemibold      
								ColorP.Text = ""      
								ColorP.TextColor3 = COL3RGB(200, 200, 200)      
								ColorP.TextSize = 14.000      

								Frame.Parent = ColorP      
								Frame.BackgroundColor3 = COL3RGB(0,0,0)      
								Frame.BorderColor3 = COL3RGB(27, 27, 35)      
								Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0)      
								Frame.Size = UDIM2(0, 200, 0, 190)      
								Frame.Visible = false      
								Frame.ZIndex = 3      

								Colorpick.Name = "Colorpick"      
								Colorpick.Parent = Frame      
								Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Colorpick.BorderColor3 = COL3RGB(27, 27, 35)      
								Colorpick.ClipsDescendants = false      
								Colorpick.Position = UDIM2(0, 40, 0, 10)      
								Colorpick.Size = UDIM2(0, 150, 0, 150)      
								Colorpick.AutoButtonColor = false      
								Colorpick.Image = "rbxassetid://4155801252"      
								Colorpick.ImageColor3 = COL3RGB(255, 0, 0)      
								Colorpick.ZIndex = 3      

								ColorDrag.Name = "ColorDrag"      
								ColorDrag.Parent = Colorpick      
								ColorDrag.AnchorPoint = Vec2(0.5, 0.5)      
								ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255)      
								ColorDrag.BorderColor3 = COL3RGB(27, 27, 35)      
								ColorDrag.Size = UDIM2(0, 4, 0, 4)      
								ColorDrag.ZIndex = 3      

								Huepick.Name = "Huepick"      
								Huepick.Parent = Frame      
								Huepick.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Huepick.BorderColor3 = COL3RGB(27, 27, 35)      
								Huepick.ClipsDescendants = true      
								Huepick.Position = UDIM2(0, 10, 0, 10)      
								Huepick.Size = UDIM2(0, 20, 0, 150)      
								Huepick.AutoButtonColor = false      
								Huepick.Image = "rbxassetid://3641079629"      
								Huepick.ImageColor3 = COL3RGB(255, 0, 0)      
								Huepick.ImageTransparency = 1      
								Huepick.BackgroundTransparency = 0      
								Huepick.ZIndex = 3      

								local HueFrameGradient = INST("UIGradient")      
								HueFrameGradient.Rotation = 90      
								HueFrameGradient.Name = "HueFrameGradient"      
								HueFrameGradient.Parent = Huepick      
								HueFrameGradient.Color = ColorSequence.new {      
									ColorSequenceKeypoint.new(0.00, COL3RGB(100, 255, 100)),         
									ColorSequenceKeypoint.new(1.00, COL3RGB(0, 255, 255))      
								}	      

								Huedrag.Name = "Huedrag"      
								Huedrag.Parent = Huepick      
								Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Huedrag.BorderColor3 = COL3RGB(27, 27, 35)      
								Huedrag.Size = UDIM2(1, 0, 0, 2)      
								Huedrag.ZIndex = 3      

								local Transpick = INST("ImageButton")      
								local Transcolor = INST("ImageLabel")      
								local Transdrag = INST("Frame")      

								Transpick.Name = "Transpick"      
								Transpick.Parent = Frame      
								Transpick.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Transpick.BorderColor3 = COL3RGB(27, 27, 35)      
								Transpick.Position = UDIM2(0, 10, 0, 167)      
								Transpick.Size = UDIM2(0, 180, 0, 15)      
								Transpick.AutoButtonColor = false      
								Transpick.Image = "rbxassetid://3887014957"      
								Transpick.ScaleType = Enum.ScaleType.Tile      
								Transpick.TileSize = UDIM2(0, 10, 0, 10)      
								Transpick.ZIndex = 3      

								Transcolor.Name = "Transcolor"      
								Transcolor.Parent = Transpick      
								Transcolor.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Transcolor.BackgroundTransparency = 1.000      
								Transcolor.Size = UDIM2(1, 0, 1, 0)      
								Transcolor.Image = "rbxassetid://3887017050"      
								Transcolor.ImageColor3 = COL3RGB(255, 0, 4)      
								Transcolor.ZIndex = 3      

								Transdrag.Name = "Transdrag"      
								Transdrag.Parent = Transcolor      
								Transdrag.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Transdrag.BorderColor3 = COL3RGB(27, 27, 35)      
								Transdrag.Position = UDIM2(0, -1, 0, 0)      
								Transdrag.Size = UDIM2(0, 2, 1, 0)      
								Transdrag.ZIndex = 3      

								ColorP.MouseButton1Down:Connect(function()      
									Frame.Visible = not Frame.Visible      
								end)      
								local abc = false      
								local inCP = false      
								ColorP.MouseEnter:Connect(function()      
									abc = true      
								end)      
								ColorP.MouseLeave:Connect(function()      
									abc = false      
								end)      
								Frame.MouseEnter:Connect(function()      
									inCP = true      
								end)      
								Frame.MouseLeave:Connect(function()      
									inCP = false      
								end)      

								ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y)      
								ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
								ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      

								if data.default.Color ~= nil then      
									ColorH, ColorS, ColorV = data.default.Color:ToHSV()      

									ColorH = CLAMP(ColorH,0,1)      
									ColorS = CLAMP(ColorS,0,1)      
									ColorV = CLAMP(ColorV,0,1)      
									ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)      
									Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      

									Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)      

									ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
									Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)      
								end      
								if data.default.Transparency ~= nil then      
									Transdrag.Position = UDIM2(data.default.Transparency, -1, 0, 0)      
								end      
								local mouse = LocalPlayer:GetMouse()      
								game:GetService("UserInputService").InputBegan:Connect(function(input)      
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
										if not dragging and not abc and not inCP then      
											Frame.Visible = false      
										end      
									end      
								end)      

								local function updateColor()      
									local ColorX = (CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
									local ColorY = (CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      
									ColorDrag.Position = UDIM2(ColorX, 0, ColorY, 0)      
									ColorS = 1-ColorX      
									ColorV = 1-ColorY      
									Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
									ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
									Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)      
									values[tabname][sectorname][tabtext][text] = Element.value      
									Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)      
									callback(Element.value)      
								end      
								local function updateHue()      
									local y = CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)      
									Huedrag.Position = UDIM2(0, 0, 0, y)      
									hue = y/148      
									ColorH = 1-hue      
									Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
									Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)      
									ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
									values[tabname][sectorname][tabtext][text] = Element.value      
									Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)      
									callback(Element.value)      
								end      
								local function updateTrans()      
									local x = CLAMP(mouse.X - Transpick.AbsolutePosition.X, 0, 178)      
									Transdrag.Position = UDIM2(0, x, 0, 0)      
									Element.value.Transparency = (x/178)      
									values[tabname][sectorname][tabtext][text] = Element.value      
									callback(Element.value)      
								end      
								Transpick.MouseButton1Down:Connect(function()      
									updateTrans()      
									moveconnection = mouse.Move:Connect(function()      
										updateTrans()      
									end)      
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
											updateTrans()      
											moveconnection:Disconnect()      
											releaseconnection:Disconnect()      
										end      
									end)      
								end)      
								Colorpick.MouseButton1Down:Connect(function()      
									updateColor()      
									moveconnection = mouse.Move:Connect(function()      
										updateColor()      
									end)      
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
											updateColor()      
											moveconnection:Disconnect()      
											releaseconnection:Disconnect()      
										end      
									end)      
								end)      
								Huepick.MouseButton1Down:Connect(function()      
									updateHue()      
									moveconnection = mouse.Move:Connect(function()      
										updateHue()      
									end)      
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
											updateHue()      
											moveconnection:Disconnect()      
											releaseconnection:Disconnect()      
										end      
									end)      
								end)      

								Button.MouseButton1Down:Connect(function()      
									Element.value.Toggle = not Element.value.Toggle      
									update()      
									values[tabname][sectorname][tabtext][text] = Element.value      
									callback(Element.value)      
								end)      
								if data.default then      
									update()      
								end      
								values[tabname][sectorname][tabtext][text] = Element.value      
								function Element:SetValue(value)      
									Element.value = value      
									local duplicate = COL3(value.Color.R, value.Color.G, value.Color.B)      
									ColorH, ColorS, ColorV = duplicate:ToHSV()      
									ColorH = CLAMP(ColorH,0,1)      
									ColorS = CLAMP(ColorS,0,1)      
									ColorV = CLAMP(ColorV,0,1)      

									ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)      
									Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
									ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
									update()      
									Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)      
								end      
							elseif type == "Dropdown" then      
								tabsize = tabsize + UDIM2(0,0,0,39)      
								Element.value = {Dropdown = data.options[1]}      

								local Dropdown = INST("Frame")      
								local Button = INST("TextButton")      
								local TextLabel = INST("TextLabel")      
								local Drop = INST("ScrollingFrame")      
								local Button_2 = INST("TextButton")      
								local TextLabel_2 = INST("TextLabel")      
								local UIListLayout = INST("UIListLayout")      
								local ImageLabel = INST("ImageLabel")      
								local TextLabel_3 = INST("TextLabel")      

								Dropdown.Name = "Dropdown"      
								Dropdown.Parent = tab1      
								Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Dropdown.BackgroundTransparency = 1.000      
								Dropdown.Position = UDIM2(0, 0, 0.255102038, 0)      
								Dropdown.Size = UDIM2(1, 0, 0, 39)      

								Button.Name = "Button"      
								Button.Parent = Dropdown      
								Button.BackgroundColor3 = COL3RGB(0,0,0)      
								Button.BorderColor3 = COL3RGB(27, 27, 35)      
								Button.Position = UDIM2(0, 30, 0, 16)      
								Button.Size = UDIM2(0, 175, 0, 17)      
								Button.AutoButtonColor = false      
								Button.Font = Enum.Font.SourceSans      
								Button.Text = ""      
								Button.TextColor3 = COL3RGB(0, 0, 0)      
								Button.TextSize = 14.000      

								TextLabel.Parent = Button      
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
								TextLabel.BackgroundTransparency = 1.000      
								TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
								TextLabel.Position = UDIM2(0, 5, 0, 0)      
								TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)      
								TextLabel.Font = Enum.Font.SourceSansSemibold      
								TextLabel.Text = Element.value.Dropdown      
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
								TextLabel.TextSize = 14.000      
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

								local abcd = TextLabel      

								Drop.Name = "Drop"      
								Drop.Parent = Button      
								Drop.Active = true      
								Drop.BackgroundColor3 = COL3RGB(0,0,0)      
								Drop.BorderColor3 = COL3RGB(27, 27, 35)      
								Drop.Position = UDIM2(0, 0, 1, 1)      
								Drop.Size = UDIM2(1, 0, 0, 20)      
								Drop.Visible = false      
								Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"      
								Drop.CanvasSize = UDIM2(1, 1, 1, 1)      
								Drop.ScrollBarThickness = 0      
								Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"      
								Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"      
								Drop.AutomaticCanvasSize = "Y"      
								Drop.ZIndex = 5      
								Drop.ScrollBarImageColor3 = MainUIColor  

								UIListLayout.Parent = Drop      
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      

								local num = #data.options      
								if num > 5 then      
									Drop.Size = UDIM2(1, 0, 0, 85)      
								else      
									Drop.Size = UDIM2(1, 0, 0, 17*num)      
								end      
								Drop.CanvasSize = UDIM2(1, 0, 0, 17*num)      
								local first = true      
								for i,v in ipairs(data.options) do      
									do      
										local Button = INST("TextButton")      
										local TextLabel = INST("TextLabel")      

										Button.Name = v      
										Button.Parent = Drop      
										Button.BackgroundColor3 = COL3RGB(0,0,0)      
										Button.BorderColor3 = COL3RGB(27, 27, 35)      
										Button.Position = UDIM2(0, 30, 0, 16)      
										Button.Size = UDIM2(0, 175, 0, 17)      
										Button.AutoButtonColor = false      
										Button.Font = Enum.Font.SourceSans      
										Button.Text = ""      
										Button.TextColor3 = COL3RGB(0, 0, 0)      
										Button.TextSize = 14.000      
										Button.BorderSizePixel = 2      
										Button.ZIndex = 6      

										TextLabel.Parent = Button      
										TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
										TextLabel.BackgroundTransparency = 1.000      
										TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
										TextLabel.Position = UDIM2(0, 5, 0, -1)      
										TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)      
										TextLabel.Font = Enum.Font.SourceSansSemibold      
										TextLabel.Text = v      
										TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
										TextLabel.TextSize = 14.000      
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left      
										TextLabel.ZIndex = 6      

										Button.MouseButton1Down:Connect(function()      
											Drop.Visible = false      
											Element.value.Dropdown = v      
											abcd.Text = v      
											values[tabname][sectorname][tabtext][text] = Element.value      
											callback(Element.value)      
											Drop.CanvasPosition = Vec2(0,0)      
										end)      
										Button.MouseEnter:Connect(function()      
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(255, 255, 255)})      
										end)      
										Button.MouseLeave:Connect(function()      
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(200, 200, 200)})      
										end)      

										first = false      
									end      
								end      

								function Element:SetValue(val)      
									Element.value = val      
									abcd.Text = val.Dropdown      
									values[tabname][sectorname][tabtext][text] = Element.value      
									callback(val)      
								end      

								ImageLabel.Parent = Button      
								ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
								ImageLabel.BackgroundTransparency = 1.000      
								ImageLabel.Position = UDIM2(0, 165, 0, 6)      
								ImageLabel.Size = UDIM2(0, 6, 0, 4)      
								ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"      

								TextLabel_3.Parent = Dropdown      
								TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255)      
								TextLabel_3.BackgroundTransparency = 1.000      
								TextLabel_3.Position = UDIM2(0, 32, 0, -1)      
								TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0)      
								TextLabel_3.Font = Enum.Font.SourceSansSemibold      
								TextLabel_3.Text = text      
								TextLabel_3.TextColor3 = COL3RGB(200, 200, 200)      
								TextLabel_3.TextSize = 14.000      
								TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left      

								Button.MouseButton1Down:Connect(function()      
									Drop.Visible = not Drop.Visible      
									if not Drop.Visible then      
										Drop.CanvasPosition = Vec2(0,0)      
									end      
								end)      
								local indrop = false      
								local ind = false      
								Drop.MouseEnter:Connect(function()      
									indrop = true      
								end)      
								Drop.MouseLeave:Connect(function()      
									indrop = false      
								end)      
								Button.MouseEnter:Connect(function()      
									ind = true      
								end)      
								Button.MouseLeave:Connect(function()      
									ind = false      
								end)      
								game:GetService("UserInputService").InputBegan:Connect(function(input)      
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
										if Drop.Visible == true and not indrop and not ind then      
											Drop.Visible = false      
											Drop.CanvasPosition = Vec2(0,0)      
										end      
									end      
								end)      
								values[tabname][sectorname][tabtext][text] = Element.value      
							elseif type == "Slider" then      

								tabsize = tabsize + UDIM2(0,0,0,25)      

								local Slider = INST("Frame")      
								local TextLabel = INST("TextLabel")      
								local Button = INST("TextButton")      
								local Frame = INST("Frame")      
								local UIGradient = INST("UIGradient")      
								local Value = INST("TextLabel")      

								Slider.Name = "Slider"      
								Slider.Parent = tab1      
								Slider.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Slider.BackgroundTransparency = 1.000      
								Slider.Position = UDIM2(0, 0, 0.653061211, 0)      
								Slider.Size = UDIM2(1, 0, 0, 25)      

								TextLabel.Parent = Slider      
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
								TextLabel.BackgroundTransparency = 1.000      
								TextLabel.Position = UDIM2(0, 32, 0, -2)      
								TextLabel.Size = UDIM2(0, 100, 0, 15)      
								TextLabel.Font = Enum.Font.SourceSansSemibold      
								TextLabel.Text = text      
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
								TextLabel.TextSize = 14.000      
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

								Button.Name = "Button"      
								Button.Parent = Slider      
								Button.BackgroundColor3 = COL3RGB(0,0,0)      
								Button.BorderColor3 = COL3RGB(27, 27, 35)      
								Button.Position = UDIM2(0, 30, 0, 15)      
								Button.Size = UDIM2(0, 175, 0, 5)      
								Button.AutoButtonColor = false      
								Button.Font = Enum.Font.SourceSans      
								Button.Text = ""      
								Button.TextColor3 = COL3RGB(0, 0, 0)      
								Button.TextSize = 14.000      

								Frame.Parent = Button      
								Frame.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Frame.BorderSizePixel = 2      
								Frame.Size = UDIM2(0.5, 0, 1, 0)      

								UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,MainUIColor), ColorSequenceKeypoint.new(1, MainUIColor)}      
								UIGradient.Rotation = 90      
								UIGradient.Parent = Frame      

								Value.Name = "Value"      
								Value.Parent = Slider      
								Value.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Value.BackgroundTransparency = 1.000      
								Value.Position = UDIM2(0, 150, 0, -1)      
								Value.Size = UDIM2(0, 55, 0, 15)      
								Value.Font = Enum.Font.SourceSansSemibold      
								Value.Text = "50"      
								Value.TextColor3 = COL3RGB(200, 200, 200)      
								Value.TextSize = 14.000      
								Value.TextXAlignment = Enum.TextXAlignment.Right      
								local min, max, default = data.min or 0, data.max or 100, data.default or 0      
								Element.value = {Slider = default}      

								function Element:SetValue(value)      
									Element.value = value      
									local a      
									if min > 0 then      
										a = ((Element.value.Slider - min)) / (max-min)      
									else      
										a = (Element.value.Slider-min)/(max-min)      
									end      
									Value.Text = Element.value.Slider      
									Frame.Size = UDIM2(a,0,1,0)      
									values[tabname][sectorname][tabtext][text] = Element.value      
									callback(value)      
								end      
								local a      
								if min > 0 then      
									a = ((Element.value.Slider - min)) / (max-min)      
								else      
									a = (Element.value.Slider-min)/(max-min)      
								end      
								Value.Text = Element.value.Slider      
								Frame.Size = UDIM2(a,0,1,0)      
								values[tabname][sectorname][tabtext][text] = Element.value      
								local uis = game:GetService("UserInputService")      
								local mouse = game.Players.LocalPlayer:GetMouse()      
								local val      
								Button.MouseButton1Down:Connect(function()      
									Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)      
									val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) or 0      
									Value.Text = val      
									Element.value.Slider = val      
									values[tabname][sectorname][tabtext][text] = Element.value      
									callback(Element.value)      
									moveconnection = mouse.Move:Connect(function()      
										Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)      
										val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min))      
										Value.Text = val      
										Element.value.Slider = val      
										values[tabname][sectorname][tabtext][text] = Element.value      
										callback(Element.value)      
									end)      
									releaseconnection = uis.InputEnded:Connect(function(Mouse)      
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
											Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)      
											val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min))      
											values[tabname][sectorname][tabtext][text] = Element.value      
											callback(Element.value)      
											moveconnection:Disconnect()      
											releaseconnection:Disconnect()      
										end      
									end)      
								end)      
							elseif type == "Button" then      

								tabsize = tabsize + UDIM2(0,0,0,24)      
								local Button = INST("Frame")      
								local Button_2 = INST("TextButton")      
								local TextLabel = INST("TextLabel")      

								Button.Name = "Button"      
								Button.Parent = tab1      
								Button.BackgroundColor3 = COL3RGB(255, 255, 255)      
								Button.BackgroundTransparency = 1.000      
								Button.Position = UDIM2(0, 0, 0.236059487, 0)      
								Button.Size = UDIM2(1, 0, 0, 24)      

								Button_2.Name = "Button"      
								Button_2.Parent = Button      
								Button_2.BackgroundColor3 = COL3RGB(0,0,0)      
								Button_2.BorderColor3 = COL3RGB(27, 27, 35)      
								Button_2.Position = UDIM2(0, 30, 0.5, -9)      
								Button_2.Size = UDIM2(0, 175, 0, 18)      
								Button_2.AutoButtonColor = false      
								Button_2.Font = Enum.Font.SourceSans      
								Button_2.Text = ""      
								Button_2.TextColor3 = COL3RGB(0, 0, 0)      
								Button_2.TextSize = 14.000      

								TextLabel.Parent = Button_2      
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
								TextLabel.BackgroundTransparency = 1.000      
								TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
								TextLabel.Size = UDIM2(1, 0, 1, 0)      
								TextLabel.Font = Enum.Font.SourceSansSemibold      
								TextLabel.Text = text      
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
								TextLabel.TextSize = 14.000      

								function Element:SetValue()      
								end      

								Button_2.MouseButton1Down:Connect(function()      
									TextLabel.TextColor3 = MainUIColor      
									library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
									callback()      
								end)      
								Button_2.MouseEnter:Connect(function()      
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
								end)      
								Button_2.MouseLeave:Connect(function()      
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
								end)      
							end      
							ConfigLoad:Connect(function(cfg)      
								local fix = library:ConfigFix(cfg)      
								if fix[tabname][sectorname][tabtext][text] ~= nil then      
									Element:SetValue(fix[tabname][sectorname][tabtext][text])      
								end      
							end)      

							return Element      
						end      


						if firs then      
							coroutine.wrap(function()      
								game:GetService("RunService").RenderStepped:Wait()      
								Section.Size = tabsize      
							end)()      
							selected = text      
							TextButton.TextColor3 = COL3RGB(255,255,255)      
							tab1.Visible = true      
							firs = false      
						end      

						return tab      
					end      

					return MSector      
				end      
				function Tab:Sector(text, side)      
					local sectorname = text      
					local Sector = {}      
					values[tabname][text] = {}      
					local Section = INST("Frame")      
					local SectionText = INST("TextLabel")      
					local Inner = INST("Frame")      
					local UIListLayout = INST("UIListLayout")      

					Section.Name = "Section"      
					Section.Parent = TabGui[side]      
					Section.BackgroundColor3 = COL3RGB(0,0,0)      
					Section.BorderColor3 = COL3RGB(0,0,0)      
					Section.BorderSizePixel = 2      
					Section.Position = UDIM2(0.00358422939, 0, 0, 0)      
					Section.Size = UDIM2(1, 0, 0, 22)      

					SectionText.Name = "SectionText"      
					SectionText.Parent = Section      
					SectionText.BackgroundColor3 = COL3RGB(255, 255, 255)      
					SectionText.BackgroundTransparency = 1.000      
					SectionText.Position = UDIM2(0, 7, 0, -12)      
					SectionText.Size = UDIM2(0, 270, 0, 19)      
					SectionText.ZIndex = 2      
					SectionText.Font = Enum.Font.SourceSansSemibold      
					SectionText.Text = text      
					SectionText.TextColor3 = COL3RGB(255, 255, 255)      
					SectionText.TextSize = 15.000      
					SectionText.TextXAlignment = Enum.TextXAlignment.Left      

					Inner.Name = "Inner"      
					Inner.Parent = Section      
					Inner.BackgroundColor3 = COL3RGB(0,0,0)      
					Inner.BorderColor3 = COL3RGB(0,0,0)      
					Inner.BorderSizePixel = 2     
					Inner.Position = UDIM2(0, 1, 0, 1)      
					Inner.Size = UDIM2(1, -2, 1, -2)      

					local UIPadding = INST("UIPadding")      

					UIPadding.Parent = Inner      
					UIPadding.PaddingTop = UDim.new(0, 10)      

					UIListLayout.Parent = Inner      
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      
					UIListLayout.Padding = UDim.new(0,1)      

					function Sector:Element(type, text, data, callback)      
						local Element = {}      
						data = data or {}      
						callback = callback or function() end      
						values[tabname][sectorname][text] = {}      
						if type == "ScrollDrop" then      
							Section.Size = Section.Size + UDIM2(0,0,0,39)      
							Element.value = {Scroll = {}, Dropdown = ""}      

							for i,v in pairs(data.options) do      
								Element.value.Scroll[i] = v[1]      
							end      

							local joe = {}      
							if data.alphabet then      
								local copy = {}      
								for i,v in pairs(data.options) do      
									INSERT(copy, i)      
								end      
								TBLSORT(copy, function(a,b)      
									return a < b      
								end)      
								joe = copy      
							else      
								for i,v in pairs(data.options) do      
									INSERT(joe, i)      
								end      
							end      

							local Dropdown = INST("Frame")      
							local Button = INST("TextButton")      
							local TextLabel = INST("TextLabel")      
							local Drop = INST("ScrollingFrame")      
							local Button_2 = INST("TextButton")      
							local TextLabel_2 = INST("TextLabel")      
							local UIListLayout = INST("UIListLayout")      
							local ImageLabel = INST("ImageLabel")      
							local TextLabel_3 = INST("TextLabel")      

							Dropdown.Name = "Dropdown"      
							Dropdown.Parent = Inner      
							Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Dropdown.BackgroundTransparency = 1.000      
							Dropdown.Position = UDIM2(0, 0, 0, 0)      
							Dropdown.Size = UDIM2(1, 0, 0, 39)      

							Button.Name = "Button"      
							Button.Parent = Dropdown      
							Button.BackgroundColor3 = COL3RGB(0,0,0)      
							Button.BorderColor3 = COL3RGB(27, 27, 35)      
							Button.Position = UDIM2(0, 30, 0, 16)      
							Button.Size = UDIM2(0, 175, 0, 17)      
							Button.AutoButtonColor = false      
							Button.Font = Enum.Font.SourceSans      
							Button.Text = ""      
							Button.TextColor3 = COL3RGB(0, 0, 0)      
							Button.TextSize = 14.000      

							local TextLabel = INST("TextLabel")      

							TextLabel.Parent = Button      
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel.BackgroundTransparency = 1.000      
							TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
							TextLabel.Position = UDIM2(0, 5, 0, 0)      
							TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)      
							TextLabel.Font = Enum.Font.SourceSansSemibold      
							TextLabel.Text = "lol"      
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel.TextSize = 14.000      
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

							local abcd = TextLabel      

							Drop.Name = "Drop"      
							Drop.Parent = Button      
							Drop.Active = true      
							Drop.BackgroundColor3 = COL3RGB(0,0,0)      
							Drop.BorderColor3 = COL3RGB(27, 27, 35)      
							Drop.Position = UDIM2(0, 0, 1, 1)      
							Drop.Size = UDIM2(1, 0, 0, 20)      
							Drop.Visible = false      
							Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"      
							Drop.CanvasSize = UDIM2(1, 1, 1, 1)      
							Drop.ScrollBarThickness = 0      
							Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"      
							Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"      
							Drop.AutomaticCanvasSize = "Y"      
							Drop.ZIndex = 5      
							Drop.ScrollBarImageColor3 = MainUIColor  

							UIListLayout.Parent = Drop      
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      


							local amount = data.Amount or 6      
							Section.Size = Section.Size + UDIM2(0,0,0,amount * 16 + 8)      

							local num = #joe      
							if num > 5 then      
								Drop.Size = UDIM2(1, 0, 0, 85)      
							else      
								Drop.Size = UDIM2(1, 0, 0, 17*num)      
							end      
							local first = true      
							for i,v in ipairs(joe) do      
								do      
									local joell = v      
									local Scroll = INST("Frame")      
									local joe2 = data.options[v]      
									local Button = INST("TextButton")      
									local TextLabel = INST("TextLabel")      

									Button.Name = v      
									Button.Parent = Drop      
									Button.BackgroundColor3 = COL3RGB(0,0,0)      
									Button.BorderColor3 = COL3RGB(27, 27, 35)      
									Button.Position = UDIM2(0, 30, 0, 16)      
									Button.Size = UDIM2(0, 175, 0, 17)      
									Button.AutoButtonColor = false      
									Button.Font = Enum.Font.SourceSans      
									Button.Text = ""      
									Button.TextColor3 = COL3RGB(0, 0, 0)      
									Button.TextSize = 14.000      
									Button.BorderSizePixel = 2     
									Button.ZIndex = 6      

									TextLabel.Parent = Button      
									TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
									TextLabel.BackgroundTransparency = 1.000      
									TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
									TextLabel.Position = UDIM2(0, 5, 0, -1)      
									TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)      
									TextLabel.Font = Enum.Font.SourceSansSemibold      
									TextLabel.Text = v      
									TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
									TextLabel.TextSize = 14.000      
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left      
									TextLabel.ZIndex = 6      

									Button.MouseButton1Down:Connect(function()      
										Drop.Visible = false      
										Drop.CanvasPosition = Vec2(0,0)      
										abcd.Text = v      
										for i,v in pairs(Scroll.Parent:GetChildren()) do      
											if v:IsA("Frame") then      
												v.Visible = false      
											end      
										end      
										Element.value.Dropdown = v      
										Scroll.Visible = true      
										callback(Element.value)      
									end)      
									Button.MouseEnter:Connect(function()      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(255, 255, 255)})      
									end)      
									Button.MouseLeave:Connect(function()      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(200, 200, 200)})      
									end)      

									if first then      
										abcd.Text = v      
										Element.value.Dropdown = v      
									end      
									local Frame = INST("ScrollingFrame")      
									local UIListLayout = INST("UIListLayout")      

									Scroll.Name = "Scroll"      
									Scroll.Parent = Dropdown      
									Scroll.BackgroundColor3 = COL3RGB(255, 255, 255)      
									Scroll.BackgroundTransparency = 1.000      
									Scroll.Position = UDIM2(0, 0, 0, 0)      
									Scroll.Size = UDIM2(1, 0, 0, amount * 16 + 8)      
									Scroll.Visible = first      
									Scroll.Name = v      


									Frame.Name = "Frame"      
									Frame.Parent = Scroll      
									Frame.Active = true      
									Frame.BackgroundColor3 = COL3RGB(0,0,0)      
									Frame.BorderColor3 = COL3RGB(27, 27, 35)      
									Frame.Position = UDIM2(0, 30, 0, 40)      
									Frame.Size = UDIM2(0, 175, 0, 16 * amount)      
									Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282"      
									Frame.CanvasSize = UDIM2(1, 1, 1, 1)      
									Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282"      
									Frame.ScrollBarThickness = 0      
									Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282"      
									Frame.AutomaticCanvasSize = "Y"      
									Frame.ScrollBarImageColor3 = MainUIColor  

									UIListLayout.Parent = Frame      
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      
									local joll = true      
									for i,v in ipairs(joe2) do      
										local Button = INST("TextButton")      
										local TextLabel = INST("TextLabel")      

										Button.Name = v      
										Button.Parent = Frame      
										Button.BackgroundColor3 = COL3RGB(0,0,0)      
										Button.BorderColor3 = COL3RGB(27, 27, 35)      
										Button.BorderSizePixel = 2      
										Button.Position = UDIM2(0, 30, 0, 16)      
										Button.Size = UDIM2(1, 0, 0, 16)      
										Button.AutoButtonColor = false      
										Button.Font = Enum.Font.SourceSans      
										Button.Text = ""      
										Button.TextColor3 = COL3RGB(0, 0, 0)      
										Button.TextSize = 14.000      

										TextLabel.Parent = Button      
										TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
										TextLabel.BackgroundTransparency = 1.000      
										TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
										TextLabel.Position = UDIM2(0, 4, 0, -1)      
										TextLabel.Size = UDIM2(1, 1, 1, 1)      
										TextLabel.Font = Enum.Font.SourceSansSemibold      
										TextLabel.Text = v      
										TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
										TextLabel.TextSize = 14.000      
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left      
										if joll then      
											joll = false      
											TextLabel.TextColor3 = MainUIColor  
										end      

										Button.MouseButton1Down:Connect(function()      

											for i,v in pairs(Frame:GetChildren()) do      
												if v:IsA("TextButton") then      
													library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
												end      
											end      

											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      

											Element.value.Scroll[joell] = v      

											values[tabname][sectorname][text] = Element.value      
											callback(Element.value)      
										end)      
										Button.MouseEnter:Connect(function()      
											if Element.value.Scroll[joell] ~= v then      
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
											end      
										end)      
										Button.MouseLeave:Connect(function()      
											if Element.value.Scroll[joell] ~= v then      
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
											end      
										end)      
									end      
									first = false      
								end      
							end      

							ImageLabel.Parent = Button      
							ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							ImageLabel.BackgroundTransparency = 1.000      
							ImageLabel.Position = UDIM2(0, 165, 0, 6)      
							ImageLabel.Size = UDIM2(0, 6, 0, 4)      
							ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"      

							TextLabel_3.Parent = Dropdown      
							TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel_3.BackgroundTransparency = 1.000      
							TextLabel_3.Position = UDIM2(0, 32, 0, -1)      
							TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0)      
							TextLabel_3.Font = Enum.Font.SourceSansSemibold      
							TextLabel_3.Text = text      
							TextLabel_3.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel_3.TextSize = 14.000      
							TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left      

							Button.MouseButton1Down:Connect(function()      
								Drop.Visible = not Drop.Visible      
								if not Drop.Visible then      
									Drop.CanvasPosition = Vec2(0,0)      
								end      
							end)      
							local indrop = false      
							local ind = false      
							Drop.MouseEnter:Connect(function()      
								indrop = true      
							end)      
							Drop.MouseLeave:Connect(function()      
								indrop = false      
							end)      
							Button.MouseEnter:Connect(function()      
								ind = true      
							end)      
							Button.MouseLeave:Connect(function()      
								ind = false      
							end)      
							game:GetService("UserInputService").InputBegan:Connect(function(input)      
								if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
									if Drop.Visible == true and not indrop and not ind then      
										Drop.Visible = false      
										Drop.CanvasPosition = Vec2(0,0)      
									end      
								end      
							end)      

							function Element:SetValue(tbl)      
								Element.value = tbl      
								abcd.Text = tbl.Dropdown      
								values[tabname][sectorname][text] = Element.value      
								for i,v in pairs(Dropdown:GetChildren()) do      
									if v:IsA("Frame") then      
										if v.Name == Element.value.Dropdown then      
											v.Visible = true      
										else      
											v.Visible = false      
										end      
										for _,bad in pairs(v.Frame:GetChildren()) do      
											if bad:IsA("TextButton") then      
												bad.TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
												if bad.Name == Element.value.Scroll[v.Name] then      
													bad.TextLabel.TextColor3 = MainUIColor  
												end      
											end      
										end      
									end      
								end      
							end      

							if data.default then      
								Element:SetValue(data.default)      
							end      

							values[tabname][sectorname][text] = Element.value      

						elseif type == "Scroll" then      
							local amount = data.Amount or 6      
							Section.Size = Section.Size + UDIM2(0,0,0,amount * 16 + 8)      
							if data.alphabet then      
								TBLSORT(data.options, function(a,b)      
									return a < b      
								end)      
							end      
							Element.value = {Scroll = data.default and data.default.Scroll or data.options[1]}      

							local Scroll = INST("Frame")      
							local Frame = INST("ScrollingFrame")      
							local UIListLayout = INST("UIListLayout")      

							Scroll.Name = "Scroll"      
							Scroll.Parent = Inner      
							Scroll.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Scroll.BackgroundTransparency = 1.000      
							Scroll.Position = UDIM2(0, 0, 00, 0)      
							Scroll.Size = UDIM2(1, 0, 0, amount * 16 + 8)      


							Frame.Name = "Frame"      
							Frame.Parent = Scroll      
							Frame.Active = true      
							Frame.BackgroundColor3 = COL3RGB(0,0,0)      
							Frame.BorderColor3 = COL3RGB(27, 27, 35)      
							Frame.Position = UDIM2(0, 30, 0, 0)      
							Frame.Size = UDIM2(0, 175, 0, 16 * amount)      
							Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282"      
							Frame.CanvasSize = UDIM2(1, 1, 1, 1)      
							Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282"      
							Frame.ScrollBarThickness = 0      
							Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282"      
							Frame.AutomaticCanvasSize = "Y"      
							Frame.ScrollBarImageColor3 = MainUIColor  

							UIListLayout.Parent = Frame      
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      
							local first = true      
							for i,v in ipairs(data.options) do      
								local Button = INST("TextButton")      
								local TextLabel = INST("TextLabel")      

								Button.Name = v      
								Button.Parent = Frame      
								Button.BackgroundColor3 = COL3RGB(0,0,0)      
								Button.BorderColor3 = COL3RGB(27, 27, 35)      
								Button.BorderSizePixel = 2     
								Button.Position = UDIM2(0, 30, 0, 16)      
								Button.Size = UDIM2(1, 0, 0, 16)      
								Button.AutoButtonColor = false      
								Button.Font = Enum.Font.SourceSans      
								Button.Text = ""      
								Button.TextColor3 = COL3RGB(0, 0, 0)      
								Button.TextSize = 14.000      

								TextLabel.Parent = Button      
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
								TextLabel.BackgroundTransparency = 1.000      
								TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
								TextLabel.Position = UDIM2(0, 4, 0, -1)      
								TextLabel.Size = UDIM2(1, 1, 1, 1)      
								TextLabel.Font = Enum.Font.SourceSansSemibold      
								TextLabel.Text = v      
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
								TextLabel.TextSize = 14.000      
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left      
								if first then first = false      
									TextLabel.TextColor3 = MainUIColor  
								end      

								Button.MouseButton1Down:Connect(function()      

									for i,v in pairs(Frame:GetChildren()) do      
										if v:IsA("TextButton") then      
											library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
										end      
									end      

									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      

									Element.value.Scroll = v      

									values[tabname][sectorname][text] = Element.value      
									callback(Element.value)      
								end)      
								Button.MouseEnter:Connect(function()      
									if Element.value.Scroll ~= v then      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
									end      
								end)      
								Button.MouseLeave:Connect(function()      
									if Element.value.Scroll ~= v then      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
									end      
								end)      
							end      

							function Element:SetValue(val)      
								Element.value = val      

								for i,v in pairs(Frame:GetChildren()) do      
									if v:IsA("TextButton") then      
										library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
									end      
								end      

								library:Tween(Frame[Element.value.Scroll].TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
								values[tabname][sectorname][text] = Element.value      
								callback(Element.value)      
							end      
							values[tabname][sectorname][text] = Element.value      
						elseif type == "Jumbobox" then      
							Section.Size = Section.Size + UDIM2(0,0,0,39)      
							Element.value = {Jumbobox = {}}      
							data.options = data.options or {}      

							local Dropdown = INST("Frame")      
							local Button = INST("TextButton")      
							local TextLabel = INST("TextLabel")      
							local Drop = INST("ScrollingFrame")      
							local Button_2 = INST("TextButton")      
							local TextLabel_2 = INST("TextLabel")      
							local UIListLayout = INST("UIListLayout")      
							local ImageLabel = INST("ImageLabel")      
							local TextLabel_3 = INST("TextLabel")      

							Dropdown.Name = "Dropdown"      
							Dropdown.Parent = Inner      
							Dropdown.BackgroundColor3 = COL3RGB(33, 35, 255)      
							Dropdown.BackgroundTransparency = 1.000      
							Dropdown.Position = UDIM2(0, 0, 0.255102038, 0)      
							Dropdown.Size = UDIM2(1, 0, 0, 39)      

							Button.Name = "Button"      
							Button.Parent = Dropdown      
							Button.BackgroundColor3 = COL3RGB(0,0,0)      
							Button.BorderColor3 = COL3RGB(27, 27, 35)      
							Button.Position = UDIM2(0, 30, 0, 16)      
							Button.Size = UDIM2(0, 175, 0, 17)      
							Button.AutoButtonColor = false      
							Button.Font = Enum.Font.SourceSans      
							Button.Text = ""      
							Button.TextColor3 = COL3RGB(0, 0, 0)      
							Button.TextSize = 14.000      

							TextLabel.Parent = Button      
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel.BackgroundTransparency = 1.000      
							TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
							TextLabel.Position = UDIM2(0, 5, 0, 0)      
							TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)      
							TextLabel.Font = Enum.Font.SourceSansSemibold      
							TextLabel.Text = "..."      
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel.TextSize = 14.000      
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

							local abcd = TextLabel      

							Drop.Name = "Drop"      
							Drop.Parent = Button      
							Drop.Active = true      
							Drop.BackgroundColor3 = COL3RGB(0,0,0)      
							Drop.BorderColor3 = COL3RGB(27, 27, 35)      
							Drop.Position = UDIM2(0, 0, 1, 1)      
							Drop.Size = UDIM2(1, 0, 0, 20)      
							Drop.Visible = false      
							Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"      
							Drop.CanvasSize = UDIM2(1, 1, 1, 1)      
							Drop.ScrollBarThickness = 0      
							Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"      
							Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"      
							--Drop.AutomaticCanvasSize = "Y"      
							for i,v in pairs(data.options) do      
								Drop.CanvasSize = Drop.CanvasSize + UDIM2(0, 0, 0, 17)      
							end      
							Drop.ZIndex = 5      
							Drop.ScrollBarImageColor3 = MainUIColor  

							UIListLayout.Parent = Drop      
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      

							values[tabname][sectorname][text] = Element.value      

							local num = #data.options      
							if num > 5 then      
								Drop.Size = UDIM2(1, 0, 0, 85)      
							else      
								Drop.Size = UDIM2(1, 0, 0, 17*num)      
							end      
							local first = true      

							local function updatetext()      
								local old = {}      
								for i,v in ipairs(data.options) do      
									if TBLFIND(Element.value.Jumbobox, v) then      
										INSERT(old, v)      
									else      
									end      
								end      
								local str = ""      


								if #old == 0 then      
									str = "..."      
								else      
									if #old == 1 then      
										str = old[1]      
									else      
										for i,v in ipairs(old) do      
											if i == 1 then      
												str = v      
											else      
												if i > 2 then      
													if i < 4 then      
														str = str..",  ..."      
													end      
												else      
													str = str..",  "..v      
												end      
											end      
										end      
									end      
								end      

								abcd.Text = str      
							end      
							for i,v in ipairs(data.options) do      
								do      
									local Button = INST("TextButton")      
									local TextLabel = INST("TextLabel")      

									Button.Name = v      
									Button.Parent = Drop      
									Button.BackgroundColor3 = COL3RGB(0,0,0)      
									Button.BorderColor3 = COL3RGB(27, 27, 35)      
									Button.Position = UDIM2(0, 30, 0, 16)      
									Button.Size = UDIM2(0, 175, 0, 17)      
									Button.AutoButtonColor = false      
									Button.Font = Enum.Font.SourceSans      
									Button.Text = ""      
									Button.TextColor3 = COL3RGB(0, 0, 0)      
									Button.TextSize = 14.000      
									Button.BorderSizePixel = 2     
									Button.ZIndex = 6      

									TextLabel.Parent = Button      
									TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
									TextLabel.BackgroundTransparency = 1.000      
									TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
									TextLabel.Position = UDIM2(0, 5, 0, -1)      
									TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)      
									TextLabel.Font = Enum.Font.SourceSansSemibold      
									TextLabel.Text = v      
									TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
									TextLabel.TextSize = 14.000      
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left      
									TextLabel.ZIndex = 6      

									Button.MouseButton1Down:Connect(function()      
										if TBLFIND(Element.value.Jumbobox, v) then      
											for i,a in pairs(Element.value.Jumbobox) do      
												if a == v then      
													TBLREMOVE(Element.value.Jumbobox, i)      
												end      
											end      
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
										else      
											INSERT(Element.value.Jumbobox, v)      
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor})      
										end      
										updatetext()      

										values[tabname][sectorname][text] = Element.value      
										callback(Element.value)      
									end)      
									Button.MouseEnter:Connect(function()      
										if not TBLFIND(Element.value.Jumbobox, v) then      
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
										end      
									end)      
									Button.MouseLeave:Connect(function()      
										if not TBLFIND(Element.value.Jumbobox, v) then      
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
										end      
									end)      

									first = false      
								end      
							end      
							function Element:SetValue(val)      
								Element.value = val      
								for i,v in pairs(Drop:GetChildren()) do      
									if v.Name ~= "UIListLayout" then      
										if TBLFIND(val.Jumbobox, v.Name) then      
											v.TextLabel.TextColor3 = MainUIColor      
										else      
											v.TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
										end      
									end      
								end      
								updatetext()      
								values[tabname][sectorname][text] = Element.value      
								callback(val)      
							end      
							if data.default then      
								Element:SetValue(data.default)      
							end      

							ImageLabel.Parent = Button      
							ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							ImageLabel.BackgroundTransparency = 1.000      
							ImageLabel.Position = UDIM2(0, 165, 0, 6)      
							ImageLabel.Size = UDIM2(0, 6, 0, 4)      
							ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"      

							TextLabel_3.Parent = Dropdown      
							TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel_3.BackgroundTransparency = 1.000      
							TextLabel_3.Position = UDIM2(0, 32, 0, -1)      
							TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0)      
							TextLabel_3.Font = Enum.Font.SourceSansSemibold      
							TextLabel_3.Text = text      
							TextLabel_3.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel_3.TextSize = 14.000      
							TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left      

							Button.MouseButton1Down:Connect(function()      
								Drop.Visible = not Drop.Visible      
								if not Drop.Visible then      
									Drop.CanvasPosition = Vec2(0,0)      
								end      
							end)      
							local indrop = false      
							local ind = false      
							Drop.MouseEnter:Connect(function()      
								indrop = true      
							end)      
							Drop.MouseLeave:Connect(function()      
								indrop = false      
							end)      
							Button.MouseEnter:Connect(function()      
								ind = true      
							end)      
							Button.MouseLeave:Connect(function()      
								ind = false      
							end)      
							game:GetService("UserInputService").InputBegan:Connect(function(input)      
								if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
									if Drop.Visible == true and not indrop and not ind then      
										Drop.Visible = false      
										Drop.CanvasPosition = Vec2(0,0)      
									end      
								end      
							end)      
						elseif type == "ToggleKeybind" then      
							Section.Size = Section.Size + UDIM2(0,0,0,16)      
							Element.value = {Toggle = data.default and data.default.Toggle or false, Key, Type = "Always", Active = true}      

							local Toggle = INST("Frame")      
							local Button = INST("TextButton")      
							local Color = INST("Frame")      
							local TextLabel = INST("TextLabel")      

							Toggle.Name = "Toggle"      
							Toggle.Parent = Inner      
							Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Toggle.BackgroundTransparency = 1.000      
							Toggle.Size = UDIM2(1, 0, 0, 15)      

							Button.Name = "Button"      
							Button.Parent = Toggle      
							Button.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Button.BackgroundTransparency = 1.000      
							Button.Size = UDIM2(1, 0, 1, 0)      
							Button.Font = Enum.Font.SourceSans      
							Button.Text = ""      
							Button.TextColor3 = COL3RGB(0, 0, 0)      
							Button.TextSize = 14.000      

							Color.Name = "Color"      
							Color.Parent = Button      
							Color.BackgroundColor3 = COL3RGB(0,0,0)      
							Color.BorderColor3 = COL3RGB(27, 27, 35)      
							Color.Position = UDIM2(0, 15, 0.5, -5)      
							Color.Size = UDIM2(0, 8, 0, 8)      
							local binding = false      
							TextLabel.Parent = Button      
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel.BackgroundTransparency = 1.000      
							TextLabel.Position = UDIM2(0, 32, 0, -1)      
							TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)      
							TextLabel.Font = Enum.Font.SourceSansSemibold      
							TextLabel.Text = text      
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel.TextSize = 14.000      
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

							local function update()      
								if Element.value.Toggle then      
									tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor})      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
								else      
									keybindremove(text)      
									tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(0,0,0)})      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
								end      
								values[tabname][sectorname][text] = Element.value      
								callback(Element.value)      
							end      

							Button.MouseButton1Down:Connect(function()      
								if not binding then      
									Element.value.Toggle = not Element.value.Toggle      
									update()      
									values[tabname][sectorname][text] = Element.value      
									callback(Element.value)      
								end      
							end)      
							if data.default then      
								update()      
							end      
							values[tabname][sectorname][text] = Element.value      
							do      
								local Keybind = INST("TextButton")      
								local Frame = INST("Frame")      
								local Always = INST("TextButton")      
								local UIListLayout = INST("UIListLayout")      
								local Hold = INST("TextButton")      
								local Toggle = INST("TextButton")      

								Keybind.Name = "Keybind"      
								Keybind.Parent = Button      
								Keybind.BackgroundColor3 = COL3RGB(0,0,0)      
								Keybind.BorderColor3 = COL3RGB(27, 27, 35)      
								Keybind.Position = UDIM2(0, 270, 0.5, -6)      
								Keybind.Text = "NONE"      
								Keybind.Size = UDIM2(0, 43, 0, 12)      
								Keybind.Size = UDIM2(0,txt:GetTextSize("NONE", 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12)      
								Keybind.AutoButtonColor = false      
								Keybind.Font = Enum.Font.SourceSansSemibold      
								Keybind.TextColor3 = COL3RGB(200, 200, 200)      
								Keybind.TextSize = 14.000      
								Keybind.AnchorPoint = Vec2(1,0)      
								Keybind.ZIndex = 3      

								Frame.Parent = Keybind      
								Frame.BackgroundColor3 = COL3RGB(0,0,0)      
								Frame.BorderColor3 = COL3RGB(27, 27, 35)      
								Frame.Position = UDIM2(1, -49, 0, 1)      
								Frame.Size = UDIM2(0, 49, 0, 49)      
								Frame.Visible = false      
								Frame.ZIndex = 3      

								Always.Name = "Always"      
								Always.Parent = Frame      
								Always.BackgroundColor3 = COL3RGB(0,0,0)      
								Always.BackgroundTransparency = 1.000      
								Always.BorderColor3 = COL3RGB(27, 27, 35)      
								Always.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)      
								Always.Size = UDIM2(1, 0, 0, 16)      
								Always.AutoButtonColor = false      
								Always.Font = Enum.Font.SourceSansBold      
								Always.Text = "Always"      
								Always.TextColor3 = COL3RGB(173, 24, 72)      
								Always.TextSize = 14.000      
								Always.ZIndex = 3      

								UIListLayout.Parent = Frame      
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      

								Hold.Name = "Hold"      
								Hold.Parent = Frame      
								Hold.BackgroundColor3 = COL3RGB(0,0,0)      
								Hold.BackgroundTransparency = 1.000      
								Hold.BorderColor3 = COL3RGB(27, 27, 35)      
								Hold.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)      
								Hold.Size = UDIM2(1, 0, 0, 16)      
								Hold.AutoButtonColor = false      
								Hold.Font = Enum.Font.SourceSansSemibold      
								Hold.Text = "Hold"      
								Hold.TextColor3 = COL3RGB(200, 200, 200)      
								Hold.TextSize = 14.000      
								Hold.ZIndex = 3      

								Toggle.Name = "Toggle"      
								Toggle.Parent = Frame      
								Toggle.BackgroundColor3 = COL3RGB(0,0,0)      
								Toggle.BackgroundTransparency = 1.000      
								Toggle.BorderColor3 = COL3RGB(27, 27, 35)      
								Toggle.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)      
								Toggle.Size = UDIM2(1, 0, 0, 16)      
								Toggle.AutoButtonColor = false      
								Toggle.Font = Enum.Font.SourceSansSemibold      
								Toggle.Text = "Toggle"      
								Toggle.TextColor3 = COL3RGB(200, 200, 200)      
								Toggle.TextSize = 14.000      
								Toggle.ZIndex = 3      

								for _,button in pairs(Frame:GetChildren()) do      
									if button:IsA("TextButton") then      
										button.MouseButton1Down:Connect(function()      
											Element.value.Type = button.Text      
											Frame.Visible = false      
											if Element.value.Active ~= (Element.value.Type == "Always" and true or false) then      
												Element.value.Active = Element.value.Type == "Always" and true or false      
												callback(Element.value)      
											end      
											if button.Text == "Always" then      
												keybindremove(text)      
											end      
											for _,button in pairs(Frame:GetChildren()) do      
												if button:IsA("TextButton") and button.Text ~= Element.value.Type then      
													button.Font = Enum.Font.SourceSansSemibold      
													library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)})      
												end      
											end      
											button.Font = Enum.Font.SourceSansBold      
											button.TextColor3 = MainUIColor     
											values[tabname][sectorname][text] = Element.value      
										end)      
										button.MouseEnter:Connect(function()      
											if Element.value.Type ~= button.Text then      
												library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255,255,255)})      
											end      
										end)      
										button.MouseLeave:Connect(function()      
											if Element.value.Type ~= button.Text then      
												library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)})      
											end      
										end)      
									end      
								end      
								Keybind.MouseButton1Down:Connect(function()      
									if not binding then      
										wait()      
										binding = true      
										Keybind.Text = "..."      
										Keybind.Size = UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12)      
									end      
								end)      
								Keybind.MouseButton2Down:Connect(function()      
									if not binding then      
										Frame.Visible = not Frame.Visible      
									end      
								end)      
								local Player = game.Players.LocalPlayer      
								local Mouse = Player:GetMouse()      
								local InFrame = false      
								Frame.MouseEnter:Connect(function()      
									InFrame = true      
								end)      
								Frame.MouseLeave:Connect(function()      
									InFrame = false      
								end)      
								local InFrame2 = false      
								Keybind.MouseEnter:Connect(function()      
									InFrame2 = true      
								end)      
								Keybind.MouseLeave:Connect(function()      
									InFrame2 = false      
								end)      
								game:GetService("UserInputService").InputBegan:Connect(function(input)      
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then      
										if Frame.Visible == true and not InFrame and not InFrame2 then      
											Frame.Visible = false      
										end      
									end      
									if binding then      
										binding = false      
										Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper()      
										Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12)      
										Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name      
										if input.KeyCode.Name == "Backspace" then      
											Keybind.Text = "NONE"      
											Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12)      
											Element.value.Key = nil      
											Element.value.Active = true      
										end      
										callback(Element.value)      
									else      
										if Element.value.Key ~= nil then      
											if FIND(Element.value.Key, "Mouse") then      
												if input.UserInputType == Enum.UserInputType[Element.value.Key] then      
													if Element.value.Type == "Hold" then      
														Element.value.Active = true      
														callback(Element.value)      
														if Element.value.Active and Element.value.Toggle then      
															keybindadd(text)      
														else      
															keybindremove(text)      
														end      
													elseif Element.value.Type == "Toggle" then      
														Element.value.Active = not Element.value.Active      
														callback(Element.value)      
														if Element.value.Active and Element.value.Toggle then      
															keybindadd(text)      
														else      
															keybindremove(text)      
														end      
													end      
												end      
											else      
												if input.KeyCode == Enum.KeyCode[Element.value.Key] then      
													if Element.value.Type == "Hold" then      
														Element.value.Active = true      
														callback(Element.value)      
														if Element.value.Active and Element.value.Toggle then      
															keybindadd(text)      
														else      
															keybindremove(text)      
														end      
													elseif Element.value.Type == "Toggle" then      
														Element.value.Active = not Element.value.Active      
														callback(Element.value)      
														if Element.value.Active and Element.value.Toggle then      
															keybindadd(text)      
														else      
															keybindremove(text)      
														end      
													end      
												end      
											end      
										else      
											Element.value.Active = true      
										end      
									end      
									values[tabname][sectorname][text] = Element.value      
								end)      
								game:GetService("UserInputService").InputEnded:Connect(function(input)      
									if Element.value.Key ~= nil then      
										if FIND(Element.value.Key, "Mouse") then      
											if input.UserInputType == Enum.UserInputType[Element.value.Key] then      
												if Element.value.Type == "Hold" then      
													Element.value.Active = false      
													callback(Element.value)      
													if Element.value.Active then      
														keybindadd(text)      
													else      
														keybindremove(text)      
													end      
												end      
											end      
										else      
											if input.KeyCode == Enum.KeyCode[Element.value.Key] then      
												if Element.value.Type == "Hold" then      
													Element.value.Active = false      
													callback(Element.value)      
													if Element.value.Active then      
														keybindadd(text)      
													else      
														keybindremove(text)      
													end      
												end      
											end      
										end      
									end      
									values[tabname][sectorname][text] = Element.value      
								end)      
							end      
							function Element:SetValue(value)      
								Element.value = value      
								update()      
							end      
						elseif type == "Toggle" then      
							Section.Size = Section.Size + UDIM2(0,0,0,16)      
							Element.value = {Toggle = data.default and data.default.Toggle or false}      

							local Toggle = INST("Frame")      
							local Button = INST("TextButton")      
							local Color = INST("Frame")      
							local TextLabel = INST("TextLabel")      

							Toggle.Name = "Toggle"      
							Toggle.Parent = Inner      
							Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Toggle.BackgroundTransparency = 1.000      
							Toggle.Size = UDIM2(1, 0, 0, 15)      

							Button.Name = "Button"      
							Button.Parent = Toggle      
							Button.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Button.BackgroundTransparency = 1.000      
							Button.Size = UDIM2(1, 0, 1, 0)      
							Button.Font = Enum.Font.SourceSans      
							Button.Text = ""      
							Button.TextColor3 = COL3RGB(0, 0, 0)      
							Button.TextSize = 14.000      

							Color.Name = "Color"      
							Color.Parent = Button      
							Color.BackgroundColor3 = COL3RGB(0,0,0)      
							Color.BorderColor3 = COL3RGB(27, 27, 35)      
							Color.Position = UDIM2(0, 15, 0.5, -5)      
							Color.Size = UDIM2(0, 8, 0, 8)      

							TextLabel.Parent = Button      
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel.BackgroundTransparency = 1.000      
							TextLabel.Position = UDIM2(0, 32, 0, -1)      
							TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)      
							TextLabel.Font = Enum.Font.SourceSansSemibold      
							TextLabel.Text = text      
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel.TextSize = 14.000      
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

							local function update()      
								if Element.value.Toggle then      
									tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor})      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
								else      
									tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(0,0,0)})      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
								end      
								values[tabname][sectorname][text] = Element.value      
							end      

							Button.MouseButton1Down:Connect(function()      
								Element.value.Toggle = not Element.value.Toggle      
								update()      
								values[tabname][sectorname][text] = Element.value      
								callback(Element.value)      
							end)      
							if data.default then      
								update()      
							end      
							values[tabname][sectorname][text] = Element.value      
							function Element:SetValue(value)      
								Element.value = value      
								values[tabname][sectorname][text] = Element.value      
								update()      
								callback(Element.value)      
							end      
						elseif type == "ToggleColor" then      
							Section.Size = Section.Size + UDIM2(0,0,0,16)      
							Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or COL3RGB(255,255,255)}      

							local Toggle = INST("Frame")      
							local Button = INST("TextButton")      
							local Color = INST("Frame")      
							local TextLabel = INST("TextLabel")      

							Toggle.Name = "Toggle"      
							Toggle.Parent = Inner      
							Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Toggle.BackgroundTransparency = 1.000      
							Toggle.Size = UDIM2(1, 0, 0, 15)      

							Button.Name = "Button"      
							Button.Parent = Toggle      
							Button.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Button.BackgroundTransparency = 1.000      
							Button.Size = UDIM2(1, 0, 1, 0)      
							Button.Font = Enum.Font.SourceSans      
							Button.Text = ""      
							Button.TextColor3 = COL3RGB(0, 0, 0)      
							Button.TextSize = 14.000      

							Color.Name = "Color"      
							Color.Parent = Button      
							Color.BackgroundColor3 = COL3RGB(0,0,0)      
							Color.BorderColor3 = COL3RGB(27, 27, 35)      
							Color.Position = UDIM2(0, 15, 0.5, -5)      
							Color.Size = UDIM2(0, 8, 0, 8)      

							TextLabel.Parent = Button      
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel.BackgroundTransparency = 1.000      
							TextLabel.Position = UDIM2(0, 32, 0, -1)      
							TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)      
							TextLabel.Font = Enum.Font.SourceSansSemibold      
							TextLabel.Text = text      
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel.TextSize = 14.000      
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

							local function update()      
								if Element.value.Toggle then      
									tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor})      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
								else      
									tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(0,0,0)})      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
								end      
								values[tabname][sectorname][text] = Element.value      
							end      

							local ColorH,ColorS,ColorV      

							local ColorP = INST("TextButton")      
							local Frame = INST("Frame")      
							local Colorpick = INST("ImageButton")      
							local ColorDrag = INST("Frame")      
							local Huepick = INST("ImageButton")      
							local Huedrag = INST("Frame")      

							ColorP.Name = "ColorP"      
							ColorP.Parent = Button      
							ColorP.AnchorPoint = Vec2(1, 0)      
							ColorP.BackgroundColor3 = COL3RGB(255, 0, 0)      
							ColorP.BorderColor3 = COL3RGB(27, 27, 35)      
							ColorP.Position = UDIM2(0, 270, 0.5, -4)      
							ColorP.Size = UDIM2(0, 18, 0, 8)      
							ColorP.AutoButtonColor = false      
							ColorP.Font = Enum.Font.SourceSansSemibold      
							ColorP.Text = ""      
							ColorP.TextColor3 = COL3RGB(200, 200, 200)      
							ColorP.TextSize = 14.000      

							Frame.Parent = ColorP      
							Frame.BackgroundColor3 = COL3RGB(0,0,0)      
							Frame.BorderColor3 = COL3RGB(27, 27, 35)      
							Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0)      
							Frame.Size = UDIM2(0, 200, 0, 170)      
							Frame.Visible = false      
							Frame.ZIndex = 3      

							Colorpick.Name = "Colorpick"      
							Colorpick.Parent = Frame      
							Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Colorpick.BorderColor3 = COL3RGB(27, 27, 35)      
							Colorpick.ClipsDescendants = false      
							Colorpick.Position = UDIM2(0, 40, 0, 10)      
							Colorpick.Size = UDIM2(0, 150, 0, 150)      
							Colorpick.AutoButtonColor = false      
							Colorpick.Image = "rbxassetid://4155801252"      
							Colorpick.ImageColor3 = COL3RGB(255, 0, 0)      
							Colorpick.ZIndex = 3      

							ColorDrag.Name = "ColorDrag"      
							ColorDrag.Parent = Colorpick      
							ColorDrag.AnchorPoint = Vec2(0.5, 0.5)      
							ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255)      
							ColorDrag.BorderColor3 = COL3RGB(27, 27, 35)      
							ColorDrag.Size = UDIM2(0, 4, 0, 4)      
							ColorDrag.ZIndex = 3      

							Huepick.Name = "Huepick"      
							Huepick.Parent = Frame      
							Huepick.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Huepick.BorderColor3 = COL3RGB(27, 27, 35)      
							Huepick.ClipsDescendants = false      
							Huepick.Position = UDIM2(0, 10, 0, 10)      
							Huepick.Size = UDIM2(0, 20, 0, 150)      
							Huepick.AutoButtonColor = false      
							Huepick.Image = "rbxassetid://3641079629"      
							Huepick.ImageColor3 = COL3RGB(255, 0, 0)      
							Huepick.ImageTransparency = 1      
							Huepick.BackgroundTransparency = 0      
							Huepick.ZIndex = 3      

							local HueFrameGradient = INST("UIGradient")      
							HueFrameGradient.Rotation = 90      
							HueFrameGradient.Name = "HueFrameGradient"      
							HueFrameGradient.Parent = Huepick      
							HueFrameGradient.Color = ColorSequence.new {      
								ColorSequenceKeypoint.new(0.00, COL3RGB(255, 0, 0)),      
								ColorSequenceKeypoint.new(0.17, COL3RGB(255, 0, 255)),      
								ColorSequenceKeypoint.new(0.33, COL3RGB(0, 0, 255)),      
								ColorSequenceKeypoint.new(0.50, COL3RGB(0, 255, 255)),      
								ColorSequenceKeypoint.new(0.67, COL3RGB(0, 255, 0)),      
								ColorSequenceKeypoint.new(0.83, COL3RGB(255, 255, 0)),      
								ColorSequenceKeypoint.new(1.00, COL3RGB(255, 0, 0))      
							}	      

							Huedrag.Name = "Huedrag"      
							Huedrag.Parent = Huepick      
							Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Huedrag.BorderColor3 = COL3RGB(27, 27, 35)      
							Huedrag.Size = UDIM2(1, 0, 0, 2)      
							Huedrag.ZIndex = 3      

							ColorP.MouseButton1Down:Connect(function()      
								Frame.Visible = not Frame.Visible      
							end)      
							local abc = false      
							local inCP = false      
							ColorP.MouseEnter:Connect(function()      
								abc = true      
							end)      
							ColorP.MouseLeave:Connect(function()      
								abc = false      
							end)      
							Frame.MouseEnter:Connect(function()      
								inCP = true      
							end)      
							Frame.MouseLeave:Connect(function()      
								inCP = false      
							end)      

							ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y)      
							ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
							ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      

							if data.default and data.default.Color ~= nil then      
								ColorH, ColorS, ColorV = data.default.Color:ToHSV()      

								ColorH = CLAMP(ColorH,0,1)      
								ColorS = CLAMP(ColorS,0,1)      
								ColorV = CLAMP(ColorV,0,1)      
								ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)      
								Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      

								ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
								Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)      

								values[tabname][sectorname][text] = data.default.Color      
							end      

							local mouse = LocalPlayer:GetMouse()      
							game:GetService("UserInputService").InputBegan:Connect(function(input)      
								if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
									if not dragging and not abc and not inCP then      
										Frame.Visible = false      
									end      
								end      
							end)      

							local function updateColor()      
								local ColorX = (CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
								local ColorY = (CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      
								ColorDrag.Position = UDIM2(ColorX, 0, ColorY, 0)      
								ColorS = 1-ColorX      
								ColorV = 1-ColorY      
								Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
								ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
								values[tabname][sectorname][text] = Element.value      
								Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)      
								callback(Element.value)      
							end      
							local function updateHue()      
								local y = CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)      
								Huedrag.Position = UDIM2(0, 0, 0, y)      
								hue = y/148      
								ColorH = 1-hue      
								Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
								ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
								values[tabname][sectorname][text] = Element.value      
								Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)      
								callback(Element.value)      
							end      
							Colorpick.MouseButton1Down:Connect(function()      
								updateColor()      
								moveconnection = mouse.Move:Connect(function()      
									updateColor()      
								end)      
								releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
									if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
										updateColor()      
										moveconnection:Disconnect()      
										releaseconnection:Disconnect()      
									end      
								end)      
							end)      
							Huepick.MouseButton1Down:Connect(function()      
								updateHue()      
								moveconnection = mouse.Move:Connect(function()      
									updateHue()      
								end)      
								releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
									if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
										updateHue()      
										moveconnection:Disconnect()      
										releaseconnection:Disconnect()      
									end      
								end)      
							end)      

							Button.MouseButton1Down:Connect(function()      
								Element.value.Toggle = not Element.value.Toggle      
								update()      
								values[tabname][sectorname][text] = Element.value      
								callback(Element.value)      
							end)      
							if data.default then      
								update()      
							end      
							values[tabname][sectorname][text] = Element.value      
							function Element:SetValue(value)      
								Element.value = value      
								local duplicate = COL3(value.Color.R, value.Color.G, value.Color.B)      
								ColorH, ColorS, ColorV = duplicate:ToHSV()      
								ColorH = CLAMP(ColorH,0,1)      
								ColorS = CLAMP(ColorS,0,1)      
								ColorV = CLAMP(ColorV,0,1)      

								ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)      
								Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
								ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
								update()      
								Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)      

								callback(value)      
							end      
						elseif type == "ToggleTrans" then      
							Section.Size = Section.Size + UDIM2(0,0,0,16)      
							Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or COL3RGB(255,255,255), Transparency = data.default and data.default.Transparency or 0}      

							local Toggle = INST("Frame")      
							local Button = INST("TextButton")      
							local Color = INST("Frame")      
							local TextLabel = INST("TextLabel")      

							Toggle.Name = "Toggle"      
							Toggle.Parent = Inner      
							Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Toggle.BackgroundTransparency = 1.000      
							Toggle.Size = UDIM2(1, 0, 0, 15)      

							Button.Name = "Button"      
							Button.Parent = Toggle      
							Button.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Button.BackgroundTransparency = 1.000      
							Button.Size = UDIM2(1, 0, 1, 0)      
							Button.Font = Enum.Font.SourceSans      
							Button.Text = ""      
							Button.TextColor3 = COL3RGB(0, 0, 0)      
							Button.TextSize = 14.000      

							Color.Name = "Color"      
							Color.Parent = Button      
							Color.BackgroundColor3 = COL3RGB(0,0,0)      
							Color.BorderColor3 = COL3RGB(27, 27, 35)      
							Color.Position = UDIM2(0, 15, 0.5, -5)      
							Color.Size = UDIM2(0, 8, 0, 8)      

							TextLabel.Parent = Button      
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel.BackgroundTransparency = 1.000      
							TextLabel.Position = UDIM2(0, 32, 0, -1)      
							TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)      
							TextLabel.Font = Enum.Font.SourceSansSemibold      
							TextLabel.Text = text      
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel.TextSize = 14.000      
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

							local function update()      
								if Element.value.Toggle then      
									tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 155, 155)})      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
								else      
									tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(0,0,0)})      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
								end      
								values[tabname][sectorname][text] = Element.value      
								callback(Element.value)      
							end      

							local ColorH,ColorS,ColorV      

							local ColorP = INST("TextButton")      
							local Frame = INST("Frame")      
							local Colorpick = INST("ImageButton")      
							local ColorDrag = INST("Frame")      
							local Huepick = INST("ImageButton")      
							local Huedrag = INST("Frame")      

							ColorP.Name = "ColorP"      
							ColorP.Parent = Button      
							ColorP.AnchorPoint = Vec2(1, 0)      
							ColorP.BackgroundColor3 = COL3RGB(255, 0, 0)      
							ColorP.BorderColor3 = COL3RGB(27, 27, 35)      
							ColorP.Position = UDIM2(0, 270, 0.5, -4)      
							ColorP.Size = UDIM2(0, 18, 0, 8)      
							ColorP.AutoButtonColor = false      
							ColorP.Font = Enum.Font.SourceSansSemibold      
							ColorP.Text = ""      
							ColorP.TextColor3 = COL3RGB(200, 200, 200)      
							ColorP.TextSize = 14.000      

							Frame.Parent = ColorP      
							Frame.BackgroundColor3 = COL3RGB(0,0,0)      
							Frame.BorderColor3 = COL3RGB(27, 27, 35)      
							Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0)      
							Frame.Size = UDIM2(0, 200, 0, 190)      
							Frame.Visible = false      
							Frame.ZIndex = 3      

							Colorpick.Name = "Colorpick"      
							Colorpick.Parent = Frame      
							Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Colorpick.BorderColor3 = COL3RGB(27, 27, 35)      
							Colorpick.ClipsDescendants = false      
							Colorpick.Position = UDIM2(0, 40, 0, 10)      
							Colorpick.Size = UDIM2(0, 150, 0, 150)      
							Colorpick.AutoButtonColor = false      
							Colorpick.Image = "rbxassetid://4155801252"      
							Colorpick.ImageColor3 = COL3RGB(255, 0, 0)      
							Colorpick.ZIndex = 3      

							ColorDrag.Name = "ColorDrag"      
							ColorDrag.Parent = Colorpick      
							ColorDrag.AnchorPoint = Vec2(0.5, 0.5)      
							ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255)      
							ColorDrag.BorderColor3 = COL3RGB(27, 27, 35)      
							ColorDrag.Size = UDIM2(0, 4, 0, 4)      
							ColorDrag.ZIndex = 3      

							Huepick.Name = "Huepick"      
							Huepick.Parent = Frame      
							Huepick.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Huepick.BorderColor3 = COL3RGB(27, 27, 35)      
							Huepick.ClipsDescendants = true      
							Huepick.Position = UDIM2(0, 10, 0, 10)      
							Huepick.Size = UDIM2(0, 20, 0, 150)      
							Huepick.AutoButtonColor = false      
							Huepick.Image = "rbxassetid://3641079629"      
							Huepick.ImageColor3 = COL3RGB(255, 0, 0)      
							Huepick.ImageTransparency = 1      
							Huepick.BackgroundTransparency = 0      
							Huepick.ZIndex = 3      

							local HueFrameGradient = INST("UIGradient")      
							HueFrameGradient.Rotation = 90      
							HueFrameGradient.Name = "HueFrameGradient"      
							HueFrameGradient.Parent = Huepick      
							HueFrameGradient.Color = ColorSequence.new {      
								ColorSequenceKeypoint.new(0.00, COL3RGB(255, 0, 0)),      
								ColorSequenceKeypoint.new(0.17, COL3RGB(255, 0, 255)),      
								ColorSequenceKeypoint.new(0.33, COL3RGB(0, 0, 255)),      
								ColorSequenceKeypoint.new(0.50, COL3RGB(0, 255, 255)),      
								ColorSequenceKeypoint.new(0.67, COL3RGB(0, 255, 0)),      
								ColorSequenceKeypoint.new(0.83, COL3RGB(255, 255, 0)),      
								ColorSequenceKeypoint.new(1.00, COL3RGB(255, 0, 0))      
							}	      

							Huedrag.Name = "Huedrag"      
							Huedrag.Parent = Huepick      
							Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Huedrag.BorderColor3 = COL3RGB(27, 27, 35)      
							Huedrag.Size = UDIM2(1, 0, 0, 2)      
							Huedrag.ZIndex = 3      

							local Transpick = INST("ImageButton")      
							local Transcolor = INST("ImageLabel")      
							local Transdrag = INST("Frame")      

							Transpick.Name = "Transpick"      
							Transpick.Parent = Frame      
							Transpick.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Transpick.BorderColor3 = COL3RGB(27, 27, 35)      
							Transpick.Position = UDIM2(0, 10, 0, 167)      
							Transpick.Size = UDIM2(0, 180, 0, 15)      
							Transpick.AutoButtonColor = false      
							Transpick.Image = "rbxassetid://3887014957"      
							Transpick.ScaleType = Enum.ScaleType.Tile      
							Transpick.TileSize = UDIM2(0, 10, 0, 10)      
							Transpick.ZIndex = 3      

							Transcolor.Name = "Transcolor"      
							Transcolor.Parent = Transpick      
							Transcolor.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Transcolor.BackgroundTransparency = 1.000      
							Transcolor.Size = UDIM2(1, 0, 1, 0)      
							Transcolor.Image = "rbxassetid://3887017050"      
							Transcolor.ImageColor3 = COL3RGB(255, 0, 4)      
							Transcolor.ZIndex = 3      

							Transdrag.Name = "Transdrag"      
							Transdrag.Parent = Transcolor      
							Transdrag.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Transdrag.BorderColor3 = COL3RGB(27, 27, 35)      
							Transdrag.Position = UDIM2(0, -1, 0, 0)      
							Transdrag.Size = UDIM2(0, 2, 1, 0)      
							Transdrag.ZIndex = 3      

							ColorP.MouseButton1Down:Connect(function()      
								Frame.Visible = not Frame.Visible      
							end)      
							local abc = false      
							local inCP = false      
							ColorP.MouseEnter:Connect(function()      
								abc = true      
							end)      
							ColorP.MouseLeave:Connect(function()      
								abc = false      
							end)      
							Frame.MouseEnter:Connect(function()      
								inCP = true      
							end)      
							Frame.MouseLeave:Connect(function()      
								inCP = false      
							end)      

							ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y)      
							ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
							ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      

							if data.default and data.default.Color ~= nil then      
								ColorH, ColorS, ColorV = data.default.Color:ToHSV()      

								ColorH = CLAMP(ColorH,0,1)      
								ColorS = CLAMP(ColorS,0,1)      
								ColorV = CLAMP(ColorV,0,1)      
								ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)      
								Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      

								Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)      

								ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
								Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)      
							end      
							if data.default and data.default.Transparency ~= nil then      
								Transdrag.Position = UDIM2(data.default.Transparency, -1, 0, 0)      
							end      
							local mouse = LocalPlayer:GetMouse()      
							game:GetService("UserInputService").InputBegan:Connect(function(input)      
								if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
									if not dragging and not abc and not inCP then      
										Frame.Visible = false      
									end      
								end      
							end)      

							local function updateColor()      
								local ColorX = (CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
								local ColorY = (CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      
								ColorDrag.Position = UDIM2(ColorX, 0, ColorY, 0)      
								ColorS = 1-ColorX      
								ColorV = 1-ColorY      
								Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
								ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
								Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)      
								values[tabname][sectorname][text] = Element.value      
								Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)      
								callback(Element.value)      
							end      
							local function updateHue()      
								local y = CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)      
								Huedrag.Position = UDIM2(0, 0, 0, y)      
								hue = y/148      
								ColorH = 1-hue      
								Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
								Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)      
								ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
								values[tabname][sectorname][text] = Element.value      
								Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)      
								callback(Element.value)      
							end      
							local function updateTrans()      
								local x = CLAMP(mouse.X - Transpick.AbsolutePosition.X, 0, 178)      
								Transdrag.Position = UDIM2(0, x, 0, 0)      
								Element.value.Transparency = (x/178)      
								values[tabname][sectorname][text] = Element.value      
								callback(Element.value)      
							end      
							Transpick.MouseButton1Down:Connect(function()      
								updateTrans()      
								moveconnection = mouse.Move:Connect(function()      
									updateTrans()      
								end)      
								releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
									if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
										updateTrans()      
										moveconnection:Disconnect()      
										releaseconnection:Disconnect()      
									end      
								end)      
							end)      
							Colorpick.MouseButton1Down:Connect(function()      
								updateColor()      
								moveconnection = mouse.Move:Connect(function()      
									updateColor()      
								end)      
								releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
									if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
										updateColor()      
										moveconnection:Disconnect()      
										releaseconnection:Disconnect()      
									end      
								end)      
							end)      
							Huepick.MouseButton1Down:Connect(function()      
								updateHue()      
								moveconnection = mouse.Move:Connect(function()      
									updateHue()      
								end)      
								releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
									if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
										updateHue()      
										moveconnection:Disconnect()      
										releaseconnection:Disconnect()      
									end      
								end)      
							end)      

							Button.MouseButton1Down:Connect(function()      
								Element.value.Toggle = not Element.value.Toggle      
								update()      
								values[tabname][sectorname][text] = Element.value      
								callback(Element.value)      
							end)      
							if data.default then      
								if Element.value.Toggle then      
									tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 155, 155)})      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
								else      
									tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(0,0,0)})      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
								end      
								values[tabname][sectorname][text] = Element.value      
							end      
							values[tabname][sectorname][text] = Element.value      
							function Element:SetValue(value)      
								Element.value = value      
								local duplicate = COL3(value.Color.R, value.Color.G, value.Color.B)      
								ColorH, ColorS, ColorV = duplicate:ToHSV()      
								ColorH = CLAMP(ColorH,0,1)      
								ColorS = CLAMP(ColorS,0,1)      
								ColorV = CLAMP(ColorV,0,1)      

								ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)      
								Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)      
								ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)      
								update()      
								Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)      
							end      
						elseif type == "TextBox" then      
							Section.Size = Section.Size + UDIM2(0,0,0,30)      
							Element.value = {Text = data.default and data.default.text or ""}      

							local Box = INST("Frame")      
							local TextBox = INST("TextBox")      

							Box.Name = "Box"      
							Box.Parent = Inner      
							Box.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Box.BackgroundTransparency = 1.000      
							Box.Position = UDIM2(0, 0, 0.542059898, 0)      
							Box.Size = UDIM2(1, 0, 0, 30)      

							TextBox.Parent = Box      
							TextBox.BackgroundColor3 = COL3RGB(0,0,0)      
							TextBox.BorderColor3 = COL3RGB(27, 27, 35)      
							TextBox.Position = UDIM2(0.108303241, 0, 0.224465579, 0)      
							TextBox.Size = UDIM2(0, 175, 0, 20)      
							TextBox.Font = Enum.Font.SourceSans      
							TextBox.PlaceholderText = data.placeholder      
							TextBox.Text = Element.value.Text      
							TextBox.TextColor3 = COL3RGB(255, 255, 255)      
							TextBox.TextSize = 14.000      

							values[tabname][sectorname][text] = Element.value      

							TextBox:GetPropertyChangedSignal("Text"):Connect(function()      
								if LEN(TextBox.Text) > 10 then      
									TextBox.Text = SUB(TextBox.Text, 1, 10)      
								end      
								Element.value.Text = TextBox.Text      
								values[tabname][sectorname][text] = Element.value      
								callback(Element.value)      
							end)      

							function Element:SetValue(value)      
								Element.value = value      
								values[tabname][sectorname][text] = Element.value      
								TextBox.Text = Element.value.Text      
							end      

						elseif type == "Dropdown" then      
							Section.Size = Section.Size + UDIM2(0,0,0,39)      
							Element.value = {Dropdown = data.options[1]}      

							local Dropdown = INST("Frame")      
							local Button = INST("TextButton")      
							local TextLabel = INST("TextLabel")      
							local Drop = INST("ScrollingFrame")      
							local Button_2 = INST("TextButton")      
							local TextLabel_2 = INST("TextLabel")      
							local UIListLayout = INST("UIListLayout")      
							local ImageLabel = INST("ImageLabel")      
							local TextLabel_3 = INST("TextLabel")      

							Dropdown.Name = "Dropdown"      
							Dropdown.Parent = Inner      
							Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Dropdown.BackgroundTransparency = 1.000      
							Dropdown.Position = UDIM2(0, 0, 0.255102038, 0)      
							Dropdown.Size = UDIM2(1, 0, 0, 39)      

							Button.Name = "Button"      
							Button.Parent = Dropdown      
							Button.BackgroundColor3 = COL3RGB(0,0,0)      
							Button.BorderColor3 = COL3RGB(27, 27, 35)      
							Button.Position = UDIM2(0, 30, 0, 16)      
							Button.Size = UDIM2(0, 175, 0, 17)      
							Button.AutoButtonColor = false      
							Button.Font = Enum.Font.SourceSans      
							Button.Text = ""      
							Button.TextColor3 = COL3RGB(0, 0, 0)      
							Button.TextSize = 14.000      

							TextLabel.Parent = Button      
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel.BackgroundTransparency = 1.000      
							TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
							TextLabel.Position = UDIM2(0, 5, 0, 0)      
							TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)      
							TextLabel.Font = Enum.Font.SourceSansSemibold      
							TextLabel.Text = Element.value.Dropdown      
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel.TextSize = 14.000      
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

							local abcd = TextLabel      

							Drop.Name = "Drop"      
							Drop.Parent = Button      
							Drop.Active = true      
							Drop.BackgroundColor3 = COL3RGB(0,0,0)      
							Drop.BorderColor3 = COL3RGB(27, 27, 35)      
							Drop.Position = UDIM2(0, 0, 1, 1)      
							Drop.Size = UDIM2(1, 0, 0, 20)      
							Drop.Visible = false      
							Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"      
							Drop.CanvasSize = UDIM2(1, 1, 1, 1)      
							Drop.ScrollBarThickness = 0      
							Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"      
							Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"      
							Drop.AutomaticCanvasSize = "Y"      
							Drop.ZIndex = 5      
							Drop.ScrollBarImageColor3 = MainUIColor  

							UIListLayout.Parent = Drop      
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      

							local num = #data.options      
							if num > 5 then      
								Drop.Size = UDIM2(1, 0, 0, 85)      
							else      
								Drop.Size = UDIM2(1, 0, 0, 17*num)      
							end      
							local first = true      
							for i,v in ipairs(data.options) do      
								do      
									local Button = INST("TextButton")      
									local TextLabel = INST("TextLabel")      

									Button.Name = v      
									Button.Parent = Drop      
									Button.BackgroundColor3 = COL3RGB(0,0,0)      
									Button.BorderColor3 = COL3RGB(27, 27, 35)      
									Button.Position = UDIM2(0, 30, 0, 16)      
									Button.Size = UDIM2(0, 175, 0, 17)      
									Button.AutoButtonColor = false      
									Button.Font = Enum.Font.SourceSans      
									Button.Text = ""      
									Button.TextColor3 = COL3RGB(0, 0, 0)      
									Button.TextSize = 14.000      
									Button.BorderSizePixel = 2     
									Button.ZIndex = 6      

									TextLabel.Parent = Button      
									TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
									TextLabel.BackgroundTransparency = 1.000      
									TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
									TextLabel.Position = UDIM2(0, 5, 0, -1)      
									TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)      
									TextLabel.Font = Enum.Font.SourceSansSemibold      
									TextLabel.Text = v      
									TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
									TextLabel.TextSize = 14.000      
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left      
									TextLabel.ZIndex = 6      

									Button.MouseButton1Down:Connect(function()      
										Drop.Visible = false      
										Element.value.Dropdown = v      
										abcd.Text = v      
										values[tabname][sectorname][text] = Element.value      
										callback(Element.value)      
										Drop.CanvasPosition = Vec2(0,0)      
									end)      
									Button.MouseEnter:Connect(function()      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(255, 255, 255)})      
									end)      
									Button.MouseLeave:Connect(function()      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(200, 200, 200)})      
									end)      

									first = false      
								end      
							end      

							function Element:SetValue(val)      
								Element.value = val      
								abcd.Text = val.Dropdown      
								values[tabname][sectorname][text] = Element.value      
								callback(val)      
							end      

							ImageLabel.Parent = Button      
							ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							ImageLabel.BackgroundTransparency = 1.000      
							ImageLabel.Position = UDIM2(0, 165, 0, 6)      
							ImageLabel.Size = UDIM2(0, 6, 0, 4)      
							ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"      

							TextLabel_3.Parent = Dropdown      
							TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel_3.BackgroundTransparency = 1.000      
							TextLabel_3.Position = UDIM2(0, 32, 0, -1)      
							TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0)      
							TextLabel_3.Font = Enum.Font.SourceSansSemibold      
							TextLabel_3.Text = text      
							TextLabel_3.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel_3.TextSize = 14.000      
							TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left      

							Button.MouseButton1Down:Connect(function()      
								Drop.Visible = not Drop.Visible      
								if not Drop.Visible then      
									Drop.CanvasPosition = Vec2(0,0)      
								end      
							end)      
							local indrop = false      
							local ind = false      
							Drop.MouseEnter:Connect(function()      
								indrop = true      
							end)      
							Drop.MouseLeave:Connect(function()      
								indrop = false      
							end)      
							Button.MouseEnter:Connect(function()      
								ind = true      
							end)      
							Button.MouseLeave:Connect(function()      
								ind = false      
							end)      
							game:GetService("UserInputService").InputBegan:Connect(function(input)      
								if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
									if Drop.Visible == true and not indrop and not ind then      
										Drop.Visible = false      
										Drop.CanvasPosition = Vec2(0,0)      
									end      
								end      
							end)      
							values[tabname][sectorname][text] = Element.value      
						elseif type == "Slider" then      

							Section.Size = Section.Size + UDIM2(0,0,0,25)      

							local Slider = INST("Frame")      
							local TextLabel = INST("TextLabel")      
							local Button = INST("TextButton")      
							local Frame = INST("Frame")      
							local UIGradient = INST("UIGradient")      
							local Value = INST("TextLabel")      

							Slider.Name = "Slider"      
							Slider.Parent = Inner      
							Slider.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Slider.BackgroundTransparency = 1.000      
							Slider.Position = UDIM2(0, 0, 0.653061211, 0)      
							Slider.Size = UDIM2(1, 0, 0, 25)      

							TextLabel.Parent = Slider      
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel.BackgroundTransparency = 1.000      
							TextLabel.Position = UDIM2(0, 32, 0, -2)      
							TextLabel.Size = UDIM2(0, 100, 0, 15)      
							TextLabel.Font = Enum.Font.SourceSansSemibold      
							TextLabel.Text = text      
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel.TextSize = 14.000      
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

							Button.Name = "Button"      
							Button.Parent = Slider      
							Button.BackgroundColor3 = COL3RGB(0,0,0)      
							Button.BorderColor3 = COL3RGB(27, 27, 35)      
							Button.Position = UDIM2(0, 30, 0, 15)      
							Button.Size = UDIM2(0, 175, 0, 5)      
							Button.AutoButtonColor = false      
							Button.Font = Enum.Font.SourceSans      
							Button.Text = ""      
							Button.TextColor3 = COL3RGB(0, 0, 0)      
							Button.TextSize = 14.000      

							Frame.Parent = Button      
							Frame.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Frame.BorderSizePixel = 2     
							Frame.Size = UDIM2(0.5, 0, 1, 0)      

							UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, MainUIColor), ColorSequenceKeypoint.new(1, MainUIColor)}      
							UIGradient.Rotation = 90      
							UIGradient.Parent = Frame      

							Value.Name = "Value"      
							Value.Parent = Slider      
							Value.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Value.BackgroundTransparency = 1.000      
							Value.Position = UDIM2(0, 150, 0, -1)      
							Value.Size = UDIM2(0, 55, 0, 15)      
							Value.Font = Enum.Font.SourceSansSemibold      
							Value.Text = "50"      
							Value.TextColor3 = COL3RGB(200, 200, 200)      
							Value.TextSize = 14.000      
							Value.TextXAlignment = Enum.TextXAlignment.Right      
							local min, max, default = data.min or 0, data.max or 100, data.default or 0      
							Element.value = {Slider = default}      

							function Element:SetValue(value)      
								Element.value = value      
								local a      
								if min > 0 then      
									a = ((Element.value.Slider - min)) / (max-min)      
								else      
									a = (Element.value.Slider-min)/(max-min)      
								end      
								Value.Text = Element.value.Slider      
								Frame.Size = UDIM2(a,0,1,0)      
								values[tabname][sectorname][text] = Element.value      
								callback(value)      
							end      
							local a      
							if min > 0 then      
								a = ((Element.value.Slider - min)) / (max-min)      
							else      
								a = (Element.value.Slider-min)/(max-min)      
							end      
							Value.Text = Element.value.Slider      
							Frame.Size = UDIM2(a,0,1,0)      
							values[tabname][sectorname][text] = Element.value      
							local uis = game:GetService("UserInputService")      
							local mouse = game.Players.LocalPlayer:GetMouse()      
							local val      
							Button.MouseButton1Down:Connect(function()      
								Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)      
								val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) or 0      
								Value.Text = val      
								Element.value.Slider = val      
								values[tabname][sectorname][text] = Element.value      
								callback(Element.value)      
								moveconnection = mouse.Move:Connect(function()      
									Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)      
									val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min))      
									Value.Text = val      
									Element.value.Slider = val      
									values[tabname][sectorname][text] = Element.value      
									callback(Element.value)      
								end)      
								releaseconnection = uis.InputEnded:Connect(function(Mouse)      
									if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
										Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)      
										val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min))      
										values[tabname][sectorname][text] = Element.value      
										callback(Element.value)      
										moveconnection:Disconnect()      
										releaseconnection:Disconnect()      
									end      
								end)      
							end)      
						elseif type == "Button" then      

							Section.Size = Section.Size + UDIM2(0,0,0,24)      
							local Button = INST("Frame")      
							local Button_2 = INST("TextButton")      
							local TextLabel = INST("TextLabel")      

							Button.Name = "Button"      
							Button.Parent = Inner      
							Button.BackgroundColor3 = COL3RGB(255, 255, 255)      
							Button.BackgroundTransparency = 1.000      
							Button.Position = UDIM2(0, 0, 0.236059487, 0)      
							Button.Size = UDIM2(1, 0, 0, 24)      

							Button_2.Name = "Button"      
							Button_2.Parent = Button      
							Button_2.BackgroundColor3 = COL3RGB(0,0,0)      
							Button_2.BorderColor3 = COL3RGB(27, 27, 35)      
							Button_2.Position = UDIM2(0, 30, 0.5, -9)      
							Button_2.Size = UDIM2(0, 175, 0, 18)      
							Button_2.AutoButtonColor = false      
							Button_2.Font = Enum.Font.SourceSans      
							Button_2.Text = ""      
							Button_2.TextColor3 = COL3RGB(0, 0, 0)      
							Button_2.TextSize = 14.000      

							TextLabel.Parent = Button_2      
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
							TextLabel.BackgroundTransparency = 1.000      
							TextLabel.BorderColor3 = COL3RGB(27, 42, 53)      
							TextLabel.Size = UDIM2(1, 0, 1, 0)      
							TextLabel.Font = Enum.Font.SourceSansSemibold      
							TextLabel.Text = text      
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)      
							TextLabel.TextSize = 14.000      

							function Element:SetValue()      
							end      

							Button_2.MouseButton1Down:Connect(function()      
								TextLabel.TextColor3 = MainUIColor      
								library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
								callback()      
							end)      
							Button_2.MouseEnter:Connect(function()      
								library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})      
							end)      
							Button_2.MouseLeave:Connect(function()      
								library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})      
							end)      
						end      
						ConfigLoad:Connect(function(cfg)      
							pcall(function()      
								local fix = library:ConfigFix(cfg)      
								if fix[tabname][sectorname][text] ~= nil then      
									Element:SetValue(fix[tabname][sectorname][text])      
								end      
							end)      
						end)      

						return Element      
					end      
					return Sector      
				end      

				return Tab      
			end      

			Ova.Parent = game.CoreGui      

			return menu      
		end      

		local UserInputService = game:GetService("UserInputService")      
		local ReplicatedStorage = game:GetService("ReplicatedStorage")      
		local RunService = game:GetService("RunService")      
		local Lighting = game:GetService("Lighting")      
		local Players = game:GetService("Players")      
		local LocalPlayer = Players.LocalPlayer      
		local PlayerGui = LocalPlayer.PlayerGui      
		local Mouse = LocalPlayer:GetMouse()      
		local Camera = workspace.CurrentCamera      
		local ClientScript = LocalPlayer.PlayerGui.Client      
		local Client = getsenv(ClientScript)   
		local ChatScript = getsenv(LocalPlayer.PlayerGui.GUI.Main.Chats.DisplayChat)


		repeat RunService.RenderStepped:Wait() until game:IsLoaded()      

		local Crosshairs = PlayerGui.GUI.Crosshairs      
		local Crosshair = PlayerGui.GUI.Crosshairs.Crosshair      
		local oldcreatebullethole = Client.createbullethole    
		local LGlove, RGlove, LSleeve, RSleeve, RArm, LArm      
		local WeaponObj = {}      
		local SelfObj = {}      
		local Viewmodels =  ReplicatedStorage.Viewmodels      
		local Weapons =  ReplicatedStorage.Weapons      
		local ViewmodelOffset = CF(0,0,0)      
		local Smokes = {}      
		local Mollies = {}      
		local RayIgnore = workspace.Ray_Ignore      
		local RageTarget      
		local GetIcon = require(game.ReplicatedStorage.GetIcon)      
		local BodyVelocity = INST("BodyVelocity")      
		BodyVelocity.MaxForce = Vec3(HUGE, 0, HUGE)      
		local Collision = {Camera, workspace.Ray_Ignore, workspace.Debris}      
		local FakelagFolder = INST("Folder", workspace)      
		FakelagFolder.Name = "Fakelag"      
		local FakeAnim = INST("Animation", workspace)      
		FakeAnim.AnimationId = "rbxassetid://0"      
		local Gloves = ReplicatedStorage.Gloves      
		if Gloves:FindFirstChild("ImageLabel") then      
			Gloves.ImageLabel:Destroy()      
		end      
		local GloveModels = Gloves.Models      
		local Multipliers = {      
			["Head"] = 4,      
			["FakeHead"] = 4,      
			["HeadHB"] = 4,      
			["UpperTorso"] = 1,      
			["LowerTorso"] = 1.25,      
			["LeftUpperArm"] = 1,      
			["LeftLowerArm"] = 1,      
			["LeftHand"] = 1,      
			["RightUpperArm"] = 1,      
			["RightLowerArm"] = 1,      
			["RightHand"] = 1,      
			["LeftUpperLeg"] = 0.75,      
			["LeftLowerLeg"] = 0.75,      
			["LeftFoot"] = 0.75,      
			["RightUpperLeg"] = 0.75,      
			["RightLowerLeg"] = 0.75,      
			["RightFoot"] = 0.75,      
		}      
		local ChamItems = {}      
		local Skyboxes = {      
			["nebula"] = {      
				SkyboxLf = "rbxassetid://159454286",      
				SkyboxBk = "rbxassetid://159454299",      
				SkyboxDn = "rbxassetid://159454296",      
				SkyboxFt = "rbxassetid://159454293",      
				SkyboxLf = "rbxassetid://159454286",      
				SkyboxRt = "rbxassetid://159454300",      
				SkyboxUp = "rbxassetid://159454288",      
			},      
			["vaporwave"] = {      
				SkyboxLf = "rbxassetid://1417494402",      
				SkyboxBk = "rbxassetid://1417494030",      
				SkyboxDn = "rbxassetid://1417494146",      
				SkyboxFt = "rbxassetid://1417494253",      
				SkyboxLf = "rbxassetid://1417494402",      
				SkyboxRt = "rbxassetid://1417494499",      
				SkyboxUp = "rbxassetid://1417494643",      
			},      
			["clouds"] = {      
				SkyboxLf = "rbxassetid://570557620",      
				SkyboxBk = "rbxassetid://570557514",      
				SkyboxDn = "rbxassetid://570557775",      
				SkyboxFt = "rbxassetid://570557559",      
				SkyboxLf = "rbxassetid://570557620",      
				SkyboxRt = "rbxassetid://570557672",      
				SkyboxUp = "rbxassetid://570557727",      
			},      
			["twilight"] = {      
				SkyboxLf = "rbxassetid://264909758",      
				SkyboxBk = "rbxassetid://264908339",      
				SkyboxDn = "rbxassetid://264907909",      
				SkyboxFt = "rbxassetid://264909420",      
				SkyboxLf = "rbxassetid://264909758",      
				SkyboxRt = "rbxassetid://264908886",      
				SkyboxUp = "rbxassetid://264907379",      
			},
			["Dababy"] = {
				SkyboxLf = "rbxassetid://7245418472",
				SkyboxBk = "rbxassetid://7245418472",
				SkyboxDn = "rbxassetid://7245418472",
				SkyboxFt = "rbxassetid://7245418472",
				SkyboxLf = "rbxassetid://7245418472",
				SkyboxRt = "rbxassetid://7245418472",
				SkyboxUp = "rbxassetid://7245418472",
			},
			["MC"] = {
				SkyboxLf = "rbxassetid://1876543392",
				SkyboxBk = "rbxassetid://1876545003",
				SkyboxDn = "rbxassetid://1876544331",
				SkyboxFt = "rbxassetid://1876542941",
				SkyboxLf = "rbxassetid://1876543392",
				SkyboxRt = "rbxassetid://1876543764",
				SkyboxUp = "rbxassetid://1876544642",
			},
			["Chill"] = {
				SkyboxLf = "rbxassetid://5103948542",
				SkyboxBk = "rbxassetid://5084575798",
				SkyboxDn = "rbxassetid://5084575916",
				SkyboxFt = "rbxassetid://5103949679",
				SkyboxLf = "rbxassetid://5103948542",
				SkyboxRt = "rbxassetid://5103948784",
				SkyboxUp = "rbxassetid://5084576400",
			
			}, 
		}      
		local NewScope      
		do      
			local ScreenGui = INST("ScreenGui")      
			local Frame = INST("Frame")      
			local Frame_2 = INST("Frame")      

			ScreenGui.Enabled = false      
			ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global      
			ScreenGui.IgnoreGuiInset = true      

			Frame.Parent = ScreenGui      
			Frame.BackgroundColor3 = COL3RGB(0, 0, 0)      
			Frame.BorderSizePixel = 2      
			Frame.Position = UDIM2(0, 0, 0.5, 0)      
			Frame.Size = UDIM2(1, 0, 0, 1)      

			Frame_2.Parent = ScreenGui      
			Frame_2.BackgroundColor3 = COL3RGB(0, 0, 0)      
			Frame_2.BorderSizePixel = 2      
			Frame_2.Position = UDIM2(0.5, 0, 0, 0)      
			Frame_2.Size = UDIM2(0, 1, 1, 0)      

			ScreenGui.Parent = game.CoreGui      

			NewScope = ScreenGui      
		end      
		local oldSkybox      

		local function VectorRGB(RGB)      
			return Vec3(RGB.R, RGB.G, RGB.B)      
		end      
		local function new(name, prop)      
			local obj = INST(name)      
			for i,v in pairs(prop) do      
				if i ~= "Parent" then      
					obj[i] = v      
				end      
			end      
			if prop["Parent"] ~= nil then      
				obj.Parent = prop["Parent"]      
			end      
		end      
		local function UpdateAccessory(Accessory)      
			Accessory.Material = values.visuals.effects["accessory material"].Dropdown == "Smooth" and "SmoothPlastic" or "ForceField"      
			Accessory.Mesh.VertexColor = VectorRGB(values.visuals.effects["accessory chams"].Color)      
			Accessory.Color = values.visuals.effects["accessory chams"].Color      
			Accessory.Transparency = values.visuals.effects["accessory chams"].Transparency      
			if values.visuals.effects["accessory material"].Dropdown ~= "ForceField" then      
				Accessory.Mesh.TextureId = ""      
			else      
				Accessory.Mesh.TextureId = Accessory.StringValue.Value      
			end      
		end      
		local function ReverseAccessory(Accessory)      
			Accessory.Material = "SmoothPlastic"      
			Accessory.Mesh.VertexColor = Vec3(1,1,113)      
			Accessory.Mesh.TextureId = Accessory.StringValue.Value      
			Accessory.Transparency = 0      
		end      
		local function UpdateWeapon(obj)      
			local selected = values.visuals.effects["weapon material"].Dropdown      

			if obj:IsA("MeshPart") then obj.TextureID = "" end      
			if obj:IsA("Part") and obj:FindFirstChild("Mesh") and not obj:IsA("BlockMesh") then      
				obj.Mesh.VertexColor = VectorRGB(values.visuals.effects["weapon chams"].Color)      
				if selected == "Smooth" or selected == "Glass" then      
					obj.Mesh.TextureId = ""      
				else      
					pcall(function()      
						obj.Mesh.TextureId = obj.Mesh.OriginalTexture.Value      
						obj.Mesh.TextureID = obj.Mesh.OriginalTexture.Value      
					end)      
				end      
			end      
			obj.Color = values.visuals.effects["weapon chams"].Color      
			obj.Material = selected == "Smooth" and "SmoothPlastic" or selected == "Flat" and "Neon" or selected == "ForceField" and "ForceField" or "Glass"      
			obj.Reflectance = values.visuals.effects["reflectance"].Slider/10      
			obj.Transparency = values.visuals.effects["weapon chams"].Transparency      
		end      
		local Skins = ReplicatedStorage.Skins      
		local function MapSkin(Gun, Skin, CustomSkin)      
			if CustomSkin ~= nil then      
				for _,Data in pairs(CustomSkin) do      
					local Obj = Camera.Arms:FindFirstChild(Data.Name)      
					if Obj ~= nil and Obj.Transparency ~= 1 then      
						Obj.TextureId = Data.Value      
					end      
				end      
			else      
				local SkinData = Skins:FindFirstChild(Gun):FindFirstChild(Skin)      
				if not SkinData:FindFirstChild("Animated") then      
					for _,Data in pairs(SkinData:GetChildren()) do      
						local Obj = Camera.Arms:FindFirstChild(Data.Name)      
						if Obj ~= nil and Obj.Transparency ~= 1 then      
							if Obj:FindFirstChild("Mesh") then      
								Obj.Mesh.TextureId = v.Value      
							elseif not Obj:FindFirstChild("Mesh") then      
								Obj.TextureID = Data.Value      
							end      
						end      
					end      
				end      
			end      
		end      
		local function ChangeCharacter(NewCharacter)      
			for _,Part in pairs (LocalPlayer.Character:GetChildren()) do      
				if Part:IsA("Accessory") then      
					Part:Destroy()      
				end      
				if Part:IsA("BasePart") then      
					if NewCharacter:FindFirstChild(Part.Name) then      
						Part.Color = NewCharacter:FindFirstChild(Part.Name).Color      
						Part.Transparency = NewCharacter:FindFirstChild(Part.Name).Transparency      
					end      
					if Part.Name == "FakeHead" then      
						Part.Color = NewCharacter:FindFirstChild("Head").Color      
						Part.Transparency = NewCharacter:FindFirstChild("Head").Transparency      
					end      
				end      

				if (Part.Name == "Head" or Part.Name == "FakeHead") and Part:FindFirstChildOfClass("Decal") and NewCharacter.Head:FindFirstChildOfClass("Decal") then      
					Part:FindFirstChildOfClass("Decal").Texture = NewCharacter.Head:FindFirstChildOfClass("Decal").Texture      
				end      
			end      

			if NewCharacter:FindFirstChildOfClass("Shirt") then      
				if LocalPlayer.Character:FindFirstChildOfClass("Shirt") then      
					LocalPlayer.Character:FindFirstChildOfClass("Shirt"):Destroy()      
				end      
				local Clone = NewCharacter:FindFirstChildOfClass("Shirt"):Clone()      
				Clone.Parent = LocalPlayer.Character      
			end      

			if NewCharacter:FindFirstChildOfClass("Pants") then      
				if LocalPlayer.Character:FindFirstChildOfClass("Pants") then      
					LocalPlayer.Character:FindFirstChildOfClass("Pants"):Destroy()      
				end      
				local Clone = NewCharacter:FindFirstChildOfClass("Pants"):Clone()      
				Clone.Parent = LocalPlayer.Character      
			end      

			for _,Part in pairs (NewCharacter:GetChildren()) do      
				if Part:IsA("Accessory") then      
					local Clone = Part:Clone()      
					for _,Weld in pairs (Clone.Handle:GetChildren()) do      
						if Weld:IsA("Weld") and Weld.Part1 ~= nil then      
							Weld.Part1 = LocalPlayer.Character[Weld.Part1.Name]      
						end      
					end      
					Clone.Parent = LocalPlayer.Character      
				end      
			end      

			if LocalPlayer.Character:FindFirstChildOfClass("Shirt") then      
				local String = INST("StringValue")      
				String.Name = "OriginalTexture"      
				String.Value = LocalPlayer.Character:FindFirstChildOfClass("Shirt").ShirtTemplate      
				String.Parent = LocalPlayer.Character:FindFirstChildOfClass("Shirt")      

				if TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then      
					LocalPlayer.Character:FindFirstChildOfClass("Shirt").ShirtTemplate = ""      
				end      
			end      
			if LocalPlayer.Character:FindFirstChildOfClass("Pants") then      
				local String = INST("StringValue")      
				String.Name = "OriginalTexture"      
				String.Value = LocalPlayer.Character:FindFirstChildOfClass("Pants").PantsTemplate      
				String.Parent = LocalPlayer.Character:FindFirstChildOfClass("Pants")      

				if TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then      
					LocalPlayer.Character:FindFirstChildOfClass("Pants").PantsTemplate = ""      
				end      
			end      
			for i,v in pairs(LocalPlayer.Character:GetChildren()) do      
				if v:IsA("BasePart") and v.Transparency ~= 1 then      
					INSERT(SelfObj, v)      
					local Color = INST("Color3Value")      
					Color.Name = "OriginalColor"      
					Color.Value = v.Color      
					Color.Parent = v      

					local String = INST("StringValue")      
					String.Name = "OriginalMaterial"      
					String.Value = v.Material.Name      
					String.Parent = v      
				elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then      
					INSERT(SelfObj, v.Handle)      
					local Color = INST("Color3Value")      
					Color.Name = "OriginalColor"      
					Color.Value = v.Handle.Color      
					Color.Parent = v.Handle      

					local String = INST("StringValue")      
					String.Name = "OriginalMaterial"      
					String.Value = v.Handle.Material.Name      
					String.Parent = v.Handle      
				end      
			end      

			if values.visuals.self["self chams"].Toggle then      
				for _,obj in pairs(SelfObj) do      
					if obj.Parent ~= nil then      
						obj.Material = values.visuals.self["self chams material"].Dropdown
						obj.Color = values.visuals.self["self chams"].Color     
						obj.Transparency = values.visuals.self["self chams transparency"].Slider/10    
					end      
				end      
			end      
		end      
		local function GetDeg(pos1, pos2)      
			local start = pos1.LookVector      
			local vector = CF(pos1.Position, pos2).LookVector      
			local angle = ACOS(start:Dot(vector))      
			local deg = DEG(angle)      
			return deg      
		end      
		local Ping = game.Stats.PerformanceStats.Ping:GetValue()      

		for i,v in pairs(Viewmodels:GetChildren()) do      
			if v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart.Transparency ~= 1 then      
				v.HumanoidRootPart.Transparency = 1      
			end      
		end      

		local Models = game:GetObjects("rbxassetid://7285197035")[1]      
		repeat wait() until Models ~= nil      
		local ChrModels = game:GetObjects("rbxassetid://7951832105")[1]      
		repeat wait() until ChrModels ~= nil      


		local AllKnives = {      
			"CT Knife",      
			"T Knife",      
			"Banana",      
			"Bayonet",      
			"Bearded Axe",      
			"Butterfly Knife",      
			"Cleaver",      
			"Crowbar",      
			"Falchion Knife",      
			"Flip Knife",      
			"Gut Knife",      
			"Huntsman Knife",      
			"Karambit",      
			"Sickle",      
		}      

		local AllGloves = {}      


		for _,fldr in pairs(Gloves:GetChildren()) do      
			if fldr ~= GloveModels and fldr.Name ~= "Racer" then      
				AllGloves[fldr.Name] = {}      
				for _2,modl in pairs(fldr:GetChildren()) do      
					INSERT(AllGloves[fldr.Name], modl.Name)      
				end      
			end      
		end      

		for i,v in pairs(Models.Knives:GetChildren()) do      
			INSERT(AllKnives, v.Name)      
		end      

		local AllSkins = {}      
		local AllWeapons = {}      
		local AllCharacters = {}      

		for i,v in pairs(ChrModels:GetChildren()) do      
			INSERT(AllCharacters, v.Name)      
		end      

		local skins = {      
			{["Weapon"] = "AWP", ["SkinName"] = "Bot", ["Skin"] = {["Scope"] = "6572594838", ["Handle"] = "6572594077"}}      
		}      

		for _,skin in pairs (skins) do      
			local Folder = INST("Folder")      
			Folder.Name = skin["SkinName"]      
			Folder.Parent = Skins[skin["Weapon"]]      

			for _,model in pairs (skin["Skin"]) do      
				local val = INST("StringValue")      
				val.Name = _      
				val.Value = "rbxassetid://"..model      
				val.Parent = Folder      
			end      
		end      

		for i,v in pairs(Skins:GetChildren()) do      
			INSERT(AllWeapons, v.Name)      
		end      

		TBLSORT(AllWeapons, function(a,b)      
			return a < b      
		end)      

		for i,v in ipairs(AllWeapons) do      
			AllSkins[v] = {}      
			INSERT(AllSkins[v], "Inventory")      
			for _,v2 in pairs(Skins[v]:GetChildren()) do      
				if not v2:FindFirstChild("Animated") then      
					INSERT(AllSkins[v], v2.Name)      
				end      
			end      
		end      

		RunService.RenderStepped:Wait()      

		local gui = library:New("Serenity")      
		local legit = gui:Tab("legit")      
		local rage = gui:Tab("rage")      
		local visuals = gui:Tab("visuals")      
		local misc = gui:Tab("misc")    
		local exploit = gui:Tab("exploit")      
		local skins = gui:Tab("skins")      

		getgenv().api = {}      
		api.newtab = function(name)      
			return gui:Tab(name)      
		end      
		api.newsection = function(tab, name, side)      
			return tab:Sector(name, side)      
		end      
		api.newelement = function(section, type, name, data, callback)      
			section:Element(type, name, data, callback)      
		end      


		local knife = skins:Sector("knife", "Left")      
		knife:Element("Toggle", "knife changer")      
		knife:Element("Scroll", "model", {options = AllKnives, Amount = 15})      

		local glove = skins:Sector("glove", "Left")      
		glove:Element("Toggle", "glove changer")      
		glove:Element("ScrollDrop", "model", {options = AllGloves, Amount = 9})      

		local skin = skins:Sector("skins", "Right")      
		skin:Element("Toggle", "skin changer")      
		skin:Element("ScrollDrop", "skin", {options = AllSkins, Amount = 15, alphabet = true})      

		local characters = skins:Sector("characters", "Right")      
		characters:Element("Toggle", "character changer", nil, function(tbl)      
			if tbl.Toggle then      
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun") then      
					ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll))      
				end      
			end      
		end)      
		characters:Element("Scroll", "skin", {options = AllCharacters, Amount = 9, alphabet = true}, function(tbl)      
			if values.skins.characters["character changer"].Toggle then      
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun") then      
					ChangeCharacter(ChrModels:FindFirstChild(tbl.Scroll))      
				end      
			end      
		end)  





		local aimbot = legit:Sector("aimbot", "Left")      
		aimbot:Element("ToggleKeybind", "aim assist")      
		aimbot:Element("ToggleKeybind", "silent aim")      
		aimbot:Element("ToggleKeybind", "triggerbot")      

		local main = legit:MSector("main", "Left")      
		local default = main:Tab("default")      
		local pistol = main:Tab("pistol")      
		local smg = main:Tab("smg")      
		local rifle = main:Tab("rifle")      
		local sniper = main:Tab("sniper")      

		local function AddLegit(Tab)      
			Tab:Element("Jumbobox", "conditions", {options = {"visible", "standing", "blind", "smoke"}})      
			Tab:Element("Dropdown", "target", {options = {"crosshair", "health", "distance"}})      
			Tab:Element("Dropdown", "hitbox", {options = {"closest", "head", "chest"}})      
			Tab:Element("Slider", "field of view", {min = 30, max = 420, default = 120})      
			Tab:Element("Slider", "smoothing", {min = 1, max = 50, default = 1})      
			Tab:Element("Toggle", "silent aim")      
			Tab:Element("Slider", "hitchance", {min = 1, max = 100, default = 100})      
			Tab:Element("Dropdown", "priority", {options = {"closest", "head", "chest"}})      
			Tab:Element("Toggle", "triggerbot")      
			Tab:Element("Slider", "delay (ms)", {min = 0, max = 300, default = 200})      
			Tab:Element("Slider", "minimum dmg", {min = 0, max = 100, default = 15})      
		end      

		AddLegit(default)      

		pistol:Element("Toggle", "override default")      
		AddLegit(pistol)      

		smg:Element("Toggle", "override default")      
		AddLegit(smg)      

		rifle:Element("Toggle", "override default")      
		AddLegit(rifle)      

		sniper:Element("Toggle", "override default")      
		AddLegit(sniper)      

		local settings = legit:Sector("settings", "Right")      
		settings:Element("Toggle", "free for all")      
		settings:Element("Toggle", "forcefield check")      
		settings:Element("ToggleColor", "draw fov")      

		local aimbot = rage:Sector("aimbot", "Left")      
		aimbot:Element("Toggle", "Enabled")
		aimbot:Element("Dropdown", "Prediction", {options = {"off", "Stormy.tech", "Serenity.win", "ova.rocks", "nixus"}})          
		aimbot:Element("Dropdown", "Origin", {options = {"character", "camera"}})      
		aimbot:Element("Toggle", "Silent Aim")      
		aimbot:Element("Dropdown", "Auto Fire", {options = {"off", "standard", "hitpart"}})      
		aimbot:Element("Toggle", "Auto Pen")      
		aimbot:Element("Jumbobox", "Resolver", {options = {"Pitch", "Roll","Animation","ServerSide"}})      
		aimbot:Element("Toggle", "Refine Shot")      
		aimbot:Element("Toggle", "Hitbox Manipulation")    
		aimbot:Element("Dropdown", "Prediction Modes", {options = {"off", "cframe", "velocity"}}) 
		aimbot:Element("Toggle", "Last Position")      
		aimbot:Element("Toggle", "teammates")  
		aimbot:Element("Toggle", "Scale HP")      
		aimbot:Element("Toggle", "Movement Prediction")      
		aimbot:Element("Toggle", "Knifebot")  
		aimbot:Element("Slider", "Knifebot Prediction", {min = 0, max = 127, default = 0})    
		aimbot:Element("Slider", "Prediction Hitchance", {min = 0, max = 250, default = 50})
		aimbot:Element("Dropdown", "Auto Fire Type", {options = {"Serenity" ,"standard", "off"}})
		aimbot:Element("Dropdown", "Auto Wall Type", {options = {"Serenity", "standard", "off"}})
		
		local weapons = rage:MSector("weapons", "Left")      
		local default = weapons:Tab("default")      
		local pistol = weapons:Tab("pistol")      
		local rifle = weapons:Tab("rifle")      	
		local scout = weapons:Tab("scout")      
		local awp = weapons:Tab("awp")      																											
		local auto = weapons:Tab("auto")      

		local function AddRage(Tab)      
			Tab:Element("Jumbobox", "hitboxes", {options = {"head", "torso", "pelvis", "legs"}})      
			Tab:Element("Toggle", "prefer body")      
			Tab:Element("Slider", "minimum damage", {min = -100, max = 100, default = 20})      
			Tab:Element("Slider", "max fov", {min = 1, max = 180, default = 180})      
		end      

		AddRage(default)      

		pistol:Element("Toggle", "override default")      
		AddRage(pistol)      

		rifle:Element("Toggle", "override default")      
		AddRage(rifle)      

		scout:Element("Toggle", "override default")      
		AddRage(scout)      

		awp:Element("Toggle", "override default")      
		AddRage(awp)      

		auto:Element("Toggle", "override default")      
		AddRage(auto)      

		local antiaim = rage:Sector("angles", "Right")      
		antiaim:Element("Toggle", "enabled")  
		local Client = getsenv(game.Players.LocalPlayer.PlayerGui.Client)
		fakeduckloop = false  
		antiaim:Element("Toggle", "fake duck",{},function(tbl)
			fakeduckloop = tbl.Toggle
			while fakeduckloop and syn do
				pcall(function()
					wait(1)
					local Client = getsenv(game.Players.LocalPlayer.PlayerGui.Client)
					local CrouchAnim = nil
					for i,v in pairs(debug.getupvalues(Client.setcharacter)) do
						if type(v) == "userdata" and v.ClassName == "AnimationTrack" and v.Name == "Idle" then
							CrouchAnim = v																																																																																																																																																																																																																																																																																																																																																					
						end
					end

					CrouchAnim:Play()
				end)
			end
		end)    
		antiaim:Element("Dropdown", "yaw base", {options = {"camera", "targets", "spin", "random"}})      
		antiaim:Element("Slider", "yaw offset", {min = -180, max = 180, default = 0})      
		antiaim:Element("Toggle", "Desync")      
		antiaim:Element("Slider", "Desync Range", {min = 0, max = 360, default = 0})      
		antiaim:Element("Dropdown", "pitch", {options = {"None", "Up", "Down","Huge", "Custom", "Zero", "180", "Random AA", "Stormy.tech", "gay", "Dynamic", "God", "Sus_down", "wtf", "glitch", "sussy", "fucker"}})   
		antiaim:Element("Slider", "pitch angle", {min = -100, max = 100, default = 0})     
		antiaim:Element("Toggle", "extend pitch")   
		antiaim:Element("Slider", "body roll offset", {min = -180, max = 180, default = 0}) 
		antiaim:Element("Toggle", "underground aa")  
		antiaim:Element("Slider", "underground pos", {min = -200, max = 200, default = 4})     
		antiaim:Element("Dropdown", "body roll", {options = {"off", "180","spin","360","70","60"}})          
		antiaim:Element("Slider", "spin speed", {min = 1, max = 20000, default = 4}) 
		antiaim:Element("Slider", "high pos", {min = -3, max = 20, default = 2})     

		local others = rage:Sector("others", "Right")      
		others:Element("Toggle", "remove head")      
		others:Element("Toggle", "no animations")      
		others:Element("Dropdown", "leg movement", {options = {"off", "slide"}})      

		local LagTick = 0      
		local fakelag = rage:Sector("fakelag", "Right")      
		fakelag:Element("Toggle", "enabled", {default = {Toggle = false}}, function(tbl)      
			if tbl.Toggle then      
			else      
				FakelagFolder:ClearAllChildren()      
				game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)      
			end      
		end)      
		fakelag:Element("Dropdown", "amount", {options = {"static", "dynamic"}})      
		fakelag:Element("Slider", "limit", {min = 1, max = 16, default = 8})      
		fakelag:Element("ToggleColor", "visualize lag", {default = {Toggle = false, Color = COL3RGB(255,255,255)}}, function(tbl)      
			if tbl.Toggle then      
				for _,obj in pairs(FakelagFolder:GetChildren()) do      
					obj.Color = tbl.Color      
				end      
			else      
				FakelagFolder:ClearAllChildren()      
			end      
		end)    
		fakelag:Element("Dropdown", "visualize lag material", {options = {"Neon", "ForceField","SmoothPlastic"}})  
		fakelag:Element("Slider", "visualize lag transparency", {min = 0, max = 10, default = 0})     
		fakelag:Element("ToggleKeybind", "ping spike")      
		coroutine.wrap(function()      
			while wait(1/16) do      
				LagTick = CLAMP(LagTick + 1, 0, values.rage.fakelag.limit.Slider)      
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") and values.rage.fakelag.enabled.Toggle then    
					if LagTick == (values.rage.fakelag.amount.Dropdown == "static" and values.rage.fakelag.limit.Slider or RANDOM(1, values.rage.fakelag.limit.Slider)) then      
						game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)      
						FakelagFolder:ClearAllChildren()      
						LagTick = 0      
						if values.rage.fakelag["visualize lag"].Toggle then      
							for _,hitbox in pairs(LocalPlayer.Character:GetChildren()) do      
								if hitbox:IsA("BasePart") and hitbox.Name ~= "HumanoidRootPart" then      
									local part = INST("Part")      
									part.CFrame = hitbox.CFrame      
									part.Anchored = true      
									part.CanCollide = false      
									part.Material = values.rage.fakelag["visualize lag material"].Dropdown       
									part.Color = values.rage.fakelag["visualize lag"].Color      
									part.Name = hitbox.Name      
									part.Transparency = values.rage.fakelag["visualize lag transparency"].Slider/10        
									part.Size = hitbox.Size      
									part.Parent = FakelagFolder      
								end      
							end      
						end      
					else      
						if values.rage.fakelag.enabled.Toggle then      
							game:GetService("NetworkClient"):SetOutgoingKBPSLimit(1)      
						end      
					end      
				else      
					FakelagFolder:ClearAllChildren()      
					game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)      
				end      
			end      
		end)()       
		Peek = false
		local exploits = exploit:Sector("exploits", "Left")
		exploits:Element("Button","set health to 1hp",{},function()
			game.ReplicatedStorage.Events.FallDamage:FireServer(LocalPlayer.Character.Humanoid.Health-1)
		end)      
		exploits:Element("ToggleKeybind", "Penta Tap")
		exploits:Element("Dropdown", "PT type", {options = {"Penta Tap", "Standard", "Instant"}})        
		exploits:Element("ToggleKeybind", "kill all")    
		exploits:Element("Dropdown", "kill all type", {options = {"Instant", "Delayed", "Potato"}})         
		exploits:Element("Slider", "quick peek vertical pos", {min = -500, max = 500, default = 200})  
		exploits:Element("ToggleKeybind", "quick peek",{},function(tbl)
			if tbl.Toggle and tbl.Active and LocalPlayer.Character and Peek == false then
				if values.exploit.exploits["loop peek"].Toggle == true and values.exploit.exploits["quick peek"].Active == true then
					while values.exploit.exploits["loop peek"].Toggle == true do
						Peek = true
						LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,values.exploit.exploits["quick peek vertical pos"].Slider,0)
						wait(0.2)
						Peek = false
						LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,values.exploit.exploits["quick peek vertical pos"].Slider,0)
						wait(0.2)
					end
				else
					Peek = true
					LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,values.exploit.exploits["quick peek vertical pos"].Slider,0)
					wait(0.2)
					Peek = false
					LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,values.exploit.exploits["quick peek vertical pos"].Slider,0)
				end
			elseif  not tbl.Active then
				Peek = false
			end
		end)  
		exploits:Element("Toggle","loop peek")
		exploits:Element("Toggle","debris clear",{},function(tbl)
			while values.exploit.exploits["debris clear"].Toggle == true do
				wait(1)
				for i,v in pairs(workspace.Debris:GetDescendants()) do
					game:GetService("ReplicatedStorage").Events.DestroyObject:FireServer(v)
				end 
			end
		end)
		local AutoPeek = {
			OldPeekPosition = CFrame.new()
		}

		exploits:Element("ToggleKeybind","auto peek",{},function(tbl)
			spawn(function()
				if tbl.Toggle and tbl.Active and LocalPlayer.Character then
					AutoPeek.OldPeekPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
				end
			end)
		end)

		exploits:Element("ToggleKeybind","fakeframe",{},function(tbl)
			spawn(function()
				while values.exploit.exploits["fakeframe"].Toggle == true and values.exploit.exploits["fakeframe"].Active == true do
					wait()
					game:GetService("NetworkClient"):SetOutgoingKBPSLimit(1)  
				end
				game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)
			end)
		end)

		OldClientFireBullet = Client.firebullet
		Client.firebullet = function(...)
			if values.exploit.exploits["auto peek"].Toggle and values.exploit.exploits["auto peek"].Active and LocalPlayer.Character then
				LocalPlayer.Character.HumanoidRootPart.CFrame = AutoPeek.OldPeekPosition
			end
			return OldClientFireBullet(...)
		end



		local players = visuals:Sector("players", "Left")      
		players:Element("Toggle", "teammates")      
		players:Element("ToggleColor", "box", {default = {Color = COL3RGB(255,255,255)}})      
		players:Element("ToggleColor", "name", {default = {Color = COL3RGB(255,255,255)}})      
		players:Element("Toggle", "health")      
		players:Element("ToggleColor", "weapon", {default = {Color = COL3RGB(255,255,255)}})      
		players:Element("ToggleColor", "weapon icon", {default = {Color = COL3RGB(255,255,255)}})      
		players:Element("Jumbobox", "indicators", {options = {"armor"}})      
		players:Element("Jumbobox", "outlines", {options = {"drawings", "text"}, default = {Jumbobox = {"drawings", "text"}}})      
		players:Element("Dropdown", "font", {options = {"Plex", "Monospace", "System", "UI"}})      
		players:Element("Slider", "size", {min = 12, max = 16, default = 13}) 
		players:Element("ToggleColor", "chams", nil, function(tbl)      
			for _,Player in pairs(Players:GetPlayers()) do      
				if Player.Character then      
					for _2,Obj in pairs(Player.Character:GetDescendants()) do      
						if Obj.Name == "VisibleCham" or Obj.Name == "WallCham" then 
							Obj.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle       
							if tbl.Toggle then      
								if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then      
									Obj.Visible = true      
								else      
									Obj.Visible = false      
								end      
							else      
								Obj.Visible = false      
							end      
							Obj.Color3 = tbl.Color      
						end      
					end      
				end      
			end      
		end)  
		players:Element("Toggle","invisible chams")         

		local effects = visuals:Sector("effects", "Right")      
		effects:Element("ToggleTrans", "weapon chams", {default = {Color = COL3RGB(255,255,255), Transparency = 0}}, function(tbl)      
			if WeaponObj == nil then return end      
			if tbl.Toggle then      
				for i,v in pairs(WeaponObj) do      
					UpdateWeapon(v)      
				end      
			else      
				for i,v in pairs(WeaponObj) do      
					if v:IsA("MeshPart") then v.TextureID = v.OriginalTexture.Value end      
					if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then      
						v.Mesh.TextureId = v.Mesh.OriginalTexture.Value      
						v.Mesh.VertexColor = Vec3(1,1,1)      
					end      
					v.Color = v.OriginalColor.Value      
					v.Material = v.OriginalMaterial.Value      
					v.Transparency = 0      
				end      
			end      
		end)      
		effects:Element("Dropdown", "weapon material", {options = {"Smooth", "Flat", "ForceField", "Glass"}}, function(tbl)      
			if WeaponObj == nil then return end      
			if values.visuals.effects["weapon chams"].Toggle then      
				for i,v in pairs(WeaponObj) do      
					UpdateWeapon(v)      
				end      
			end      
		end)      
		effects:Element("Slider", "reflectance", {min = 0, max = 100, default = 0}, function(tbl)      
			if values.visuals.effects["weapon chams"].Toggle then      
				for i,v in pairs(WeaponObj) do      
					UpdateWeapon(v)      
				end      
			end      
		end)      
		effects:Element("ToggleTrans", "accessory chams", {default = {Color = COL3RGB(255,255,255)}}, function(val)      
			if RArm == nil or LArm == nil then return end      
			if val.Toggle then      
				if RGlove ~= nil then      
					UpdateAccessory(RGlove)      
				end      
				if RSleeve ~= nil then      
					UpdateAccessory(RSleeve)      
				end      
				if LGlove ~= nil then      
					UpdateAccessory(LGlove)      
				end      
				if LSleeve ~= nil then      
					UpdateAccessory(LSleeve)      
				end      
			else      
				if RGlove then      
					ReverseAccessory(RGlove)      
				end      
				if LGlove then      
					ReverseAccessory(LGlove)      
				end      
				if RSleeve then      
					ReverseAccessory(RSleeve)      
				end      
				if LSleeve then      
					ReverseAccessory(LSleeve)      
				end      
			end      
		end)      
		effects:Element("Dropdown", "accessory material", {options = {"Smooth","ForceField"}}, function(val)      
			if RArm == nil or LArm == nil then return end      
			if values.visuals.effects["accessory chams"].Toggle then      
				if RGlove ~= nil then      
					UpdateAccessory(RGlove)      
				end      
				if RSleeve ~= nil then      
					UpdateAccessory(RSleeve)      
				end      
				if LGlove ~= nil then      
					UpdateAccessory(LGlove)      
				end      
				if LSleeve ~= nil then      
					UpdateAccessory(LSleeve)      
				end      
			end      
		end)      
		effects:Element("ToggleTrans", "arm chams", {default = {Color = COL3RGB(255,255,255)}}, function(val)      
			if RArm == nil then return end      
			if LArm == nil then return end      
			if val.Toggle then      
				RArm.Color = val.Color      
				LArm.Color = val.Color      
				RArm.Transparency = val.Transparency      
				LArm.Transparency = val.Transparency      
			else      
				RArm.Color = RArm.Color3Value.Value      
				LArm.Color = RArm.Color3Value.Value      
				RArm.Transparency = 0      
				LArm.Transparency = 0      
			end      
		end)      
		effects:Element("Jumbobox", "removals", {options = {"scope", "scope lines", "flash", "smoke", "decals", "shadows", "clothes"}}, function(val)      
			local tbl = val.Jumbobox      
			if TBLFIND(tbl, "decals") then      
				Client.createbullethole = function() end      
				for i,v in pairs(workspace.Debris:GetChildren()) do      
					if v.Name == "Bullet" or v.Name == "SurfaceGui" then      
						v:Destroy()      
					end      
				end      
			else      
				Client.createbullethole = oldcreatebullethole      
			end      
			if TBLFIND(tbl, "clothes") then      
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") then      
					if LocalPlayer.Character:FindFirstChild("Shirt") then      
						LocalPlayer.Character:FindFirstChild("Shirt").ShirtTemplate = ""      
					end      
					if LocalPlayer.Character:FindFirstChild("Pants") then      
						LocalPlayer.Character:FindFirstChild("Pants").PantsTemplate = ""      
					end      
				end      
			else      
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") then      
					if LocalPlayer.Character:FindFirstChild("Shirt") then      
						LocalPlayer.Character:FindFirstChild("Shirt").ShirtTemplate = LocalPlayer.Character:FindFirstChild("Shirt").OriginalTexture.Value      
					end      
					if LocalPlayer.Character:FindFirstChild("Pants") then      
						LocalPlayer.Character:FindFirstChild("Pants").PantsTemplate = LocalPlayer.Character:FindFirstChild("Pants").OriginalTexture.Value      
					end      
				end      
			end      
			if TBLFIND(tbl, "scope") then      
				Crosshairs.Scope.ImageTransparency = 1      
				Crosshairs.Scope.Scope.ImageTransparency = 1      
				Crosshairs.Frame1.Transparency = 1      
				Crosshairs.Frame2.Transparency = 1      
				Crosshairs.Frame3.Transparency = 1      
				Crosshairs.Frame4.Transparency = 1      
			else      
				Crosshairs.Scope.ImageTransparency = 0      
				Crosshairs.Scope.Scope.ImageTransparency = 0      
				Crosshairs.Frame1.Transparency = 0      
				Crosshairs.Frame2.Transparency = 0      
				Crosshairs.Frame3.Transparency = 0      
				Crosshairs.Frame4.Transparency = 0      
			end      
			PlayerGui.Blnd.Enabled = not TBLFIND(tbl, "flash") and true or false      
			Lighting.GlobalShadows = not TBLFIND(tbl, "shadows") and true or false      
			if RayIgnore:FindFirstChild("Smokes") then      
				if TBLFIND(tbl, "smoke") then      
					for i,smoke in pairs(RayIgnore.Smokes:GetChildren()) do      
						smoke.ParticleEmitter.Rate = 0      
					end      
				else      
					for i,smoke in pairs(RayIgnore.Smokes:GetChildren()) do      
						smoke.ParticleEmitter.Rate = smoke.OriginalRate.Value      
					end      
				end      
			end      
		end)      
		effects:Element("Toggle", "force crosshair")      
		effects:Element("ToggleColor", "world color", {default = {Color = COL3RGB(255,255,255)}}, function(val)      
			if val.Toggle then      
				Camera.ColorCorrection.TintColor = val.Color      
			else      
				Camera.ColorCorrection.TintColor = COL3RGB(255,255,255)      
			end      
		end)      
		effects:Element("ToggleColor", "Ambient", {default = {Color = COL3RGB(255,255,255)}}, function(val) 
			if val.Toggle then
				game.Lighting.ColorShift_Bottom = val.Color
				game.Lighting.ColorShift_Top = val.Color
				game.Lighting.OutdoorAmbient = val.Color
				game.Lighting.ColorShift_Bottom = val.Color
				game.Lighting.ColorShift_Top = val.Color
			else
				game.Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
				game.Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
				game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
				game.Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
				game.Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
			end
		end)
		effects:Element("Toggle", "shadowmap technology", nil, function(val) sethiddenproperty(Lighting, "Technology", val.Toggle and "ShadowMap" or "Legacy") end)      

		local self = visuals:Sector("self", "Right")      
		self:Element("ToggleKeybind", "third person", {}, function(tbl)      
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then      
				if tbl.Toggle then      
					if tbl.Active then      
						LocalPlayer.CameraMaxZoomDistance = values.visuals.self.distance.Slider      
						LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider      
						LocalPlayer.CameraMaxZoomDistance = values.visuals.self.distance.Slider      
						LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider      
					else      
						LocalPlayer.CameraMaxZoomDistance = 0      
						LocalPlayer.CameraMinZoomDistance = 0      
						LocalPlayer.CameraMaxZoomDistance = 0      
						LocalPlayer.CameraMinZoomDistance = 0      
					end      
				else      
					LocalPlayer.CameraMaxZoomDistance = 0      
					LocalPlayer.CameraMinZoomDistance = 0      
				end      
			end      
		end)      
		self:Element("Slider", "distance", {min = 6, max = 18, default = 12}, function(tbl)      
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then      
				if values.visuals.self["third person"].Toggle then      
					if values.visuals.self["third person"].Active then      
						LocalPlayer.CameraMaxZoomDistance = tbl.Slider      
						LocalPlayer.CameraMinZoomDistance = tbl.Slider      
						LocalPlayer.CameraMaxZoomDistance = tbl.Slider      
						LocalPlayer.CameraMinZoomDistance = tbl.Slider      
					else      
						LocalPlayer.CameraMaxZoomDistance = 0      
						LocalPlayer.CameraMinZoomDistance = 0      
					end      
				else      
					LocalPlayer.CameraMaxZoomDistance = 0      
					LocalPlayer.CameraMinZoomDistance = 0      
				end      
			end      
		end)      
		LocalPlayer:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function(current)      
			if values.visuals.self["third person"].Toggle then      
				if values.visuals.self["third person"].Active then      
					if current ~= values.visuals.self.distance.Slider then      
						LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider      
					end      
				end      
			end      
		end)      
		self:Element("Slider", "fov changer", {min = 0, max = 120, default = 80}, function(value)      
			RunService.RenderStepped:Wait()      
			if LocalPlayer.Character == nil then return end      
			if fov == value.Slider then return end      
			if values.visuals.self["on scope"].Toggle or not LocalPlayer.Character:FindFirstChild("AIMING") then      
				Camera.FieldOfView = value.Slider      
			end      
		end)      
		self:Element("Toggle", "on scope")      
		self:Element("Toggle", "viewmodel changer")      
		self:Element("Slider", "viewmodel x", {min = -30, max = 30}, function(val)      
			ViewmodelOffset = CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * CFAngles(0, 0, values.visuals.self.roll.Slider/50)      
		end)      
		self:Element("Slider", "viewmodel y", {min = -30, max = 30}, function(val)      
			ViewmodelOffset = CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * CFAngles(0, 0, values.visuals.self.roll.Slider/50)      
		end)      
		self:Element("Slider", "viewmodel z", {min = -30, max = 30}, function(val)      
			ViewmodelOffset = CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * CFAngles(0, 0, values.visuals.self.roll.Slider/50)      
		end)      
		self:Element("Slider", "roll", {min = -100, max = 100}, function(val)      
			ViewmodelOffset = CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * CFAngles(0, 0, values.visuals.self.roll.Slider/50)      
		end)      
		self:Element("ToggleColor", "self chams", {default = {Color = COL3RGB(255,255,255)}}, function(tbl)      
			if tbl.Toggle then      
				for _,obj in pairs(SelfObj) do      
					if obj.Parent ~= nil then      
						obj.Material = values.visuals.self["self chams material"].Dropdown
						obj.Color = values.visuals.self["self chams"].Color    
						obj.Transparency = values.visuals.self["self chams transparency"].Slider/10
					end      
				end      
			else      
				for _,obj in pairs(SelfObj) do      
					if obj.Parent ~= nil then      
						obj.Material = values.visuals.self["self chams material"].Dropdown
						obj.Color = values.visuals.self["self chams"].Color 
						obj.Transparency = values.visuals.self["self chams transparency"].Slider/10  
					end      
				end      
			end      
		end)   
		self:Element("Dropdown", "self chams material", {options = {"ForceField","Neon","SmoothPlastic"}})         
		self:Element("Slider", "self chams transparency", {min = 0, max = 10})
		self:Element("Slider", "scope blend", {min = 0, max = 100, default = 0})      

		local ads = Client.updateads      
		Client.updateads = function(self, ...)      
			local args = {...}      
			coroutine.wrap(function()      
				wait()      
				if LocalPlayer.Character ~= nil then      
					for _,part in pairs(LocalPlayer.Character:GetDescendants()) do      
						if part:IsA("Part") or part:IsA("MeshPart") then      
							if part.Transparency ~= 1 then      
								part.Transparency = LocalPlayer.Character:FindFirstChild("AIMING") and values.visuals.self["scope blend"].Slider/100 or 0      
							end      
						end      
						if part:IsA("Accessory") then      
							part.Handle.Transparency = LocalPlayer.Character:FindFirstChild("AIMING") and values.visuals.self["scope blend"].Slider/100 or 0      
						end      
					end      
				end      
			end)()      
			return ads(self, ...)      
		end      

		local world = visuals:Sector("world", "Left")      
		world:Element("ToggleTrans", "molly radius", {default = {Color = COL3RGB(255,0,0)}}, function(tbl)      
			if RayIgnore:FindFirstChild("Fires") == nil then return end      
			if tbl.Toggle then      
				for i,fire in pairs(RayIgnore:FindFirstChild("Fires"):GetChildren()) do      
					fire.Transparency = tbl.Transparency      
					fire.Color = tbl.Color      
				end      
			else      
				for i,fire in pairs(RayIgnore:FindFirstChild("Fires"):GetChildren()) do      
					fire.Transparency = 1      
				end      
			end      
		end)      
		world:Element("ToggleColor", "smoke radius", {default = {Color = COL3RGB(0, 255, 0)}}, function(tbl)      
			if RayIgnore:FindFirstChild("Smokes") == nil then return end      
			if tbl.Toggle then      
				for i,smoke in pairs(RayIgnore:FindFirstChild("Smokes"):GetChildren()) do      
					smoke.Transparency = 0      
					smoke.Color = tbl.Color      
				end      
			else      
				for i,smoke in pairs(RayIgnore:FindFirstChild("Smokes"):GetChildren()) do      
					smoke.Transparency = 1      
				end      
			end      
		end)    
		world:Element("Slider", "time changer", {min = 0, max = 12, default = 0}, function(tbl) 
			game.Lighting.ClockTime = tbl.Slider
			end)  
		world:Element("ToggleColor", "bullet tracers", {default = {Color = COL3RGB(0, 0, 255)}})  
		world:Element("Dropdown", "bullet tracers type", {options = {"Normal","Drawing"}})          
		world:Element("ToggleColor", "impacts", {default = {Color = COL3RGB(255, 0, 0)}})      
		world:Element("ToggleColor", "hit chams", {default = {Color = COL3RGB(0, 0, 255)}})      
		world:Element("Dropdown", "hitsound", {options = {"none", "skeet", "neverlose", "rust", "bag", "baimware", "osu", "Tf2", "Tf2 pan", "M55solix", "Slap", "1", "Minecraft", "jojo", "vibe", "supersmash", "epic", "retro", "quek", "SEMI"}}) 
		world:Element("Slider", "sound volume", {min = 1, max = 5, default = 3})      
		world:Element("Dropdown", "skybox", {options = {"none", "nebula", "vaporwave", "clouds","MC","Dababy","Rezero","Chill"}}, function(tbl) 
			local sky = tbl.Dropdown      
			if sky ~= "none" then      
				if Lighting:FindFirstChildOfClass("Sky") then Lighting:FindFirstChildOfClass("Sky"):Destroy() end      
				local skybox = INST("Sky")      
				skybox.SkyboxLf = Skyboxes[sky].SkyboxLf      
				skybox.SkyboxBk = Skyboxes[sky].SkyboxBk      
				skybox.SkyboxDn = Skyboxes[sky].SkyboxDn      
				skybox.SkyboxFt = Skyboxes[sky].SkyboxFt      
				skybox.SkyboxRt = Skyboxes[sky].SkyboxRt      
				skybox.SkyboxUp = Skyboxes[sky].SkyboxUp      
				skybox.Name = "override"      
				skybox.Parent = Lighting      
			else      
				if Lighting:FindFirstChildOfClass("Sky") then Lighting:FindFirstChildOfClass("Sky"):Destroy() end      
				if oldSkybox ~= nil then oldSkybox:Clone().Parent = Lighting end      
			end      
		end)      
		world:Element("ToggleColor", "item esp", {default = {Color = COL3RGB(255, 255, 255)}}, function(tbl)      
			for i,weapon in pairs(workspace.Debris:GetChildren()) do      
				if weapon:IsA("BasePart") and Weapons:FindFirstChild(weapon.Name) then      
					weapon.BillboardGui.ImageLabel.Visible = tbl.Toggle and TBLFIND(values.visuals.world["types"].Jumbobox, "icon") and true or false      
				end      
			end      
		end)      
		world:Element("Jumbobox", "types", {options = {"icon"}}, function(tbl)      
			for i,weapon in pairs(workspace.Debris:GetChildren()) do      
				if weapon:IsA("BasePart") and Weapons:FindFirstChild(weapon.Name) then      
					weapon.BillboardGui.ImageLabel.Visible = values.visuals.world["item esp"].Toggle and TBLFIND(tbl.Jumbobox, "icon") and true or false      
					weapon.BillboardGui.ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color      
				end      
			end      
		end)      
		local configs = misc:Sector("configs", "Left")      
		configs:Element("TextBox", "config", {placeholder = "config name"})      
		configs:Element("Button", "save", {}, function() if values.misc.configs.config.Text ~= "" then library:SaveConfig(values.misc.configs.config.Text) end end)      
		configs:Element("Button", "load", {}, function() if values.misc.configs.config.Text ~= "" then ConfigLoad:Fire(values.misc.configs.config.Text) end end)      
		configs:Element("Toggle", "keybind list", nil, function(tbl)      
			library:SetKeybindVisible(tbl.Toggle)      
		end)      

		local crosshaireditor = misc:Sector("crosshair editor", "Right")      
		local function UpdateCrosshair()      
			if values.misc["crosshair editor"].enabled.Toggle then      
				local length = values.misc["crosshair editor"].length.Slider      
				Crosshair.LeftFrame.Size = UDIM2(0, length, 0, 2)      
				Crosshair.RightFrame.Size = UDIM2(0, length, 0, 2)      
				Crosshair.TopFrame.Size = UDIM2(0, 2, 0, length)      
				Crosshair.BottomFrame.Size = UDIM2(0, 2, 0, length)      
				for _,frame in pairs(Crosshair:GetChildren()) do      
					if FIND(frame.Name, "Frame") then      
						frame.BorderColor3 = COL3(0,0,0)      
						if values.misc["crosshair editor"].border.Toggle then      
							frame.BorderSizePixel = 1      
						else      
							frame.BorderSizePixel = 0      
						end      
					end      
				end      
			else      
				Crosshair.LeftFrame.Size = UDIM2(0, 10, 0, 2)      
				Crosshair.RightFrame.Size = UDIM2(0, 10, 0, 2)      
				Crosshair.TopFrame.Size = UDIM2(0, 2, 0, 10)      
				Crosshair.BottomFrame.Size = UDIM2(0, 2, 0, 10)      
				for _,frame in pairs(Crosshair:GetChildren()) do      
					if FIND(frame.Name, "Frame") then      
						frame.BorderSizePixel = 0      
					end      
				end      
			end      
		end      
		crosshaireditor:Element("Toggle", "enabled", nil, UpdateCrosshair)      
		crosshaireditor:Element("Slider", "length", {min = 1, max = 15, default = 10}, UpdateCrosshair)      
		crosshaireditor:Element("Toggle", "border", nil, UpdateCrosshair)      

		local client = misc:Sector("client", "Right")      
		client:Element("Toggle", "infinite cash", nil, function(tbl)      
			if tbl.Toggle then      
				LocalPlayer.Cash.Value = 8000      
			end      
		end)      
		client:Element("Toggle", "infinite crouch")      
		client:Element("Jumbobox", "damage bypass", {options = {"fire", "fall"}})      
		client:Element("Jumbobox", "gun modifiers", {options = {"recoil", "spread", "reload", "equip", "ammo", "automatic", "penetration", "firerate"}})     
		client:Element("Toggle", "remove killers", {}, function(tbl)      
			if tbl.Toggle then      
				if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then      
					local clone = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone()      
					clone.Name = "KillersClone"      
					clone.Parent = workspace:FindFirstChild("Map")      

					workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy()      
				end      
			else      
				if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("KillersClone") then      
					workspace:FindFirstChild("Map"):FindFirstChild("KillersClone").Name = "Killers"      
				end      
			end      
		end)      
		client:Element("ToggleColor", "hitmarker", {default = {Color = COL3RGB(255,255,255)}})      
		client:Element("Toggle", "buy any grenade")      
		client:Element("Toggle", "chat alive")      
		client:Element("Jumbobox", "shop", {options = {"inf time", "anywhere"}})      
		client:Element("Toggle", "anti spectate")   
		client:Element("Toggle", "upside down spectate") 
		local zuhnmode = Instance.new("ColorCorrectionEffect", workspace.CurrentCamera)
				client:Element("Toggle", "Boost Saturation", {}, function(tbl)
					if tbl.Toggle then
						zuhnmode.Saturation = 1.4
				else
				zuhnmode.Saturation = 0
				end
				end)      

				
				client:Element("Toggle", "keystrokes", {}, function(tbl)
					if tbl.Toggle then
							local ScreenGuiKey = Instance.new("ScreenGui")
				local W = Instance.new("TextLabel")
				local A = Instance.new("TextLabel")
				local S = Instance.new("TextLabel")
				local D = Instance.new("TextLabel")
				local E = Instance.new("TextLabel")
				local R = Instance.new("TextLabel")
				local _ = Instance.new("TextLabel")
				local _2 = Instance.new("TextLabel")
				local _3 = Instance.new("TextLabel")
				local _4 = Instance.new("TextLabel")
				local _5 = Instance.new("TextLabel")
				local _6 = Instance.new("TextLabel")


				ScreenGuiKey.Parent = game.CoreGui
				ScreenGuiKey.Name = "keystrokess"

				W.Name = "W"
				W.Parent = ScreenGuiKey
				W.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				W.BackgroundTransparency = 1.000
				W.Position = UDim2.new(0.488053292, 0, 0.728395104, 0)
				W.Size = UDim2.new(0, 29, 0, 28)
				W.Visible = false
				W.Font = Enum.Font.Code
				W.Text = "W"
				W.TextColor3 = Color3.fromRGB(255, 255, 255)
				W.TextSize = 14.000
				W.TextStrokeTransparency = 0.000
				
				_.Name = "_"
				_.Parent = ScreenGuiKey
				_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				_.BackgroundTransparency = 1.000
				_.Position = UDim2.new(0.488053292, 0, 0.728395104, 0)
				_.Size = UDim2.new(0, 29, 0, 28)
				_.Visible = true
				_.Font = Enum.Font.Code
				_.Text = "_"
				_.TextColor3 = Color3.fromRGB(255, 255, 255)
				_.TextSize = 14.000
				_.TextStrokeTransparency = 0.000

				A.Name = "A"
				A.Parent = ScreenGuiKey
				A.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				A.BackgroundTransparency = 1.000
				A.Position = UDim2.new(0.453584045, 0, 0.777777791, 0)
				A.Size = UDim2.new(0, 29, 0, 28)
				A.Visible = false
				A.Font = Enum.Font.Code
				A.Text = "A"
				A.TextColor3 = Color3.fromRGB(255, 255, 255)
				A.TextSize = 14.000
				A.TextStrokeTransparency = 0.000
				
				_2.Name = "_2"
				_2.Parent = ScreenGuiKey
				_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				_2.BackgroundTransparency = 1.000
				_2.Position = UDim2.new(0.453584045, 0, 0.777777791, 0)
				_2.Size = UDim2.new(0, 29, 0, 28)
				_2.Visible = true
				_2.Font = Enum.Font.Code
				_2.Text = "_"
				_2.TextColor3 = Color3.fromRGB(255, 255, 255)
				_2.TextSize = 14.000
				_2.TextStrokeTransparency = 0.000

				S.Name = "S"
				S.Parent = ScreenGuiKey
				S.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				S.BackgroundTransparency = 1.000
				S.Position = UDim2.new(0.488053292, 0, 0.777777791, 0)
				S.Size = UDim2.new(0, 29, 0, 28)
				S.Visible = false
				S.Font = Enum.Font.Code
				S.Text = "S"
				S.TextColor3 = Color3.fromRGB(255, 255, 255)
				S.TextSize = 14.000
				S.TextStrokeTransparency = 0.000
				
				_3.Name = "_3"
				_3.Parent = ScreenGuiKey
				_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				_3.BackgroundTransparency = 1.000
				_3.Position = UDim2.new(0.488053292, 0, 0.777777791, 0)
				_3.Size = UDim2.new(0, 29, 0, 28)
				_3.Visible = true
				_3.Font = Enum.Font.Code
				_3.Text = "_"
				_3.TextColor3 = Color3.fromRGB(255, 255, 255)
				_3.TextSize = 14.000
				_3.TextStrokeTransparency = 0.000

				D.Name = "D"
				D.Parent = ScreenGuiKey
				D.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				D.BackgroundTransparency = 1.000
				D.Position = UDim2.new(0.522522688, 0, 0.777777791, 0)
				D.Size = UDim2.new(0, 29, 0, 28)
				D.Visible = false
				D.Font = Enum.Font.Code
				D.Text = "D"
				D.TextColor3 = Color3.fromRGB(255, 255, 255)
				D.TextSize = 14.000
				D.TextStrokeTransparency = 0.000
				
				_4.Name = "_4"
				_4.Parent = ScreenGuiKey
				_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				_4.BackgroundTransparency = 1.000
				_4.Position = UDim2.new(0.522522688, 0, 0.777777791, 0)
				_4.Size = UDim2.new(0, 29, 0, 28)
				_4.Visible = true
				_4.Font = Enum.Font.Code
				_4.Text = "_"
				_4.TextColor3 = Color3.fromRGB(255, 255, 255)
				_4.TextSize = 14.000
				_4.TextStrokeTransparency = 0.000

				E.Name = "E"
				E.Parent = ScreenGuiKey
				E.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				E.BackgroundTransparency = 1.000
				E.Position = UDim2.new(0.453584045, 0, 0.728395045, 0)
				E.Size = UDim2.new(0, 29, 0, 28)
				E.Visible = false
				E.Font = Enum.Font.Code
				E.Text = "C"
				E.TextColor3 = Color3.fromRGB(255, 255, 255)
				E.TextSize = 14.000
				E.TextStrokeTransparency = 0.000
				
				_5.Name = "_5"
				_5.Parent = ScreenGuiKey
				_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				_5.BackgroundTransparency = 1.000
				_5.Position = UDim2.new(0.453584045, 0, 0.728395045, 0)
				_5.Size = UDim2.new(0, 29, 0, 28)
				_5.Visible = true
				_5.Font = Enum.Font.Code
				_5.Text = "_"
				_5.TextColor3 = Color3.fromRGB(255, 255, 255)
				_5.TextSize = 14.000
				_5.TextStrokeTransparency = 0.000

				R.Name = "R"
				R.Parent = ScreenGuiKey
				R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				R.BackgroundTransparency = 1.000
				R.Position = UDim2.new(0.522522688, 0, 0.728395045, 0)
				R.Size = UDim2.new(0, 29, 0, 28)
				R.Visible = false
				R.Font = Enum.Font.Code
				R.Text = "J"
				R.TextColor3 = Color3.fromRGB(255, 255, 255)
				R.TextSize = 14.000
				R.TextStrokeTransparency = 0.000
				
				_6.Name = "_6"
				_6.Parent = ScreenGuiKey
				_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				_6.BackgroundTransparency = 1.000
				_6.Position = UDim2.new(0.522522688, 0, 0.728395045, 0)
				_6.Size = UDim2.new(0, 29, 0, 28)
				_6.Visible = true
				_6.Font = Enum.Font.Code
				_6.Text = "_"
				_6.TextColor3 = Color3.fromRGB(255, 255, 255)
				_6.TextSize = 14.000
				_6.TextStrokeTransparency = 0.000
		

				local UserInputService = game:GetService("UserInputService")

				local W1Key = Enum.KeyCode.W
				local A1Key = Enum.KeyCode.A
				local S1Key = Enum.KeyCode.S
				local D1Key = Enum.KeyCode.D
				local E1Key = Enum.KeyCode.LeftControl
				local R1Key = Enum.KeyCode.R
				local SpaceKey = Enum.KeyCode.Space

				UserInputService.InputBegan:Connect(function(input)
					if (input.KeyCode == W1Key) then
						W.Visible = true
						_.Visible = false
					elseif (input.KeyCode == A1Key) then
						A.Visible = true
						_2.Visible = false
					elseif (input.KeyCode == S1Key) then
						S.Visible = true
						_3.Visible = false
					elseif (input.KeyCode == D1Key) then
						D.Visible = true
						_4.Visible = false
					elseif (input.KeyCode == E1Key) then
						E.Visible = true
						_5.Visible = false
					elseif (input.KeyCode == SpaceKey) then
						R.Visible = true
						_6.Visible = false
					end
				end)

				UserInputService.InputEnded:Connect(function(input)
					if (input.KeyCode == W1Key) then
						W.Visible = false
						_.Visible = true
					elseif (input.KeyCode == A1Key) then
						A.Visible = false
						_2.Visible = true
					elseif (input.KeyCode == S1Key) then
						S.Visible = false
						_3.Visible = true
					elseif (input.KeyCode == D1Key) then
						D.Visible = false
						_4.Visible = true
					elseif (input.KeyCode == E1Key) then
						E.Visible = false
						_5.Visible = true	
					elseif (input.KeyCode == SpaceKey) then
						R.Visible = false
						_6.Visible = true
					end
				end)		
				else
				game.CoreGui.keystrokess:Destroy()
				end
				end)

		client:Element("Toggle", "velocity graph", {}, function(tbl)
		if tbl.Toggle then
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local LocalPlayer = Players.LocalPlayer
		local CurrentCamera = workspace.CurrentCamera

		local graphLines = {}
		local standardY = workspace.CurrentCamera.ViewportSize.Y-100
		local oldY = standardY
		local oldVelo = 0

		local VelocityCounter = Drawing.new("Text")
		VelocityCounter.Text = ""
		VelocityCounter.Center = true
		VelocityCounter.Outline = true
		VelocityCounter.Color = Color3.new(1,1,1)
		VelocityCounter.Font = 3
		VelocityCounter.Position = Vector2.new(CurrentCamera.ViewportSize.X/2, CurrentCamera.ViewportSize.Y-90)
		VelocityCounter.Size = 20
		VelocityCounter.Visible = true

		while true do
		RunService.RenderStepped:Wait()

		standardY = CurrentCamera.ViewportSize.Y-100
		VelocityCounter.Position = Vector2.new(CurrentCamera.ViewportSize.X/2,CurrentCamera.ViewportSize.Y-90)

		if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
			if #graphLines >= 1 then
				local max = 100
				
				if #graphLines >= max then
					graphLines[1]:Remove()
					
					local counter = 0

					for i=2,6 do
						counter = counter + 1.8
						graphLines[i].Transparency = 1 - (counter/10)
					end
					
					graphLines[2].Transparency = 0.1
					graphLines[3].Transparency = 0.2
					graphLines[4].Transparency = 0.4
					graphLines[5].Transparency = 0.6
					graphLines[6].Transparency = 0.8
					
					table.remove(graphLines, 1)
				end
				
				for i,v in pairs(graphLines) do
					v.To = v.To - Vector2.new(2,0)
					v.From = v.From - Vector2.new(2,0)
				end
			end
			
			local totalVelo = (LocalPlayer.Character.PrimaryPart.Velocity * Vector3.new(1, 0, 1)).magnitude
			local graphVelocity = totalVelo * 14.85
			--[[
			if graphVelocity > 300 then
				graphVelocity = 300
			end
			--]]
			VelocityCounter.Color = Color3.new(1,1,1)
			
			if math.floor(totalVelo) < oldVelo then
				VelocityCounter.Color = Color3.new(1,0.5,0.3)
			end
			
			if math.floor(totalVelo) > oldVelo then
				VelocityCounter.Color = Color3.new(0.5,1,0.3)
			end
			--[[
			if math.floor(graphVelocity) == 300 then
				VelocityCounter.Color = Color3.new(1,0.3,0.1)
			end
			--]]
			local color = Color3.new(1,1,1)
			
			--color = Color3.fromHSV(tick()%5/5,1,1)

			local line = Drawing.new("Line")
			
			table.insert(graphLines, line)
			
			line.Color = color
			line.Thickness = 2
			line.From = Vector2.new(CurrentCamera.ViewportSize.X/2 + 98, oldY)
			line.To = Vector2.new(CurrentCamera.ViewportSize.X/2 + 100, standardY - (graphVelocity/6.5))
			line.Transparency = 0
			line.Visible = true
			
			if #graphLines >= 8 then
				graphLines[#graphLines-1].Transparency = graphLines[#graphLines-1].Transparency + 0.2
				graphLines[#graphLines-2].Transparency = graphLines[#graphLines-2].Transparency + 0.2
				graphLines[#graphLines-3].Transparency = graphLines[#graphLines-3].Transparency + 0.2
				graphLines[#graphLines-4].Transparency = graphLines[#graphLines-4].Transparency + 0.2
				graphLines[#graphLines-5].Transparency = graphLines[#graphLines-5].Transparency + 0.2
				graphLines[#graphLines-7].Transparency = 1
			end
			
			VelocityCounter.Text = tostring(math.floor(graphVelocity))
			oldY = standardY - (graphVelocity/6.5)
			oldVelo = math.floor(totalVelo)
		end
		end
				else
				VelocityCounter.Visible = false
				graphLines.Visble = false
				print("nigerian test")
				end
				end)			

		local oldgrenadeallowed = Client.grenadeallowed      
		Client.grenadeallowed = function(...)      
			if values.misc.client["buy any grenade"].Toggle then      
				return true      
			end      

			return oldgrenadeallowed(...)      
		end      


		local movement = misc:Sector("movement", "Left")      
		movement:Element("Toggle", "bunny hop")      
		movement:Element("Dropdown", "direction", {options = {"forward", "directional", "directional 2"}})      
		movement:Element("Dropdown", "type", {options = {"gyro", "cframe"}})      
		movement:Element("Slider", "speed", {min = -15, max = 300, default = 40}) 
		movement:Element("ToggleKeybind", "jump bug")      
		movement:Element("ToggleKeybind", "edge jump")      
		movement:Element("ToggleKeybind", "edge bug")    
		movement:Element("ToggleKeybind", "noclip",{},function(tbl)
			spawn(function()
				while values.misc.movement["noclip"].Toggle and values.misc.movement["noclip"].Active do
					game:GetService("RunService").Stepped:Wait()
					if LocalPlayer.Character then
						for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
							if v:IsA("BasePart") then
								v.CanCollide = false
							end
						end
					end
				end
			end)
		end)      

		local chat = misc:Sector("chat", "Left")      
		chat:Element("Toggle", "chat spam", nil, function(tbl)      
			if tbl.Toggle then      
				while values.misc.chat["chat spam"].Toggle do      
					game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(values.misc.chat.type.Dropdown == "Serenity.pub" and "You need Serenity, all hacks losing! You need Serenity, all hacks losing! You need Serenity, all hacks losing! You need Serenity, all hacks losing! You need Serenity, all hacks losing!" or values.misc.chat.type.Dropdown == "Stormy.tech" and "your paste is bad, use Serenity" or values.misc.chat.type.Dropdown == "MOM" and "I FUCKED UR MOM NIGGA I FUCKED UR MOM NIGGA I FUCKED UR MOM NIGGA" or values.misc.chat.type.Dropdown == "SEMI" and "🐀 RATTED BY SEMI  🐀 ❌ DONT FUCK ❌ WITH 👾BLOXSENSE 👾👨‍🦲USERS👨‍🦲", false, "Innocent", false, true) 
					wait(values.misc.chat["speed (ms)"].Slider/1000)      
						
				end      
			end      
		end)      
		chat:Element("Dropdown", "type", {options = {"Serenity.pub", "Stormy.tech", "MOM", "SEMI"}}) 
		chat:Element("Slider", "speed (ms)", {min = 150, max = 1000, default = 500})      
		chat:Element("Toggle", "kill say")      
		chat:Element("TextBox", "message", {placeholder = "message"})      
		chat:Element("Toggle", "no filter")      
		local MX_ONHIT = Instance.new("ScreenGui")
		local OnHitFrame = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local SampleLabel = Instance.new("TextLabel")


		MX_ONHIT.Name = "MX_ONHIT"
		MX_ONHIT.Parent = game.CoreGui
		MX_ONHIT.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		OnHitFrame.Parent = MX_ONHIT
		OnHitFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OnHitFrame.BackgroundTransparency = 1.000
		OnHitFrame.Position = UDim2.new(1, -300, 0, 0)
		OnHitFrame.Size = UDim2.new(0, 300, 0, 500)

		UIListLayout.Parent = OnHitFrame
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		SampleLabel.Name = "SampleLabel"
		SampleLabel.Parent = OnHitFrame
		SampleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SampleLabel.BackgroundTransparency = 1.000
		SampleLabel.BorderSizePixel = 0
		SampleLabel.Size = UDim2.new(1, 0, 0, 18)
		SampleLabel.Font = Enum.Font.SourceSansLight
		SampleLabel.Text = "Hit SamplePlayer in HeadHB "
		SampleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		SampleLabel.TextSize = 16.000
		SampleLabel.TextStrokeTransparency = 0.000
		SampleLabel.TextTransparency = 1.000
		SampleLabel.TextXAlignment = Enum.TextXAlignment.Right

		local function CreateHitElement(text,col)
			spawn(function()
				local Label = SampleLabel:Clone()
				Label.Text = text
				Label.Parent = MX_ONHIT.Frame
				Label.TextTransparency = 0
				Label.TextColor3 = col
				wait(5)
				Label:Destroy()
			end)
		end
		local grenades = misc:Sector("grenades", "Right")      
		grenades:Element("ToggleKeybind", "spam grenades")      
		coroutine.wrap(function()      
			while true do      
				wait(0.5)      
				if values.misc.grenades["spam grenades"].Toggle and values.misc.grenades["spam grenades"].Active then      
					local oh1 = game:GetService("ReplicatedStorage").Weapons[values.misc.grenades.grenade.Dropdown].Model      
					local oh3 = 25      
					local oh4 = 35      
					local oh6 = ""      
					local oh7 = ""      
					game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(oh1, nil, oh3, oh4, Vec3(0,-100,0), oh6, oh7)      
				end      
			end      
		end)()      
		grenades:Element("Dropdown", "grenade", {options = {"Flashbang", "Smoke Grenade", "Molotov", "HE Grenade", "Decoy Grenade"}})      
		grenades:Element("Button", "crash server", {}, function() 
			CreateHitElement("Crashing server..",Color3.new(1,0.5,0.5))
			while true do
				pcall(function()
					game:GetService("RunService").RenderStepped:Wait()
					for i = 1,100,1 do																																																																								
						game:GetService("ReplicatedStorage").Events.DropMag:FireServer(LocalPlayer.Character.Gun.Mag)
					end
				end)
			end   
		end)      
		grenades:Element("ToggleKeybind", "ping exploit", {Type = "Toggle", Key = "T"}, function(tbl)      
			spawn(function()
				while values.misc.grenades["ping exploit"].Toggle and values.misc.grenades["ping exploit"].Active do
				
						pcall(function()
							game:GetService("RunService").RenderStepped:Wait()
							for i = 1,values.misc.grenades["ping limit"].Slider,1 do
								game:GetService("ReplicatedStorage").Events.DropMag:FireServer(LocalPlayer.Character.Gun.Mag)
								for i,v in pairs(workspace["Ray_Ignore"]:GetChildren()) do
									if v.Name == "MagDrop" then
										v:Destroy()
									end
								end
							end
						end)
					
				end 
			end)    
		end)      
		grenades:Element("Slider", "ping limit", {min = 1, max = 4, default = 2})  
		grenades:Element("Toggle", "anti-ping", {}, function(tbl)      
			spawn(function()
				while values.misc.grenades["anti-ping"].Toggle do
					pcall(function()
						game:GetService("RunService").RenderStepped:Wait()
						for i,v in pairs(workspace["Ray_Ignore"]:GetChildren()) do
							if v.Name == "MagDrop" then
								v:Destroy()
							end
						end
					end)
				end 
			end)    
		end) 


		local Dance = INST("Animation")      
		Dance.AnimationId = "rbxassetid://5917459365"      

		local LoadedAnim      

		local animations = misc:Sector("animations", "Right")      
		animations:Element("ToggleKeybind", "enabled", nil, function(tbl)      
			pcall(function()      
				LoadedAnim:Stop()      
			end)      
			if not tbl.Toggle or tbl.Toggle and not tbl.Active then      
			else      
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then      
					LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)      
					LoadedAnim.Priority = Enum.AnimationPriority.Action      
					LoadedAnim:Play()      
				end      
			end      
		end)     
		--136801964 
		animations:Element("Dropdown", "animation", {options = {"Fake swim", "Fake walk", "Fake jump",  "Fake sit", "Default", "Floss", "Dolphin", "Monkey" ,"Around Town", "Baby Dance", "Old Town Road", "Line Dance", "Happy", "Dorky Dance", "Hero Landing", "Jacks"}}, function(tbl)
			Dance.AnimationId = tbl.Dropdown == "Fake swim" and "rbxassetid://63716636630 i" or tbl.Dropdown == "Fake walk" and "rbxassetid://1330180905"  or tbl.Dropdown == "Fake sit" and "rbxassetid://507768133" or tbl.Dropdown == "Fake jump" and "rbxassetid://896586529" or tbl.Dropdown == "Default" and "rbxassetid://3732699835" or tbl.Dropdown == "Floss" and "rbxassetid://5917459365" or tbl.Dropdown == "Fake jump" and "rbxassetid://896586529" or tbl.Dropdown == "Default" and "rbxassetid://3732699835" or tbl.Dropdown == "Dolphin" and "rbxassetid://5918726674" or tbl.Dropdown == "Monkey" and "rbxassetid://3333499508" or tbl.Dropdown == "Around Town" and "rbxassetid://3303391864" or tbl.Dropdown == "Baby Dance" and "rbxassetid://4265725525" or tbl.Dropdown == "Old Town Road" and "rbxassetid://5937560570" or tbl.Dropdown == "Line Dance" and "rbxassetid://4049037604" or tbl.Dropdown == "Happy" and "rbxassetid://4841405708"  or tbl.Dropdown == "Dorky Dance" and "rbxassetid://4212455378" or tbl.Dropdown == "Hero Landing" and "rbxassetid://5104344710" or tbl.Dropdown == "Jacks" and "rbxassetid://3338066331"

			pcall(function()      
				LoadedAnim:Stop()      
			end)      

			if values.misc.animations.enabled.Toggle and values.misc.animations.enabled.Active then      
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then      
					LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)      
					LoadedAnim.Priority = Enum.AnimationPriority.Action      
					LoadedAnim:Play()      
				end      
			end      
		end)      

		local ui = misc:Sector("ui", "Left")      
		ui:Element("Toggle", "scaling")      
		ui:Element("Slider", "amount", {min = 5, max = 11, default = 10})      
		ui:Element("Button","Unload",{},function()
			game:GetService("TeleportService"):Teleport(301549746,game:GetService("Players").LocalPlayer)
		end)
		local RifthookTK = Instance.new("ScreenGui")
		local Main = Instance.new("TextButton")
		local Frame = Instance.new("Frame")
			

		RifthookTK.Name = "RifthookTK"
		RifthookTK.Parent = game.CoreGui
		RifthookTK.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

			
		Main.Size = UDim2.new(0,200,0,40)
		Main.Transparency = 1
		Main.Parent = RifthookTK

		Frame.Parent = Main
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.BorderSizePixel = 2
		Frame.Size = UDim2.new(1,-20,1,-35)
		Frame.Position = UDim2.new(0,10,0,25)
		TeamDamage = false
		ui:Element("Toggle","show team damage",{},function(tbl)
			TeamDamage = tbl.Toggle
			RifthookTK.Enabled = TeamDamage
			spawn(function()
				while TeamDamage do
					pcall(function()
						local UIListLayout = Instance.new("UIListLayout")
						UIListLayout.Parent = Frame
						UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
							if UIListLayout.AbsoluteContentSize.Y == 0 then
								Main.Size = UDim2.new(0,200,0,40)
							else
								Main.Size = UDim2.new(0,200,0,UIListLayout.AbsoluteContentSize.Y+34)
							end
						end)
						wait()
						for i,v in pairs(Frame:GetChildren()) do
							v:Destroy()
						end
						for i,v in pairs(game.Players:GetChildren()) do
							if v.Team == LocalPlayer.Team then
								local Label = Instance.new("TextLabel")
								Label.Name = v.Name
								Label.BackgroundTransparency = 1
								Label.Size = UDim2.new(1, 0, 0, 18)
								if v == LocalPlayer then
									Label.Text = "You | Kills: "..tostring(math.floor(v.TeamKills.value)).." | Damage: "..tostring(math.floor(v.TeamDamage.value))
									Label.TextColor3 = Color3.new(0.3, 1, 0.3)
								else
									Label.Text = v.Name.." | Kills: "..tostring(math.floor(v.TeamKills.value)).." | Damage: "..tostring(math.floor(v.TeamDamage.value))
									Label.TextColor3 = Color3.new(1, 1, 1)
								end
								Label.Parent = Frame
								Label.TextXAlignment = "Left"
								Label.TextStrokeTransparency = 0
							end
						end
					end)
				end
			end)
		end)

		local objects = {}      
		local utility = {}      
		do      
			utility.default = {      
				Line = {      
					Thickness = 1.5,      
					Color = COL3RGB(255, 255, 255),      
					Visible = false      
				},      
				Text = {      
					Size = 13,      
					Center = true,      
					Outline = true,      
					Font = Drawing.Fonts.Plex,      
					Color = COL3RGB(255, 255, 255),      
					Visible = false      
				},      
				Square = {      
					Thickness = 1.5,      
					Filled = false,      
					Color = COL3RGB(255, 255, 255),      
					Visible = false      
				},      
			}      
			function utility.create(type, isOutline)      
				local drawing = Drawing.new(type)      
				for i, v in pairs(utility.default[type]) do      
					drawing[i] = v      
				end      
				if isOutline then      
					drawing.Color = COL3(0,0,0)      
					drawing.Thickness = 3      
				end      
				return drawing      
			end      
			function utility.add(plr)      
				if not objects[plr] then      
					objects[plr] = {      
						Name = utility.create("Text"),      
						Weapon = utility.create("Text"),      
						Armor = utility.create("Text"),      
						BoxOutline = utility.create("Square", true),      
						Box = utility.create("Square"),      
						HealthOutline = utility.create("Line", true),      
						Health = utility.create("Line"),      
					}      
				end      
			end      
			for _,plr in pairs(Players:GetPlayers()) do      
				if Player ~= LocalPlayer then      
					utility.add(plr)      
				end      
			end      
			Players.PlayerAdded:Connect(utility.add)      
			Players.PlayerRemoving:Connect(function(plr)      
				wait()      
				if objects[plr] then      
					for i,v in pairs(objects[plr]) do  
						if type(v) == "userdata" then
							v:Remove()   
						else
							for i2,v2 in pairs(v) do      
								if v then      
									v:Remove()      
								end      
							end   
						end   
					end      

					objects[plr] = nil      
				end      
			end)      
		end      
		local Items = INST("ScreenGui")      
		Items.Name = "Items"      
		Items.Parent = game.CoreGui      
		Items.ResetOnSpawn = false      
		Items.ZIndexBehavior = "Global"      
		do      
			function add(plr)      
				local ImageLabel = INST("ImageLabel")      
				ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255)      
				ImageLabel.BackgroundTransparency = 1.000      
				ImageLabel.Size = UDIM2(0, 62, 0, 25)      
				ImageLabel.Visible = false      
				ImageLabel.Image = "rbxassetid://1784884358"      
				ImageLabel.ScaleType = Enum.ScaleType.Fit      
				ImageLabel.Name = plr.Name      
				ImageLabel.AnchorPoint = Vec2(0.5,0.5)      
				ImageLabel.Parent = Items      
			end      
			for _,plr in pairs(Players:GetPlayers()) do      
				if Player ~= LocalPlayer then      
					add(plr)      
				end      
			end      
			Players.PlayerAdded:Connect(add)      
			Players.PlayerRemoving:Connect(function(plr)      
				wait()      
				Items[plr.Name]:Destroy()      
			end)      
		end      
		local debrisitems = {}      
		workspace.Debris.ChildAdded:Connect(function(obj)      
			if obj:IsA("BasePart") and Weapons:FindFirstChild(obj.Name) then      
				RunService.RenderStepped:Wait()      

				local BillboardGui = INST("BillboardGui")      
				BillboardGui.AlwaysOnTop = true      
				BillboardGui.Size = UDIM2(0, 40, 0, 40)      
				BillboardGui.Adornee = obj      

				local ImageLabel = INST("ImageLabel")      
				ImageLabel.Parent = BillboardGui      
				ImageLabel.BackgroundTransparency = 1      
				ImageLabel.Size = UDIM2(1, 0, 1, 0)      
				ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color      
				ImageLabel.Image = GetIcon.getWeaponOfKiller(obj.Name)      
				ImageLabel.ScaleType = Enum.ScaleType.Fit      
				ImageLabel.Visible = values.visuals.world["item esp"].Toggle and TBLFIND(values.visuals.world["types"].Jumbobox, "icon") and true or false      

				BillboardGui.Parent = obj      
			end      
		end)      
		for _, obj in pairs(workspace.Debris:GetChildren()) do      
			if obj:IsA("BasePart") and Weapons:FindFirstChild(obj.Name) then      
				RunService.RenderStepped:Wait()      

				local BillboardGui = INST("BillboardGui")      
				BillboardGui.AlwaysOnTop = true      
				BillboardGui.Size = UDIM2(0, 40, 0, 40)      
				BillboardGui.Adornee = obj      

				local ImageLabel = INST("ImageLabel")      
				ImageLabel.Parent = BillboardGui      
				ImageLabel.BackgroundTransparency = 1      
				ImageLabel.Size = UDIM2(1, 0, 1, 0)      
				ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color      
				ImageLabel.Image = GetIcon.getWeaponOfKiller(obj.Name)      
				ImageLabel.ScaleType = Enum.ScaleType.Fit      
				ImageLabel.Visible = values.visuals.world["item esp"].Toggle and TBLFIND(values.visuals.world["types"].Jumbobox, "icon") and true or false      

				BillboardGui.Parent = obj      
			end      
		end      
		local function YROTATION(cframe)      
			local x, y, z = cframe:ToOrientation()      
			return CF(cframe.Position) * CFAngles(0,y,0)      
		end      
		local function XYROTATION(cframe)      
			local x, y, z = cframe:ToOrientation()      
			return CF(cframe.Position) * CFAngles(x,y,0)      
		end      
		local weps = {      
			Pistol = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"},      
			SMG = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"},      
			Rifle = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG", "SG"},      
			Sniper = {"AWP", "Scout", "G3SG1"}      
		}      
		local weps2 = {      
			Pistol = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"},      
			SMG = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"},      
			Rifle = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG", "SG"},      
			Sniper = {"AWP", "Scout", "G3SG1"}      
		}      
		local function GetWeaponRage(weapon)      
			return TBLFIND(weps.Pistol, weapon) and "pistol" or TBLFIND(weps.Rifle, weapon) and "rifle" or weapon == "AWP" and "awp" or weapon == "G3SG1"  and "auto" or weapon == "Scout" and "scout" or "default"      
		end      
		local function GetStatsRage(weapon)      
			if weapon == "default" then      
				return values.rage.weapons.default      
			else      
				if values.rage.weapons[weapon]["override default"].Toggle then      
					return values.rage.weapons[weapon]      
				else      
					return values.rage.weapons.default      
				end      
			end      
		end      
		local function GetWeaponLegit(weapon)      
			return TBLFIND(weps2.Pistol, weapon) and "pistol" or TBLFIND(weps2.Rifle, weapon) and "rifle" or TBLFIND(weps2.SMG, weapon) and "smg" or TBLFIND(weps2.Sniper, weapon) and "sniper" or "default"      
		end      
		local function GetStatsLegit(weapon)      
			if weapon == "default" then      
				return values.legit.main.default      
			else      
				if values.legit.main[weapon]["override default"].Toggle then      
					return values.legit.main[weapon]      
				else      
					return values.legit.main.default      
				end      
			end      
		end      
		local Desync = false      
		local Spin = 0      
		local RageTarget      
		local Filter = false      
		local LastStep      
		local TriggerDebounce = false      
		local DisableAA = false      

		local Fov = Drawing.new("Circle")      
		Fov.Filled = true      
		Fov.Color = COL3RGB(15,15,15)      
		Fov.Transparency = 0.5      
		Fov.Position = Vec2(Mouse.X, Mouse.Y + 16)      
		Fov.Radius = 120      
		RunService.RenderStepped:Connect(function(step)     
			Fov.Visible = false      
			LastStep = step      
			Ping = game.Stats.PerformanceStats.Ping:GetValue()      
			RageTarget = nil      
			local CamCFrame = Camera.CFrame      
			local CamLook = CamCFrame.LookVector      
			local PlayerIsAlive = false      
			local Character = LocalPlayer.Character      
			RageTarget = nil      
			Spin = CLAMP(Spin + values.rage.angles["spin speed"].Slider, 0, 20000)      
			if Spin == 20001 then Spin = 0 end      
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and LocalPlayer.Character:FindFirstChild("UpperTorso") then      
				PlayerIsAlive = true      
			end      
			for i,v in pairs(ChamItems) do      
				if v.Parent == nil then      
					TBLREMOVE(ChamItems, i)      
				end      
			end      
			Fov.Position = Vec2(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)      
			if PlayerIsAlive then      
				local SelfVelocity = LocalPlayer.Character.HumanoidRootPart.Velocity      
				if values.rage.fakelag["ping spike"].Toggle and values.rage.fakelag["ping spike"].Active then      
					for count = 1, 20  do      
						game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer({[1] = "createparticle", [2] = "bullethole", [3] = LocalPlayer.Character.Head, [4] = Vec3(0,0,0)})       
					end      
				end      
				local Root = LocalPlayer.Character.HumanoidRootPart      
				if values.misc.client["infinite crouch"].Toggle then      
					Client.crouchcooldown = 0      
				end      
				if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "firerate") then      
					Client.DISABLED = false      
				end      
				if values.exploit.exploits["kill all"].Toggle and values.exploit.exploits["kill all"].Active and LocalPlayer.Character:FindFirstChild("UpperTorso") and LocalPlayer.Character:FindFirstChild("Gun") then      
					for _,Player in pairs(Players:GetPlayers()) do      
						if Player.Character and Player.Team ~= LocalPlayer.Team and Player.Character:FindFirstChild("UpperTorso") then      
							local oh1 = Player.Character.Head      
							local oh2 = Player.Character.Head.CFrame.p      
							local oh3 = Client.gun.Name      
							local oh4 = 4096      
							local oh5 = LocalPlayer.Character.Gun      
							local oh8 = 15      
							local oh9 = false      
							local oh10 = false      
							local oh11 = Vec3(0,0,0)      
							local oh12 = 16868      
							local oh13 = Vec3(0, 0, 0)      
							game:GetService("ReplicatedStorage").Events.HitPart:FireServer(oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9, oh10, oh11, oh12, oh13)      
						end      
					end      
				end      
				if TBLFIND(values.visuals.effects.removals.Jumbobox, "scope lines") then       
					NewScope.Enabled = LocalPlayer.Character:FindFirstChild("AIMING") and true or false      
					Crosshairs.Scope.Visible = false      
				else      
					NewScope.Enabled = false      
				end      
				local RageGuy      
				if workspace:FindFirstChild("Map") and Client.gun ~= "none" and Client.gun.Name ~= "C4" then      
					if values.rage.aimbot.Enabled.Toggle then      
						local Origin = values.rage.aimbot.Origin.Dropdown == "character" and LocalPlayer.Character.LowerTorso.Position + Vec3(0, 2.5, 0) or CamCFrame.p      
						local Stats = GetStatsRage(GetWeaponRage(Client.gun.Name))      
						for _,Player in pairs(Players:GetPlayers()) do      
							if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "firerate") then      
								Client.DISABLED = false      
							end      
							spawn(function()
								if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 and Player.Team ~= "TTT" and Player ~= LocalPlayer then      
									if TBLFIND(values.rage.aimbot.Resolver.Jumbobox, "Pitch") then      
										Player.Character.UpperTorso.Waist.C0 = CFAngles(0, 0, 0)      
										Player.Character.LowerTorso.Root.C0 = CFAngles(0,0,0)
										Player.Character.Head.Neck.C0 = CFrame.new(0,0.0001,0) * CFAngles(0, 0, 0) 
									end      
									if TBLFIND(values.rage.aimbot.Resolver.Jumbobox, "Roll") then      
										Player.Character.Humanoid.MaxSlopeAngle = 0      
									end  
									if TBLFIND(values.rage.aimbot.Resolver.Jumbobox, "Animation") then     
										for i2,Animation in pairs(Player.Character.Humanoid:GetPlayingAnimationTracks()) do
											Animation:Stop()
										end
									end     
								end  
							end)    
							if Player.Character and Player.Character:FindFirstChild("Humanoid") and not Client.DISABLED and Player.Character:FindFirstChild("Humanoid").Health > 0 and Player.Team ~= "TTT" and not Player.Character:FindFirstChildOfClass("ForceField") and GetDeg(CamCFrame, Player.Character.Head.Position) <= Stats["max fov"].Slider and Player ~= LocalPlayer then      
								if Player.Team ~= LocalPlayer.Team or values.rage.aimbot.teammates.Toggle and Player:FindFirstChild("Status") and Player.Status.Team.Value ~= LocalPlayer.Status.Team.Value and Player.Status.Alive.Value then      
									if Client.gun:FindFirstChild("Melee") and values.rage.aimbot["Knifebot"].Toggle then      
										local Ignore = {unpack(Collision)}      
										INSERT(Ignore, workspace.Map.Clips)      
										INSERT(Ignore, workspace.Map.SpawnPoints)      
										INSERT(Ignore, LocalPlayer.Character)      
										INSERT(Ignore, Player.Character.HumanoidRootPart)      
										if Player.Character:FindFirstChild("BackC4") then      
											INSERT(Ignore, Player.Character.BackC4)      
										end      
										if Player.Character:FindFirstChild("Gun") then      
											INSERT(Ignore, Player.Character.Gun)      
										end      

										local Ray = RAY(Origin, (Player.Character.Head.Position - Origin).unit * 20)      
										local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray, Ignore, false, true)      

										if Hit and Hit.Parent == Player.Character then      
											RageGuy = Hit      
											RageTarget = Hit      
											if not values.rage.aimbot["Silent Aim"].Toggle then      
												Camera.CFrame = CF(CamCFrame.Position, Hit.Position)      
											end      
											Filter = true      
											Client.firebullet()      
											Filter = false      

											local Arguments = {      
												[1] = Hit,      
												[2] = Hit.Position,      
												[3] = Client.gun.Name,      
												[4] = 4096,      
												[5] = LocalPlayer.Character.Gun,      
												[8] = 1,      
												[9] = false,      
												[10] = false,      
												[11] = Vec3(),      
												[12] = 16868,      
												[13] = Vec3()      
											}      
											game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))      
										end      
									else      
										local Ignore = {unpack(Collision)}      
										INSERT(Ignore, workspace.Map.Clips)      
										INSERT(Ignore, workspace.Map.SpawnPoints)      
										INSERT(Ignore, LocalPlayer.Character)      
										INSERT(Ignore, Player.Character.HumanoidRootPart)      
										if Player.Character:FindFirstChild("BackC4") then      
											INSERT(Ignore, Player.Character.BackC4)      
										end      
										if Player.Character:FindFirstChild("Gun") then      
											INSERT(Ignore, Player.Character.Gun)      
										end      

										local Hitboxes = {}      
										for _,Hitbox in ipairs(Stats.hitboxes.Jumbobox) do      
											if Stats["prefer body"].Toggle then      
												if Hitbox == "head" and (not values.rage.aimbot["Scale HP"].Toggle or Player.Character:FindFirstChild("FakeHead")) then      
													INSERT(Hitboxes, Player.Character.Head)      
												elseif Hitbox == "torso" then      
													INSERT(Hitboxes, Player.Character.UpperTorso)      
												else      
													INSERT(Hitboxes, Player.Character.LowerTorso)      
												end      
											else      
												if Hitbox == "torso" then      
													INSERT(Hitboxes, Player.Character.UpperTorso)      
												elseif Hitbox == "pelvis" then      
													INSERT(Hitboxes, Player.Character.LowerTorso)      
												elseif not values.rage.aimbot["Scale HP"].Toggle or Player.Character:FindFirstChild("FakeHead") then      
													INSERT(Hitboxes, Player.Character.Head)      
												end      
											end      
										end      

										for _,Hitbox in ipairs(Hitboxes) do      
											local Ignore2 = {unpack(Ignore)}      
											for _,Part in pairs(Player.Character:GetChildren()) do      
												if Part ~= Hitbox then INSERT(Ignore2, Part) end      
											end      
											if values.rage.aimbot["Auto Pen"].Toggle then      
												local Hits = {}      
												local EndHit, Hit, Pos      
												local Penetration = Client.gun.Penetration.Value * 0.01      
												local Ray1 = RAY(Origin, (Hitbox.Position - Origin).unit * (Hitbox.Position - Origin).magnitude)      
												repeat      
													Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore2, false, true)      
													if Hit ~= nil and Hit.Parent ~= nil then      
														if Hit and Multipliers[Hit.Name] ~= nil then      
															EndHit = Hit      
														else      
															INSERT(Ignore2, Hit)      
															INSERT(Hits, {["Position"] = Pos,["Hit"] = Hit})      
														end      
													end      
												until EndHit ~= nil or #Hits >= 4 or Hit == nil      
												if EndHit ~= nil and Multipliers[EndHit.Name] ~= nil and #Hits <= 4 then      
													if #Hits == 0 then      
														local Damage = Client.gun.DMG.Value * Multipliers[EndHit.Name]      
														if Player:FindFirstChild("Kevlar") then      
															if FIND(EndHit.Name, "Head") then      
																if Player:FindFirstChild("Helmet") then      
																	Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value      
																end      
															else      
																Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value      
															end      
														end      
														Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - EndHit.Position).Magnitude/500))/100      
														if Damage >= Stats["minimum damage"].Slider then      
															RageGuy = EndHit      
															RageTarget = EndHit      
															if not values.rage.aimbot["Silent Aim"].Toggle then      
																Camera.CFrame = CF(CamCFrame.Position, EndHit.Position)      
															end      
															Filter = true      
															if values.rage.aimbot["Auto Fire"].Dropdown == "standard" then      
																Client.firebullet()      
																if values.exploit.exploits["Penta Tap"].Toggle and values.exploit.exploits["Penta Tap"].Active then      
																	Client.firebullet()      
																	Client.firebullet()  
																	Client.firebullet()
																	Client.firebullet()
																	Client.firebullet()
																end  
																CreateHitElement("Hit "..EndHit.Parent.Name.." in the "..EndHit.Name,Color3.new(1,1,1)) 
															elseif values.rage.aimbot["Auto Fire"].Dropdown == "hitpart" then      
																Client.firebullet()      
																local Arguments = {      
																	[1] = EndHit,      
																	[2] = EndHit.Position,      
																	[3] = LocalPlayer.Character.EquippedTool.Value,      
																	[4] = 100,      
																	[5] = LocalPlayer.Character.Gun,      
																	[8] = 1,      
																	[9] = false,      
																	[10] = false,      
																	[11] = Vec3(),      
																	[12] = 100,      
																	[13] = Vec3()      
																}      
																game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))   
																if values.exploit.exploits["Penta Tap"].Toggle and values.exploit.exploits["Penta Tap"].Active then      
																	Client.firebullet()      
																	local Arguments = {      
																		[1] = EndHit,      
																		[2] = EndHit.Position,      
																		[3] = LocalPlayer.Character.EquippedTool.Value,      
																		[4] = 100,      
																		[5] = LocalPlayer.Character.Gun,      
																		[8] = 1,      
																		[9] = false,      
																		[10] = false,      
																		[11] = Vec3(),      
																		[12] = 100,      
																		[13] = Vec3()      
																	}      
																	game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))      
																	Client.firebullet()      
																	local Arguments = {      
																		[1] = EndHit,      
																		[2] = EndHit.Position,      
																		[3] = LocalPlayer.Character.EquippedTool.Value,      
																		[4] = 100,      
																		[5] = LocalPlayer.Character.Gun,      
																		[8] = 1,      
																		[9] = false,      
																		[10] = false,      
																		[11] = Vec3(),      
																		[12] = 100,      
																		[13] = Vec3()      
																	}      
																	game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))     
																end      
																CreateHitElement("Hit "..EndHit.Parent.Name.." in the "..EndHit.Name,Color3.new(1,1,1)) 
															end      
															Filter = false      
															break      
														end      
													else      
														local penetration = Client.gun.Penetration.Value * 0.01	      
														local limit = 0      
														local dmgmodifier = 1      
														for i = 1, #Hits do      
															local data = Hits[i]      
															local part = data["Hit"]      
															local pos = data["Position"]      
															local modifier = 1      
															if part.Material == Enum.Material.DiamondPlate then      
																modifier = 0.4      
															end      
															if part.Material == Enum.Material.CorrodedMetal or part.Material == Enum.Material.Metal or part.Material == Enum.Material.Concrete or part.Material == Enum.Material.Brick then      
																modifier = 0.1      
															end      
															if part.Name == "Grate" or part.Material == Enum.Material.Wood or part.Material == Enum.Material.WoodPlanks then      
																modifier = 0.03      
															end      
															if part.Name == "nowallbang" then      
																modifier = 100      
															end      
															if part:FindFirstChild("PartModifier") then      
																modifier = part.PartModifier.Value      
															end      
															if part.Transparency == 1 or part.CanCollide == false or part.Name == "Glass" or part.Name == "Cardboard" then      
																modifier = 0      
															end      
															local direction = (Hitbox.Position - pos).unit * CLAMP(Client.gun.Range.Value, 1, 100)      
															local ray = RAY(pos + direction * 1, direction * -2)      
															local _,endpos = workspace:FindPartOnRayWithWhitelist(ray, {part}, true)      
															local thickness = (endpos - pos).Magnitude      
															thickness = thickness * modifier      
															limit = MIN(penetration, limit + thickness)      
															dmgmodifier = 1 - limit / penetration      
														end      
														local Damage = Client.gun.DMG.Value * Multipliers[EndHit.Name] * dmgmodifier      
														if Player:FindFirstChild("Kevlar") then      
															if FIND(EndHit.Name, "Head") then      
																if Player:FindFirstChild("Helmet") then      
																	Damage = (Damage / 120) * Client.gun.ArmorPenetration.Value      
																end      
															else      
																Damage = (Damage / 120) * Client.gun.ArmorPenetration.Value      
															end      
														end      
														Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - EndHit.Position).Magnitude/500))/100      
														if Damage >= Stats["minimum damage"].Slider then      
															RageGuy = EndHit      
															RageTarget = EndHit      
															if not values.rage.aimbot["Silent Aim"].Toggle then      
																Camera.CFrame = CF(CamCFrame.Position, EndHit.Position)      
															end      
															Filter = true      
															if values.rage.aimbot["Auto Fire"].Dropdown == "standard" then      
																Client.firebullet()      
																Client.firebullet()      
																if values.exploit.exploits["Penta Tap"].Toggle and values.exploit.exploits["Penta Tap"].Active then      
																	Client.firebullet()      
																	Client.firebullet()    
																	Client.firebullet()  
																	Client.firebullet() 
																	Client.firebullet() 

																end  
																CreateHitElement("Hit "..EndHit.Parent.Name.." in the "..EndHit.Name,Color3.new(1,1,1)) 
															elseif values.rage.aimbot["Auto Fire"].Dropdown == "hitpart" then      
																Client.firebullet()      
																local Arguments = {      
																	[1] = EndHit,      
																	[2] = EndHit.Position,      
																	[3] = LocalPlayer.Character.EquippedTool.Value,      
																	[4] = 100,      
																	[5] = LocalPlayer.Character.Gun,      
																	[8] = 1,      
																	[9] = false,      
																	[10] = false,      
																	[11] = Vec3(),      
																	[12] = 100,      
																	[13] = Vec3()      
																}      
																game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments)) 
																Client.firebullet()  
																	local Arguments = {      
																	[1] = EndHit,      
																	[2] = EndHit.Position,      
																	[3] = LocalPlayer.Character.EquippedTool.Value,      
																	[4] = 100,      
																	[5] = LocalPlayer.Character.Gun,      
																	[8] = 1,      
																	[9] = false,      
																	[10] = false,      
																	[11] = Vec3(),      
																	[12] = 100,      
																	[13] = Vec3()      
																}      
																game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))  
																CreateHitElement("Hit "..EndHit.Parent.Name.." in the "..EndHit.Name,Color3.new(1,1,1)) 
																if values.exploit.exploits["Penta Tap"].Toggle and values.exploit.exploits["Penta Tap"].Active then      
																	Client.firebullet()      
																	local Arguments = {      
																		[1] = EndHit,      
																		[2] = EndHit.Position,      
																		[3] = LocalPlayer.Character.EquippedTool.Value,      
																		[4] = 100,      
																		[5] = LocalPlayer.Character.Gun,      
																		[8] = 1,      
																		[9] = false,      
																		[10] = false,      
																		[11] = Vec3(),      
																		[12] = 100,      
																		[13] = Vec3()      
																	}      
																	game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))      
																	Client.firebullet()      
																	local Arguments = {      
																		[1] = EndHit,      
																		[2] = EndHit.Position,      
																		[3] = LocalPlayer.Character.EquippedTool.Value,      
																		[4] = 100,      
																		[5] = LocalPlayer.Character.Gun,      
																		[8] = 1,      
																		[9] = false,      
																		[10] = false,      
																		[11] = Vec3(),      
																		[12] = 100,      
																		[13] = Vec3()      
																	}      
																	game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))      
																end      
															end      
															Filter = false      
															break      
														end      
													end      
												end      
											else      
												local Ray = RAY(Origin, (Hitbox.Position - Origin).unit * (Hitbox.Position - Origin).magnitude)      
												local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray, Ignore2, false, true)      
												if Hit and Multipliers[Hit.Name] ~= nil then      
													local Damage = Client.gun.DMG.Value * Multipliers[Hit.Name]      
													if Player:FindFirstChild("Kevlar") then      
														if FIND(Hit.Name, "Head") then      
															if Player:FindFirstChild("Helmet") then      
																Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value      
															end      
														else      
															Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value      
														end      
													end      
													Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - Hit.Position).Magnitude/500))      
													if Damage >= Stats["minimum damage"].Slider then      
														RageGuy = Hit      
														RageTarget = Hit      
														if not values.rage.aimbot["Silent Aim"].Toggle then      
															Camera.CFrame = CF(CamCFrame.Position, Hit.Position)      
														end      
														Filter = true      
														if values.rage.aimbot["Auto Fire"].Dropdown == "standard" then      
															Client.firebullet()
															Client.firebullet()      
															if values.exploit.exploits["Penta Tap"].Toggle and values.exploit.exploits["Penta Tap"].Active then      
																Client.firebullet()    
																Client.firebullet()   
																Client.firebullet()   
																Client.firebullet() 
																Client.firebullet()  
															end      
															CreateHitElement("Hit "..EndHit.Parent.Name.." in the "..EndHit.Name,Color3.new(1,1,1)) 
														elseif values.rage.aimbot["Auto Fire"].Dropdown == "hitpart" then     
															CreateHitElement("Hit "..EndHit.Parent.Name.." in the "..EndHit.Name,Color3.new(1,1,1))  
															Client.firebullet()      
															Client.firebullet()      
															local Arguments = {      
																[1] = EndHit,      
																[2] = EndHit.Position,      
																[3] = LocalPlayer.Character.EquippedTool.Value,      
																[4] = 100,      
																[5] = LocalPlayer.Character.Gun,      
																[8] = 1,      
																[9] = false,      
																[10] = false,      
																[11] = Vec3(),      
																[12] = 100,      
																[13] = Vec3()      
															}      
															game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments)) 
															Client.firebullet()      
															local Arguments = {      
																[1] = EndHit,      
																[2] = EndHit.Position,      
																[3] = LocalPlayer.Character.EquippedTool.Value,      
																[4] = 100,      
																[5] = LocalPlayer.Character.Gun,      
																[8] = 1,      
																[9] = false,      
																[10] = false,      
																[11] = Vec3(),      
																[12] = 100,      
																[13] = Vec3()      
															}      
															game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))      
															if values.exploit.exploits["Penta Tap"].Toggle and values.exploit.exploits["Penta Tap"].Active then      
																Client.firebullet()      
																local Arguments = {      
																	[1] = EndHit,      
																	[2] = EndHit.Position,      
																	[3] = LocalPlayer.Character.EquippedTool.Value,      
																	[4] = 100,      
																	[5] = LocalPlayer.Character.Gun,      
																	[8] = 1,      
																	[9] = false,      
																	[10] = false,      
																	[11] = Vec3(),      
																	[12] = 100,      
																	[13] = Vec3()      
																}      
																game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))      
																Client.firebullet()      
																local Arguments = {      
																	[1] = EndHit,      
																	[2] = EndHit.Position,      
																	[3] = LocalPlayer.Character.EquippedTool.Value,      
																	[4] = 100,      
																	[5] = LocalPlayer.Character.Gun,      
																	[8] = 1,      
																	[9] = false,      
																	[10] = false,      
																	[11] = Vec3(),      
																	[12] = 100,      
																	[13] = Vec3()      
																}      
																game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))      
															end      
														end      
														Filter = false      
														break      
													end      
												end      
											end      
										end      
									end      
								end      
							end      
						end      
					elseif values.legit.aimbot["aim assist"].Toggle and values.legit.aimbot["aim assist"].Active and not library.uiopen then      
						local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name))      
						local Ignore = {LocalPlayer.Character, Camera, workspace.Map.Clips, workspace.Map.SpawnPoints, workspace.Debris}      
						local Closest = 9999      
						local Target      

						Fov.Radius = Stats["field of view"].Slider      
						Fov.Visible =  values.legit.settings["draw fov"].Toggle      
						Fov.Color =  values.legit.settings["draw fov"].Color      

						if not TBLFIND(Stats.conditions.Jumbobox, "smoke") then      
							INSERT(Ignore, workspace.Ray_Ignore)      
						end      

						if not TBLFIND(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then      
							if not TBLFIND(Stats.conditions.Jumbobox, "standing") or SelfVelocity.Magnitude < 3 then      
								for _,Player in pairs(Players:GetPlayers()) do      
									if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 then      
										if not values.legit.settings["forcefield check"].Toggle or not Player.Character:FindFirstChildOfClass("ForceField") then      
											if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then      
												local Pos, onScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)      
												if onScreen then      
													local Magnitude = (Vec2(Pos.X, Pos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude      
													if Magnitude < Stats["field of view"].Slider then      
														local Hitbox = Stats.hitbox.Dropdown == "head" and Player.Character.Head or Stats.hitbox.Dropdown == "chest" and Player.Character.UpperTorso      
														if Stats.hitbox.Dropdown == "closest" then      
															local HeadPos = Camera:WorldToViewportPoint(Player.Character.Head.Position)      
															local TorsoPos = Camera:WorldToViewportPoint(Player.Character.UpperTorso.Position)      
															local HeadDistance = (Vec2(HeadPos.X, HeadPos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude      
															local TorsoDistance = (Vec2(TorsoPos.X, TorsoPos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude      
															if HeadDistance < TorsoDistance then      
																Hitbox = Player.Character.Head      
															else      
																Hitbox = Player.Character.UpperTorso      
															end      
														end      
														if Hitbox ~= nil then      
															if not TBLFIND(Stats.conditions.Jumbobox, "visible") then      
																Target = Hitbox      
															else      
																local Ray1 = RAY(Camera.CFrame.Position, (Hitbox.Position - Camera.CFrame.Position).unit * (Hitbox.Position - Camera.CFrame.Position).magnitude)      
																local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore, false, true)      
																if Hit and Hit:FindFirstAncestor(Player.Name) then      
																	Target = Hitbox      
																end      
															end      
														end      
													end      
												end      
											end      
										end      
									end      
								end      
							end      
						end      

						if Target ~= nil then      
							local Pos = Camera:WorldToScreenPoint(Target.Position)      
							local Magnitude = Vec2(Pos.X - Mouse.X, Pos.Y - Mouse.Y)      
							mousemoverel(Magnitude.x/Stats.smoothing.Slider, Magnitude.y/Stats.smoothing.Slider)      
						end      
					end      
					if not values.rage.aimbot.Enabled.Toggle and values.legit.aimbot["triggerbot"].Toggle and values.legit.aimbot["triggerbot"].Active and not TriggerDebounce then      
						local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name))      
						if Stats.triggerbot.Toggle then      
							if not TBLFIND(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then      
								if not TBLFIND(Stats.conditions.Jumbobox, "standing") or SelfVelocity.Magnitude < 3 then      
									if Mouse.Target and Mouse.Target.Parent and Players:GetPlayerFromCharacter(Mouse.Target.Parent) and Multipliers[Mouse.Target.Name] ~= nil and Client.gun.DMG.Value * Multipliers[Mouse.Target.Name] >= Stats["minimum dmg"].Slider then      
										local OldTarget = Mouse.Target      
										local Player = Players:GetPlayerFromCharacter(Mouse.Target.Parent)      
										if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then      
											coroutine.wrap(function()      
												TriggerDebounce = true      
												wait(Stats["delay (ms)"].Slider/1000)      
												repeat RunService.RenderStepped:Wait()      
													if not Client.DISABLED then      
														Client.firebullet()      
													end      
												until Mouse.Target == nil or Player ~= Players:GetPlayerFromCharacter(Mouse.Target.Parent)      
												TriggerDebounce = false      
											end)()      
										end      
									end      
								end      
							end      
						end      
					end       
				end      
				BodyVelocity:Destroy()      
				BodyVelocity = INST("BodyVelocity")      
				BodyVelocity.MaxForce = Vec3(HUGE,0,HUGE)      
				if UserInputService:IsKeyDown("Space") and values.misc.movement["bunny hop"].Toggle then      
					local add = 0      
					if values.misc.movement.direction.Dropdown == "directional" or values.misc.movement.direction.Dropdown == "directional 2" then      
						if UserInputService:IsKeyDown("A") then add = 90 end      
						if UserInputService:IsKeyDown("S") then add = 180 end      
						if UserInputService:IsKeyDown("D") then add = 270 end      
						if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("W") then add = 45 end      
						if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("W") then add = 315 end      
						if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("S") then add = 225 end      
						if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("S") then add = 145 end      
					end      
					local rot = YROTATION(CamCFrame) * CFAngles(0,RAD(add),0)      
					BodyVelocity.Parent = LocalPlayer.Character.UpperTorso      
					LocalPlayer.Character.Humanoid.Jump = true      
					BodyVelocity.Velocity = Vec3(rot.LookVector.X,0,rot.LookVector.Z) * (values.misc.movement["speed"].Slider * 2)      
					if add == 0 and values.misc.movement.direction.Dropdown == "directional" and not UserInputService:IsKeyDown("W") then      
						BodyVelocity:Destroy()      
					else      
						if values.misc.movement.type.Dropdown == "cframe" then      
							BodyVelocity:Destroy()      
							Root.CFrame = Root.CFrame + Vec3(rot.LookVector.X,0,rot.LookVector.Z) * values.misc.movement["speed"].Slider/50      
						end      
					end      
				end      
				if values.misc.movement["edge jump"].Toggle and values.misc.movement["edge jump"].Active then      
					if LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then      
						coroutine.wrap(function()      
							RunService.RenderStepped:Wait()      
							if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then      
								LocalPlayer.Character.Humanoid:ChangeState("Jumping")      
							end      
						end)()      
					end      
				end      
				Desync = not Desync      
				LocalPlayer.Character.Humanoid.AutoRotate = false      
				if values.rage.angles.enabled.Toggle and not DisableAA then      
					local Angle = -ATAN2(CamLook.Z, CamLook.X) + RAD(-90)      
					if values.rage.angles["yaw base"].Dropdown == "spin" then   
						if Angle > -5 then
							   LagTick = 16000^16000 and Angle + math.random(-5, 5) -- This is essentially where the "static" happens
							   --16000 is the max ServerTicks that can happen in a single clientside update.
                        end
					end      
					if values.rage.angles["yaw base"].Dropdown == "random" then      
						Angle = Angle + 90
						if Angle > 89 then
							Angle = 0
						end
					end      
					local Offset = RAD(-values.rage.angles["yaw offset"].Slider - (values.rage.angles.Desync.Toggle and Desync and values.rage.angles["Desync Range"].Slider or 0))      
					local CFramePos = CF(Root.Position) * CFAngles(0, Angle + Offset, 0)      
					if values.rage.angles["yaw base"].Dropdown == "targets" then      
						local part      
						local closest = 9999      
						for _,plr in pairs(Players:GetPlayers()) do      
							if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("Humanoid").Health > 0 and plr.Team ~= LocalPlayer.Team then      
								local pos, onScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)      
								local magnitude = (Vec2(pos.X, pos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude      
								if closest > magnitude then      
									part = plr.Character.HumanoidRootPart      
									closest = magnitude      
								end      
							end      
						end      
						if part ~= nil then      
							CFramePos = CF(Root.Position, part.Position) * CFAngles(0, Offset, 0)      
						end      
					end      

					
					Root.CFrame = YROTATION(CFramePos) 
					if values.rage.angles["body roll"].Dropdown == "180" then 
						Root.CFrame = Root.CFrame * CFAngles(values.rage.angles["body roll"].Dropdown == "180" and RAD(-values.rage.angles["body roll offset"].Slider or 0) or 0, 1, 0)  
						LocalPlayer.Character.Humanoid.HipHeight = values.rage.angles["high pos"].Slider or 1
					else 
						LocalPlayer.Character.Humanoid.HipHeight = values.rage.angles["high pos"].Slider or 1
					end
					
					Root.CFrame = YROTATION(CFramePos) 
					if values.rage.angles["body roll"].Dropdown == "360" then 
						Root.CFrame = Root.CFrame * CFAngles(values.rage.angles["body roll"].Dropdown == "360" and RAD(-values.rage.angles["body roll offset"].Slider or 0) or 0, 1, 0)  
						LocalPlayer.Character.Humanoid.HipHeight = values.rage.angles["high pos"].Slider or 1
					else 
						LocalPlayer.Character.Humanoid.HipHeight = values.rage.angles["high pos"].Slider or 1
					end
		
		
					if values.rage.angles["underground aa"].Toggle == true and underground == false then
						LocalPlayer.Character.LowerTorso.Root.C0 = LocalPlayer.Character.LowerTorso.Root.C0 * CFrame.Angles(0, 0, 0) * CFrame.new(0, values.rage.angles["underground pos"].Slider, 0)
						underground = true
					end

					local Pitch = values.rage.angles["pitch"].Dropdown == "Sus_down" and -3 
					or values.rage.angles["pitch"].Dropdown == "None" and CamLook.Y -180
					or values.rage.angles["pitch"].Dropdown == "Stormy.tech" and (-1 + -95) 
					or values.rage.angles["pitch"].Dropdown == "gay" and RANDOM(-30 + 1000)
					or values.rage.angles["pitch"].Dropdown == "Dynamic" and CamLook.Y-55
					or values.rage.angles["pitch"].Dropdown == "Up" and 1 
					or values.rage.angles["pitch"].Dropdown == "Down" and -1.3 
					or values.rage.angles["pitch"].Dropdown == "Zero" and 0 
					or values.rage.angles["pitch"].Dropdown == "Random AA" and RANDOM(-99999999, 100)/100 
					or values.rage.angles["pitch"].Dropdown == "Huge" and math.huge 
					or values.rage.angles["pitch"].Dropdown == "Custom" and values.rage.angles["pitch angle"].Slider or 2.5 
					or values.rage.angles["pitch"].Dropdown == "wtf" and RANDOM(6969696969696969696969696969696969669696969696696969696969696696969696969696969696969696, 2931)/420 
					or values.rage.angles["pitch"].Dropdown == "glitch" and CamLook.Y +2.5 and CamLook.Z -50 and CamLook.X + LagTick
					or values.rage.angles["pitch"].Dropdown == "God" and CamLook.X - RANDOM(-0.3, 0.3)
					or values.rage.angles["pitch"].Dropdown == "fucker" and -13 
					or values.rage.angles["pitch"].Dropdown == "sussy" and math.huge -1/0 -5  
					if values.rage.angles["extend pitch"].Toggle and (values.rage.angles["pitch"].Dropdown == "up" or values.rage.angles["pitch"].Dropdown == "down" or values.rage.angles["pitch"].Dropdown == "negative" or values.rage.angles["pitch"].Dropdown == "glitch" or values.rage.angles["pitch"].Dropdown == "Sus_down" or values.rage.angles["pitch"].Dropdown == "180" or values.rage.angles ["pitch"].Dropdown == "fucker") then 
						Pitch = (Pitch*2)/1.6 
					end      
					game.ReplicatedStorage.Events.ControlTurn:FireServer(Pitch, LocalPlayer.Character:FindFirstChild("Climbing") and true or false)      
				else      
					LocalPlayer.Character.Humanoid.HipHeight = 2      
					Root.CFrame = CF(Root.Position) * CFAngles(0, -ATAN2(CamLook.Z, CamLook.X) + RAD(270), 0)      
					game.ReplicatedStorage.Events.ControlTurn:FireServer(CamLook.Y, LocalPlayer.Character:FindFirstChild("Climbing") and true or false)      
				end      
				if values.rage.others["remove head"].Toggle then      
					if LocalPlayer.Character:FindFirstChild("FakeHead") then      
						LocalPlayer.Character.FakeHead:Destroy()      
					end      
					if LocalPlayer.Character:FindFirstChild("HeadHB") then      
						LocalPlayer.Character.HeadHB:Destroy()      
					end      
				end      
				if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "recoil") then      
					Client.resetaccuracy()      
					Client.RecoilX = 0      
					Client.RecoilY = 0      
				end  
			else
				underground = false    
			end      
			for _,Player in pairs(Players:GetPlayers()) do      
				if Player.Character and Player ~= LocalPlayer and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("OldPosition") then      
					coroutine.wrap(function()      
						local Position = Player.Character.HumanoidRootPart.Position      
						RunService.RenderStepped:Wait()      
						if Player.Character and Player ~= LocalPlayer and Player.Character:FindFirstChild("HumanoidRootPart") then      
							if Player.Character.HumanoidRootPart:FindFirstChild("OldPosition") then      
								Player.Character.HumanoidRootPart.OldPosition.Value = Position      
							else      
								local Value = INST("Vector3Value")      
								Value.Name = "OldPosition"      
								Value.Value = Position      
								Value.Parent = Player.Character.HumanoidRootPart      
							end      
						end      
					end)()      
				end      
			end      
			for _,Player in pairs(Players:GetPlayers()) do      
				local tbl = objects[Player]      
				if tbl == nil then return end      
				if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Team ~= "TTT" and (Player.Team ~= LocalPlayer.Team or values.visuals.players.teammates.Toggle) and Player.Character:FindFirstChild("Gun") and Player.Character:FindFirstChild("Humanoid") and Player ~= LocalPlayer then      
					local HumanoidRootPart = Player.Character.HumanoidRootPart      
					local RootPosition = HumanoidRootPart.Position      
					local Pos, OnScreen = Camera:WorldToViewportPoint(RootPosition)      
					local Size = (Camera:WorldToViewportPoint(RootPosition - Vec3(0, 3, 0)).Y - Camera:WorldToViewportPoint(RootPosition + Vec3(0, 2.6, 0)).Y) / 2      

					local Drawings, Text = TBLFIND(values.visuals.players.outlines.Jumbobox, "drawings") ~= nil, TBLFIND(values.visuals.players.outlines.Jumbobox, "text") ~= nil      

					tbl.Box.Color = values.visuals.players.box.Color      
					tbl.Box.Size = Vec2(Size * 1.5, Size * 1.9)      
					tbl.Box.Position = Vec2(Pos.X - Size*1.5 / 2, (Pos.Y - Size*1.6 / 2))      

					if values.visuals.players.box.Toggle then      
						tbl.Box.Visible = OnScreen      
						if Drawings then      
							tbl.BoxOutline.Size = tbl.Box.Size      
							tbl.BoxOutline.Position = tbl.Box.Position      
							tbl.BoxOutline.Visible = OnScreen      
						else      
							tbl.BoxOutline.Visible = false      
						end      
					else      
						tbl.Box.Visible = false      
						tbl.BoxOutline.Visible = false      
					end      

					if values.visuals.players.health.Toggle then      
						tbl.Health.Color = COL3(0,1,0)      
						tbl.Health.From = Vec2((tbl.Box.Position.X - 5), tbl.Box.Position.Y + tbl.Box.Size.Y)      
						tbl.Health.To = Vec2(tbl.Health.From.X, tbl.Health.From.Y - CLAMP(Player.Character.Humanoid.Health / Player.Character.Humanoid.MaxHealth, 0, 1) * tbl.Box.Size.Y)      
						tbl.Health.Visible = OnScreen      
						if Drawings then      
							tbl.HealthOutline.From = Vec2(tbl.Health.From.X, tbl.Box.Position.Y + tbl.Box.Size.Y + 1)      
							tbl.HealthOutline.To = Vec2(tbl.Health.From.X, (tbl.Health.From.Y - 1 * tbl.Box.Size.Y) -1)      
							tbl.HealthOutline.Visible = OnScreen      
						else      
							tbl.HealthOutline.Visible = false      
						end      
					else      
						tbl.Health.Visible = false      
						tbl.HealthOutline.Visible = false      
					end      

					if values.visuals.players.weapon.Toggle then      
						tbl.Weapon.Color = values.visuals.players.weapon.Color      
						tbl.Weapon.Text = Player.Character.EquippedTool.Value      
						tbl.Weapon.Position = Vec2(tbl.Box.Size.X/2 + tbl.Box.Position.X, tbl.Box.Size.Y + tbl.Box.Position.Y + 1)      
						tbl.Weapon.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]      
						tbl.Weapon.Outline = Text      
						tbl.Weapon.Size = values.visuals.players.size.Slider      
						tbl.Weapon.Visible = OnScreen      
					else      
						tbl.Weapon.Visible = false      
					end      

					if values.visuals.players["weapon icon"].Toggle then      
						Items[Player.Name].ImageColor3 = values.visuals.players["weapon icon"].Color      
						Items[Player.Name].Image = GetIcon.getWeaponOfKiller(Player.Character.EquippedTool.Value)      
						Items[Player.Name].Position = UDIM2(0, tbl.Box.Size.X/2 + tbl.Box.Position.X, 0, tbl.Box.Size.Y + tbl.Box.Position.Y + (values.visuals.players.weapon.Toggle and -10 or -22))      
						Items[Player.Name].Visible = OnScreen      
					else      
						Items[Player.Name].Visible = false      
					end      

					if values.visuals.players.name.Toggle then      
						tbl.Name.Color = values.visuals.players.name.Color      
						tbl.Name.Text = Player.Name      
						tbl.Name.Position = Vec2(tbl.Box.Size.X/2 + tbl.Box.Position.X,  tbl.Box.Position.Y - 16)      
						tbl.Name.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]      
						tbl.Name.Outline = Text      
						tbl.Name.Size = values.visuals.players.size.Slider      
						tbl.Name.Visible = OnScreen      
					else      
						tbl.Name.Visible = false      
					end      
					local LastInfoPos = tbl.Box.Position.Y - 1      
					if TBLFIND(values.visuals.players.indicators.Jumbobox, "armor") and Player:FindFirstChild("Kevlar") then      
						tbl.Armor.Color = COL3RGB(0, 150, 255)      
						tbl.Armor.Text = Player:FindFirstChild("Helmet") and "HK" or "K"      
						tbl.Armor.Position = Vec2(tbl.Box.Size.X + tbl.Box.Position.X + 12, LastInfoPos)      
						tbl.Armor.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]      
						tbl.Armor.Outline = Text      
						tbl.Armor.Size = values.visuals.players.size.Slider      
						tbl.Armor.Visible = OnScreen      

						LastInfoPos = LastInfoPos + values.visuals.players.size.Slider      
					else      
						tbl.Armor.Visible = false      
					end      
				else      
					if Player.Name ~= LocalPlayer.Name then      
						Items[Player.Name].Visible = false      
						for i,v in pairs(tbl) do      
							v.Visible = false      
						end      
					end      
				end      
			end      

			if (values.misc.ui.scaling.Toggle) then      
				gui:SetScale(values.misc.ui.amount.Slider / 10)      
			else      
				gui:SetScale(1)      
			end      
		end)      

		local mt = getrawmetatable(game)      
		local oldNamecall = mt.__namecall      
		local oldIndex = mt.__index      
		local oldNewIndex = mt.__newindex      
		setreadonly(mt,false)      
		mt.__namecall = function(self, ...)      
			local method = tostring(getnamecallmethod())      
			local args = {...}      

			if method == "SetPrimaryPartCFrame" and self.Name == "Arms" then      
				if values.visuals.self["third person"].Toggle and values.visuals.self["third person"].Active and LocalPlayer.Character then      
					args[1] = args[1] * CF(99, 99, 99)      
				else      
					if values.visuals.self["viewmodel changer"].Toggle then      
						args[1] = args[1] * ViewmodelOffset      
					end      
				end      
			end      
			if method == "SetPrimaryPartCFrame" and self.Name ~= "Arms" then      
				args[1] = args[1] + Vec3(0, 3, 0)      
				coroutine.wrap(function()      
					DisableAA = true      
					wait(2)      
					DisableAA = false      
				end)()      
			end      
			if method == "Kick" then      
				return      
			end      
			if method == "FireServer" then      
				if LEN(self.Name) == 38 then      
					return      
				elseif self.Name == "FallDamage" and TBLFIND(values.misc.client["damage bypass"].Jumbobox, "fall") or values.misc.movement["jump bug"].Toggle and values.misc.movement["jump bug"].Active then      
					return      
				elseif self.Name == "BURNME" and TBLFIND(values.misc.client["damage bypass"].Jumbobox, "fire") then      
					return      
				elseif self.Name == "ControlTurn" and not checkcaller() then      
					return      
				end      
				if self.Name == "PlayerChatted" and values.misc.client["chat alive"].Toggle then      
					args[2] = false      
					args[3] = "Innocent"      
					args[4] = false      
					args[5] = false      
				end      
				if self.Name == "ReplicateCamera" and values.misc.client["anti spectate"].Toggle then      
					args[1] = CF()      
				end      
				if self.Name == "ReplicateCamera" and values.misc.client["upside down spectate"].Toggle then      
					args[1] =  args[1] * CFrame.Angles(0,0,math.rad(180))      
				end      
				
			end      
			if method == "FindPartOnRayWithWhitelist" and not checkcaller() and Client.gun ~= "none" and Client.gun.Name ~= "C4" then      
				if #args[2] == 1 and args[2][1].Name == "SpawnPoints" then      
					local Team = LocalPlayer.Status.Team.Value      

					if TBLFIND(values.misc.client.shop.Jumbobox, "anywhere") then      
						return Team == "T" and args[2][1].BuyArea or args[2][1].BuyArea2      
					end      
				end      
			end      
			if method == "FindPartOnRayWithIgnoreList" and args[2][1] == workspace.Debris then      
				if not checkcaller() or Filter then      
					if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "penetration") then      
						INSERT(args[2], workspace.Map)      
					end      
					if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "spread") then      
						args[1] = RAY(Camera.CFrame.p, Camera.CFrame.LookVector * Client.gun.Range.Value)      
					end      
					local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name))      
					if values.legit.aimbot["silent aim"].Toggle and values.legit.aimbot["silent aim"].Active and Stats["silent aim"].Toggle then      
						local Ignore = {LocalPlayer.Character, Camera, workspace.Map.Clips, workspace.Map.SpawnPoints, workspace.Debris}      
						local Closest = 9999      
						local Target      

						if not TBLFIND(Stats.conditions.Jumbobox, "smoke") then      
							INSERT(Ignore, workspace.Ray_Ignore)      
						end      

						coroutine.wrap(function()      
							if not TBLFIND(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then      
								if not TBLFIND(Stats.conditions.Jumbobox, "blind") or SelfVelocity.Magnitude < 3 then      
									for _,Player in pairs(Players:GetPlayers()) do      
										if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 then      
											if not values.legit.settings["forcefield check"].Toggle or not Player.Character:FindFirstChildOfClass("ForceField") then      
												if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then      
													local Pos, onScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)      
													if onScreen then      
														local Magnitude = (Vec2(Pos.X, Pos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude      
														if Magnitude < Stats["field of view"].Slider then      
															local Hitbox = Stats.priority.Dropdown == "head" and Player.Character.Head or Stats.priority.Dropdown == "chest" and Player.Character.UpperTorso      
															if Stats.priority.Dropdown == "closest" then      
																local HeadPos = Camera:WorldToViewportPoint(Player.Character.Head.Position)      
																local TorsoPos = Camera:WorldToViewportPoint(Player.Character.UpperTorso.Position)      
																local HeadDistance = (Vec2(HeadPos.X, HeadPos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude      
																local TorsoDistance = (Vec2(TorsoPos.X, TorsoPos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude      
																if HeadDistance < TorsoDistance then      
																	Hitbox = Player.Character.Head      
																else      
																	Hitbox = Player.Character.UpperTorso      
																end      
															end      
															if Hitbox ~= nil then      
																if not TBLFIND(Stats.conditions.Jumbobox, "visible") then      
																	Target = Hitbox      
																else      
																	local Ray1 = RAY(Camera.CFrame.Position, (Hitbox.Position - Camera.CFrame.Position).unit * (Hitbox.Position - Camera.CFrame.Position).magnitude)      
																	local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore, false, true)      
																	if Hit and Hit:FindFirstAncestor(Player.Name) then      
																		Target = Hitbox      
																	end      
																end      
															end      
														end      
													end      
												end      
											end      
										end      
									end      
								end      
							end      

							local Hit = RANDOM(1, 100) <= Stats.hitchance.Slider      
							if Target ~= nil and Hit then      
								args[1] = RAY(Camera.CFrame.Position, (Target.Position - Camera.CFrame.Position).unit * (Target.Position - Camera.CFrame.Position).magnitude)      
							end      
						end)()      
					end      
					if RageTarget ~= nil then      
						local Origin = values.rage.aimbot.Origin.Dropdown == "character" and LocalPlayer.Character.LowerTorso.Position + Vec3(0, 2.5, 0) or Camera.CFrame.p      
						if values.rage.aimbot["Refine Shot"].Toggle then      
							spawn(function()      
								args[1] = RAY(Origin, (RageTarget.Position - Origin).unit * (RageTarget.Position - Origin).magnitude)      
							end)      
						else      
							args[1] = RAY(Origin, (RageTarget.Position - Origin).unit * (RageTarget.Position - Origin).magnitude)      
						end      
					end      
				end      
			end      
			if method == "InvokeServer" then      
				if self.Name == "Moolah" then      
					return      
				elseif self.Name == "Hugh" then      
					return      
				elseif self.Name == "Filter" and values.misc.chat["no filter"].Toggle then      
					return args[1]      
				end      
			end      
			if method == "LoadAnimation" and self.Name == "Humanoid" then      
				if values.rage.others["leg movement"].Dropdown == "slide" then      
					if FIND(args[1].Name, "Run") or FIND(args[1].Name, "Jump") then 
						args[1] = FakeAnim
					end
				end      
				if values.rage.others["no animations"].Toggle then      
					args[1] = FakeAnim      
				end      
			end      
			if method == "FireServer" and self.Name == "HitPart" then
				if values.visuals.world["bullet tracers"].Toggle then   
					if values.visuals.world["bullet tracers type"].Dropdown == "Normal" then   
						coroutine.wrap(function()      
							beam = INST("Part")      
							beam.Anchored = true      
							beam.CanCollide = false      
							beam.Material = "ForceField"  
							beam.Color = values.visuals.world["bullet tracers"].Color      
							beam.Size = Vec3(0.1, 0.1, (Camera.CFrame.Position - args[2]).Magnitude)      
							beam.CFrame = CF(Camera.CFrame.Position, args[2]) * CF(0, 0, -beam.Size.Z / 2)      
							beam.Parent = workspace.Debris      
							library:Tween(beam, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})      
							wait(3)      
							beam:Destroy()      
						end)()   
					else
						coroutine.wrap(function()
							pcall(function()
								local Line = Drawing3d:New3DLine()
								Line.Visible = true
								Line.ZIndex = 3
								Line.Transparency = 1
								Line.Color = values.visuals.world["bullet tracers"].Color    
								Line.Thickness = 1
								Line.From = Camera.CFrame.Position
								Line.To = args[2]
								wait(3)

								Line:Remove()
							end)
						end)()
					end
				end   
				
				if values.rage.aimbot["Hitbox Manipulation"].Toggle then      
					args[1] = RageTarget      
					args[2] = RageTarget.Position      
				end      
				if values.rage.aimbot["Prediction Modes"].Dropdown ~= "off" and RageTarget ~= nil then
					coroutine.wrap(function()
						if Players:GetPlayerFromCharacter(args[1].Parent) or args[1] == RageTarget then
							if values.rage.aimbot["Prediction Modes"].Dropdown == "cframe" then
								if Players:GetPlayerFromCharacter(args[1].Parent) or args[1] == RageTarget then 
									local hrp = RageTarget.Parent.HumanoidRootPart.Position 
									local oldHrp = RageTarget.Parent.HumanoidRootPart.OldPosition.Value 
				
									local vel = (Vec3(hrp.X, 0, hrp.Z) - Vec3(oldHrp.X, 0, oldHrp.Z)) / LastStep 
									local dir = Vec3(vel.X / vel.magnitude, 0, vel.Z / vel.magnitude) 
				
									
									args[2] = args[2] + dir * (Ping / (POW(Ping, 1.5)) * (dir / (dir / 2))) 
									args[4] = 0 
									args[12] = args[12] - 500 
								end
							else
								local Velocity = RageTarget.Parent.HumanoidRootPart.Velocity
								local Direction = Vector3.new(Velocity.X/Velocity.magnitude, 0, Velocity.Z/Velocity.magnitude)
								if Velocity.magnitude >= 8 then
									args[2] = args[2] + Direction * (Velocity.magnitude*(Ping/1000) * (Ping > 200 and 1.5 or 2))
									args[4] = 0
									args[12] = args[12] - 500
								end
							end
						end
					end)()
				end
				if (values.rage.aimbot["Last Position"].Toggle and RageTarget ~= nil) then      
					coroutine.wrap(function()      
						if Players:GetPlayerFromCharacter(args[1].Parent) or args[1] == RageTarget then      
							local hrp = RageTarget.Parent.HumanoidRootPart.Position      
							local oldHrp = RageTarget.Parent.HumanoidRootPart.OldPosition.Value      

							local vel = (Vec3(hrp.X, 0, hrp.Z) - Vec3(oldHrp.X, 0, oldHrp.Z)) / LastStep      
							local dir = Vec3(vel.X / vel.magnitude, 0, vel.Z / vel.magnitude)      

								
							args[2] = args[2] + dir * (Ping / (POW(Ping, 1.5)) * (dir / (dir / 2)))      
							args[4] = 0      
							args[12] = args[12] - 500      
						end      
					end)()      
				end      
						
				if values.visuals.world["impacts"].Toggle then      
					coroutine.wrap(function()      
						local hit = INST("Part")      
						hit.Transparency = 1      
						hit.Anchored = true      
						hit.CanCollide = false      
						hit.Size = Vec3(0.3,0.3,0.3)      
						hit.Position = args[2]      
						local selection = INST("SelectionBox")      
						selection.LineThickness = 0      
						selection.SurfaceTransparency = 0.5      
						selection.Color3 = values.visuals.world["impacts"].Color      
						selection.SurfaceColor3 = values.visuals.world["impacts"].Color      
						selection.Parent = hit      
						selection.Adornee = hit      
						hit.Parent = workspace.Debris      
						wait(5.9)      
						library:Tween(selection, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {SurfaceTransparency = 1})      
						hit:Destroy()      
					end)()      
					if values.visuals.world["hit chams"].Toggle then      
						coroutine.wrap(function()      
							if Players:GetPlayerFromCharacter(args[1].Parent) and Players:GetPlayerFromCharacter(args[1].Parent).Team ~= LocalPlayer.Team then      
								for _,hitbox in pairs(args[1].Parent:GetChildren()) do      
									if hitbox:IsA("BasePart") or hitbox.Name == "Head" then      
										coroutine.wrap(function()      
											local part = INST("Part")      
											part.CFrame = hitbox.CFrame      
											part.Anchored = true      
											part.CanCollide = false      
											part.Material = Enum.Material.ForceField      
											part.Color = values.visuals.world["hit chams"].Color      
											part.Size = hitbox.Size      
											part.Parent = workspace.Debris      
											library:Tween(part, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})      
											wait(2)      
											part:Destroy()      
										end)()      
									end      
								end      
							end      
						end)()      
					end      
				end      
			end      

			return oldNamecall(self, unpack(args))      
		end      
		local oldIndex
		oldIndex = hookmetamethod(game,"__index",function(self, key)      
			local CallingScript = getcallingscript()      

			if not checkcaller() and self == Viewmodels and LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("UpperTorso") then      
				local WeaponName = GSUB(key, "v_", "")      
				if not FIND(WeaponName, "Arms") then      
					if Weapons[WeaponName]:FindFirstChild("Melee") and values.skins.knife["knife changer"].Toggle then      
						if Viewmodels:FindFirstChild("v_"..values.skins.knife.model.Scroll) then      
							return Viewmodels:FindFirstChild("v_"..values.skins.knife.model.Scroll)      
						else      
							local Clone = Models.Knives[values.skins.knife.model.Scroll]:Clone()      
							return Clone      
						end      
					end      
				end      
			end      
			if key == "Value" then      
				if self.Name == "Auto" and TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "automatic") then      
					return true      
				elseif self.Name == "ReloadTime" and TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "reload") then      
					return 0.001      
				elseif self.Name == "EquipTime" and TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "equip") then      
					return 0.001      
				elseif self.Name == "BuyTime" and TBLFIND(values.misc.client.shop.Jumbobox, "inf time") then      
					return 5      
				end      
			end      

			return oldIndex(self, key)      
		end)      

		if LocalPlayer.PlayerGui:FindFirstChild("Performance") then
			local perf__ = LocalPlayer.PlayerGui.Performance.Perf      
		end

		mt.__newindex = function(self, i, v)      
			if self:IsA("Humanoid") and i == "JumpPower" and not checkcaller() then      
				if values.misc.movement["jump bug"].Toggle and values.misc.movement["jump bug"].Active then      
					v = 24      
				end      
				if values.misc.movement["edge bug"].Toggle and values.misc.movement["edge bug"].Active then      
					v = 0      
				end      
			elseif self:IsA("Humanoid") and i == "CameraOffset" then      
				if values.rage.angles.enabled.Toggle and (values.rage.angles["body roll"].Dropdown == "180" or values.rage.angles["body roll"].Dropdown == "spin") and not DisableAA then      
					v = v + Vec3(0, -3.5, 0)      
				end      
			end      

			return oldNewIndex(self, i, v)      
		end      
		Crosshairs.Scope:GetPropertyChangedSignal("Visible"):Connect(function(current)      
			if not TBLFIND(values.visuals.effects.removals.Jumbobox, "scope lines") then return end      

			if current ~= false then      
				Crosshairs.Scope.Visible = false      
			end      
		end)      
		Crosshair:GetPropertyChangedSignal("Visible"):Connect(function(current)      
			if not LocalPlayer.Character then return end      
			if not values.visuals.effects["force crosshair"].Toggle then return end      
			if LocalPlayer.Character:FindFirstChild("AIMING") then return end      

			Crosshair.Visible = true      
		end)      

		LocalPlayer.Additionals.TotalDamage:GetPropertyChangedSignal("Value"):Connect(function(current)      
			if current == 0 then return end      
			coroutine.wrap(function()      
				if values.misc.client.hitmarker.Toggle then      
					local Line = Drawing.new("Line")      
					local Line2 = Drawing.new("Line")      
					local Line3 = Drawing.new("Line")      
					local Line4 = Drawing.new("Line")      

					local x, y = Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2      

					Line.From = Vec2(x + 4, y + 4)      
					Line.To = Vec2(x + 10, y + 10)      
					Line.Color = values.misc.client.hitmarker.Color      
					Line.Visible = true       

					Line2.From = Vec2(x + 4, y - 4)      
					Line2.To = Vec2(x + 10, y - 10)      
					Line2.Color = values.misc.client.hitmarker.Color      
					Line2.Visible = true       

					Line3.From = Vec2(x - 4, y - 4)      
					Line3.To = Vec2(x - 10, y - 10)      
					Line3.Color = values.misc.client.hitmarker.Color      
					Line3.Visible = true       

					Line4.From = Vec2(x - 4, y + 4)      
					Line4.To = Vec2(x - 10, y + 10)      
					Line4.Color = values.misc.client.hitmarker.Color      
					Line4.Visible = true      

					Line.Transparency = 1      
					Line2.Transparency = 1      
					Line3.Transparency = 1      
					Line4.Transparency = 1      

					Line.Thickness = 1      
					Line2.Thickness = 1      
					Line3.Thickness = 1      
					Line4.Thickness = 1      

					wait(0.3)      
					for i = 1,0,-0.1 do      
						wait()      
						Line.Transparency = i       
						Line2.Transparency = i      
						Line3.Transparency = i      
						Line4.Transparency = i      
					end      
					Line:Remove()      
					Line2:Remove()      
					Line3:Remove()      
					Line4:Remove()      
				end      
			end)()      
			if values.visuals.world.hitsound.Dropdown == "none" then return end      

			local sound = INST("Sound")      
			sound.Parent = game:GetService("SoundService")      
			sound.SoundId = values.visuals.world.hitsound.Dropdown == "skeet" and "rbxassetid://5447626464" or values.visuals.world.hitsound.Dropdown == "neverlose" and "rbxassetid://5043539486" or values.visuals.world.hitsound.Dropdown == "rust" and "rbxassetid://5043539486" or values.visuals.world.hitsound.Dropdown == "bag" and "rbxassetid://364942410" or values.visuals.world.hitsound.Dropdown == "baimware" and "rbxassetid://6607339542" or values.visuals.world.hitsound.Dropdown == "osu" and "rbxassetid://7149919358" or values.visuals.world.hitsound.Dropdown == "Tf2" and "rbxassetid://296102734" or values.visuals.world.hitsound.Dropdown == "Tf2 pan" and "rbxassetid://3431749479" or values.visuals.world.hitsound.Dropdown  == "M55solix" and "rbxassetid://364942410" or values.visuals.world.hitsound.Dropdown == "Slap" and "rbxassetid://4888372697" or values.visuals.world.hitsound.Dropdown  == "1" and "rbxassetid://7349055654" or values.visuals.world.hitsound.Dropdown == "Minecraft" and "rbxassetid://7273736372" or values.visuals.world.hitsound.Dropdown == "jojo" and "rbxassetid://6787514780" or values.visuals.world.hitsound.Dropdown == "vibe" and "rbxassetid://1848288500" or values.visuals.world.hitsound.Dropdown == "supersmash" and "rbxassetid://2039907664" or values.visuals.world.hitsound.Dropdown == "epic" and "rbxassetid://7344303740" or values.visuals.world.hitsound.Dropdown == "retro" and "rbxassetid://3466984142" or values.visuals.world.hitsound.Dropdown == "quek" and "rbxassetid://4868633804" or values.visuals.world.hitsound.Dropdown == "SEMI" and "rbxassetid://7791675603" 
			sound.Volume = values.visuals.world["sound volume"].Slider      
			sound.PlayOnRemove = true      
			sound:Destroy()      
		end)      
		LocalPlayer.Status.Kills:GetPropertyChangedSignal("Value"):Connect(function(current)      
			if current == 0 then return end      
			if values.misc.chat["kill say"].Toggle then      
				game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(values.misc.chat["message"].Text ~= "" and values.misc.chat["message"].Text or "The smile of Super Idol is not as sweet as yours. The sun at noon in August is not as dazzling as you. I love you at 105 °C. Drops of pure distilled water", false, "Innocent", false, true)      
			end      
		end)      
		RayIgnore.ChildAdded:Connect(function(obj)      
			if obj.Name == "Fires" then      
				obj.ChildAdded:Connect(function(fire)      
					if values.visuals.world["molly radius"].Toggle then      
						fire.Transparency = values.visuals.world["molly radius"].Transparency      
						fire.Color = values.visuals.world["molly radius"].Color      
					end      
				end)      
			end      
			if obj.Name == "Smokes" then      
				obj.ChildAdded:Connect(function(smoke)      
					RunService.RenderStepped:Wait()      
					local OriginalRate = INST("NumberValue")      	
					OriginalRate.Value = smoke.ParticleEmitter.Rate      
					OriginalRate.Name = "OriginalRate"      
					OriginalRate.Parent = smoke      
					if TBLFIND(values.visuals.effects.removals.Jumbobox, "smokes") then      
						smoke.ParticleEmitter.Rate = 0      
					end      
					smoke.Material = Enum.Material.ForceField      
					if values.visuals.world["smoke radius"].Toggle then      
						smoke.Transparency = 0      
						smoke.Color = values.visuals.world["smoke radius"].Color      
					end      
				end)      
			end      
		end)      
		if RayIgnore:FindFirstChild("Fires") then      
			RayIgnore:FindFirstChild("Fires").ChildAdded:Connect(function(fire)      
				if values.visuals.world["molly radius"].Toggle then      
					fire.Transparency = values.visuals.world["molly radius"].Transparency      
					fire.Color = values.visuals.world["molly radius"].Color      
				end      
			end)      
		end      
		if RayIgnore:FindFirstChild("Smokes") then      
			for _,smoke in pairs(RayIgnore:FindFirstChild("Smokes"):GetChildren()) do      
				local OriginalRate = INST("NumberValue")      
				OriginalRate.Value = smoke.ParticleEmitter.Rate      
				OriginalRate.Name = "OriginalRate"      
				OriginalRate.Parent = smoke      
				smoke.Material = Enum.Material.ForceField      
			end      
			RayIgnore:FindFirstChild("Smokes").ChildAdded:Connect(function(smoke)      
				RunService.RenderStepped:Wait()      
				local OriginalRate = INST("NumberValue")      
				OriginalRate.Value = smoke.ParticleEmitter.Rate      
				OriginalRate.Name = "OriginalRate"      
				OriginalRate.Parent = smoke      
				if TBLFIND(values.visuals.effects.removals.Jumbobox, "smokes") then      
					smoke.ParticleEmitter.Rate = 0      
				end      
				smoke.Material = Enum.Material.ForceField      
				if values.visuals.world["smoke radius"].Toggle then      
					smoke.Transparency = 0      
					smoke.Color = values.visuals.world["smoke radius"].Color      
				end      
			end)      
		end      
		Camera.ChildAdded:Connect(function(obj)      
			if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "ammo") then      
				Client.ammocount = 999999      
				Client.primarystored = 999999      
				Client.ammocount2 = 999999      
				Client.secondarystored = 999999      
			end      
			RunService.RenderStepped:Wait()      
			if obj.Name ~= "Arms" then return end      
			local Model      
			for i,v in pairs(obj:GetChildren()) do      
				if v:IsA("Model") and (v:FindFirstChild("Right Arm") or v:FindFirstChild("Left Arm")) then      
					Model = v      
				end      
			end      
			if Model == nil then return end      
			for i,v in pairs(obj:GetChildren()) do      
				if (v:IsA("BasePart") or v:IsA("Part")) and v.Transparency ~= 1 and v.Name ~= "Flash" then      
					local valid = true      
					if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then      
						valid = false      
						local success, err = pcall(function()      
							local OriginalTexture = INST("StringValue")      
							OriginalTexture.Value = v.Mesh.TextureId      
							OriginalTexture.Name = "OriginalTexture"      
							OriginalTexture.Parent = v.Mesh      
						end)      
						local success2, err2 = pcall(function()      
							local OriginalTexture = INST("StringValue")      
							OriginalTexture.Value = v.Mesh.TextureID      
							OriginalTexture.Name = "OriginalTexture"      
							OriginalTexture.Parent = v.Mesh      
						end)      
						if success or success2 then valid = true end      
					end      

					for i2,v2 in pairs(v:GetChildren()) do      
						if (v2:IsA("BasePart") or v2:IsA("Part")) then      
							INSERT(WeaponObj, v2)      
						end      
					end      

					if valid then      
						INSERT(WeaponObj, v)      
					end      
				end      
			end      

			local gunname = Client.gun ~= "none" and values.skins.knife["knife changer"].Toggle and Client.gun:FindFirstChild("Melee") and values.skins.knife.model.Scroll or Client.gun ~= "none" and Client.gun.Name      
			if values.skins.skins["skin changer"].Toggle and gunname ~= nil and Skins:FindFirstChild(gunname) then      
				if values.skins.skins.skin.Scroll[gunname] ~= "Inventory" then      
					MapSkin(gunname, values.skins.skins.skin.Scroll[gunname])      
				end      
			end      
			for _,v in pairs(WeaponObj) do      
				if v:IsA("MeshPart") then      
					local OriginalTexture = INST("StringValue")      
					OriginalTexture.Value = v.TextureID      
					OriginalTexture.Name = "OriginalTexture"      
					OriginalTexture.Parent = v      
				end      

				local OriginalColor = INST("Color3Value")      
				OriginalColor.Value = v.Color      
				OriginalColor.Name = "OriginalColor"      
				OriginalColor.Parent = v      

				local OriginalMaterial = INST("StringValue")      
				OriginalMaterial.Value = v.Material.Name      
				OriginalMaterial.Name = "OriginalMaterial"      
				OriginalMaterial.Parent = v      

				if values.visuals.effects["weapon chams"].Toggle then      
					UpdateWeapon(v)      
				end      
			end      
			RArm = Model:FindFirstChild("Right Arm"); LArm = Model:FindFirstChild("Left Arm")      
			if RArm then      
				local OriginalColor = INST("Color3Value")      
				OriginalColor.Value = RArm.Color      
				OriginalColor.Name = "Color3Value"      
				OriginalColor.Parent = RArm      
				if values.visuals.effects["arm chams"].Toggle then      
					RArm.Color = values.visuals.effects["arm chams"].Color      
					RArm.Transparency = values.visuals.effects["arm chams"].Transparency      
				end      
				RGlove = RArm:FindFirstChild("Glove") or RArm:FindFirstChild("RGlove")      
				if values.skins.glove["glove changer"].Toggle and Client.gun ~= "none" then      
					if RGlove then RGlove:Destroy() end      
					RGlove = GloveModels[values.skins.glove.model.Dropdown].RGlove:Clone()      
					RGlove.Mesh.TextureId = Gloves[values.skins.glove.model.Dropdown][values.skins.glove.model.Scroll[values.skins.glove.model.Dropdown]].Textures.TextureId      
					RGlove.Parent = RArm      
					RGlove.Transparency = 0      
					RGlove.Welded.Part0 = RArm      
				end      
				if RGlove.Transparency == 1 then      
					RGlove:Destroy()      
					RGlove = nil      
				else      
					local GloveTexture = INST("StringValue")      
					GloveTexture.Value = RGlove.Mesh.TextureId      
					GloveTexture.Name = "StringValue"      
					GloveTexture.Parent = RGlove      

					if values.visuals.effects["accessory chams"].Toggle then      
						UpdateAccessory(RGlove)      
					end      
				end      
				RSleeve = RArm:FindFirstChild("Sleeve")      
				if RSleeve ~= nil then      
					local SleeveTexture = INST("StringValue")      
					SleeveTexture.Value = RSleeve.Mesh.TextureId      
					SleeveTexture.Name = "StringValue"      
					SleeveTexture.Parent = RSleeve      
					if values.visuals.effects["arm chams"].Toggle then      
						LArm.Color = values.visuals.effects["arm chams"].Color      
					end      
					if values.visuals.effects["accessory chams"].Toggle then      
						UpdateAccessory(RSleeve)      
					end      
				end      
			end      
			if LArm then      
				local OriginalColor = INST("Color3Value")      
				OriginalColor.Value = LArm.Color      
				OriginalColor.Name = "Color3Value"      
				OriginalColor.Parent = LArm      
				if values.visuals.effects["arm chams"].Toggle then      
					LArm.Color = values.visuals.effects["arm chams"].Color      
					LArm.Transparency = values.visuals.effects["arm chams"].Transparency      
				end      
				LGlove = LArm:FindFirstChild("Glove") or LArm:FindFirstChild("LGlove")      
				if values.skins.glove["glove changer"].Toggle and Client.gun ~= "none" then      
					if LGlove then LGlove:Destroy() end      
					LGlove = GloveModels[values.skins.glove.model.Dropdown].LGlove:Clone()      
					LGlove.Mesh.TextureId = Gloves[values.skins.glove.model.Dropdown][values.skins.glove.model.Scroll[values.skins.glove.model.Dropdown]].Textures.TextureId      
					LGlove.Transparency = 0      
					LGlove.Parent = LArm      
					LGlove.Welded.Part0 = LArm      
				end      
				if LGlove.Transparency == 1 then      
					LGlove:Destroy()      
					LGlove =  nil      
				else      
					local GloveTexture = INST("StringValue")      
					GloveTexture.Value = LGlove.Mesh.TextureId      
					GloveTexture.Name = "StringValue"      
					GloveTexture.Parent = LGlove      

					if values.visuals.effects["accessory chams"].Toggle then      
						UpdateAccessory(LGlove)      
					end      
				end      
				LSleeve = LArm:FindFirstChild("Sleeve")      
				if LSleeve ~= nil then      
					local SleeveTexture = INST("StringValue")      
					SleeveTexture.Value = LSleeve.Mesh.TextureId      
					SleeveTexture.Name = "StringValue"      
					SleeveTexture.Parent = LSleeve      

					if values.visuals.effects["accessory chams"].Toggle then      
						UpdateAccessory(LSleeve)      
					end      
				end      
			end      
		end)      
		Camera.ChildAdded:Connect(function(obj)      
			if obj.Name == "Arms" then      
				RArm, LArm, RGlove, RSleeve, LGlove, LSleeve = nil, nil, nil, nil, nil, nil      
				WeaponObj = {}      
			end      
		end)      
		Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function(fov)      
			if LocalPlayer.Character == nil then return end      
			if fov == values.visuals.self["fov changer"].Slider then return end      
			if values.visuals.self["on scope"].Toggle or not LocalPlayer.Character:FindFirstChild("AIMING") then      
				Camera.FieldOfView = values.visuals.self["fov changer"].Slider      
			end      
		end)      
		LocalPlayer.Cash:GetPropertyChangedSignal("Value"):Connect(function(cash)      
			if values.misc.client["infinite cash"].Toggle and cash ~= 8000 then      
				LocalPlayer.Cash.Value = 8000      
			end      
		end)      
		if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Origin") then      
			if workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or workspace.Map.Origin.Value == "de_nuke" or workspace.Map.Origin.Value == "de_aztec" then      
				oldSkybox = Lighting:FindFirstChildOfClass("Sky"):Clone()      
			end      
		end      
		workspace.ChildAdded:Connect(function(obj)      
			if obj.Name == "Map" then      
				wait(5)      
				if values.misc.client["remove killers"].Toggle then      
					if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then      
						local clone = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone()      
						clone.Name = "KillersClone"      
						clone.Parent = workspace:FindFirstChild("Map")      

						workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy()      
					end      
				end      
				if oldSkybox ~= nil then      
					oldSkybox:Destroy()      
					oldSkybox = nil      
				end      
				local Origin = workspace.Map:WaitForChild("Origin")      
				if workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or workspace.Map.Origin.Value == "de_nuke" or workspace.Map.Origin.Value == "de_aztec" then      
					oldSkybox = Lighting:FindFirstChildOfClass("Sky"):Clone()      

					local sky = values.visuals.world.skybox.Dropdown      
					if sky ~= "none" then      
						Lighting:FindFirstChildOfClass("Sky"):Destroy()      
						local skybox = INST("Sky")      
						skybox.SkyboxLf = Skyboxes[sky].SkyboxLf      
						skybox.SkyboxBk = Skyboxes[sky].SkyboxBk      
						skybox.SkyboxDn = Skyboxes[sky].SkyboxDn      
						skybox.SkyboxFt = Skyboxes[sky].SkyboxFt      
						skybox.SkyboxRt = Skyboxes[sky].SkyboxRt      
						skybox.SkyboxUp = Skyboxes[sky].SkyboxUp      
						skybox.Name = "override"      
						skybox.Parent = Lighting      
					end      
				else      
					local sky = values.visuals.world.skybox.Dropdown      
					if sky ~= "none" then      
						local skybox = INST("Sky")      
						skybox.SkyboxLf = Skyboxes[sky].SkyboxLf      
						skybox.SkyboxBk = Skyboxes[sky].SkyboxBk      
						skybox.SkyboxDn = Skyboxes[sky].SkyboxDn      
						skybox.SkyboxFt = Skyboxes[sky].SkyboxFt      
						skybox.SkyboxRt = Skyboxes[sky].SkyboxRt      
						skybox.SkyboxUp = Skyboxes[sky].SkyboxUp      
						skybox.Name = "override"      
						skybox.Parent = Lighting      
					end      
				end      
			end      
		end)      
		Lighting.ChildAdded:Connect(function(obj)      
			if obj:IsA("Sky") and obj.Name ~= "override" then      
				oldSkybox = obj:Clone()      
			end      
		end)      

		local function CollisionTBL(obj)      
			if obj:IsA("Accessory") then      
				INSERT(Collision, obj)      
			end      
			if obj:IsA("Part") then      
				if obj.Name == "HeadHB" or obj.Name == "FakeHead" then      
					INSERT(Collision, obj)      
				end      
			end      
		end      
		LocalPlayer.CharacterAdded:Connect(function(char)      
			repeat RunService.RenderStepped:Wait()      
			until char:FindFirstChild("Gun")      
			SelfObj = {}      
			if values.skins.characters["character changer"].Toggle then      
				ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll))      
			end      
			if char:FindFirstChildOfClass("Shirt") then      
				local String = INST("StringValue")      
				String.Name = "OriginalTexture"      
				String.Value = char:FindFirstChildOfClass("Shirt").ShirtTemplate      
				String.Parent = char:FindFirstChildOfClass("Shirt")      

				if TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then      
					char:FindFirstChildOfClass("Shirt").ShirtTemplate = ""      
				end      
			end      
			if char:FindFirstChildOfClass("Pants") then      
				local String = INST("StringValue")      
				String.Name = "OriginalTexture"      
				String.Value = char:FindFirstChildOfClass("Pants").PantsTemplate      
				String.Parent = char:FindFirstChildOfClass("Pants")      

				if TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then      
					char:FindFirstChildOfClass("Pants").PantsTemplate = ""      
				end      
			end      
			for i,v in pairs(char:GetChildren()) do      
				if v:IsA("BasePart") and v.Transparency ~= 1 then      
					INSERT(SelfObj, v)      
					local Color = INST("Color3Value")      
					Color.Name = "OriginalColor"      
					Color.Value = v.Color      
					Color.Parent = v      

					local String = INST("StringValue")      
					String.Name = "OriginalMaterial"      
					String.Value = v.Material.Name      
					String.Parent = v      
				elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then      
					INSERT(SelfObj, v.Handle)      
					local Color = INST("Color3Value")      
					Color.Name = "OriginalColor"      
					Color.Value = v.Handle.Color      
					Color.Parent = v.Handle      

					local String = INST("StringValue")      
					String.Name = "OriginalMaterial"      
					String.Value = v.Handle.Material.Name      
					String.Parent = v.Handle      
				end      
			end      
			if values.visuals.self["self chams"].Toggle then      
				for _,obj in pairs(SelfObj) do      
					if obj.Parent ~= nil then      
						obj.Material = values.visuals.self["self chams material"].Dropdown
						obj.Color = values.visuals.self["self chams"].Color     
						obj.Transparency = values.visuals.self["self chams transparency"].Slider/10
					end      
				end      
			end      
			LocalPlayer.Character.ChildAdded:Connect(function(Child)      
				if Child:IsA("Accessory") and Child.Handle.Transparency ~= 1 then      
					INSERT(SelfObj, Child.Handle)      
					local Color = INST("Color3Value")      
					Color.Name = "OriginalColor"      
					Color.Value = Child.Handle.Color      
					Color.Parent = Child.Handle      

					local String = INST("StringValue")      
					String.Name = "OriginalMaterial"      
					String.Value = Child.Handle.Material.Name      
					String.Parent = Child.Handle      

					if values.visuals.self["self chams"].Toggle then      
						for _,obj in pairs(SelfObj) do      
							if obj.Parent ~= nil then      
								obj.Material = values.visuals.self["self chams material"].Dropdown   
								obj.Color = values.visuals.self["self chams"].Color
								obj.Transparency = values.visuals.self["self chams transparency"].Slider/10      
							end      
						end      
					end      
				end      
			end)      

			if values.misc.animations.enabled.Toggle and values.misc.animations.enabled.Active then      
				LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)      
				LoadedAnim.Priority = Enum.AnimationPriority.Action      
				LoadedAnim:Play()      
			end      
		end)      
		if LocalPlayer.Character ~= nil then      
			for i,v in pairs(LocalPlayer.Character:GetChildren()) do      
				if v:IsA("BasePart") and v.Transparency ~= 1 then      
					INSERT(SelfObj, v)      
					local Color = INST("Color3Value")      
					Color.Name = "OriginalColor"      
					Color.Value = v.Color      
					Color.Parent = v      

					local String = INST("StringValue")      
					String.Name = "OriginalMaterial"      
					String.Value = v.Material.Name      
					String.Parent = v      
				elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then      
					INSERT(SelfObj, v.Handle)      
					local Color = INST("Color3Value")      
					Color.Name = "OriginalColor"      
					Color.Value = v.Handle.Color      
					Color.Parent = v.Handle      

					local String = INST("StringValue")      
					String.Name = "OriginalMaterial"      
					String.Value = v.Handle.Material.Name      
					String.Parent = v.Handle      
				end      
			end      
			if values.visuals.self["self chams"].Toggle then      
				for _,obj in pairs(SelfObj) do      
					if obj.Parent ~= nil then      
						obj.Material = values.visuals.self["self chams material"].Dropdown   
						obj.Color = values.visuals.self["self chams"].Color
						obj.Transparency = values.visuals.self["self chams transparency"].Slider/10        
					end      
				end      
			end      
			LocalPlayer.Character.ChildAdded:Connect(function(Child)      
				if Child:IsA("Accessory") and Child.Handle.Transparency ~= 1 then      
					INSERT(SelfObj, Child.Handle)      
					local Color = INST("Color3Value")      
					Color.Name = "OriginalColor"      
					Color.Value = Child.Handle.Color      
					Color.Parent = Child.Handle      

					local String = INST("StringValue")      
					String.Name = "OriginalMaterial"      
					String.Value = Child.Handle.Material.Name      
					String.Parent = Child.Handle      

					if values.visuals.self["self chams"].Toggle then      
						for _,obj in pairs(SelfObj) do      
							if obj.Parent ~= nil then      
								obj.Material = values.visuals.self["self chams material"].Dropdown   
								obj.Color = values.visuals.self["self chams"].Color
								obj.Transparency = values.visuals.self["self chams transparency"].Slider/10     
							end      
						end      
					end      
				end      
			end)      
		end      
		Players.PlayerAdded:Connect(function(Player)      
			Player:GetPropertyChangedSignal("Team"):Connect(function(new)      
				wait()      
				if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then      
					for _2,Obj in pairs(Player.Character:GetDescendants()) do      
						if Obj.Name == "VisibleCham" or Obj.Name == "WallCham" then      
							if values.visuals.players.chams.Toggle then      
								if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then      
									Obj.Visible = true      
								else      
									Obj.Visible = false      
								end      
							else      
								Obj.Visible = false      
							end      
							Obj.Color3 = values.visuals.players.chams.Color      
						end      
					end      
				end      
			end)      
			Player.CharacterAdded:Connect(function(Character)      
				Character.ChildAdded:Connect(function(obj)      
					wait(1)      
					CollisionTBL(obj)      
				end)      
				wait(1)      
				if Character ~= nil then      
					local Value = INST("Vector3Value")      
					Value.Name = "OldPosition"      
					Value.Value = Character.HumanoidRootPart.Position      
					Value.Parent = Character.HumanoidRootPart      
					for _,obj in pairs(Character:GetChildren()) do      
						if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then      
							local VisibleCham = INST("BoxHandleAdornment")      
							VisibleCham.Name = "VisibleCham"      
							VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
							VisibleCham.ZIndex = 8      
							VisibleCham.Size = obj.Size + Vec3(0.1,0.1,0.1)      
							VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
							VisibleCham.Transparency = 0      

							local WallCham = INST("BoxHandleAdornment")      
							WallCham.Name = "WallCham"      
							WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
							WallCham.ZIndex = 5      
							WallCham.Size = obj.Size + Vec3(0.1,0.1,0.1)      
							WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
							WallCham.Transparency = 0.7      

							if values.visuals.players.chams.Toggle then      
								if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then      
									VisibleCham.Visible = true      
									WallCham.Visible = true      
								else      
									VisibleCham.Visible = false      
									WallCham.Visible = false      
								end      
							else      
								VisibleCham.Visible = false      
								WallCham.Visible = false      
							end      

							INSERT(ChamItems, VisibleCham)      
							INSERT(ChamItems, WallCham)      

							VisibleCham.Color3 = values.visuals.players.chams.Color      
							WallCham.Color3 = values.visuals.players.chams.Color   
							WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
							VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle

							VisibleCham.AdornCullingMode = "Never"      
							WallCham.AdornCullingMode = "Never"      

							VisibleCham.Adornee = obj      
							VisibleCham.Parent = obj      

							WallCham.Adornee = obj      
							WallCham.Parent = obj      
						end      
					end      
				end      
			end)      
		end)      
		for _,Player in pairs(Players:GetPlayers()) do      
			if Player ~= LocalPlayer then      
				Player:GetPropertyChangedSignal("Team"):Connect(function(new)      
					wait()      
					if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then      
						for _2,Obj in pairs(Player.Character:GetDescendants()) do      
							if Obj.Name == "VisibleCham" or Obj.Name == "WallCham" then      
								if values.visuals.players.chams.Toggle then      
									if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then      
										Obj.Visible = true      
									else      
										Obj.Visible = false      
									end      
								else      
									Obj.Visible = false      
								end      
								Obj.Color3 = values.visuals.players.chams.Color      
							end      
						end      
					end      
				end)      
			else      
				LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function(new)      
					wait()      
					for _,Player in pairs(Players:GetPlayers()) do      
						if Player.Character then      
							for _2,Obj in pairs(Player.Character:GetDescendants()) do      
								if Obj.Name == "VisibleCham" or Obj.Name == "WallCham" then      
									if values.visuals.players.chams.Toggle then      
										if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then      
											Obj.Visible = true      
										else      
											Obj.Visible = false      
										end      
									else      
										Obj.Visible = false      
									end      
									Obj.Color3 = values.visuals.players.chams.Color      
								end      
							end      
						end      
					end      
				end)      
			end      
			Player.CharacterAdded:Connect(function(Character)      
				Character.ChildAdded:Connect(function(obj)      
					wait(1)      
					CollisionTBL(obj)      
				end)      
				wait(1)      
				if Player.Character ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") then      
					local Value = INST("Vector3Value")      
					Value.Value = Player.Character.HumanoidRootPart.Position      
					Value.Name = "OldPosition"      
					Value.Parent = Player.Character.HumanoidRootPart      
					for _,obj in pairs(Player.Character:GetChildren()) do      
						if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then      
							local VisibleCham = INST("BoxHandleAdornment")      
							VisibleCham.Name = "VisibleCham"      
							VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
							VisibleCham.ZIndex = 5      
							VisibleCham.Size = obj.Size + Vec3(0.1,0.1,0.1)      
							VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
							VisibleCham.Transparency = 0      

							local WallCham = INST("BoxHandleAdornment")      
							WallCham.Name = "WallCham"      
							WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
							WallCham.ZIndex = 5      
							WallCham.Size = obj.Size + Vec3(0.1,0.1,0.1)      
							WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
							WallCham.Transparency = 0.7      

							if values.visuals.players.chams.Toggle then      
								if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then      
									VisibleCham.Visible = true      
									WallCham.Visible = true      
								else      
									VisibleCham.Visible = false      
									WallCham.Visible = false      
								end      
							else      
								VisibleCham.Visible = false      
								WallCham.Visible = false      
							end      

							INSERT(ChamItems, VisibleCham)      
							INSERT(ChamItems, WallCham)      

							VisibleCham.Color3 = values.visuals.players.chams.Color      
							WallCham.Color3 = values.visuals.players.chams.Color      

							VisibleCham.AdornCullingMode = "Never"      
							WallCham.AdornCullingMode = "Never"      

							VisibleCham.Adornee = obj      
							VisibleCham.Parent = obj      

							WallCham.Adornee = obj      
							WallCham.Parent = obj      
						end      
					end      
				end      
			end)      
			if Player.Character ~= nil and Player.Character:FindFirstChild("UpperTorso") then      
				local Value = INST("Vector3Value")      
				Value.Name = "OldPosition"      
				Value.Value = Player.Character.HumanoidRootPart.Position      
				Value.Parent = Player.Character.HumanoidRootPart      
				for _,obj in pairs(Player.Character:GetChildren()) do      
					CollisionTBL(obj)      
					if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then      
						VisibleCham = INST("BoxHandleAdornment")      
						VisibleCham.Name = "VisibleCham"      
						VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
						VisibleCham.ZIndex = 5      
						VisibleCham.Size = obj.Size + Vec3(0.1,0.1,0.1)      
						VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
						VisibleCham.Transparency = 0      

						WallCham = INST("BoxHandleAdornment")      
						WallCham.Name = "WallCham"      
						WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
						WallCham.ZIndex = 5      
						WallCham.Size = obj.Size + Vec3(0.1,0.1,0.1)      
						WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle      
						WallCham.Transparency = 0.7      

						if values.visuals.players.chams.Toggle then      
							if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then      
								VisibleCham.Visible = true      
								WallCham.Visible = true      
							else      
								VisibleCham.Visible = false      
								WallCham.Visible = false      
							end      
						else      
							VisibleCham.Visible = false      
							WallCham.Visible = false      
						end      

						INSERT(ChamItems, VisibleCham)      
						INSERT(ChamItems, WallCham)      

						VisibleCham.Color3 = values.visuals.players.chams.Color      
						WallCham.Color3 = values.visuals.players.chams.Color      

						VisibleCham.AdornCullingMode = "Never"      
						WallCham.AdornCullingMode = "Never"      

						VisibleCham.Adornee = obj      
						VisibleCham.Parent = obj      

						WallCham.Adornee = obj      
						WallCham.Parent = obj      
					end      
				end      
			end      
		end      
		CreateHitElement("Success!",Color3.new(0,1,0))
		ChatScript.moveOldMessages()
		ChatScript.createNewMessage("Serenity.win","Serenity.win",MainUIColor,Color3.new(1,1,1),0.01,nil)
		ChatScript.moveOldMessages()
		ChatScript.createNewMessage("Serenity.win","Welcome back to Greatness ; Serenity.win",MainUIColor,Color3.new(1,1,1),0.01,nil)
		ChatScript.moveOldMessages()
		ChatScript.createNewMessage("Serenity.win","Version Pre Release",MainUIColor,Color3.new(1,1,1),0.01,nil)
		ChatScript.moveOldMessages()
		ChatScript.createNewMessage("Serenity on top",MainUIColor,Color3.new(1,1,1),0.01,nil)
		Print("smd :3")