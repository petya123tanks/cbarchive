-- // variables
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local ts = game:GetService("TweenService")
local plrs = game:GetService("Players")
local cas = game:GetService("ContextActionService")
local stats = game:GetService("Stats")

-- // library

local library = {
    connections = {},
    drawings = {},
    hidden = {},
    pointers = {},
    flags = {},
    preloaded_images = {},
    loaded = false
}

local lplr = game.Players.LocalPlayer
local client = getsenv(lplr.PlayerGui.Client)

local old_getselected = client.getSelected

local buymenu = lplr.PlayerGui.GUI.Buymenu
local circle = buymenu.Circle

local dummy = game:GetObjects("rbxassetid://10521168220")[1]

dummy.Parent = workspace.Ray_Ignore
dummy.Name = ""
dummy.Humanoid:Destroy()
Instance.new("AnimationController", dummy).Name = "Humanoid"
dummy:SetPrimaryPartCFrame(CFrame.new(Vector3.new(1,1,1) * 99e99))

for i, v in pairs(dummy:GetChildren()) do
    if v:IsA("BasePart") then
        v.CanCollide = false
    end
end

dummy = {ins = dummy, playing = {}}

function dummy.stop(id)
    if dummy.playing[id] then
        dummy.playing[id].Stop(dummy.playing[id])
    end
end

function dummy.play(id, ...)
    dummy.stop(id)

    local animation = Instance.new("Animation")
    animation.AnimationId = tostring(id)

    local loaded = dummy.ins.Humanoid.LoadAnimation(dummy.ins.Humanoid, animation)
    loaded.Play(loaded, ...)

    dummy.playing[id] = loaded
end

function dummy.goto(a)
    dummy.ins:SetPrimaryPartCFrame(a)
end

function dummy.update()

end

client.splatterBlood = function() end
client.createbullethole = function()
    for i, v in pairs(workspace.Debris:GetChildren()) do
        if v.Name == "Bullet" or v.Name == "SurfaceGui" then
            v:Destroy()
        end
    end
end

function getRotate(v, rads)
    local u = v.Unit

    local a, b = math.sin(rads), math.cos(rads)

    local c, d = (b * u.X) - (a * u.Y), (a * u.X) + (b * u.Y)

    return Vector2.new(c, d).Unit * v.Magnitude
end

function pressbutton(btn)
    for i, v in pairs(getconnections(btn.MouseButton1Down)) do
        v:Fire()
    end
end

makefolder("beanbot")
makefolder("beanbot/icons")
makefolder("beanbot/cb")
makefolder("beanbot/cb/configs")

if not isfile("beanbot/icons.json") then
    writefile("beanbot/icons.json", "[]")
end

local esp_stuff = {}

-- // utility
local utility = {}

do
    function utility:Draw(class, offset, properties, hidden)
        hidden = hidden or false

        local draw = Drawing.new(class)
        local fakeDraw = {}
        rawset(fakeDraw, "__OBJECT_EXIST", true)
        setmetatable(fakeDraw, {
            __index = function(self, key)
                if rawget(fakeDraw, "__OBJECT_EXIST") then
                    return draw[key]
                end
            end,
            __newindex = function(self, key, value)
                if rawget(fakeDraw, "__OBJECT_EXIST") then
                    draw[key] = value
                    if key == "Position" then
                        for _, v in pairs(rawget(fakeDraw, "children")) do
                            v.Position = fakeDraw.Position + v.GetOffset()
                        end
                    end
                end
            end
        })
        rawset(fakeDraw, "Remove", function()
            if rawget(fakeDraw, "__OBJECT_EXIST") then
                draw:Remove()
                rawset(fakeDraw, "__OBJECT_EXIST", false)
            end
        end)
        rawset(fakeDraw, "GetType", function()
            return class
        end)
        rawset(fakeDraw, "GetOffset", function()
            return offset or Vector2.new()
        end)
        rawset(fakeDraw, "SetOffset", function(noffset)
            offset = noffset or Vector2.new()

            fakeDraw.Position = properties.Parent.Position + fakeDraw.GetOffset()
        end)
        rawset(fakeDraw, "children", {})
        rawset(fakeDraw, "Lerp", function(instanceTo, instanceTime)
            if not rawget(fakeDraw, "__OBJECT_EXIST") then return end

            local currentTime = 0
            local currentIndex = {}
            local connection

            for i,v in pairs(instanceTo) do
                currentIndex[i] = fakeDraw[i]
            end

            local function lerp()
                for i,v in pairs(instanceTo) do
                    fakeDraw[i] = ((v - currentIndex[i]) * currentTime / instanceTime) + currentIndex[i]
                end
            end

            connection = rs.RenderStepped:Connect(function(delta)
                if currentTime < instanceTime then
                    currentTime = currentTime + delta
                    lerp()
                else
                    connection:Disconnect()
                end
            end)

            table.insert(library.connections, connection)
        end)

        local customProperties = {
            ["Parent"] = function(object)
                table.insert(rawget(object, "children"), fakeDraw)
            end
        }

        if class == "Square" or class == "Circle" or class == "Line" then
            fakeDraw.Thickness = 1
            if class == "Square" then
                fakeDraw.Filled = true
            end
        end

        if class ~= "Image" then
            fakeDraw.Color = Color3.new(0, 0, 0)
        end

        fakeDraw.Visible = library.loaded
        if properties ~= nil then
            for key, value in pairs(properties) do
                if customProperties[key] == nil then
                    fakeDraw[key] = value
                else
                    customProperties[key](value)
                end
            end
            if properties.Parent then
                fakeDraw.Position = properties.Parent.Position + fakeDraw.GetOffset()
            end
            if properties.Parent and properties.From then
                fakeDraw.From = properties.Parent.Position + fakeDraw.GetOffset()
            end
            if properties.Parent and properties.To then
                fakeDraw.To = properties.Parent.Position + fakeDraw.GetOffset()
            end
        end

        if not library.loaded and not hidden then
            fakeDraw.Transparency = 0
        end

        properties = properties or {}

        if not hidden then
            table.insert(library.drawings, {fakeDraw, properties["Transparency"] or 1, class})
        else
            table.insert(library.hidden, {fakeDraw, properties["Transparency"] or 1, class})
        end

        return fakeDraw
    end

    function utility:ScreenSize()
        return workspace.CurrentCamera.ViewportSize
    end

    function utility:RoundVector(vector)
        return Vector2.new(math.floor(vector.X), math.floor(vector.Y))
    end

    function utility:MouseOverDrawing(object)
        local values = {object.Position, object.Position + object.Size}
        local mouseLocation = uis:GetMouseLocation()
        return mouseLocation.X >= values[1].X and mouseLocation.Y >= values[1].Y and mouseLocation.X <= values[2].X and mouseLocation.Y <= values[2].Y
    end

    function utility:MouseOverPosition(values)
        local mouseLocation = uis:GetMouseLocation()
        return mouseLocation.X >= values[1].X and mouseLocation.Y >= values[1].Y and mouseLocation.X <= values[2].X and mouseLocation.Y <= values[2].Y
    end

    function utility:PreloadImage(link)
        local data = library.preloaded_images[link] or game:HttpGet(link)
        if library.preloaded_images[link] == nil then
            library.preloaded_images[link] = data
        end
        return data
    end

    function utility:Image(object, link)
        local data = library.preloaded_images[link] or game:HttpGet(link)
        if library.preloaded_images[link] == nil then
            library.preloaded_images[link] = data
        end
        object.Data = data
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

    function utility:GetTextSize(text, font, size)
        local textlabel = Drawing.new("Text")
        textlabel.Size = size
        textlabel.Font = font
        textlabel.Text = text
        local bounds = textlabel.TextBounds
        textlabel:Remove()
        return bounds
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

    function utility:CopyTable(tbl)
        local newtbl = {}
        for i, v in pairs(tbl) do
            newtbl[i] = v
        end
        return newtbl
    end

    function utility:GetClipboard()
        local s = Instance.new("ScreenGui", game.CoreGui)
        local t = Instance.new("TextBox", s)
        t.Text = ""
        t:CaptureFocus()
        keypress(0x11)
        keypress(0x56)
        task.wait()
        keyrelease(0x56)
        keyrelease(0x11)
        local v = t.Text
        s:Destroy()
        return tostring(v)
    end

    function utility.EspAddPlayer(plr)
        esp_stuff[plr] = {
            BoxOutline = utility:Draw("Square", Vector2.new(), {Visible = false, Filled = false, Thickness = 3}, true),
            Box = utility:Draw("Square", Vector2.new(), {Visible = false, Filled = false, ZIndex}, true),
            HealthOutline = utility:Draw("Square", Vector2.new(), {Visible = false}, true),
            Health = utility:Draw("Square", Vector2.new(), {Visible = false}, true),
            Name = utility:Draw("Text", Vector2.new(), {Size = 13, Font = 2, Text = plr.Name, Outline = true, Center = true, Visible = false}, true),
            Weapon = utility:Draw("Text", Vector2.new(), {Size = 13, Font = 2, Outline = true, Center = true, Visible = false}, true),
            Arrow = utility:Draw("Triangle", Vector2.new(), {Thickness = 2.4, Filled = true, Visible = false}, true),
        }

        for i = 1, 4 do
            esp_stuff[plr][i] = utility:Draw("Line", Vector2.new(), {Thickness = 1, Color = Color3.new(1, 1, 1), Visible = false}, true)
        end
    end

    function utility.EspRemovePlayer(plr)
        if esp_stuff[plr] then
            for i, v in pairs(esp_stuff[plr]) do
                v.Remove()
            end
            esp_stuff[plr] = nil
        end
    end

    function utility:ShiftKey(key)
        if string.byte(key) >= 65 and string.byte(key) <= 122 then
            return key:upper()
        else
            local shiftKeybinds = {["-"] = "_", ["="] = "+", ["1"] = "!", ["2"] = "@", ["3"] = "#", ["4"] = "$", ["5"] = "%", ["6"] = "^", ["7"] = "&", ["8"] = "*", ["9"] = "(", ["0"] = ")", [";"] = ":", [string.char(39)] = string.char(34), [string.char(92)] = "|", ["/"] = "?"}
            return shiftKeybinds[key] or key
        end
    end
end

for _, plr in pairs(game.Players:GetPlayers()) do
    utility.EspAddPlayer(plr)
end

utility:Connect(game.Players.PlayerAdded, utility.EspAddPlayer)
utility:Connect(game.Players.PlayerRemoving, utility.EspRemovePlayer)

-- // library coding

function library:New(args)
    args = args or {}

    local name = args.name or args.Name or "bbot ui"
    local accent1 = args.accent1 or args.Accent1 or Color3.fromRGB(127, 72, 163)
    local accent2 = args.accent2 or args.Accent2 or Color3.fromRGB(math.round(accent1.R * 255) - 40, math.round(accent1.G * 255) - 40, math.round(accent1.B * 255) - 40)

    local window = {name = name, library = library, tabs = {}, cursor = {}, unsafe = false, fading = false, togglekey = "Insert", dragging = false, startPos = nil, content = {dropdown = nil, colorpicker = nil, colorpickermenu = nil, keybind = nil}, theme = {accent1, accent2}}

    local window_frame = utility:Draw("Square", nil, {
        Color = Color3.fromRGB(35, 35, 35),
        Size = Vector2.new(496, 596),
        Position = utility:RoundVector(utility:ScreenSize() / 2) - Vector2.new(248, 298)
    })

    utility:Draw("Square", Vector2.new(-1, -1), {
        Color = Color3.fromRGB(20, 20, 20),
        Size = window_frame.Size + Vector2.new(2, 2),
        Filled = false,
        Parent = window_frame
    })

    utility:Draw("Square", Vector2.new(-2, -2), {
        Color = Color3.fromRGB(0, 0, 0),
        Size = window_frame.Size + Vector2.new(4, 4),
        Filled = false,
        Parent = window_frame
    })

    utility:Draw("Square", Vector2.new(0, 1), {
        Color = window.theme[1],
        Size = Vector2.new(window_frame.Size.X, 1),
        Parent = window_frame
    })

    utility:Draw("Square", Vector2.new(0, 2), {
        Color = window.theme[2],
        Size = Vector2.new(window_frame.Size.X, 1),
        Parent = window_frame
    })

    utility:Draw("Square", Vector2.new(0, 3), {
        Color = Color3.fromRGB(20, 20, 20),
        Size = Vector2.new(window_frame.Size.X, 1),
        Parent = window_frame
    })

    local title = utility:Draw("Text", Vector2.new(4, 6), {
        Color = Color3.fromRGB(255, 255, 255),
        Outline = true,
        Size = 13,
        Font = 2,
        Text = name,
        Parent = window_frame
    })

    local tabs_frame = utility:Draw("Square", Vector2.new(8, 23), {
        Color = Color3.fromRGB(35, 35, 35),
        Size = Vector2.new(480, 566),
        Parent = window_frame
    })

    utility:Draw("Square", Vector2.new(-1, -1), {
        Color = Color3.fromRGB(20, 20, 20),
        Size = tabs_frame.Size + Vector2.new(2, 2),
        Filled = false,
        Parent = tabs_frame
    })

    utility:Draw("Square", Vector2.new(-2, -2), {
        Color = Color3.fromRGB(0, 0, 0),
        Size = tabs_frame.Size + Vector2.new(4, 4),
        Filled = false,
        Parent = tabs_frame
    })

    utility:Draw("Square", Vector2.new(0, 1), {
        Color = window.theme[1],
        Size = Vector2.new(tabs_frame.Size.X, 1),
        Parent = tabs_frame
    })

    utility:Draw("Square", Vector2.new(0, 2), {
        Color = window.theme[2],
        Size = Vector2.new(tabs_frame.Size.X, 1),
        Parent = tabs_frame
    })

    utility:Draw("Square", Vector2.new(0, 3), {
        Color = Color3.fromRGB(20, 20, 20),
        Size = Vector2.new(tabs_frame.Size.X, 1),
        Parent = tabs_frame
    })

    local tab_content = utility:Draw("Square", Vector2.new(1, 37), {
        Color = Color3.fromRGB(35, 35, 35),
        Size = Vector2.new(478, 528),
        Parent = tabs_frame
    })

    utility:Draw("Square", Vector2.new(-1, -1), {
        Color = Color3.fromRGB(20, 20, 20),
        Size = tab_content.Size + Vector2.new(2, 2),
        Filled = false,
        Parent = tab_content
    })

    utility:Connect(uis.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverPosition({window_frame.Position, window_frame.Position + Vector2.new(window_frame.Size.X, 22)}) and window_frame.Visible and not window.fading then
            window.dragging = true
            window.startPos = uis:GetMouseLocation() - window_frame.Position
        elseif input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode.Name == window.togglekey then
                window:Toggle()
            end
        end
    end)

    utility:Connect(uis.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            window.dragging = false
        end
    end)

    utility:Connect(rs.RenderStepped, function()
        if window.dragging then
            window_frame.Position = uis:GetMouseLocation() - window.startPos
        end
    end)

    function window:Toggle()
        if window.fading then return end
        window:CloseContent()
        if window_frame.Visible then
            cas:UnbindAction("beanbotkeyboard")
            cas:UnbindAction("beanbotwheel")
            cas:UnbindAction("beanbotm1")
            cas:UnbindAction("beanbotm2")
            for i, v in pairs(utility:Combine(library.drawings, window.cursor)) do
                v[1].Lerp({Transparency = 0}, 0.25)
                delay(0.25, function()
                    v[1].Visible = false
                end)
            end
            window.fading = true
            delay(0.25, function()
                window.fading = false
                task.wait()
                uis.MouseIconEnabled = true
            end)
        else
            cas:BindAction("beanbotkeyboard", function() end, false, Enum.UserInputType.Keyboard)
            cas:BindAction("beanbotwheel", function() end, false, Enum.UserInputType.MouseWheel)
            cas:BindAction("beanbotm1", function() end, false, Enum.UserInputType.MouseButton1)
            cas:BindAction("beanbotm2", function() end, false, Enum.UserInputType.MouseButton2)
            local lerp_tick = tick()
            for i, v in pairs(utility:Combine(library.drawings, window.cursor)) do
                v[1].Visible = true
                v[1].Lerp({Transparency = v[2]}, 0.25)
            end
            local connection connection = utility:Connect(rs.RenderStepped, function()
                if tick()-lerp_tick < 1/4 then
                    window:UpdateTabs()
                else
                    connection:Disconnect()
                end
            end)
            window.fading = true
            delay(0.25, function()
                window.fading = false
                window:UpdateTabs()
            end)
            local con con = utility:Connect(rs.RenderStepped, function()
                if library.loaded and window_frame.Visible == true then
                    uis.MouseIconEnabled = false
                else
                    con:Disconnect()
                end
            end)
        end
    end

    function window:Tab(args)
        args = args or {}

        local name = args.name or args.Name or "Tab"

        local tab = {name = name, window = window, sections = {}, sectionOffsets = {left = 0, right = 0}, open = false, instances = {}}

        local tab_frame = utility:Draw("Square", Vector2.new((1 + ((480 / (#window.tabs + 1))) * #window.tabs), 5), {
            Color = Color3.fromRGB(30, 30, 30),
            Size = Vector2.new(480 / (#window.tabs + 1) - 2, 30),
            Parent = tabs_frame
        })

        for i, v in pairs(window.tabs) do
            v.instances[1].SetOffset(Vector2.new(1 + ((480 / (#window.tabs + 1)) * (i - 1)), 5))
            v.instances[1].Size = Vector2.new(480 / (#window.tabs + 1) - 2, 30)
            v.instances[2].Size = v.instances[1].Size + Vector2.new(2, 2)
            v.instances[3].Size = v.instances[1].Size
            v.instances[5].Size = Vector2.new(v.instances[1].Size.X, 2)
            v.instances[4].SetOffset(Vector2.new(math.floor(v.instances[1].Size.X / 2), 7))
        end

        local outline = utility:Draw("Square", Vector2.new(-1, -1), {
            Color = Color3.fromRGB(20, 20, 20),
            Size = tab_frame.Size + Vector2.new(2, 2),
            Filled = false,
            Parent = tab_frame
        })

        local tab_gradient = utility:Draw("Image", Vector2.new(), {
            Size = tab_frame.Size,
            Visible = false,
            Transparency = 0.615,
            Parent = tab_frame
        })

        local tab_title = utility:Draw("Text", Vector2.new(math.floor(tab_frame.Size.X / 2), 7), {
            Color = Color3.fromRGB(255, 255, 255),
            Outline = true,
            Size = 13,
            Font = 2,
            Text = name,
            Center = true,
            Parent = tab_frame
        })

        local outline_hider = utility:Draw("Square", Vector2.new(0, 30), {
            Color = Color3.fromRGB(35, 35, 35),
            Size = Vector2.new(tab_frame.Size.X, 2),
            Visible = false,
            Parent = tab_frame
        })

        utility:Image(tab_gradient, "https://i.imgur.com/5hmlrjX.png")

        utility:Connect(uis.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverDrawing(tab_frame) and not window.fading then
                window:SetTab(name)
            end
        end)

        tab.instances = {tab_frame, outline, tab_gradient, tab_title, outline_hider}

        table.insert(window.tabs, tab)

        function tab:Show()
            window:CloseContent()

            tab_frame.Color = Color3.fromRGB(50, 50, 50)
            tab_title.Color = Color3.fromRGB(255, 255, 255)
            tab_gradient.Visible = true
            outline_hider.Visible = true

            for i, v in pairs(tab.sections) do
                for i2, v2 in pairs(v.instances) do
                    v2.Visible = true
                end
            end
        end

        function tab:Hide()
            window:CloseContent()

            tab_frame.Color = Color3.fromRGB(30, 30, 30)
            tab_title.Color = Color3.fromRGB(170, 170, 170)
            tab_gradient.Visible = false
            outline_hider.Visible = false

            for i, v in pairs(tab.sections) do
                for i2, v2 in pairs(v.instances) do
                    v2.Visible = false
                end
            end
        end

        function tab:GetSecionPosition(side)
            local default = Vector2.new(side == "left" and 9 or side == "right" and 245, 9 + tab.sectionOffsets[side])
            return default
        end

        function tab:Section(args)
            args = args or {}

            local name = args.name or args.Name or "section"
            local side = (args.side or args.Side or "left"):lower()

            local section = {name = name, tab = tab, side = side, offset = 0, instances = {}}

            local section_frame = utility:Draw("Square", tab:GetSecionPosition(side), {
                Color = Color3.fromRGB(35, 35, 35),
                Size = Vector2.new(226, 15),
                Parent = tab_content
            })

            local section_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                Color = Color3.fromRGB(20, 20, 20),
                Size = section_frame.Size + Vector2.new(2, 2),
                Filled = false,
                Parent = section_frame
            })

            local section_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                Color = Color3.fromRGB(0, 0, 0),
                Size = section_frame.Size + Vector2.new(4, 4),
                Filled = false,
                Parent = section_frame
            })

            local section_gradient_frame = utility:Draw("Square", Vector2.new(0, 0), {
                Color = Color3.fromRGB(50, 50, 50),
                Size = Vector2.new(section_frame.Size.X, 22),
                Parent = section_frame
            })

            local section_gradient = utility:Draw("Image", Vector2.new(0, 0), {
                Size = section_gradient_frame.Size,
                Transparency = 0.615,
                Parent = section_frame
            })

            local section_title = utility:Draw("Text", Vector2.new(4, 4), {
                Color = Color3.fromRGB(255, 255, 255),
                Outline = true,
                Size = 13,
                Font = 2,
                Text = name,
                Parent = section_frame
            })

            local section_accent1 = utility:Draw("Square", Vector2.new(0, 1), {
                Color = window.theme[1],
                Size = Vector2.new(section_frame.Size.X, 1),
                Parent = section_frame
            })

            local section_accent2 = utility:Draw("Square", Vector2.new(0, 2), {
                Color = window.theme[2],
                Size = Vector2.new(section_frame.Size.X, 1),
                Parent = section_frame
            })

            local section_inline2 = utility:Draw("Square", Vector2.new(0, 3), {
                Color = Color3.fromRGB(20, 20, 20),
                Size = Vector2.new(section_frame.Size.X, 1),
                Parent = section_frame
            })

            tab.sectionOffsets[side] = tab.sectionOffsets[side] + 27

            section.instances = {section_frame, section_inline, section_outline, section_title, section_accent1, section_accent2, section_inline2, section_gradient_frame, section_gradient}

            table.insert(tab.sections, section)

            utility:Image(section_gradient, "https://i.imgur.com/5hmlrjX.png")

            function section:Update()
                section_frame.Size = Vector2.new(226, 28 + section.offset)
                section_inline.Size = section_frame.Size + Vector2.new(2, 2)
                section_outline.Size = section_frame.Size + Vector2.new(4, 4)
            end

            function section:Toggle(args)
                args = args or {}

                local name = args.name or args.Name or "toggle"
                local default = args.default or args.Default or args.def or args.Def or false
                local callback = args.callback or args.Callback or function() end
                local flag = args.flag or args.Flag or ""
                local pointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. name
                local unsafe = args.unsafe or args.Unsafe or false

                local toggle = {name = name, state = default}

                local toggle_frame = utility:Draw("Square", Vector2.new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(50, 50, 50),
                    Size = Vector2.new(8, 8),
                    Parent = section_frame
                })

                local toggle_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = toggle_frame.Size + Vector2.new(2, 2),
                    Filled = false,
                    Parent = toggle_frame
                })

                local toggle_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                    Color = Color3.fromRGB(30, 30, 30),
                    Size = toggle_frame.Size + Vector2.new(4, 4),
                    Filled = false,
                    Parent = toggle_frame
                })

                local toggle_gradient = utility:Draw("Image", Vector2.new(), {
                    Size = toggle_frame.Size,
                    Transparency = 0.8,
                    Parent = toggle_frame
                })

                local toggle_title = utility:Draw("Text", Vector2.new(15, -3), {
                    Color = unsafe and Color3.fromRGB(245, 239, 120) or Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Parent = toggle_frame
                })

                utility:Image(toggle_gradient, "https://i.imgur.com/5hmlrjX.png")

                function toggle:Set(value)
                    if unsafe and window.unsafe or not unsafe then
                        toggle.state = value
                        toggle_frame.Color = toggle.state and window.theme[1] or Color3.fromRGB(50, 50, 50)

                        if flag ~= "" then
                            library.flags[flag] = toggle.state
                        end

                        if typeof(toggle.keybind) == "table" and toggle.state then
                            if toggle.keybind.value ~= "..." then
                                window.keybinds:Add(string.format("[%s] " .. section.name .. ": " .. toggle.keybind.name, toggle.keybind.sinputs[toggle.keybind.value] or toggle.keybind.value:upper()))
                            end
                        elseif typeof(toggle.keybind) == "table" and toggle.state == false then
                            window.keybinds:Remove(string.format("[%s] " .. section.name .. ": " .. toggle.keybind.name, toggle.keybind.sinputs[toggle.keybind.value] or toggle.keybind.value:upper()))
                        end

                        callback(toggle.state)
                    end
                end

                function toggle:Get()
                    return toggle.state
                end

                function toggle:Keybind(args)
                    if toggle.colorpicker ~= nil then return end

                    args = args or {}

                    local kname = args.name or args.Name or args.kname or args.Kname or toggle.name
                    local default = (args.default or args.Default or args.def or args.Def or "..."):upper()
                    local kpointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. toggle.name .. "_keybind"
                    local callback = args.callback or args.Callback or function() end

                    local keybind = {name = kname, value = default, binding = false, mode = "Toggle", content = {}}

                    local keybind_frame = utility:Draw("Square", Vector2.new(171, -1), {
                        Color = Color3.fromRGB(25, 25, 25),
                        Size = Vector2.new(40, 12),
                        Parent = toggle_frame
                    })

                    local keybind_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                        Color = Color3.fromRGB(0, 0, 0),
                        Size = keybind_frame.Size + Vector2.new(2, 2),
                        Filled = false,
                        Parent = keybind_frame
                    })

                    local keybind_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                        Color = Color3.fromRGB(30, 30, 30),
                        Size = keybind_frame.Size + Vector2.new(4, 4),
                        Filled = false,
                        Parent = keybind_frame
                    })

                    local keybind_value = utility:Draw("Text", Vector2.new(20, -1), {
                        Color = Color3.fromRGB(255, 255, 255),
                        Outline = true,
                        Size = 13,
                        Font = 2,
                        Text = default,
                        Center = true,
                        Parent = keybind_frame
                    })

                    local shortenedInputs = {["Insert"] = "INS", ["LeftAlt"] = "LALT", ["LeftControl"] = "LC", ["LeftShift"] = "LS", ["RightAlt"] = "RALT", ["RightControl"] = "RC", ["RightShift"] = "RS", ["CapsLock"] = "CAPS", ["Delete"] = "DEL", ["PageUp"] = "PUP", ["PageDown"] = "PDO", ["Space"] = "SPAC"}

                    keybind.sinputs = shortenedInputs

                    function keybind:Set(value)
                        keybind.value = value
                        keybind_value.Text = keybind.value
                        callback(keybind.value)
                    end

                    function keybind:Get()
                        return keybind.value
                    end

                    utility:Connect(uis.InputBegan, function(input)
                        if not keybind.binding then
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                if not window:MouseOverContent() and not window.fading and tab.open then
                                    if #keybind.content > 0 then
                                        window:CloseContent()
                                        keybind.content = {}
                                    end
                                    if utility:MouseOverDrawing(keybind_frame) then
                                        keybind.binding = true
                                        keybind_value.Text = "..."
                                    end
                                elseif #keybind.content > 0 and window:MouseOverContent() and not window.fading and tab.open then
                                    for i, v in pairs({"Always", "Hold", "Toggle"}) do
                                        if utility:MouseOverPosition({keybind.content[1].Position + Vector2.new(0, 15 * (i - 1)), keybind.content[1].Position + Vector2.new(keybind.content[1].Size.X, 15 * i )}) then
                                            keybind.mode = v
                                            keybind.content[3 + i].Color = window.theme[1]
                                        else
                                            keybind.content[3 + i].Color = Color3.fromRGB(255, 255, 255)
                                        end
                                    end
                                end
                            elseif input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode.Name == keybind.value then
                                if #keybind.content > 0 then
                                    window:CloseContent()
                                    keybind.content = {}
                                end
                                if keybind.mode == "Toggle" then
                                    toggle:Set(not toggle.state)
                                else
                                    toggle:Set(true)
                                end
                            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                                if utility:MouseOverDrawing(keybind_frame) and not window:MouseOverContent() and not window.fading and tab.open then
                                    local keybind_open_frame = utility:Draw("Square", Vector2.new(1, 16), {
                                        Color = Color3.fromRGB(45, 45, 45),
                                        Size = Vector2.new(50, 45),
                                        Parent = keybind_frame
                                    })

                                    local keybind_open_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                        Color = Color3.fromRGB(20, 20, 20),
                                        Size = keybind_open_frame.Size + Vector2.new(2, 2),
                                        Filled = false,
                                        Parent = keybind_open_frame
                                    })

                                    local keybind_open_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                        Color = Color3.fromRGB(0, 0, 0),
                                        Size = keybind_open_frame.Size + Vector2.new(4, 4),
                                        Filled = false,
                                        Parent = keybind_open_frame
                                    })

                                    keybind.content = {keybind_open_frame, keybind_open_inline, keybind_open_outline}

                                    for i, v in pairs({"Always", "Hold", "Toggle"}) do
                                        local mode = utility:Draw("Text", Vector2.new(2, (15 * (i-1))), {
                                            Color = keybind.mode == v and window.theme[1] or Color3.fromRGB(255, 255, 255),
                                            Outline = true,
                                            Size = 13,
                                            Font = 2,
                                            Text = v,
                                            Center = false,
                                            Parent = keybind_open_frame
                                        })

                                        table.insert(keybind.content, mode)
                                    end

                                    window.content.keybind = keybind.content
                                end
                            end
                        else
                            if input.UserInputType == Enum.UserInputType.Keyboard then
                                if input.KeyCode.Name ~= "Escape" and input.KeyCode.Name ~= "Backspace" then
                                    keybind.binding = false
                                    keybind.value = input.KeyCode.Name
                                    keybind_value.Text = shortenedInputs[keybind.value] or keybind.value:upper()
                                else
                                    keybind.binding = false
                                    keybind_value.Text = shortenedInputs[keybind.value] or keybind.value:upper()
                                end
                            end
                        end
                    end)

                    utility:Connect(uis.InputEnded, function(input)
                        if not keybind.binding and input.UserInputType == Enum.UserInputType.Keyboard and keybind.mode == "Hold" and input.KeyCode.Name == keybind.value then
                            toggle:Set(false)
                        end
                    end)

                    toggle.keybind = keybind

                    library.pointers[kpointer] = keybind

                    section.instances = utility:Combine(section.instances, {keybind_frame, keybind_inline, keybind_outline, keybind_value})
                end

                function toggle:Colorpicker(args)
                    if toggle.keybind ~= nil then return end

                    args = args or {}

                    local cname = args.name or args.Name or "colorpicker"
                    local default = args.default or args.Default or args.def or args.Def or Color3.fromRGB(255, 0, 0)
                    local flag = args.flag or args.Flag or ""
                    local cpointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. toggle.name .. "_colorpicker"
                    local callback = args.callback or args.Callback or function() end

                    local colorpicker = {name = cname, value = {default:ToHSV()}, tempvalue = {}, brightness = {100, 0}, holding = {hue = false, brightness = false, color = false}, content = {}}

                    if flag ~= "" then
                        library.flags[flag] = default
                    end

                    local colorpicker_color = utility:Draw("Square", Vector2.new(section_frame.Size.X - 45, -1), {
                        Color = default,
                        Size = Vector2.new(24, 10),
                        Parent = toggle_frame
                    })

                    local colorpciker_inline1 = utility:Draw("Square", Vector2.new(), {
                        Color = Color3.fromRGB(0, 0, 0),
                        Size = colorpicker_color.Size,
                        Transparency = 0.3,
                        Filled = false,
                        Parent = colorpicker_color
                    })

                    local colorpciker_inline2 = utility:Draw("Square", Vector2.new(1, 1), {
                        Color = Color3.fromRGB(0, 0, 0),
                        Size = colorpicker_color.Size - Vector2.new(2, 2),
                        Transparency = 0.3,
                        Filled = false,
                        Parent = colorpicker_color
                    })

                    local colorpicker_outline = utility:Draw("Square", Vector2.new(-1, -1), {
                        Color = Color3.fromRGB(0, 0, 0),
                        Size = colorpicker_color.Size + Vector2.new(2, 2),
                        Filled = false,
                        Parent = colorpicker_color
                    })

                    function colorpicker:Set(value)
                        if typeof(value) == "Color3" then
                            value = {value:ToHSV()}
                        end

                        colorpicker.value = value
                        colorpicker_color.Color = Color3.fromHSV(unpack(colorpicker.value))

                        if flag ~= "" then
                            library.flags[flag] = Color3.fromHSV(unpack(colorpicker.value))
                        end

                        callback(Color3.fromHSV(unpack(colorpicker.value)))
                    end

                    function colorpicker:Get()
                        return colorpicker.value
                    end

                    utility:Connect(uis.InputBegan, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if #colorpicker.content == 0 and utility:MouseOverDrawing(colorpicker_color) and not window:MouseOverContent() and not window.fading and tab.open then
                                colorpicker.tempvalue = colorpicker.value
                                colorpicker.brightness[2] = 0

                                local colorpicker_open_frame = utility:Draw("Square", Vector2.new(12, 5), {
                                    Color = Color3.fromRGB(35, 35, 35),
                                    Size = Vector2.new(276, 207),
                                    Parent = colorpicker_color
                                })

                                local colorpicker_open_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                    Color = Color3.fromRGB(20, 20, 20),
                                    Size = colorpicker_open_frame.Size + Vector2.new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_frame.Size + Vector2.new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_accent1 = utility:Draw("Square", Vector2.new(0, 1), {
                                    Color = window.theme[1],
                                    Size = Vector2.new(colorpicker_open_frame.Size.X, 1),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_accent2 = utility:Draw("Square", Vector2.new(0, 2), {
                                    Color = window.theme[2],
                                    Size = Vector2.new(colorpicker_open_frame.Size.X, 1),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_inline2 = utility:Draw("Square", Vector2.new(0, 3), {
                                    Color = Color3.fromRGB(20, 20, 20),
                                    Size = Vector2.new(colorpicker_open_frame.Size.X, 1),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_title = utility:Draw("Text", Vector2.new(5, 6), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Outline = true,
                                    Size = 13,
                                    Font = 2,
                                    Text = colorpicker.name,
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_apply = utility:Draw("Text", Vector2.new(232, 187), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Outline = true,
                                    Size = 13,
                                    Font = 2,
                                    Text = "[ Apply ]",
                                    Center = true,
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_color = utility:Draw("Square", Vector2.new(10, 23), {
                                    Color = Color3.fromHSV(colorpicker.value[1], 1, 1),
                                    Size = Vector2.new(156, 156),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_color_image = utility:Draw("Image", Vector2.new(), {
                                    Size = colorpicker_open_color.Size,
                                    Parent = colorpicker_open_color
                                })

                                local colorpicker_open_color_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_color.Size + Vector2.new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_color
                                })

                                local colorpicker_open_color_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                    Color = Color3.fromRGB(30, 30, 30),
                                    Size = colorpicker_open_color.Size + Vector2.new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_color
                                })

                                local colorpicker_open_brightness_image = utility:Draw("Image", Vector2.new(10, 189), {
                                    Size = Vector2.new(156, 10),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_brightness_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_brightness_image.Size + Vector2.new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_brightness_image
                                })

                                local colorpicker_open_brightness_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                    Color = Color3.fromRGB(30, 30, 30),
                                    Size = colorpicker_open_brightness_image.Size + Vector2.new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_brightness_image
                                })

                                local colorpicker_open_hue_image = utility:Draw("Image", Vector2.new(176, 23), {
                                    Size = Vector2.new(10, 156),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_hue_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_hue_image.Size + Vector2.new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_hue_image
                                })

                                local colorpicker_open_hue_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                    Color = Color3.fromRGB(30, 30, 30),
                                    Size = colorpicker_open_hue_image.Size + Vector2.new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_hue_image
                                })

                                local colorpicker_open_newcolor_title = utility:Draw("Text", Vector2.new(196, 23), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Outline = true,
                                    Size = 13,
                                    Font = 2,
                                    Text = "New color",
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_newcolor_image = utility:Draw("Image", Vector2.new(197, 37), {
                                    Size = Vector2.new(71, 36),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_newcolor_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_newcolor_image.Size + Vector2.new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_newcolor_image
                                })

                                local colorpicker_open_newcolor_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                    Color = Color3.fromRGB(30, 30, 30),
                                    Size = colorpicker_open_newcolor_image.Size + Vector2.new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_newcolor_image
                                })

                                local colorpicker_open_newcolor = utility:Draw("Square", Vector2.new(2, 2), {
                                    Color = Color3.fromHSV(unpack(colorpicker.value)),
                                    Size = colorpicker_open_newcolor_image.Size - Vector2.new(4, 4),
                                    Transparency = 0.4,
                                    Parent = colorpicker_open_newcolor_image
                                })

                                local colorpicker_open_oldcolor_title = utility:Draw("Text", Vector2.new(196, 76), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Outline = true,
                                    Size = 13,
                                    Font = 2,
                                    Text = "Old color",
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_oldcolor_image = utility:Draw("Image", Vector2.new(197, 91), {
                                    Size = Vector2.new(71, 36),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_oldcolor_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_oldcolor_image.Size + Vector2.new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_oldcolor_image
                                })

                                local colorpicker_open_oldcolor_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                    Color = Color3.fromRGB(30, 30, 30),
                                    Size = colorpicker_open_oldcolor_image.Size + Vector2.new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_oldcolor_image
                                })

                                local colorpicker_open_oldcolor = utility:Draw("Square", Vector2.new(2, 2), {
                                    Color = Color3.fromHSV(unpack(colorpicker.value)),
                                    Size = colorpicker_open_oldcolor_image.Size - Vector2.new(4, 4),
                                    Transparency = 0.4,
                                    Parent = colorpicker_open_oldcolor_image
                                })

                                local colorpicker_open_color_holder = utility:Draw("Square", Vector2.new(colorpicker_open_color_image.Size.X - 5, 0), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Size = Vector2.new(5, 5),
                                    Filled = false,
                                    Parent = colorpicker_open_color_image
                                })

                                local colorpicker_open_color_holder_outline = utility:Draw("Square", Vector2.new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_color_holder.Size + Vector2.new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_color_holder
                                })

                                local colorpicker_open_hue_holder = utility:Draw("Square", Vector2.new(-1, 0), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Size = Vector2.new(12, 3),
                                    Filled = false,
                                    Parent = colorpicker_open_hue_image
                                })

                                colorpicker_open_hue_holder.Position = Vector2.new(colorpicker_open_hue_image.Position.X-1, colorpicker_open_hue_image.Position.Y + colorpicker.tempvalue[1] * colorpicker_open_hue_image.Size.Y)

                                local colorpicker_open_hue_holder_outline = utility:Draw("Square", Vector2.new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_hue_holder.Size + Vector2.new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_hue_holder
                                })

                                local colorpicker_open_brightness_holder = utility:Draw("Square", Vector2.new(colorpicker_open_brightness_image.Size.X, -1), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Size = Vector2.new(3, 12),
                                    Filled = false,
                                    Parent = colorpicker_open_brightness_image
                                })

                                colorpicker_open_brightness_holder.Position = Vector2.new(colorpicker_open_brightness_image.Position.X + colorpicker_open_brightness_image.Size.X * (colorpicker.brightness[1] / 100), colorpicker_open_brightness_image.Position.Y-1)

                                local colorpicker_open_brightness_holder_outline = utility:Draw("Square", Vector2.new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_brightness_holder.Size + Vector2.new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_brightness_holder
                                })

                                utility:Image(colorpicker_open_color_image, "https://i.imgur.com/wpDRqVH.png")
                                utility:Image(colorpicker_open_brightness_image, "https://i.imgur.com/jG3NjxN.png")
                                utility:Image(colorpicker_open_hue_image, "https://i.imgur.com/iEOsHFv.png")
                                utility:Image(colorpicker_open_newcolor_image, "https://i.imgur.com/kNGuTlj.png")
                                utility:Image(colorpicker_open_oldcolor_image, "https://i.imgur.com/kNGuTlj.png")

                                colorpicker.content = {colorpicker_open_frame, colorpicker_open_inline, colorpicker_open_outline, colorpicker_open_accent1, colorpicker_open_accent2, colorpicker_open_inline2, colorpicker_open_title, colorpicker_open_apply,
                                colorpicker_open_color, colorpicker_open_color_image, colorpicker_open_color_inline, colorpicker_open_color_outline, colorpicker_open_brightness_image, colorpicker_open_brightness_inline, colorpicker_open_brightness_outline,
                                colorpicker_open_hue_image, colorpicker_open_hue_inline, colorpicker_open_hue_outline, colorpicker_open_newcolor_title, colorpicker_open_newcolor_image, colorpicker_open_newcolor_inline, colorpicker_open_newcolor_outline,
                                colorpicker_open_newcolor, colorpicker_open_oldcolor_title, colorpicker_open_oldcolor_image, colorpicker_open_oldcolor_inline, colorpicker_open_oldcolor_outline, colorpicker_open_oldcolor, colorpicker_open_hue_holder_outline,
                                colorpicker_open_brightness_holder_outline, colorpicker_open_color_holder_outline, colorpicker_open_color_holder, colorpicker_open_hue_holder, colorpicker_open_brightness_holder}

                                window.content.colorpicker = colorpicker.content
                            elseif #colorpicker.content > 0 and not window:MouseOverContent() and not window.fading and tab.open then
                                window:CloseContent()
                                colorpicker.content = {}
                                for i, v in pairs(colorpicker.holding) do
                                    colorpicker.holding[i] = false
                                end
                            elseif #colorpicker.content > 0 and window.content.colorpicker and window:MouseOverContent() and not window.fading and tab.open then
                                if utility:MouseOverDrawing(colorpicker.content[10]) then
                                    local colorx = math.clamp(uis:GetMouseLocation().X - colorpicker.content[10].Position.X, 0, colorpicker.content[10].Position.X) /colorpicker.content[10].Size.X
                                    local colory = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y
                                    local s = colorx
                                    local v = (colorpicker.brightness[1] / 100) - colory

                                    colorpicker.brightness[2] = colory

                                    colorpicker.tempvalue = {colorpicker.tempvalue[1], s, v}

                                    local minPos = Vector2.new(colorpicker.content[10].Position.X, colorpicker.content[10].Position.Y)
                                    local maxPos = Vector2.new(colorpicker.content[10].Position.X + colorpicker.content[10].Size.X - 5, colorpicker.content[10].Position.Y + colorpicker.content[10].Size.Y - 5)
                                    local holderPos = uis:GetMouseLocation()
                                    if holderPos.X > maxPos.X then
                                        holderPos = Vector2.new(maxPos.X, holderPos.Y)
                                    end
                                    if holderPos.Y > maxPos.Y then
                                        holderPos = Vector2.new(holderPos.X, maxPos.Y)
                                    end
                                    if holderPos.X < minPos.X then
                                        holderPos = Vector2.new(minPos.X, holderPos.Y)
                                    end
                                    if holderPos.Y < minPos.Y then
                                        holderPos = Vector2.new(holderPos.X, minPos.Y)
                                    end
                                    colorpicker.content[32].Position = holderPos

                                    colorpicker.holding.color = true
                                elseif utility:MouseOverDrawing(colorpicker.content[16]) then
                                    local hue = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[16].Position.Y, 0, colorpicker.content[16].Size.Y) / colorpicker.content[16].Size.Y

                                    colorpicker.tempvalue = {hue, colorpicker.tempvalue[2], colorpicker.tempvalue[3]}

                                    colorpicker.content[33].Position = Vector2.new(colorpicker.content[16].Position.X-1, colorpicker.content[16].Position.Y + colorpicker.tempvalue[1] * colorpicker.content[16].Size.Y)

                                    colorpicker.content[9].Color = Color3.fromHSV(colorpicker.tempvalue[1], 1, 1)

                                    colorpicker.holding.hue = true
                                elseif utility:MouseOverDrawing(colorpicker.content[13]) then
                                    local percent = math.clamp(uis:GetMouseLocation().X - colorpicker.content[13].Position.X, 0, colorpicker.content[13].Size.X) / colorpicker.content[13].Size.X

                                    colorpicker.brightness[1] = 100 * percent

                                    colorpicker.tempvalue[3] = (colorpicker.brightness[1] / 100) - colorpicker.brightness[2]

                                    colorpicker.content[34].Position = Vector2.new(colorpicker.content[13].Position.X + colorpicker.content[13].Size.X * (colorpicker.brightness[1] / 100), colorpicker.content[13].Position.Y-1)

                                    colorpicker.holding.brightness = true
                                elseif utility:MouseOverPosition({colorpicker.content[8].Position - Vector2.new(colorpicker.content[8].TextBounds.X / 2, 0), colorpicker.content[8].Position + Vector2.new(colorpicker.content[8].TextBounds.X / 2, 13)}) then
                                    colorpicker:Set(colorpicker.tempvalue)
                                    colorpicker.tempvalue = colorpicker.value
                                    colorpicker.content[28].Color = Color3.fromHSV(unpack(colorpicker.value))
                                end
                                colorpicker.content[23].Color = Color3.fromHSV(unpack(colorpicker.tempvalue))
                            elseif #colorpicker.content > 0 and window.content.colorpickermenu and window:MouseOverContent() and not window.fading and tab.open then
                                for i = 1, 3 do
                                    if utility:MouseOverPosition({colorpicker.content[1].Position + Vector2.new(0, 15 * (i - 1)), colorpicker.content[1].Position + Vector2.new(colorpicker.content[1].Size.X, 15 * i )}) then
                                        if i == 1 then
                                            setclipboard("hsv(" .. tostring(colorpicker.value[1]) .. "," .. tostring(colorpicker.value[2]) .. "," .. tostring(colorpicker.value[3]) .. ")")
                                        elseif i == 2 then
                                            local clipboard = utility:GetClipboard():lower()
                                            if clipboard:find("hsv") ~= nil then
                                                local values = string.split(clipboard:sub(5, -2), ",")
                                                for i, v in pairs(values) do values[i] = tonumber(v) end
                                                colorpicker:Set(Color3.fromHSV(values[1], values[2], values[3]))
                                            end
                                        elseif i == 3 then
                                            colorpicker:Set(default)
                                        end
                                    end
                                end
                            end
                        elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                            if #colorpicker.content == 0 and utility:MouseOverDrawing(colorpicker_color) and not window:MouseOverContent() and not window.fading and tab.open then
                                window:CloseContent()
                                local colorpicker_open_frame = utility:Draw("Square", Vector2.new(45, -17), {
                                    Color = Color3.fromRGB(50, 50, 50),
                                    Size = Vector2.new(76, 45),
                                    Parent = colorpicker_color
                                })

                                local colorpicker_open_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                    Color = Color3.fromRGB(20, 20, 20),
                                    Size = colorpicker_open_frame.Size + Vector2.new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_frame.Size + Vector2.new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_gradient = utility:Draw("Image", Vector2.new(), {
                                    Size = colorpicker_open_frame.Size,
                                    Transparency = 0.615,
                                    Parent = colorpicker_open_frame
                                })

                                utility:Image(colorpicker_open_gradient, "https://i.imgur.com/5hmlrjX.png")

                                colorpicker.content = {colorpicker_open_frame, colorpicker_open_inline, colorpicker_open_outline, colorpicker_open_gradient}

                                for i, v in pairs({"Copy", "Paste", "To default"}) do
                                    local mode = utility:Draw("Text", Vector2.new(38, (15 * (i-1))), {
                                        Color = Color3.fromRGB(255, 255, 255),
                                        Outline = true,
                                        Size = 13,
                                        Font = 2,
                                        Text = v,
                                        Center = true,
                                        Parent = colorpicker_open_frame
                                    })

                                    table.insert(colorpicker.content, mode)
                                end

                                window.content.colorpickermenu = colorpicker.content
                            end
                        end
                    end)

                    utility:Connect(uis.InputChanged, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement and #colorpicker.content > 0 and window.content.colorpicker then
                            if colorpicker.holding.color then
                                local colorx = math.clamp(uis:GetMouseLocation().X - colorpicker.content[10].Position.X, 0, colorpicker.content[10].Position.X) /colorpicker.content[10].Size.X
                                local colory = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y
                                local s = colorx
                                local v = (colorpicker.brightness[1] / 100) - colory

                                colorpicker.brightness[2] = colory

                                colorpicker.tempvalue = {colorpicker.tempvalue[1], s, v}

                                local minPos = Vector2.new(colorpicker.content[10].Position.X, colorpicker.content[10].Position.Y)
                                local maxPos = Vector2.new(colorpicker.content[10].Position.X + colorpicker.content[10].Size.X - 5, colorpicker.content[10].Position.Y + colorpicker.content[10].Size.Y - 5)
                                local holderPos = uis:GetMouseLocation()
                                if holderPos.X > maxPos.X then
                                    holderPos = Vector2.new(maxPos.X, holderPos.Y)
                                end
                                if holderPos.Y > maxPos.Y then
                                    holderPos = Vector2.new(holderPos.X, maxPos.Y)
                                end
                                if holderPos.X < minPos.X then
                                    holderPos = Vector2.new(minPos.X, holderPos.Y)
                                end
                                if holderPos.Y < minPos.Y then
                                    holderPos = Vector2.new(holderPos.X, minPos.Y)
                                end
                                colorpicker.content[32].Position = holderPos
                            elseif colorpicker.holding.hue then
                                local hue = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[16].Position.Y, 0, colorpicker.content[16].Size.Y) / colorpicker.content[16].Size.Y

                                colorpicker.tempvalue = {hue, colorpicker.tempvalue[2], colorpicker.tempvalue[3]}

                                colorpicker.content[33].Position = Vector2.new(colorpicker.content[16].Position.X-1, colorpicker.content[16].Position.Y + colorpicker.tempvalue[1] * colorpicker.content[16].Size.Y)

                                colorpicker.content[9].Color = Color3.fromHSV(colorpicker.tempvalue[1], 1, 1)
                            elseif colorpicker.holding.brightness then
                                local percent = math.clamp(uis:GetMouseLocation().X - colorpicker.content[13].Position.X, 0, colorpicker.content[13].Size.X) / colorpicker.content[13].Size.X

                                local colory = math.clamp(colorpicker.content[31].Position.Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y

                                colorpicker.brightness[1] = 100 * percent

                                colorpicker.tempvalue[3] = (colorpicker.brightness[1] / 100) - colorpicker.brightness[2]

                                colorpicker.content[34].Position = Vector2.new(colorpicker.content[13].Position.X + colorpicker.content[13].Size.X * (colorpicker.brightness[1] / 100), colorpicker.content[13].Position.Y-1)
                            end
                            colorpicker.content[23].Color = Color3.fromHSV(unpack(colorpicker.tempvalue))
                        end
                    end)

                    utility:Connect(uis.InputEnded, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and #colorpicker.content > 0 then
                            for i, v in pairs(colorpicker.holding) do
                                colorpicker.holding[i] = false
                            end
                        end
                    end)

                    toggle.colorpicker = colorpicker

                    library.pointers[cpointer] = colorpicker

                    section.instances = utility:Combine(section.instances, {colorpicker_title, colorpicker_color, colorpciker_inline1, colorpciker_inline2, colorpicker_outline})

                    return colorpicker
                end

                toggle:Set(default)

                utility:Connect(uis.InputBegan, function(input)
                    local positions = {Vector2.new(section_frame.Position.X, toggle_frame.Position.Y - 3), Vector2.new(section_frame.Position.X + section_frame.Size.X, toggle_frame.Position.Y + 10)}

                    if typeof(toggle.keybind) == "table" or typeof(toggle.colorpicker) == "table" then
                        positions = {Vector2.new(section_frame.Position.X, toggle_frame.Position.Y - 3), Vector2.new(section_frame.Position.X + section_frame.Size.X - 50, toggle_frame.Position.Y + 10)}
                    end

                    if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverPosition(positions) and not window:MouseOverContent() and not window.fading and tab.open then
                        toggle:Set(not toggle.state)
                    end
                end)

                section.offset = section.offset + 17

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 19

                section:Update()

                library.pointers[pointer] = toggle

                section.instances = utility:Combine(section.instances, {toggle_frame, toggle_inline, toggle_outline, toggle_gradient, toggle_title})

                return toggle
            end

            function section:Button(args)
                args = args or {}

                local name = args.name or args.Name or "button"
                local callback = args.callback or args.Callback or function() end

                local button = {name = name, pressed = false}

                local button_frame = utility:Draw("Square", Vector2.new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(50, 50, 50),
                    Size = Vector2.new(210, 18),
                    Parent = section_frame
                })

                local button_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = button_frame.Size + Vector2.new(2, 2),
                    Filled = false,
                    Parent = button_frame
                })

                local button_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                    Color = Color3.fromRGB(30, 30, 30),
                    Size = button_frame.Size + Vector2.new(4, 4),
                    Filled = false,
                    Parent = button_frame
                })

                local button_gradient = utility:Draw("Image", Vector2.new(), {
                    Size = button_frame.Size,
                    Transparency = 0.8,
                    Parent = button_frame
                })

                local button_title = utility:Draw("Text", Vector2.new(105, 1), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Center = true,
                    Parent = button_frame
                })

                utility:Image(button_gradient, "https://i.imgur.com/5hmlrjX.png")

                utility:Connect(uis.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverPosition({Vector2.new(section_frame.Position.X, button_frame.Position.Y - 2), Vector2.new(section_frame.Position.X + section_frame.Size.X, button_frame.Position.Y + 20)}) and not window:MouseOverContent() and not window.fading and tab.open then
                        button.pressed = true
                        button_frame.Color = Color3.fromRGB(40, 40, 40)
                        callback()
                    end
                end)

                utility:Connect(uis.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and button.pressed then
                        button.pressed = false
                        button_frame.Color = Color3.fromRGB(50, 50, 50)
                    end
                end)

                section.offset = section.offset + 23

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 25

                section:Update()

                section.instances = utility:Combine(section.instances, {button_frame, button_inline, button_outline, button_gradient, button_title})
            end

            function section:SubButtons(args)
                args = args or {}
                local buttons_table = args.buttons or args.Buttons or {{"button 1", function() end}, {"button 2", function() end}}

                local buttons = {{}, {}}

                for i = 1, 2 do
                    local button_frame = utility:Draw("Square", Vector2.new(8 + (110 * (i-1)), 25 + section.offset), {
                        Color = Color3.fromRGB(50, 50, 50),
                        Size = Vector2.new(100, 18),
                        Parent = section_frame
                    })

                    local button_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                        Color = Color3.fromRGB(0, 0, 0),
                        Size = button_frame.Size + Vector2.new(2, 2),
                        Filled = false,
                        Parent = button_frame
                    })

                    local button_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                        Color = Color3.fromRGB(30, 30, 30),
                        Size = button_frame.Size + Vector2.new(4, 4),
                        Filled = false,
                        Parent = button_frame
                    })

                    local button_gradient = utility:Draw("Image", Vector2.new(), {
                        Size = button_frame.Size,
                        Transparency = 0.8,
                        Parent = button_frame
                    })

                    local button_title = utility:Draw("Text", Vector2.new(50, 1), {
                        Color = Color3.fromRGB(255, 255, 255),
                        Outline = true,
                        Size = 13,
                        Font = 2,
                        Text = buttons_table[i][1],
                        Center = true,
                        Parent = button_frame
                    })

                    utility:Image(button_gradient, "https://i.imgur.com/5hmlrjX.png")

                    buttons[i] = {button_frame, button_inline, button_outline, button_gradient, button_title}

                    section.instances = utility:Combine(section.instances, buttons[i])
                end

                utility:Connect(uis.InputBegan, function(input)
                    for i = 1, 2 do
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverDrawing(buttons[i][1]) and not window:MouseOverContent() and not window.fading and tab.open then
                            buttons[i][1].Color = Color3.fromRGB(30, 30, 30)
                            buttons_table[i][2]()
                        end
                    end
                end)

                utility:Connect(uis.InputEnded, function(input)
                    for i = 1, 2 do
                        buttons[i][1].Color = Color3.fromRGB(50, 50, 50)
                    end
                end)

                section.offset = section.offset + 23

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 25

                section:Update()
            end

            function section:Slider(args)
                args = args or {}

                local name = args.name or args.Name or "slider"
                local min = args.minimum or args.Minimum or args.min or args.Min or -25
                local max = args.maximum or args.Maximum or args.max or args.Max or 25
                local default = args.default or args.Default or args.def or args.Def or min
                local decimals = 1 / (args.decimals or args.Decimals or 1)
                local ending = args.ending or args.Ending or args.suffix or args.Suffix or args.suf or args.Suf or ""
                local callback = args.callback or args.Callback or function() end
                local flag = args.flag or args.Flag or ""
                local pointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. name

                local slider = {name = name, value = def, sliding = false}

                local slider_title = utility:Draw("Text", Vector2.new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Parent = section_frame
                })

                local slider_frame = utility:Draw("Square", Vector2.new(0, 16), {
                    Color = Color3.fromRGB(50, 50, 50),
                    Size = Vector2.new(210, 10),
                    Parent = slider_title
                })

                local slider_bar = utility:Draw("Square", Vector2.new(), {
                    Color = window.theme[1],
                    Size = Vector2.new(0, slider_frame.Size.Y),
                    Parent = slider_frame
                })

                local slider_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = slider_frame.Size + Vector2.new(2, 2),
                    Filled = false,
                    Parent = slider_frame
                })

                local slider_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                    Color = Color3.fromRGB(30, 30, 30),
                    Size = slider_frame.Size + Vector2.new(4, 4),
                    Filled = false,
                    Parent = slider_frame
                })

                local slider_gradient = utility:Draw("Image", Vector2.new(), {
                    Size = slider_frame.Size,
                    Transparency = 0.8,
                    Parent = slider_frame
                })

                local slider_value = utility:Draw("Text", Vector2.new(slider_frame.Size.X / 2, -2), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = tostring(default) .. ending,
                    Center = true,
                    Parent = slider_frame
                })

                utility:Image(slider_gradient, "https://i.imgur.com/5hmlrjX.png")

                function slider:Set(value)
                    slider.value = math.clamp(math.round(value * decimals) / decimals, min, max)
                    local percent = 1 - ((max - slider.value) / (max - min))
                    slider_value.Text = tostring(value) .. ending
                    slider_bar.Size = Vector2.new(percent * slider_frame.Size.X, slider_frame.Size.Y)

                    if flag ~= "" then
                        library.flags[flag] = slider.value
                    end

                    callback(slider.value)
                end

                function slider:Get()
                    return slider.value
                end

                slider:Set(default)

                utility:Connect(uis.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverPosition({Vector2.new(section_frame.Position.X, slider_title.Position.Y), Vector2.new(section_frame.Position.X + section_frame.Size.X, slider_title.Position.Y + 18 + slider_frame.Size.Y)}) and not window:MouseOverContent() and not window.fading and tab.open then
                        slider.holding = true
                        local percent = math.clamp(uis:GetMouseLocation().X - slider_bar.Position.X, 0, slider_frame.Size.X) / slider_frame.Size.X
                        local value = math.floor((min + (max - min) * percent) * decimals) / decimals
                        value = math.clamp(value, min, max)
                        slider:Set(value)
                    end
                end)

                utility:Connect(uis.InputChanged, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement and slider.holding then
                        local percent = math.clamp(uis:GetMouseLocation().X - slider_bar.Position.X, 0, slider_frame.Size.X) / slider_frame.Size.X
                        local value = math.floor((min + (max - min) * percent) * decimals) / decimals
                        value = math.clamp(value, min, max)
                        slider:Set(value)
                    end
                end)

                utility:Connect(uis.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and slider.holding then
                        slider.holding = false
                    end
                end)

                section.offset = section.offset + 32

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 34

                section:Update()

                library.pointers[pointer] = slider

                section.instances = utility:Combine(section.instances, {slider_frame, slider_bar, slider_inline, slider_outline, slider_gradient, slider_title, slider_value})

                return slider
            end

            function section:Dropdown(args)
                args = args or {}

                local name = args.name or args.Name or "dropdown"
                local options = args.options or args.Options or {"1", "2"}
                local multi = args.multi or args.Multi or false
                local default = args.default or args.Default or args.def or args.Def or (multi == false and options[1] or multi == true and {options[1]})
                local scrollable = args.scrollable or args.Scrollable or true
                local requiredOptions = args.requiredOptions or args.requiredoptions or 7
                local flag = args.flag or args.Flag or ""
                local pointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. name
                local callback = args.callback or args.Callback or function() end

                local dropdown = {name = name, options = options, value = default, multi = multi, open = false, search = "", scroll_min = 1, content = {}}

                if flag ~= "" then
                    library.flags[flag] = dropdown.value
                end

                function dropdown:ReadValue(val)
                    if not multi then
                        if utility:GetTextSize(dropdown.value, 2, 13).X >= 196 then
                            return "..."
                        else
                            return dropdown.value
                        end
                    else
                        local str = ""
                        for i, v in pairs(dropdown.value) do
                            if i < #dropdown.value then
                                str = str .. tostring(v) .. ", "
                            else
                                str = str .. tostring(v)
                            end
                        end
                        if utility:GetTextSize(str, 2, 13).X >= 186 then
                            return "..."
                        else
                            return str
                        end
                    end
                end

                local dropdown_title = utility:Draw("Text", Vector2.new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Parent = section_frame
                })

                local dropdown_frame = utility:Draw("Square", Vector2.new(0, 16), {
                    Color = Color3.fromRGB(50, 50, 50),
                    Size = Vector2.new(210, 18),
                    Parent = dropdown_title
                })

                local dropdown_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = dropdown_frame.Size + Vector2.new(2, 2),
                    Filled = false,
                    Parent = dropdown_frame
                })

                local dropdown_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                    Color = Color3.fromRGB(30, 30, 30),
                    Size = dropdown_frame.Size + Vector2.new(4, 4),
                    Filled = false,
                    Parent = dropdown_frame
                })

                local dropdown_gradient = utility:Draw("Image", Vector2.new(), {
                    Size = dropdown_frame.Size,
                    Transparency = 0.8,
                    Parent = dropdown_frame
                })

                local dropdown_value = utility:Draw("Text", Vector2.new(5, 1), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = dropdown:ReadValue(),
                    Parent = dropdown_frame
                })

                local dropdown_indicator = utility:Draw("Text", Vector2.new(dropdown_frame.Size.X - (multi and 22 or 12), 1), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = multi and "..." or "-",
                    Parent = dropdown_frame
                })

                utility:Image(dropdown_gradient, "https://i.imgur.com/5hmlrjX.png")

                function dropdown:Update()
                    if #dropdown.content > 0 then
                        for i, v in pairs({select(4, unpack(dropdown.content))}) do
                            v.Color = (multi == false and v.Text == dropdown.value and window.theme[1] or multi == true and table.find(dropdown.value, v.Text) and window.theme[1] or Color3.fromRGB(255, 255, 255))
                            if scrollable and #dropdown.options > (requiredOptions - 1) then
                                v.Visible = i >= dropdown.scroll_min and i <= dropdown.scroll_min + requiredOptions - 2
                                v.SetOffset(Vector2.new(4, 15 * (i-dropdown.scroll_min)))
                            end
                        end
                    end
                end

                function dropdown:Set(value)
                    dropdown.value = value
                    dropdown_value.Text = dropdown:ReadValue()
                    dropdown:Update()

                    if flag ~= "" then
                        library.flags[flag] = dropdown.value
                    end

                    callback(dropdown.value)
                end

                function dropdown:Get()
                    return dropdown.value
                end

                function dropdown:Refresh(options)
                    if #dropdown.content > 0 then
                        window:CloseContent()
                    end

                    dropdown.options = options
                    dropdown:Set(multi == false and dropdown.options[1] or multi == true and {dropdown.options[1]})
                end

                dropdown:Set(dropdown.value)

                utility:Connect(uis.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and not window:MouseOverContent() and not window.fading and tab.open then
                        if #dropdown.content == 0 and utility:MouseOverPosition({Vector2.new(section_frame.Position.X, dropdown_title.Position.Y), Vector2.new(section_frame.Position.X + section_frame.Size.X, dropdown_title.Position.Y + 20 + dropdown_frame.Size.Y)}) then
                            window:CloseContent()

                            dropdown.search = ""
                            dropdown.scroll_min = 0

                            local list_frame = utility:Draw("Square", Vector2.new(1, 20), {
                                Color = Color3.fromRGB(45, 45, 45),
                                Size = Vector2.new(dropdown_frame.Size.X - 2, #dropdown.options * 15),
                                Parent = dropdown_frame
                            })

                            if scrollable and #dropdown.options > (requiredOptions - 1) then
                                list_frame.Size = Vector2.new(dropdown_frame.Size.X - 2, (requiredOptions - 1) * 15)
                            end

                            local list_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = list_frame.Size + Vector2.new(2, 2),
                                Filled = false,
                                Parent = list_frame
                            })

                            local list_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = list_frame.Size + Vector2.new(4, 4),
                                Filled = false,
                                Parent = list_frame
                            })

                            dropdown.content = {list_frame, list_inline, list_outline}

                            for i, v in pairs(dropdown.options) do
                                local text = utility:Draw("Text", Vector2.new(4, 15 * (i - 1)), {
                                    Color = (multi == false and v == dropdown.value and window.theme[1] or multi == true and table.find(dropdown.value, v) and window.theme[1] or Color3.fromRGB(255, 255, 255)),
                                    Outline = true,
                                    Size = 13,
                                    Font = 2,
                                    Text = tostring(v),
                                    Parent = list_frame
                                })

                                if scrollable and #dropdown.options > (requiredOptions - 1) then
                                    text.Visible = i >= dropdown.scroll_min and i <= dropdown.scroll_min + requiredOptions - 1
                                end

                                table.insert(dropdown.content, text)
                            end

                            window.content.dropdown = dropdown.content
                        elseif #dropdown.content > 0 then
                            window:CloseContent()
                            dropdown.content = {}
                        end
                    elseif input.UserInputType == Enum.UserInputType.MouseButton1 and #dropdown.content > 0 and not window.fading and tab.open then
                        for i = 1, #dropdown.options do
                            if utility:MouseOverPosition({Vector2.new(dropdown.content[1].Position.X, dropdown.content[3 + i].Position.Y), Vector2.new(dropdown.content[1].Position.X + dropdown.content[1].Size.X, dropdown.content[3 + i].Position.Y + 15)}) then
                                if not dropdown.multi then
                                    dropdown:Set(dropdown.options[i])
                                else
                                    if table.find(dropdown.value, dropdown.options[i]) then
                                        dropdown:Set(utility:RemoveItem(dropdown.value, dropdown.options[i]))
                                    else
                                        table.insert(dropdown.value, dropdown.options[i])
                                        dropdown:Set(dropdown.value)
                                    end
                                end
                            end
                        end
                    elseif input.UserInputType == Enum.UserInputType.Keyboard and #dropdown.content > 4 and not window.fading and tab.open then
                        local key = input.KeyCode
                        if key.Name ~= "Backspace" then
                            dropdown.search = dropdown.search .. uis:GetStringForKeyCode(key):lower()
                        else
                            dropdown.search = dropdown.search:sub(1, -2)
                        end
                        if dropdown.search ~= "" then
                            for i, v in pairs({select(4, unpack(dropdown.content))}) do
                                if v.Color ~= window.theme[1] and v.Text:lower():find(dropdown.search) then
                                    v.Color = Color3.fromRGB(255, 255, 255)
                                elseif v.Color ~= window.theme[1] and not v.Text:lower():find(dropdown.search) then
                                    v.Color = Color3.fromRGB(155, 155, 155)
                                end
                            end
                        else
                            for i, v in pairs({select(4, unpack(dropdown.content))}) do
                                if v.Color ~= window.theme[1] then
                                    v.Color = Color3.fromRGB(255, 255, 255)
                                end
                            end
                        end
                    end
                end)

                utility:Connect(uis.InputChanged, function(input)
                    if #dropdown.content > 0 and not window.fading and tab.open then
                        if input.UserInputType == Enum.UserInputType.MouseWheel and scrollable and #dropdown.options > (requiredOptions - 1) then
                            local direction = input.Position.Z > 0 and "up" or "down"
                            if direction == "up" and dropdown.scroll_min > 1 then
                                dropdown.scroll_min = dropdown.scroll_min - 1
                            elseif direction == "down" and dropdown.scroll_min + requiredOptions - 2 < #dropdown.options then
                                dropdown.scroll_min = dropdown.scroll_min + 1
                            end

                            --dropdown.content[4].SetOffset(Vector2.new(dropdown.content[1].Size.X - 5, dropdown.scroll_min == 1 and 0 or ((#dropdown.options * 15) - dropdown.content[1].Size.Y) * (dropdown.scroll_min / #dropdown.options)))

                            dropdown:Update()
                        end
                    end
                end)

                section.offset = section.offset + 40

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 42

                section:Update()

                library.pointers[pointer] = dropdown

                section.instances = utility:Combine(section.instances, {dropdown_frame, dropdown_inline, dropdown_outline, dropdown_gradient, dropdown_title, dropdown_value, dropdown_indicator})

                return dropdown
            end

            function section:Textbox(args)
                args = args or {}

                local name = args.name or args.Name or "textbox"
                local default = args.default or args.Default or args.def or args.Def or ""
                local flag = args.flag or args.Flag or ""
                local pointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. name
                local callback = args.callback or args.Callback or function() end

                local textbox = {name = name, typing = false, hideHolder = false, value = ""}

                local textbox_frame = utility:Draw("Square", Vector2.new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(50, 50, 50),
                    Size = Vector2.new(210, 18),
                    Parent = section_frame
                })

                local textbox_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = textbox_frame.Size + Vector2.new(2, 2),
                    Filled = false,
                    Parent = textbox_frame
                })

                local textbox_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                    Color = Color3.fromRGB(30, 30, 30),
                    Size = textbox_frame.Size + Vector2.new(4, 4),
                    Filled = false,
                    Parent = textbox_frame
                })

                local textbox_gradient = utility:Draw("Image", Vector2.new(), {
                    Size = textbox_frame.Size,
                    Transparency = 0.8,
                    Parent = textbox_frame
                })

                local textbox_title = utility:Draw("Text", Vector2.new(4, 1), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Parent = textbox_frame
                })

                utility:Image(textbox_gradient, "https://i.imgur.com/5hmlrjX.png")

                function textbox:Set(value)
                    textbox.value = value
                    textbox_title.Text = textbox.typing == false and name or textbox.value
                    if flag ~= "" then
                        library.flags[flag] = textbox.value
                    end
                    callback(textbox.value)
                end

                function textbox:Get()
                    return textbox.value
                end

                utility:Connect(uis.InputBegan, function(input)
                    if not textbox.typing then
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverPosition({Vector2.new(section_frame.Position.X, textbox_frame.Position.Y - 2), Vector2.new(section_frame.Position.X + section_frame.Size.X, textbox_frame.Position.Y + 20)}) and not window:MouseOverContent() and not window.fading and tab.open then
                            textbox.typing = true
                            if textbox.hideHolder == false then
                                textbox.hideHolder = true
                                textbox_title.Text = textbox.value
                            end
                        end
                    else
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and not window:MouseOverContent() and not window.fading and tab.open then
                            textbox.typing = false
                            textbox.hideHolder = false
                            textbox_title.Text = name
                        elseif input.UserInputType == Enum.UserInputType.Keyboard then
                            local key = input.KeyCode
                            if key.Name ~= "Return" then
                                if key.Name ~= "Backspace" then
                                    if uis:GetStringForKeyCode(key) ~= "" then
                                        local key = uis:GetStringForKeyCode(key):lower()
                                        if uis:IsKeyDown("LeftShift") then
                                            key = utility:ShiftKey(key)
                                        end
                                        textbox.value = textbox.value .. key
                                        local time = 1
                                        spawn(function()
                                            task.wait(0.5)
                                            while uis:IsKeyDown(key.Name) do
                                                if not textbox.typing then break end
                                                task.wait(.2 / time)
                                                local key = uis:GetStringForKeyCode(key):lower()
                                                if uis:IsKeyDown("LeftShift") then
                                                    key = utility:ShiftKey(key)
                                                end
                                                textbox.value = textbox.value .. key
                                                time = time + 1
                                                textbox:Set(textbox.value)
                                            end
                                        end)
                                    end
                                else
                                    textbox.value = textbox.value:sub(1, -2)
                                    local time = 1
                                    spawn(function()
                                        task.wait(0.5)
                                        while uis:IsKeyDown(key.Name) do
                                            if not textbox.typing then break end
                                            task.wait(.2 / time)
                                            textbox.value = textbox.value:sub(1, -2)
                                            time = time + 1
                                            textbox:Set(textbox.value)
                                        end
                                    end)
                                end
                            else
                                textbox.typing = false
                                textbox.hideHolder = false
                                textbox_title.Text = name
                            end
                            if textbox.hideHolder == true then
                                textbox_title.Text = textbox.value
                                textbox:Set(textbox.value)
                            end
                        end
                    end
                end)

                if flag ~= "" then
                    library.flags[flag] = ""
                end

                section.offset = section.offset + 22

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 24

                library.pointers[pointer] = textbox

                section:Update()

                section.instances = utility:Combine(section.instances, {textbox_frame, textbox_inline, textbox_outline, textbox_gradient, textbox_title})
            end

            function section:Label(args)
                args = args or {}

                local name = args.name or args.Name or args.text or args.Text or "label"
                local middle = args.mid or args.Mid or args.middle or args.Middle or false
                local callback = args.callback or args.Callback or function() end

                local label = {name = name, middle = middle}

                local label_title = utility:Draw("Text", Vector2.new(middle == false and 9 or section_frame.Size.X / 2, 25 + section.offset), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Center = middle,
                    Parent = section_frame
                })

                section.offset = section.offset + 15

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 17

                section:Update()

                section.instances = utility:Combine(section.instances, {label_title})
            end

            function section:Colorpicker(args)
                args = args or {}

                local name = args.name or args.Name or "colorpicker"
                local default = args.default or args.Default or args.def or args.Def or Color3.fromRGB(255, 0, 0)
                local flag = args.flag or args.Flag or ""
                local pointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. name
                local callback = args.callback or args.Callback or function() end

                local colorpicker = {name = name, value = {default:ToHSV()}, tempvalue = {}, brightness = {100, 0}, holding = {hue = false, brightness = false, color = false}, content = {}}

                if flag ~= "" then
                    library.flags[flag] = default
                end

                local colorpicker_title = utility:Draw("Text", Vector2.new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Parent = section_frame
                })

                local colorpicker_color = utility:Draw("Square", Vector2.new(section_frame.Size.X - 45, 2), {
                    Color = default,
                    Size = Vector2.new(24, 10),
                    Parent = colorpicker_title
                })

                local colorpciker_inline1 = utility:Draw("Square", Vector2.new(), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = colorpicker_color.Size,
                    Transparency = 0.3,
                    Filled = false,
                    Parent = colorpicker_color
                })

                local colorpciker_inline2 = utility:Draw("Square", Vector2.new(1, 1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = colorpicker_color.Size - Vector2.new(2, 2),
                    Transparency = 0.3,
                    Filled = false,
                    Parent = colorpicker_color
                })

                local colorpicker_outline = utility:Draw("Square", Vector2.new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = colorpicker_color.Size + Vector2.new(2, 2),
                    Filled = false,
                    Parent = colorpicker_color
                })

                function colorpicker:Set(value)
                    if typeof(value) == "Color3" then
                        value = {value:ToHSV()}
                    end

                    colorpicker.value = value
                    colorpicker_color.Color = Color3.fromHSV(unpack(colorpicker.value))

                    if flag ~= "" then
                        library.flags[flag] = Color3.fromHSV(unpack(colorpicker.value))
                    end

                    callback(Color3.fromHSV(unpack(colorpicker.value)))
                end

                function colorpicker:Get()
                    return colorpicker.value
                end

                utility:Connect(uis.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if #colorpicker.content == 0 and utility:MouseOverDrawing(colorpicker_color) and not window:MouseOverContent() and not window.fading and tab.open then
                            window:CloseContent()
                            colorpicker.tempvalue = colorpicker.value
                            colorpicker.brightness[2] = 0

                            local colorpicker_open_frame = utility:Draw("Square", Vector2.new(12, 5), {
                                Color = Color3.fromRGB(35, 35, 35),
                                Size = Vector2.new(276, 207),
                                Parent = colorpicker_color
                            })

                            local colorpicker_open_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                Color = Color3.fromRGB(20, 20, 20),
                                Size = colorpicker_open_frame.Size + Vector2.new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_frame.Size + Vector2.new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_accent1 = utility:Draw("Square", Vector2.new(0, 1), {
                                Color = window.theme[1],
                                Size = Vector2.new(colorpicker_open_frame.Size.X, 1),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_accent2 = utility:Draw("Square", Vector2.new(0, 2), {
                                Color = window.theme[2],
                                Size = Vector2.new(colorpicker_open_frame.Size.X, 1),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_inline2 = utility:Draw("Square", Vector2.new(0, 3), {
                                Color = Color3.fromRGB(20, 20, 20),
                                Size = Vector2.new(colorpicker_open_frame.Size.X, 1),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_title = utility:Draw("Text", Vector2.new(5, 6), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Outline = true,
                                Size = 13,
                                Font = 2,
                                Text = colorpicker.name,
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_apply = utility:Draw("Text", Vector2.new(232, 187), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Outline = true,
                                Size = 13,
                                Font = 2,
                                Text = "[ Apply ]",
                                Center = true,
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_color = utility:Draw("Square", Vector2.new(10, 23), {
                                Color = Color3.fromHSV(colorpicker.value[1], 1, 1),
                                Size = Vector2.new(156, 156),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_color_image = utility:Draw("Image", Vector2.new(), {
                                Size = colorpicker_open_color.Size,
                                Parent = colorpicker_open_color
                            })

                            local colorpicker_open_color_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_color.Size + Vector2.new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_color
                            })

                            local colorpicker_open_color_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = colorpicker_open_color.Size + Vector2.new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_color
                            })

                            local colorpicker_open_brightness_image = utility:Draw("Image", Vector2.new(10, 189), {
                                Size = Vector2.new(156, 10),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_brightness_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_brightness_image.Size + Vector2.new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_brightness_image
                            })

                            local colorpicker_open_brightness_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = colorpicker_open_brightness_image.Size + Vector2.new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_brightness_image
                            })

                            local colorpicker_open_hue_image = utility:Draw("Image", Vector2.new(176, 23), {
                                Size = Vector2.new(10, 156),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_hue_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_hue_image.Size + Vector2.new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_hue_image
                            })

                            local colorpicker_open_hue_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = colorpicker_open_hue_image.Size + Vector2.new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_hue_image
                            })

                            local colorpicker_open_newcolor_title = utility:Draw("Text", Vector2.new(196, 23), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Outline = true,
                                Size = 13,
                                Font = 2,
                                Text = "New color",
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_newcolor_image = utility:Draw("Image", Vector2.new(197, 37), {
                                Size = Vector2.new(71, 36),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_newcolor_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_newcolor_image.Size + Vector2.new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_newcolor_image
                            })

                            local colorpicker_open_newcolor_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = colorpicker_open_newcolor_image.Size + Vector2.new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_newcolor_image
                            })

                            local colorpicker_open_newcolor = utility:Draw("Square", Vector2.new(2, 2), {
                                Color = Color3.fromHSV(unpack(colorpicker.value)),
                                Size = colorpicker_open_newcolor_image.Size - Vector2.new(4, 4),
                                Transparency = 0.4,
                                Parent = colorpicker_open_newcolor_image
                            })

                            local colorpicker_open_oldcolor_title = utility:Draw("Text", Vector2.new(196, 76), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Outline = true,
                                Size = 13,
                                Font = 2,
                                Text = "Old color",
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_oldcolor_image = utility:Draw("Image", Vector2.new(197, 91), {
                                Size = Vector2.new(71, 36),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_oldcolor_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_oldcolor_image.Size + Vector2.new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_oldcolor_image
                            })

                            local colorpicker_open_oldcolor_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = colorpicker_open_oldcolor_image.Size + Vector2.new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_oldcolor_image
                            })

                            local colorpicker_open_oldcolor = utility:Draw("Square", Vector2.new(2, 2), {
                                Color = Color3.fromHSV(unpack(colorpicker.value)),
                                Size = colorpicker_open_oldcolor_image.Size - Vector2.new(4, 4),
                                Transparency = 0.4,
                                Parent = colorpicker_open_oldcolor_image
                            })

                            local colorpicker_open_color_holder = utility:Draw("Square", Vector2.new(colorpicker_open_color_image.Size.X - 5, 0), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Size = Vector2.new(5, 5),
                                Filled = false,
                                Parent = colorpicker_open_color_image
                            })

                            local colorpicker_open_color_holder_outline = utility:Draw("Square", Vector2.new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_color_holder.Size + Vector2.new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_color_holder
                            })

                            local colorpicker_open_hue_holder = utility:Draw("Square", Vector2.new(-1, 0), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Size = Vector2.new(12, 3),
                                Filled = false,
                                Parent = colorpicker_open_hue_image
                            })

                            colorpicker_open_hue_holder.Position = Vector2.new(colorpicker_open_hue_image.Position.X-1, colorpicker_open_hue_image.Position.Y + colorpicker.tempvalue[1] * colorpicker_open_hue_image.Size.Y)

                            local colorpicker_open_hue_holder_outline = utility:Draw("Square", Vector2.new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_hue_holder.Size + Vector2.new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_hue_holder
                            })

                            local colorpicker_open_brightness_holder = utility:Draw("Square", Vector2.new(colorpicker_open_brightness_image.Size.X, -1), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Size = Vector2.new(3, 12),
                                Filled = false,
                                Parent = colorpicker_open_brightness_image
                            })

                            colorpicker_open_brightness_holder.Position = Vector2.new(colorpicker_open_brightness_image.Position.X + colorpicker_open_brightness_image.Size.X * (colorpicker.brightness[1] / 100), colorpicker_open_brightness_image.Position.Y-1)

                            local colorpicker_open_brightness_holder_outline = utility:Draw("Square", Vector2.new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_brightness_holder.Size + Vector2.new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_brightness_holder
                            })

                            utility:Image(colorpicker_open_color_image, "https://i.imgur.com/wpDRqVH.png")
                            utility:Image(colorpicker_open_brightness_image, "https://i.imgur.com/jG3NjxN.png")
                            utility:Image(colorpicker_open_hue_image, "https://i.imgur.com/iEOsHFv.png")
                            utility:Image(colorpicker_open_newcolor_image, "https://i.imgur.com/kNGuTlj.png")
                            utility:Image(colorpicker_open_oldcolor_image, "https://i.imgur.com/kNGuTlj.png")

                            colorpicker.content = {colorpicker_open_frame, colorpicker_open_inline, colorpicker_open_outline, colorpicker_open_accent1, colorpicker_open_accent2, colorpicker_open_inline2, colorpicker_open_title, colorpicker_open_apply,
                            colorpicker_open_color, colorpicker_open_color_image, colorpicker_open_color_inline, colorpicker_open_color_outline, colorpicker_open_brightness_image, colorpicker_open_brightness_inline, colorpicker_open_brightness_outline,
                            colorpicker_open_hue_image, colorpicker_open_hue_inline, colorpicker_open_hue_outline, colorpicker_open_newcolor_title, colorpicker_open_newcolor_image, colorpicker_open_newcolor_inline, colorpicker_open_newcolor_outline,
                            colorpicker_open_newcolor, colorpicker_open_oldcolor_title, colorpicker_open_oldcolor_image, colorpicker_open_oldcolor_inline, colorpicker_open_oldcolor_outline, colorpicker_open_oldcolor, colorpicker_open_hue_holder_outline,
                            colorpicker_open_brightness_holder_outline, colorpicker_open_color_holder_outline, colorpicker_open_color_holder, colorpicker_open_hue_holder, colorpicker_open_brightness_holder}

                            window.content.colorpicker = colorpicker.content
                        elseif #colorpicker.content > 0 and not window:MouseOverContent() and not window.fading and tab.open then
                            window:CloseContent()
                            colorpicker.content = {}
                            for i, v in pairs(colorpicker.holding) do
                                colorpicker.holding[i] = false
                            end
                        elseif #colorpicker.content > 0 and window.content.colorpicker and window:MouseOverContent() and not window.fading and tab.open then
                            if utility:MouseOverDrawing(colorpicker.content[10]) then
                                local colorx = math.clamp(uis:GetMouseLocation().X - colorpicker.content[10].Position.X, 0, colorpicker.content[10].Position.X) /colorpicker.content[10].Size.X
                                local colory = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y
                                local s = colorx
                                local v = (colorpicker.brightness[1] / 100) - colory

                                colorpicker.brightness[2] = colory

                                colorpicker.tempvalue = {colorpicker.tempvalue[1], s, v}

                                local minPos = Vector2.new(colorpicker.content[10].Position.X, colorpicker.content[10].Position.Y)
                                local maxPos = Vector2.new(colorpicker.content[10].Position.X + colorpicker.content[10].Size.X - 5, colorpicker.content[10].Position.Y + colorpicker.content[10].Size.Y - 5)
                                local holderPos = uis:GetMouseLocation()
                                if holderPos.X > maxPos.X then
                                    holderPos = Vector2.new(maxPos.X, holderPos.Y)
                                end
                                if holderPos.Y > maxPos.Y then
                                    holderPos = Vector2.new(holderPos.X, maxPos.Y)
                                end
                                if holderPos.X < minPos.X then
                                    holderPos = Vector2.new(minPos.X, holderPos.Y)
                                end
                                if holderPos.Y < minPos.Y then
                                    holderPos = Vector2.new(holderPos.X, minPos.Y)
                                end
                                colorpicker.content[32].Position = holderPos

                                colorpicker.holding.color = true
                            elseif utility:MouseOverDrawing(colorpicker.content[16]) then
                                local hue = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[16].Position.Y, 0, colorpicker.content[16].Size.Y) / colorpicker.content[16].Size.Y

                                colorpicker.tempvalue = {hue, colorpicker.tempvalue[2], colorpicker.tempvalue[3]}

                                colorpicker.content[33].Position = Vector2.new(colorpicker.content[16].Position.X-1, colorpicker.content[16].Position.Y + colorpicker.tempvalue[1] * colorpicker.content[16].Size.Y)

                                colorpicker.content[9].Color = Color3.fromHSV(colorpicker.tempvalue[1], 1, 1)

                                colorpicker.holding.hue = true
                            elseif utility:MouseOverDrawing(colorpicker.content[13]) then
                                local percent = math.clamp(uis:GetMouseLocation().X - colorpicker.content[13].Position.X, 0, colorpicker.content[13].Size.X) / colorpicker.content[13].Size.X

                                colorpicker.brightness[1] = 100 * percent

                                colorpicker.tempvalue[3] = (colorpicker.brightness[1] / 100) - colorpicker.brightness[2]

                                colorpicker.content[34].Position = Vector2.new(colorpicker.content[13].Position.X + colorpicker.content[13].Size.X * (colorpicker.brightness[1] / 100), colorpicker.content[13].Position.Y-1)

                                colorpicker.holding.brightness = true
                            elseif utility:MouseOverPosition({colorpicker.content[8].Position - Vector2.new(colorpicker.content[8].TextBounds.X / 2, 0), colorpicker.content[8].Position + Vector2.new(colorpicker.content[8].TextBounds.X / 2, 13)}) then
                                colorpicker:Set(colorpicker.tempvalue)
                                colorpicker.tempvalue = colorpicker.value
                                colorpicker.content[28].Color = Color3.fromHSV(unpack(colorpicker.value))
                            end
                            colorpicker.content[23].Color = Color3.fromHSV(unpack(colorpicker.tempvalue))
                        elseif #colorpicker.content > 0 and window.content.colorpickermenu and window:MouseOverContent() and not window.fading and tab.open then
                            for i = 1, 3 do
                                if utility:MouseOverPosition({colorpicker.content[1].Position + Vector2.new(0, 15 * (i - 1)), colorpicker.content[1].Position + Vector2.new(colorpicker.content[1].Size.X, 15 * i )}) then
                                    if i == 1 then
                                        setclipboard("hsv(" .. tostring(colorpicker.value[1]) .. "," .. tostring(colorpicker.value[2]) .. "," .. tostring(colorpicker.value[3]))
                                    elseif i == 2 then
                                        local clipboard = utility:GetClipboard():lower()
                                            if clipboard:find("hsv") ~= nil then
                                                local values = string.split(clipboard:sub(5, -2), ",")
                                                for i, v in pairs(values) do values[i] = tonumber(v) end
                                                colorpicker:Set(Color3.fromHSV(values[1], values[2], values[3]))
                                            end
                                    elseif i == 3 then
                                        colorpicker:Set(default)
                                    end
                                end
                            end
                        end
                    elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                        if #colorpicker.content == 0 and utility:MouseOverDrawing(colorpicker_color) and not window:MouseOverContent() and not window.fading and tab.open then
                            window:CloseContent()
                            local colorpicker_open_frame = utility:Draw("Square", Vector2.new(45, -17), {
                                Color = Color3.fromRGB(50, 50, 50),
                                Size = Vector2.new(76, 45),
                                Parent = colorpicker_color
                            })

                            local colorpicker_open_inline = utility:Draw("Square", Vector2.new(-1, -1), {
                                Color = Color3.fromRGB(20, 20, 20),
                                Size = colorpicker_open_frame.Size + Vector2.new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_outline = utility:Draw("Square", Vector2.new(-2, -2), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_frame.Size + Vector2.new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_gradient = utility:Draw("Image", Vector2.new(), {
                                Size = colorpicker_open_frame.Size,
                                Transparency = 0.615,
                                Parent = colorpicker_open_frame
                            })

                            utility:Image(colorpicker_open_gradient, "https://i.imgur.com/5hmlrjX.png")

                            colorpicker.content = {colorpicker_open_frame, colorpicker_open_inline, colorpicker_open_outline, colorpicker_open_gradient}

                            for i, v in pairs({"Copy", "Paste", "To default"}) do
                                local mode = utility:Draw("Text", Vector2.new(38, (15 * (i-1))), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Outline = true,
                                    Size = 13,
                                    Font = 2,
                                    Text = v,
                                    Center = true,
                                    Parent = colorpicker_open_frame
                                })

                                table.insert(colorpicker.content, mode)
                            end

                            window.content.colorpickermenu = colorpicker.content
                        end
                    end
                end)

                utility:Connect(uis.InputChanged, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement and #colorpicker.content > 23 and window.content.colorpicker then
                        if colorpicker.holding.color then
                            local colorx = math.clamp(uis:GetMouseLocation().X - colorpicker.content[10].Position.X, 0, colorpicker.content[10].Position.X) /colorpicker.content[10].Size.X
							local colory = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y
							local s = colorx
							local v = (colorpicker.brightness[1] / 100) - colory

                            colorpicker.brightness[2] = colory

                            colorpicker.tempvalue = {colorpicker.tempvalue[1], s, v}

                            local minPos = Vector2.new(colorpicker.content[10].Position.X, colorpicker.content[10].Position.Y)
                            local maxPos = Vector2.new(colorpicker.content[10].Position.X + colorpicker.content[10].Size.X - 5, colorpicker.content[10].Position.Y + colorpicker.content[10].Size.Y - 5)
                            local holderPos = uis:GetMouseLocation()
                            if holderPos.X > maxPos.X then
                                holderPos = Vector2.new(maxPos.X, holderPos.Y)
                            end
                            if holderPos.Y > maxPos.Y then
                                holderPos = Vector2.new(holderPos.X, maxPos.Y)
                            end
                            if holderPos.X < minPos.X then
                                holderPos = Vector2.new(minPos.X, holderPos.Y)
                            end
                            if holderPos.Y < minPos.Y then
                                holderPos = Vector2.new(holderPos.X, minPos.Y)
                            end
                            colorpicker.content[32].Position = holderPos
                        elseif colorpicker.holding.hue then
                            local hue = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[16].Position.Y, 0, colorpicker.content[16].Size.Y) / colorpicker.content[16].Size.Y

                            colorpicker.tempvalue = {hue, colorpicker.tempvalue[2], colorpicker.tempvalue[3]}

                            colorpicker.content[33].Position = Vector2.new(colorpicker.content[16].Position.X-1, colorpicker.content[16].Position.Y + colorpicker.tempvalue[1] * colorpicker.content[16].Size.Y)

                            colorpicker.content[9].Color = Color3.fromHSV(colorpicker.tempvalue[1], 1, 1)
                        elseif colorpicker.holding.brightness then
                            local percent = math.clamp(uis:GetMouseLocation().X - colorpicker.content[13].Position.X, 0, colorpicker.content[13].Size.X) / colorpicker.content[13].Size.X

                            local colory = math.clamp(colorpicker.content[31].Position.Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y

                            colorpicker.brightness[1] = 100 * percent

                            colorpicker.tempvalue[3] = (colorpicker.brightness[1] / 100) - colorpicker.brightness[2]

                            colorpicker.content[34].Position = Vector2.new(colorpicker.content[13].Position.X + colorpicker.content[13].Size.X * (colorpicker.brightness[1] / 100), colorpicker.content[13].Position.Y-1)
                        end
                        colorpicker.content[23].Color = Color3.fromHSV(unpack(colorpicker.tempvalue))
                    end
                end)

                utility:Connect(uis.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and #colorpicker.content > 23 then
                        for i, v in pairs(colorpicker.holding) do
                            colorpicker.holding[i] = false
                        end
                    end
                end)

                section.offset = section.offset + 17

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 19

                section:Update()

                library.pointers[pointer] = colorpicker

                section.instances = utility:Combine(section.instances, {colorpicker_title, colorpicker_color, colorpciker_inline1, colorpciker_inline2, colorpicker_outline})

                return colorpicker
            end

            return section
        end

        function tab:Update()
            function getUnderIndex(i, side)
                local count = 0
                for i2, v in pairs(tab.sections) do
                    if i2 < i and v.side == side then
                        count = count + v.instances[1].Size.Y + 9
                    end
                end
                return count
            end

            for i, v in pairs(tab.sections) do
                v.instances[1].SetOffset(Vector2.new(v.side == "left" and 9 or v.side == "right" and 245, 9 + getUnderIndex(i, v.side)))
            end
        end

        return tab
    end

    function window:Watermark()
        local watermark = {name = "beanbot", version = "dev", instances = {}, values = {}}

        local watermark_frame = utility:Draw("Square", Vector2.new(), {
            Color = Color3.fromRGB(50, 50, 50),
            Size = Vector2.new(223, 20),
            Position = Vector2.new(60, 10)
        }, true)

        local watermark_inline = utility:Draw("Square", Vector2.new(-1, -1), {
            Color = Color3.fromRGB(20, 20, 20),
            Size = watermark_frame.Size + Vector2.new(2, 2),
            Filled = false,
            Parent = watermark_frame
        }, true)

        local watermark_outline = utility:Draw("Square", Vector2.new(-2, -2), {
            Color = Color3.fromRGB(0, 0, 0),
            Size = watermark_frame.Size + Vector2.new(4, 4),
            Filled = false,
            Parent = watermark_frame
        }, true)

        local watermark_accent1 = utility:Draw("Square", Vector2.new(), {
            Color = window.theme[1],
            Size = Vector2.new(watermark_frame.Size.X, 1),
            Parent = watermark_frame
        }, true)

        local watermark_accent2 = utility:Draw("Square", Vector2.new(0, 1), {
            Color = window.theme[2],
            Size = Vector2.new(watermark_frame.Size.X, 1),
            Parent = watermark_frame
        }, true)

        local watermark_inline2 = utility:Draw("Square", Vector2.new(0, 2), {
            Color = Color3.fromRGB(20, 20, 20),
            Size = Vector2.new(watermark_frame.Size.X, 1),
            Parent = watermark_frame
        }, true)

        local watermark_gradient = utility:Draw("Image", Vector2.new(0, 3), {
            Size = watermark_frame.Size - Vector2.new(0, 3),
            Transparency = 0.75,
            Parent = watermark_frame
        }, true)

        local watermark_icon = utility:Draw("Image", Vector2.new(4, 2), {
            Size = Vector2.new(18, 18),
            Parent = watermark_frame
        }, true)

        local watermark_title = utility:Draw("Text", Vector2.new(28, 4), {
            Color = Color3.fromRGB(255, 255, 255),
            Outline = true,
            Size = 13,
            Font = 2,
            Text = watermark.name .. " | 0 fps | 0ms",
            Parent = watermark_frame
        }, true)

        utility:Image(watermark_gradient, "https://i.imgur.com/5hmlrjX.png")
        utility:Image(watermark_icon, "https://tr.rbxcdn.com/74ac16e97027fc4dd6cec71eb2932dba/420/420/Image/Png")

        function watermark:Property(i, v)
            if i == "Visible" then
                for i2, v2 in pairs(watermark.instances) do
                    v2.Visible = v
                end
            elseif i == "Icon" then
                if v:sub(1, 4) == "http" then
                    utility:Image(watermark_icon, v)
                else
                    watermark_icon.Data = v
                end
            elseif i == "Name" then
                watermark.name = v
            end
        end

        utility:Connect(rs.RenderStepped, function(delta)
            watermark.values[1] = math.floor(1 / delta)
            watermark.values[2] = math.floor(game.Stats.PerformanceStats.Ping:GetValue())
        end)

        spawn(function()
            while task.wait(0.1) do
                if rawget(watermark_title, "__OBJECT_EXIST") then
                    watermark_title.Text = watermark.name .. " | " .. watermark.version .. " | " .. tostring(watermark.values[1]) .. " fps | " .. tostring(watermark.values[2]) .. "ms"
                    watermark_frame.Size = Vector2.new(32 + watermark_title.TextBounds.X, 20)
                    watermark_inline.Size = watermark_frame.Size + Vector2.new(2, 2)
                    watermark_outline.Size = watermark_frame.Size + Vector2.new(4, 4)
                    watermark_gradient.Size = watermark_frame.Size
                    watermark_accent1.Size = Vector2.new(watermark_frame.Size.X, 1)
                    watermark_accent2.Size = Vector2.new(watermark_frame.Size.X, 1)
                    watermark_inline2.Size = Vector2.new(watermark_frame.Size.X, 1)
                else
                    break
                end
            end
        end)

        watermark.instances = {watermark_frame, watermark_inline, watermark_outline, watermark_accent1, watermark_accent2, watermark_inline2, watermark_gradient, watermark_icon, watermark_title}

        watermark:Property("Visible", false)

        window.watermark = watermark
    end

    function window:Keybinds()
        local keybinds = {instances = {}, keybinds = {}}

        local keybinds_frame = utility:Draw("Square", Vector2.new(), {
            Color = Color3.fromRGB(50, 50, 50),
            Size = Vector2.new(62, 18),
            Position = Vector2.new(10, math.floor(utility:ScreenSize().Y / 2))
        }, true)

        local keybinds_inline = utility:Draw("Square", Vector2.new(-1, -1), {
            Color = Color3.fromRGB(20, 20, 20),
            Size = keybinds_frame.Size + Vector2.new(2, 2),
            Filled = false,
            Parent = keybinds_frame
        }, true)

        local keybinds_outline = utility:Draw("Square", Vector2.new(-2, -2), {
            Color = Color3.fromRGB(0, 0, 0),
            Size = keybinds_frame.Size + Vector2.new(4, 4),
            Filled = false,
            Parent = keybinds_frame
        }, true)

        local keybinds_accent1 = utility:Draw("Square", Vector2.new(), {
            Color = window.theme[1],
            Size = Vector2.new(keybinds_frame.Size.X, 1),
            Parent = keybinds_frame
        }, true)

        local keybinds_accent2 = utility:Draw("Square", Vector2.new(0, 1), {
            Color = window.theme[2],
            Size = Vector2.new(keybinds_frame.Size.X, 1),
            Parent = keybinds_frame
        }, true)

        local keybinds_inline2 = utility:Draw("Square", Vector2.new(0, 2), {
            Color = Color3.fromRGB(20, 20, 20),
            Size = Vector2.new(keybinds_frame.Size.X, 1),
            Parent = keybinds_frame
        }, true)

        local keybinds_gradient = utility:Draw("Image", Vector2.new(0, 3), {
            Size = keybinds_frame.Size - Vector2.new(0, 3),
            Transparency = 0.8,
            Parent = keybinds_frame
        }, true)

        local keybinds_title = utility:Draw("Text", Vector2.new(2, 2), {
            Color = Color3.fromRGB(255, 255, 255),
            Outline = true,
            Size = 13,
            Font = 2,
            Text = "Keybinds",
            Parent = keybinds_frame
        }, true)

        utility:Image(keybinds_gradient, "https://i.imgur.com/5hmlrjX.png")

        function keybinds:Longest()
            if #keybinds.keybinds > 0 then
                local copy = utility:CopyTable(keybinds.keybinds)
                table.sort(copy, function(a, b)
                    return utility:GetTextSize(a, 2, 13).X > utility:GetTextSize(b, 2, 13).X
                end)
                return utility:GetTextSize(copy[1], 2, 13).X
            end
            return 0
        end

        function keybinds:Redraw()
            for _, v in pairs({select(9, unpack(keybinds.instances))}) do
                v.Remove()
            end

            keybinds.instances = {keybinds_frame, keybinds_inline, keybinds_outline, keybinds_accent1, keybinds_accent2, keybinds_inline2, keybinds_gradient, keybinds_title}

            if keybinds:Longest() + 6 > 60 then
                keybinds_frame.Size = Vector2.new(keybinds:Longest() + 6, (#keybinds.keybinds + 1) * 16 + 2)
                keybinds_inline.Size = keybinds_frame.Size + Vector2.new(2, 2)
                keybinds_outline.Size = keybinds_frame.Size + Vector2.new(4, 4)
                keybinds_accent1.Size = Vector2.new(keybinds_frame.Size.X, 1)
                keybinds_accent2.Size = Vector2.new(keybinds_frame.Size.X, 1)
                keybinds_inline2.Size = Vector2.new(keybinds_frame.Size.X, 1)
                keybinds_gradient.Size = keybinds_frame.Size
            else
                keybinds_frame.Size = Vector2.new(60, (#keybinds.keybinds + 1) * 16 + 2)
                keybinds_inline.Size = keybinds_frame.Size + Vector2.new(2, 2)
                keybinds_outline.Size = keybinds_frame.Size + Vector2.new(4, 4)
                keybinds_accent1.Size = Vector2.new(keybinds_frame.Size.X, 1)
                keybinds_accent2.Size = Vector2.new(keybinds_frame.Size.X, 1)
                keybinds_inline2.Size = Vector2.new(keybinds_frame.Size.X, 1)
                keybinds_gradient.Size = keybinds_frame.Size
            end

            for i, v in pairs(keybinds.keybinds) do
                local keybind_title = utility:Draw("Text", Vector2.new(2, 16 * i + 2), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = v,
                    Parent = keybinds_frame,
                    Visible = keybinds_frame.Visible
                }, true)

                table.insert(keybinds.instances, keybind_title)
            end
        end

        function keybinds:Add(name)
            if not table.find(keybinds.keybinds, name) then
                table.insert(keybinds.keybinds, name)
                keybinds:Redraw()
            end
        end

        function keybinds:Remove(name)
            if table.find(keybinds.keybinds, name) then
                table.remove(keybinds.keybinds, table.find(keybinds.keybinds, name))
                keybinds:Redraw()
            end
        end

        function keybinds:Property(i, v)
            if i == "Visible" then
                for _, v2 in pairs(keybinds.instances) do
                    v2.Visible = v
                end
            end
        end

        keybinds.instances = {keybinds_frame, keybinds_inline, keybinds_outline, keybinds_accent1, keybinds_accent2, keybinds_inline2, keybinds_gradient, keybinds_title}

        keybinds:Property("Visisble", false)

        window.keybinds = keybinds
    end

    function window:ChangeAccent(atype, color)
        atype = atype:lower() == "accent1" and 1 or 2
        for i, v in pairs(utility:Combine(library.drawings, library.hidden)) do
            if library.loaded and v[3] == "Square" and typeof(v[1].Color) == "Color3" and v[1].Color:ToHex() == window.theme[atype]:ToHex() then
                v[1].Color = color
            end
        end
        window.theme[atype] = color
    end

    function window:Unsafe(value)
        window.unsafe = value
    end

    function window:Rename(value)
        title.Text = value
    end

    function window:GetConfig()
        local config = {}
        for i, v in pairs(library.pointers) do
            config[i] = v:Get()
        end
        return game:GetService("HttpService"):JSONEncode(config)
    end

    function window:LoadConfig(config)
        config = game:GetService("HttpService"):JSONDecode(config)
        if config["Settings_UI_Allow unsafe features"] then
            library.pointers["Settings_UI_Allow unsafe features"]:Set(config["Settings_UI_Allow unsafe features"])
        end
        for i, v in pairs(config) do
            if library.pointers[i] then
                spawn(function() library.pointers[i]:Set(v) end)
            end
        end
    end

    function window:Update()
        for i, v in pairs(window.tabs) do
            v:Update()
        end
        window:UpdateTabs()
    end

    function window:MouseOverContent()
        if window_frame.Visible then
            if window.content.dropdown then
                return utility:MouseOverDrawing(window.content.dropdown[1])
            elseif window.content.colorpicker then
                return utility:MouseOverDrawing(window.content.colorpicker[1])
            elseif window.content.keybind then
                return utility:MouseOverDrawing(window.content.keybind[1])
            elseif window.content.colorpickermenu then
                return utility:MouseOverDrawing(window.content.colorpickermenu[1])
            end
        end
        return not window_frame.Visible
    end

    function window:CloseContent()
        if window.content.dropdown then
            for i, v in pairs(window.content.dropdown) do
                v.Remove()
            end
            window.content.dropdown = nil
        elseif window.content.colorpicker then
            for i, v in pairs(window.content.colorpicker) do
                v.Remove()
            end
            window.content.colorpicker = nil
        elseif window.content.keybind then
            for i, v in pairs(window.content.keybind) do
                v.Remove()
            end
            window.content.keybind = nil
        elseif window.content.colorpickermenu then
            for i, v in pairs(window.content.colorpickermenu) do
                v.Remove()
            end
            window.content.colorpickermenu = nil
        end
    end

    function window:UpdateTabs()
        for _, v in pairs(window.tabs) do
            if v.open == false then
                v:Hide()
            else
                v:Show()
            end
        end
    end

    function window:SetTab(name)
        for _, v in pairs(window.tabs) do
            if v.name == name then
                v.open = true
            else
                v.open = false
            end
        end
        window:UpdateTabs()
        window:CloseContent()
    end

    function window:Cursor()
        local cursor = utility:Draw("Triangle", nil, {
            Thickness = 0,
            Filled = true,
            Color = accent1,
            ZIndex = 65
        }, true)

        local cursor_outline = utility:Draw("Triangle", nil, {
            Thickness = 1.5,
            Filled = false,
            ZIndex = 65
        }, true)

        utility:Connect(rs.RenderStepped, function()
            if window_frame.Visible then
                for i, v in pairs(window.cursor) do
                    v[1].PointA = uis:GetMouseLocation()
                    v[1].PointB = uis:GetMouseLocation() + Vector2.new(16, 6)
                    v[1].PointC = uis:GetMouseLocation() + Vector2.new(6, 16)
                end
            end
        end)

        window.cursor = {{cursor, 1}, {cursor_outline, 1}}
    end

    function window:Load(tab)
        getgenv().window_state = "pre"
        window:SetTab(tab or window.tabs[1].name)
        task.wait(0.3)
        getgenv().window_state = "initializing"
        window:Watermark()
        window:Keybinds()
        window:Cursor()
        library.loaded = true
        task.wait(0.3)
        getgenv().window_state = "post"
        task.wait(0.5)
        window:Toggle()
        repeat task.wait() until window.fading == false
        getgenv().window_state = "finished"
    end

    function window:Unload()
        for i, v in pairs(library.connections) do
            v:Disconnect()
        end
        for i, v in pairs(utility:Combine(library.drawings, library.hidden)) do
            v[1].Remove()
        end

        cas:UnbindAction("beanbotkeyboard")
        cas:UnbindAction("beanbotwheel")
        cas:UnbindAction("beanbotm1")
        cas:UnbindAction("beanbotm2")

        library.loaded = false
        uis.MouseIconEnabled = true
    end

    return window
end

local desync_stuff = {frames = {}, mode = "default"}

function desync_stuff:GetOrigin()
    return desync_stuff["origin"] or CFrame.new()
end

function desync_stuff:SetOrigin(new)
    desync_stuff["origin"] = new
end

function desync_stuff.step(a, origin)
    frames = desync_stuff.frames

    if isAlive(lplr) then
        frames[#frames + 1] = origin

        if desync_stuff["mode"] == "default" then
            if frames[#frames - a] ~= nil then
                desync_stuff:SetOrigin(frames[#frames - a])
            else
                desync_stuff:SetOrigin(frames[#frames])
            end
        end
    end
end

local frames_stuff = {}

local icons_stuff = {["Default"] = "https://tr.rbxcdn.com/74ac16e97027fc4dd6cec71eb2932dba/420/420/Image/Png", ["Azure"] = "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Microsoft_Azure.svg/1200px-Microsoft_Azure.svg.png"}

local ragebot_target = nil
local ragebot_wallbang = false
local to_kill = {}

local kbot_target = nil

local autobought = false

lplr.CharacterAdded:Connect(function()
    autobought = false
end)

local loadout = {
    ["T"] = {
        {
            ["Slot"] = 1,
            ["Weapons"] = {
                "Glock-17",
                "Dual Berettas",
                "P250",
                "TEC-9",
                "Deagle"
            }
        },
        {
            ["Slot"] = 2,
            ["Weapons"] = {
                "Nova",
                "XM1014",
                "Sawed Off",
                "M249",
                "MG42"
            }
        },
        {
            ["Slot"] = 3,
            ["Weapons"] = {
                "MAC-10",
                "MP5",
                "UMP-45",
                "P90",
                "Thompson"
            }
        },
        {
            ["Slot"] = 4,
            ["Weapons"] = {
                "Galil SAR",
                "AK-47",
                "Scout",
                "SG 553",
                "AWP",
                "G3SG1"
            }
        }
    },
    ["CT"] = {
        {
            ["Slot"] = 1,
            ["Weapons"] = {
                "PX4",
                "Dual Berettas",
                "P250",
                "Five-seveN",
                "Deagle"
            }
        },
        {
            ["Slot"] = 2,
            ["Weapons"] = {
                "Nova",
                "XM1014",
                "MAG-7",
                "M249",
                "MG42"
            }
        },
        {
            ["Slot"] = 3,
            ["Weapons"] = {
                "MP9",
                "MP5",
                "UMP-45",
                "P90",
                "Thompson"
            }
        },
        {
            ["Slot"] = 4,
            ["Weapons"] = {
                "FAMAS F1",
                "M4A4",
                "Scout",
                "AUG A3",
                "AWP",
                "G3SG1"
            }
        }
    }
}

function ParseIcon(i)
    assert(typeof(i) == "table", "[BEANBOT] - Icon error.")
    assert(typeof(i.name) == "string", "[BEANBOT] - Unnamed icon.")
    function ParseContent(c, i2)
        local content

        if i.write == true then
            assert(i.writepath ~= nil, ("[BEANBOT] - No write path for icon [%s]."):format(i.name))

            if typeof(i.writepath) == "table" then
                if isfile(i.writepath[i2]) then
                    content = readfile(i.writepath[i2])
                end
            else
                if isfile(i.writepath) then
                    content = readfile(i.writepath)
                end
            end
        end

        if (i.type ~= "http" and content or i.type == "http") then
            if i.type:lower() == "http" then
                if content == nil then
                    content = utility:PreloadImage(c)
                else
                    spawn(function()
                        utility:PreloadImage(c)
                    end)
                end
            elseif i.type:lower() == "read" then
                content = i.path and isfile(i.path) and readfile(i.path) or assert(("[BEANBOT] - Wrong path for icon named [%s]."):format(tostring(i.name)))
                if typeof(i.content) == "table" then
                    i.content[table.find(i.content, c)] = content
                else
                    i.content = content
                end
            elseif i.type:lower() == "base64" then
                local base64_decode = (syn ~= nil and syn.crypt.base64.decode or Krnl.Base64.Decode or crypt ~= nil and crypt.base64decode)
                content = base64_decode(c)
                if typeof(i.content) == "table" then
                    i.content[table.find(i.content, c)] = content
                else
                    i.content = content
                end
            end
        end

        if i.write == true then
            if typeof(i.writepath) == "table" then
                if not isfile(i.writepath[i2]) then
                    writefile(i.writepath[i2], content)
                end
            else
                if not isfile(i.writepath) then
                    writefile(i.writepath, content)
                end
            end
        end
    end
    if typeof(i.content) == "table" then
        for i2, v in pairs(i.content) do
            ParseContent(v, i2)
        end
    else
        ParseContent(i.content, 1)
    end
end

for i, v in pairs(game:GetService("HttpService"):JSONDecode(readfile("beanbot/icons.json"))) do
    ParseIcon(v)
    icons_stuff[v.name] = v
end

function scan(ins)
    return {
        ins.Position + (Vector3.new(ins.Size.X, 0, 0) / 2),
        ins.Position - (Vector3.new(ins.Size.X, 0, 0) / 2),
        ins.Position + (Vector3.new(0, ins.Size.Y, 0) / 2),
        ins.Position - (Vector3.new(0, ins.Size.Y, 0) / 2),
        ins.Position + (Vector3.new(0, 0, ins.Size.Z) / 2),
        ins.Position - (Vector3.new(0, 0, ins.Size.Z) / 2),
        ins.Position,
    }
end

function scan_advanced(ins)
    return {
        ins.Position + (Vector3.new(ins.Size.X, 0, 0) / 2),
        ins.Position - (Vector3.new(ins.Size.X, 0, 0) / 2),
        ins.Position + (Vector3.new(0, ins.Size.Y, 0) / 2),
        ins.Position - (Vector3.new(0, ins.Size.Y, 0) / 2),
        ins.Position + (Vector3.new(0, 0, ins.Size.Z) / 2),
        ins.Position - (Vector3.new(0, 0, ins.Size.Z) / 2),
        ins.Position + (Vector3.new(ins.Size.X, ins.Size.Y, 0) / 2),
        ins.Position - (Vector3.new(ins.Size.X, ins.Size.Y, 0) / 2),
        ins.Position + (Vector3.new(0, ins.Size.Y, ins.Size.Z) / 2),
        ins.Position - (Vector3.new(0, ins.Size.Y, ins.Size.Z) / 2),
        ins.Position + (Vector3.new(ins.Size.X, 0, ins.Size.Z) / 2),
        ins.Position - (Vector3.new(ins.Size.X, 0, ins.Size.Z) / 2),
        ins.Position + (Vector3.new(-ins.Size.X, ins.Size.Y, 0) / 2),
        ins.Position + (Vector3.new(ins.Size.X, -ins.Size.Y, 0) / 2),
        ins.Position + (Vector3.new(0, -ins.Size.Y, ins.Size.Z) / 2),
        ins.Position + (Vector3.new(0, ins.Size.Y, -ins.Size.Z) / 2),
        ins.Position + (Vector3.new(-ins.Size.X, 0, ins.Size.Z) / 2),
        ins.Position + (Vector3.new(ins.Size.X, 0, -ins.Size.Z) / 2),
        ins.Position + (Vector3.new(-ins.Size.X, ins.Size.Y, ins.Size.Z) / 2),
        ins.Position + (Vector3.new(ins.Size.X, -ins.Size.Y, ins.Size.Z) / 2),
        ins.Position + (Vector3.new(ins.Size.X, ins.Size.Y, -ins.Size.Z) / 2),
        ins.Position + (Vector3.new(-ins.Size.X, -ins.Size.Y, ins.Size.Z) / 2),
        ins.Position + (Vector3.new(ins.Size.X, -ins.Size.Y, -ins.Size.Z) / 2),
        ins.Position + (Vector3.new(-ins.Size.X, ins.Size.Y, -ins.Size.Z) / 2),
        ins.Position + (ins.Size / 2),
        ins.Position - (ins.Size / 2),
        ins.Position,
    }
end

function getDamageMultiplier(p)
    return p.Name:find("Head") and 4 or (p.Name:find("Leg") or p.Name:find("Foot")) and 0.75 or (p.Name:find("Arm") or p.Name:find("Hand") or p.Name == "LowerTorso") and 1 or p.Name == "UpperTorso" and 1.25 or 0
end

function getDamage(hit, plr, dmgmod)
    if isAlive(lplr) and typeof(hit) == "table" and client.gun ~= nil and client.gun:FindFirstChild("DMG") and getDamageMultiplier(hit[1]) ~= nil then
        local damage_mod = (dmgmod or 1) * getDamageMultiplier(hit[1])

        local range_mod = client.gun.RangeModifier.Value / 100
        local fell_off = math.clamp(range_mod ^ (0 / (500 * 0.0694)), 0.45, 1)
        local dmg = client.gun.DMG.Value * damage_mod

        return math.max(client.gun.MinDmg.Value * dmg, dmg * fell_off)
    end
    return 0
end

function is_visible(origin, position, accuracy, ignore)
    local hit, pos = workspace:FindPartOnRayWithIgnoreList(Ray.new(origin, (position - origin).Unit * (position - origin).Magnitude), ignore, false, true)

    return (pos - position).Magnitude <= accuracy, hit, pos
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

function isTarget(plr, teammates)
	if isAlive(plr) then
		if not plr.Neutral and not lplr.Neutral then
			if teammates == false then
				return plr.Team ~= lplr.Team
			elseif teammates == true then
				return plr ~= lplr
			end
		else
			return plr ~= lplr
		end
	end
end

function getConfigs()
    local configs = {"-"}
    for i, v in pairs(listfiles("beanbot/cb/configs/")) do
        if tostring(v):sub(-5, -1) == ".bean" then
            table.insert(configs, tostring(v):sub(20, -6))
        end
    end
    return configs
end

function indexListing(a)
    local b = {}
    for i, v in pairs(a) do
        table.insert(b, i)
    end
    return b
end

function equip_weapon(a)

    client.getSelected = function()
        return a
    end

    client.giveTool()

    client.getSelected = old_getselected
end

function client_rbm(m)
    client["Button2" .. m]()
end
--[[
local fake_killfeed = Instance.new("Model")
fake_killfeed.Name = "1"

local values = {
    {Name = "Active", Class = "BoolValue", Value = true}
    {Name = "Killer", Class = "StringValue", Value = "", Instances = {
        {Name = "TeamColor", Class = "Color3Value", Value = Color3.new(1, 1, 1)}
    }},
    {Name = "Victim", Class = "StringValue", Value = "", Instances = {
        {Name = "TeamColor", Class = "Color3Value", Value = Color3.new(1, 1, 1)}
    }},
    {Name = "Weapon", Class = "StringValue", Value = "", Instances = {
        {Name = "Headshot", Class = "StringValue", Value = ""},
        {Name = "Wallbang", Class = "StringValue", Value = ""}
    }}
    {Name = "time", Class = "NumberValue", Value = 0},
    {Name = "Assist", Class = "StringValue", Value = "", Instances = {
        {Name = "TeamColor", Class = "Color3Value", Value = Color3.new(1, 1, 1)}
    }}
}]]

function newInstance(class, props)
    local obj = Instance.new(class)

    for i, v in pairs(props) do
        obj[i] = v
    end

    return obj
end

--[[for i, v in pairs(values) do
    local ins = newInstance(v.Class, {
        Parent = fake_killfeed,
        Name = v.Name,
        Value = v.Value
    })

    for i, v in pairs(v.Instances or {}) do
        newInstance(v.Class, {
            Parent = ins,
            Name = v.Name,
            Value = v.Value
        })
    end
end]]

local skyboxes = {
    ["-"] = {},
	["Galaxy"] = {
		SkyboxBk = "rbxassetid://159454299",
		SkyboxDn = "rbxassetid://159454296",
		SkyboxFt = "rbxassetid://159454293",
		SkyboxLf = "rbxassetid://159454286",
		SkyboxRt = "rbxassetid://159454300",
		SkyboxUp = "rbxassetid://159454288",
	},
	["Purple"] = {
		SkyboxBk = "rbxassetid://570557514",
		SkyboxDn = "rbxassetid://570557775",
		SkyboxFt = "rbxassetid://570557559",
		SkyboxLf = "rbxassetid://570557620",
		SkyboxRt = "rbxassetid://570557672",
		SkyboxUp = "rbxassetid://570557727",
	},
	["Purple Night"] = {
		SkyboxBk = "rbxassetid://296908715",
		SkyboxDn = "rbxassetid://296908724",
		SkyboxFt = "rbxassetid://296908740",
		SkyboxLf = "rbxassetid://296908755",
		SkyboxRt = "rbxassetid://296908764",
		SkyboxUp = "rbxassetid://296908769",
	}
}

local hitsound_stuff = {{}, {}}

local window = library:New({name = "beanbot"})

local rage = window:Tab({name = "Rage"})
local visuals = window:Tab({name = "Visuals"})
local misc = window:Tab({name = "Misc"})
local exploits = window:Tab({name = "Exploits"})
local settings = window:Tab({name = "Settings"})

local rage_aimbot = rage:Section({name = "Ragebot"})
local rage_knifebot = rage:Section({name = "Knifebot", side = "right"})
local rage_antiaim = rage:Section({name = "Anti-aim", side = "right"})

local visuals_esp = visuals:Section({name = "ESP"})
local visuals_self = visuals:Section({name = "Self"})
local visuals_other = visuals:Section({name = "Other"})
local visuals_world = visuals:Section({name = "World", side = "right"})
local visuals_weapons = visuals:Section({name = "Weapon Changer", side = "right"})
local visuals_viewmodel = visuals:Section({name = "Viewmodel", side = "right"})

local misc_desync = misc:Section({name = "Desync"})
local misc_movement = misc:Section({name = "Movement", side = "right"})
local misc_killall = misc:Section({name = "Kill all", side = "right"})

local exploits_client = exploits:Section({name = "Client"})
local exploits_autobuy = exploits:Section({name = "Autobuy"})

local settings_ui = settings:Section({name = "UI"})
local settings_config = settings:Section({name = "Config"})
local settings_game = settings:Section({name = "Game", side = "right"})

rage_aimbot:Toggle({name = "Enabled", unsafe = true, flag = "rage_enabled"})
rage_aimbot:Dropdown({name = "Hitboxes", options = {"Head", "Torso", "Arms", "Legs"}, multi = true, flag = "rage_hitboxes"})
rage_aimbot:Dropdown({name = "Multipoints", options = {"Off", "Normal", "Advanced"}, flag = "rage_multipoints"})
rage_aimbot:Toggle({name = "Autowall", flag = "rage_autowall"})
rage_aimbot:Toggle({name = "Autoshoot", flag = "rage_autoshoot"})
rage_aimbot:Slider({name = "Min. damage", min = 0, max = 100, default = 20, flag = "rage_min"})
rage_aimbot:Toggle({name = "Double tap", flag = "rage_dt"})
rage_aimbot:Toggle({name = "On preparation", flag = "rage_prep"})

-- // some gay features

rage_aimbot:Label({name = "- Dangerous features -", middle = true})

rage_aimbot:Slider({name = "Penetration modifier", min = 1, max = 5, flag = "rage_mod"})
rage_aimbot:Label({name = "Forward track", middle = true})
rage_aimbot:Toggle({name = "Forward track", flag = "rage_ftrack"})
rage_aimbot:Slider({name = "Forward track amount", min = 0.5, max = 15, default = 1.5, decimals = 0.5, flag = "rage_ftrack_amount"})
rage_aimbot:Slider({name = "Backtrack offset", min = 0, max = 360, default = 0, ending = " frames", flag = "rage_backtrack"})

rage_knifebot:Toggle({name = "Enabled", unsafe = true, flag = "kbot_enabled"}):Keybind()
rage_knifebot:Toggle({name = "Auto equip", unsafe = true, default = true, flag = "kbot_equip"})
rage_knifebot:Toggle({name = "Stab", flag = "kbot_stab"})
rage_knifebot:Slider({name = "Distance", min = 5, max = 200, default = 10, ending = " studs", flag = "kbot_dist"})

rage_antiaim:Toggle({name = "Enabled", unsafe = true, flag = "aa_enabled"}):Keybind()
rage_antiaim:Dropdown({name = "Yaw", options = {"None", "Spin"}, flag = "aa_yaw"})
rage_antiaim:Slider({name = "Yaw offset", min = -180, max = 180, default = 0, ending = "°", flag = "aa_offset"})
rage_antiaim:Dropdown({name = "Pitch", options = {"Default", "Up", "Down", "Zero", "Random", "Smooth"}, flag = "aa_pitch"})

visuals_esp:Toggle({name = "Enabled", flag = "esp_enabled"}):Keybind()
visuals_esp:Toggle({name = "Teammates", flag = "esp_teammates"})
visuals_esp:Toggle({name = "Box", flag = "esp_box"}):Colorpicker({name = "Box color", flag = "esp_box_color", def = Color3.fromRGB(255, 255, 255)})
visuals_esp:Toggle({name = "Health", flag = "esp_health"}):Colorpicker({name = "Health color", flag = "esp_health_color", def = Color3.fromRGB(0, 255, 0)})
visuals_esp:Toggle({name = "Name", flag = "esp_name"}):Colorpicker({name = "Name color", flag = "esp_name_color", def = Color3.fromRGB(255, 255, 255)})
visuals_esp:Toggle({name = "Weapon", flag = "esp_weapon"}):Colorpicker({name = "Weapon color", flag = "esp_weapon_color", def = Color3.fromRGB(255, 255, 255)})
visuals_esp:Toggle({name = "Out of FOV", flag = "esp_arrows"}):Colorpicker({name = "Out of FOV color", flag = "esp_arrows_color", def = Color3.fromRGB(255, 255, 255)})
visuals_esp:Toggle({name = "Chams", flag = "esp_chams"}):Colorpicker({name = "Chams color", flag = "esp_chams_color", def = Color3.fromRGB(255, 0, 0)})
visuals_esp:Toggle({name = "Chams outline", flag = "esp_chams_outline"}):Colorpicker({name = "Chams outline color", flag = "esp_chams_outline_color", def = Color3.fromRGB(0, 0, 0)})
visuals_esp:Slider({name = "Arrows offset", min = 1, max = 30, default = 10, flag = "esp_arrows_offset"})

visuals_other:Toggle({name = "No Flash", flag = "ot_flash", callback = function()
    lplr.PlayerGui.Blnd.Enabled = library.flags["ot_flash"]
end})
visuals_other:Toggle({name = "No Smoke", flag = "ot_smoke"})
--visuals_other:Toggle({name = "No Kill Feed", flag = "ot_nokf"})

--[[visuals_other:Toggle({name = "No Hit Sounds (stgui)", flag = "ot_noh"})
visuals_other:Toggle({name = "No Hit Sounds (LocalPlayer)", flag = "nohitsound2_flag"})
visuals_other:Toggle({name = "No Hit Sounds (replic)", flag = "nohitsound2_flag"})]]

visuals_other:Toggle({name = "Force Crosshair", flag = "ot_fc"})
visuals_other:Toggle({name = "No gun bob", flag = "ot_no_bob"})
visuals_other:Dropdown({name = "Skybox", options = indexListing(skyboxes), flag = "ot_skybox"})

visuals_world:Toggle({name = "Enabled", flag = "enabled_worldflag"})
visuals_world:Toggle({name = "Better Shadow", flag = "betshadflag", callback = function(state)
    sethiddenproperty(game.Lighting, "Technology", library.flags["enabled_worldflag"] and state and "ShadowMap" or "Legacy")
end})
visuals_world:Colorpicker({name = "Ambient", flag = "OutDooram_colorflag", def = Color3.fromRGB(255, 255, 255), callback = function(val)
    game.Lighting.Ambient = library.flags["enabled_worldflag"] and val or Color3.new(1, 1, 1)
    game.Lighting.OutdoorAmbient = library.flags["enabled_worldflag"] and val or Color3.new(1, 1, 1)
end})
visuals_world:Colorpicker({name = "Tint", flag = "tintcolor_colorflag", def = Color3.fromRGB(255, 255, 255), callback = function(val)
	workspace.CurrentCamera.ColorCorrection.TintColor = library.flags["enabled_worldflag"] and val or Color3.new(1, 1, 1)
end})
visuals_world:Colorpicker({name = "Fog", flag = "fogcolor_flag", def = Color3.fromRGB(255, 255, 255), callback = function(val)
    game.Lighting.FogEnd = library.flags["enabled_worldflag"] and 1000 or 9e9
    game.Lighting.FogStart = library.flags["enabled_worldflag"] and 1000 or 9e9
    game.Lighting.FogColor = val
end})
visuals_world:Slider({name = "Time Changer", min = 10, max = 30, default = 15, decimals = 0.5, ending = "hr", flag = "time_flag", callback = function(state)
	game.Lighting.TimeOfDay = library.flags["enabled_worldflag"] and state or 12
end})

visuals_weapons:Toggle({name = "Enabled", flag = "view_w_enabled"}):Colorpicker({cname = "Color", flag = "view_w_color", def = Color3.fromRGB(255, 255, 255)})
visuals_weapons:Dropdown({name = "Material", options = {"Plastic", "Neon", "Ghost", "Glass"}, flag = "view_w_material"})
visuals_weapons:Slider({name = "Transparency", min = 0, max = 100, default = 0, ending = "", flag = "view_w_trans"})
visuals_weapons:Slider({name = "Reflectance", min = 0, max = 100, default = 0, ending = "", flag = "view_w_ref"})

visuals_viewmodel:Toggle({name = "Enabled", flag = "view_enabled"})
visuals_viewmodel:Slider({name = "X", min = -180, max = 180, default = 0, ending = "°", flag = "view_x"})
visuals_viewmodel:Slider({name = "Y", min = -180, max = 180, default = 0, ending = "°", flag = "view_y"})
visuals_viewmodel:Slider({name = "Z", min = -180, max = 180, default = 0, ending = "°", flag = "view_z"})
visuals_viewmodel:Slider({name = "Roll", min = -180, max = 180, default = 0, ending = "°", flag = "view_roll"})

visuals_self:Toggle({name = "Third person", flag = "s_tper"}):Keybind()
visuals_self:Slider({name = "Third person distance", min = 10, max = 30, default = 15, decimals = 0.5, ending = "studs", flag = "s_tper_distance"})

misc_desync:Toggle({name = "Enabled", unsafe = true, flag = "desync_enabled"}):Keybind()
misc_desync:Slider({name = "Frames offset", min = 0, max = 360, default = 0, flag = "desync_frames_offset"})
misc_desync:Dropdown({name = "Mode", options = {"-", "Offset", "Random", "Invisible"}, flag = "desync_mode"})
misc_desync:Dropdown({name = "Rotation", options = {"Manual", "Random"}, flag = "desync_rotation"})

misc_desync:Label({name = "Offset mode", middle = true})

misc_desync:Slider({name = "Offset X", min = -10, max = 10, def = 0, suf = "st", flag = "desync_offset_x"})
misc_desync:Slider({name = "Offset Y", min = -10, max = 10, def = 0, suf = "st", flag = "desync_offset_y"})
misc_desync:Slider({name = "Offset Z", min = -10, max = 10, def = 0, suf = "st", flag = "desync_offset_z"})

misc_desync:Label({name = "Random mode", middle = true})

misc_desync:Slider({name = "Random X", min = 0, max = 35, def = 10, suf = "st", flag = "desync_random_x"})
misc_desync:Slider({name = "Random Y", min = 0, max = 35, def = 10, suf = "st", flag = "desync_random_y"})
misc_desync:Slider({name = "Random Z", min = 0, max = 35, def = 10, suf = "st", flag = "desync_random_z"})

misc_desync:Label({name = "Manual rotation", middle = true})

misc_desync:Slider({name = "Manual X", min = -180, max = 180, def = 0, suf = "°", flag = "desync_manual_x"})
misc_desync:Slider({name = "Manual Y", min = -180, max = 180, def = 0, suf = "°", flag = "desync_manual_y"})
misc_desync:Slider({name = "Manual Z", min = -180, max = 180, def = 0, suf = "°", flag = "desync_manual_z"})

misc_desync:Button({name = "Reset", callback = function()
    local values = {{"Misc_Desync_Offset ", 0}, {"Misc_Desync_Manual ", 0}, {"Misc_Desync_Random ", 10}}
    for _, v in pairs(values) do
        for _, v2 in pairs({"X", "Y", "Z"}) do
            library.pointers[v[1] .. v2]:Set(v[2])
        end
    end
end})

misc_movement:Toggle({name = "Bunnyhop", unsafe = true, flag = "m_bhop_enabled"}):Keybind()
misc_movement:Slider({name = "Bunnyhop speed", min = 15, max = 300, default = 60, ending = "studs/s", flag = "m_bhop_speed"})

misc_killall:Toggle({name = "Enabled", unsafe = true, flag = "kall_enabled"}):Keybind()
misc_killall:Slider({name = "Hits per run", min = 1, max = 60, default = 5, ending = " hit(s)", flag = "kall_hpr"})
misc_killall:Toggle({name = "On preparation", flag = "kall_prep"})

exploits_client:Dropdown({name = "Select", options = {"Ammo", "Firerate", "Recoil"}, def = {}, multi = true, flag = "gunmods"})
exploits_client:Toggle({name = "Infinite cash", flag = "inf_cash"})
exploits_client:Toggle({name = "No footstep sound", flag = "no_footstep"})
exploits_client:Toggle({name = "Prevent replication", flag = "prev_replication"}):Keybind()

exploits_autobuy:Toggle({name = "Enabled", unsafe = true, flag = "abuy_enabled"}):Keybind()
exploits_autobuy:Dropdown({name = "Primary page", options = {"Heavy", "SMGS", "Rifles"}, flag = "abuy_page"})
exploits_autobuy:Dropdown({name = "Primary", options = {"-", "1", "2", "3", "4", "5", "6"}, flag = "abuy_primary"})
exploits_autobuy:Dropdown({name = "Secondary", options = {"-", "1", "2", "3", "4", "5"}, flag = "abuy_secondary"})

settings_ui:Toggle({name = "Allow unsafe features", flag = "ui_unsafe", callback = function() if library.loaded then window:Unsafe(library.flags["ui_unsafe"]) end end})
settings_ui:Toggle({name = "Watermark", flag = "ui_watermark", callback = function() if library.loaded then window.watermark:Property("Visible", library.flags["ui_watermark"]) end end})
settings_ui:Toggle({name = "Keybinds", flag = "ui_keybinds", callback = function() if library.loaded then window.keybinds:Property("Visible", library.flags["ui_keybinds"]) end end})
settings_ui:Textbox({name = "Custom cheat name", flag = "ui_name", callback = function() window:Rename(library.flags["ui_name"]) if library.loaded then window.watermark:Property("Name", library.flags["ui_name"]) end end})
settings_ui:Dropdown({name = "Icon", options = indexListing(icons_stuff), default = "Default", flag = "ui_icon", callback = function()
    if library.loaded then
        local icon = tostring(library.flags["ui_icon"])
        if typeof(icons_stuff[icon]) == "string" then
            window.watermark:Property("Icon", icons_stuff[icon])
        elseif typeof(icons_stuff[icon]) == "table" then
            if typeof(icons_stuff[icon].content) == "table" then
                local frame = 0
                while library.flags["ui_icon"] == icon and library.loaded do
                    local icon2 = icons_stuff[icon]
                    frame = frame + 1
                    if frame > #icon2.content then
                        frame = 1
                    end

                    local fps = icon2.fps or 60

                    window.watermark:Property("Icon", icon2.content[frame])

                    task.wait(1/fps)
                end
            else
                window.watermark:Property("Icon", icons_stuff[icon].content)
            end
        end
    end
end})
settings_ui:Colorpicker({name = "Accent 1", def = Color3.fromRGB(127, 72, 163), flag = "ui_accent1", callback = function() window:ChangeAccent("accent1", library.flags["ui_accent1"]) end})
settings_ui:Colorpicker({name = "Accent 2", def = Color3.fromRGB(87, 32, 127), flag = "ui_accent2", callback = function() window:ChangeAccent("accent2", library.flags["ui_accent2"]) end})
settings_ui:Button({name = "Unload", callback = function() window:Unload() end})

settings_config:Textbox({name = "Config name", flag = "config_name"})
settings_config:Dropdown({name = "Saved configs", options = getConfigs(), flag = "config_selected"})
settings_config:SubButtons({buttons = {
    {"Save", function()
        writefile("beanbot/cb/configs/" .. library.flags["config_name"] .. ".bean", window:GetConfig())
    end},
    {"Load", function()
        if isfile("beanbot/cb/configs/" .. library.flags["config_selected"] .. ".bean") then
            window:LoadConfig(readfile("beanbot/cb/configs/" .. library.flags["config_selected"] .. ".bean"))
        end
    end}
}})
settings_config:Button({name = "Refresh", callback = function() library.pointers["Settings_Config_Saved configs"]:Refresh(getConfigs()) end})

settings_game:Slider({name = "Fps cap", min = 30, max = 240, def = 144, flag = "game_fps_cap", callback = function() if not library.flags["game_unlimited_fps"] then setfpscap(library.flags["game_fps_cap"]) end end})
settings_game:Toggle({name = "Unlocked fps cap", flag = "game_unlimited_fps", callback = function() setfpscap(library.flags["game_unlimited_fps"] == true and 2^17 or library.flags["game_fps_cap"]) end})

utility:Connect(rs.RenderStepped, function() -- ragebot yay!!1
    ragebot_target = nil
    to_kill = {}

    if library.flags["inf_cash"] then
        lplr.Cash.Value = 2^31
    end

    if library.flags["ot_skybox"] ~= "-" then
        local skybox = game.Lighting:FindFirstChild("$$$ skybox $$$") or Instance.new("Sky")
		skybox.Parent = game.Lighting
		skybox.Name = "$$$ skybox $$$"

		skybox.SkyboxBk = skyboxes[library.flags["ot_skybox"]].SkyboxBk
		skybox.SkyboxDn = skyboxes[library.flags["ot_skybox"]].SkyboxDn
		skybox.SkyboxFt = skyboxes[library.flags["ot_skybox"]].SkyboxFt
		skybox.SkyboxLf = skyboxes[library.flags["ot_skybox"]].SkyboxLf
		skybox.SkyboxRt = skyboxes[library.flags["ot_skybox"]].SkyboxRt
		skybox.SkyboxUp = skyboxes[library.flags["ot_skybox"]].SkyboxUp
    else
        if game.Lighting:FindFirstChild("$$$ skybox $$$") then
            game.Lighting:FindFirstChild("$$$ skybox $$$"):Destroy()
        end
    end

    if workspace.CurrentCamera:FindFirstChild("Arms") and library.flags["view_w_enabled"] then
        for i, v in pairs(workspace.CurrentCamera.Arms:GetChildren()) do
            if v:IsA("BasePart") and not v.Name:find("Arm") and not v.Name ~= "Flash" and v.Transparency ~= 1 then

                if v:IsA("MeshPart") then
                    v.TextureID = library.flags["view_w_material"] == "Ghost" and "rbxassetid://8133639623" or ""
                end

                if v:FindFirstChildOfClass("SpecialMesh") then
                    v:FindFirstChildOfClass("SpecialMesh").TextureId = library.flags["view_w_material"] == "Ghost" and "rbxassetid://8133639623" or ""
                end

                v.Transparency = math.clamp(library.flags["view_w_trans"], 0, 99) / 100
                v.Reflectance = library.flags["view_w_ref"]
                v.Color = library.flags["view_w_color"]
                v.Material = library.flags["view_w_material"] == "Ghost" and "ForceField" or library.flags["view_w_material"]
            elseif v.Name == "HumanoidRootPart" then
                v.Transparency = 1
            end
        end
    end

    if isAlive(lplr) then

        --dummy.update()

        if not workspace.Status.Preparation.Value then
            if library.flags["aa_enabled"] then
                if library.flags["aa_pitch"] ~= "Default" then
                    game.ReplicatedStorage.Events.ControlTurn:FireServer(0, false)
                end
            end

            if library.flags["prev_replication"] then
                if desync_stuff["mode"] ~= "prevent" then
                    desync_stuff["mode"] = "prevent"
                    desync_stuff:SetOrigin(lplr.Character.HumanoidRootPart.CFrame)
                end
            else
                desync_stuff["mode"] = "default"
            end
        end

        if library.flags["abuy_enabled"] and not autobought then
            if library.flags["abuy_primary"] ~= "-" then
                local page = library.flags["abuy_page"] == "Heavy" and 2 or library.flags["abuy_page"] == "SMGS" and 3 or 4
                pressbutton(circle[page].Hitbox)
                pressbutton(circle[library.flags["abuy_primary"]].Hitbox)
                pressbutton(buymenu.Base.Outline.Close)
            end

            if library.flags["abuy_secondary"] ~= "-" then
                pressbutton(circle["1"].Hitbox)
                pressbutton(circle[library.flags["abuy_secondary"]].Hitbox)
                pressbutton(buymenu.Base.Outline.Close)
            end
            autobought = true
        end

        if library.flags["m_bhop_enabled"] and uis:IsKeyDown("Space") then
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
                lplr.Character.HumanoidRootPart.Velocity = (vel.Unit * (library.flags["m_bhop_speed"] * 1.3)) + Vector3.new(0, lplr.Character.HumanoidRootPart.Velocity.Y, 0)
                lplr.Character.Humanoid.Jump = true
            end
        end

        if table.find(library.flags["gunmods"], "Ammo") then
            client.ammocount = 99e99
		    client.primarystored = 99e99
		    client.ammocount2 = 99e99
		    client.secondarystored = 99e99
        end

        if table.find(library.flags["gunmods"], "Firerate") then
            client.DISABLED = false
        end

        if library.flags["s_tper"] then
            workspace.ThirdPerson.Value = true
            if lplr.CameraMinZoomDistance ~= library.flags["s_tper_distance"] then
				lplr.CameraMinZoomDistance = library.flags["s_tper_distance"]
				lplr.CameraMaxZoomDistance = library.flags["s_tper_distance"]
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

            if library.flags["rage_enabled"] and (not library.flags["rage_prep"] and not workspace.Status.Preparation.Value or true) and isTarget(plr, false) and typeof(client.gun) == "Instance" and client.gun:FindFirstChild("Penetration") and not client.DISABLED and not client.gun:FindFirstChild("Melee") and client.gun.Name ~= "C4" then
                local ignore = {workspace.Ray_Ignore, lplr.Character, workspace.Debris, workspace.CurrentCamera, plr.Character}
                local multipoints = library.flags["rage_multipoints"]

                local hitboxes = {}
                for i, v in pairs(library.flags["rage_hitboxes"]) do
                    if v == "Head" then
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.Head))
                    elseif v == "Torso" then
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.UpperTorso))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LowerTorso))
                    elseif v == "Arms" then
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftUpperArm))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftLowerArm))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftHand))
                        --
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightUpperArm))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightLowerArm))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightHand))
                    elseif v == "Legs" then
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftUpperLeg))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftLowerLeg))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.LeftFoot))
                        --
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightUpperLeg))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightLowerLeg))
                        table.insert(hitboxes, (function(a)
                            return multipoints == "Normal" and {a, scan(a)} or multipoints == "Advanced" and {a, scan_advanced(a)} or {a, {a.Position}}
                        end)(plr.Character.RightFoot))
                    end
                end

                if library.flags["rage_ftrack"] then
                    table.insert(hitboxes, {lplr.Character.LowerTorso, {
                        plr.Character.HumanoidRootPart.Position + (plr.Character.Humanoid.MoveDirection * (library.flags["rage_ftrack_amount"] * 3))
                    }})
                end

                if #frames_stuff[plr] >= library.flags["rage_backtrack"] then
                    table.insert(hitboxes, {lplr.Character.LowerTorso, {
                        frames_stuff[plr][#frames_stuff[plr] - library.flags["rage_backtrack"]],
                    }})
                end

                local origin = lplr.Character.HumanoidRootPart.Position + Vector3.new(0, 1.5, 0)

                if plr.Character:FindFirstChild("UpperTorso") and plr.Character.UpperTorso:FindFirstChild("Waist") then
                    plr.Character.UpperTorso.Waist.C0 = CFrame.new()
                else
                    table.insert(to_kill, plr)
                end

                if plr.Character:FindFirstChild("Head") and plr.Character.Head:FindFirstChild("Neck") then
                    plr.Character.Head.Neck.C0 = CFrame.new(0, 0.7, 0)
                else
                    table.insert(to_kill, plr)
                end

                for _, v in pairs(hitboxes) do
                    if ragebot_target ~= nil then break end
                    for _, v2 in pairs(v[2]) do
                        if ragebot_target ~= nil then break end
                        local visible, hit = is_visible(origin, v2, 0.1, ignore)

                        local penetration = client.gun.Penetration.Value / (100 / library.flags["rage_mod"])

                        local dmgmod = nil

                        if visible then
                            ragebot_wallbang = false
                            ragebot_target = {v[1], v2}
                        else
                            if library.flags["rage_autowall"] then
                                local temphits, newraydata = {}, {}
                                local temphit

                                repeat
                                    newraydata = {is_visible(origin, v2, 0.1, ignore)}
                                    if newraydata[1] then
                                        temphit = v[1]
                                    else
                                        if newraydata[2] then
                                            table.insert(ignore, newraydata[2])
                                            table.insert(temphits, newraydata)
                                        end
                                    end
                                until temphit ~= nil or #temphits > 4 or newraydata[1] == nil

                                if temphit and getDamageMultiplier(temphit) ~= nil then
                                    local limit = 0
                                    for i, v in pairs(temphits) do
                                        local mod2 = 1

                                        -- // counter blox "Client" local script code go brrrrr

                                        if v[2].Material == Enum.Material.DiamondPlate then
                                            mod2 = 3
                                        end
                                        if v[2].Material == Enum.Material.CorrodedMetal or v[2].Material == Enum.Material.Metal or v[2].Material == Enum.Material.Concrete or v[2].Material == Enum.Material.Brick then
                                            mod2 = 2
                                        end
                                        if v[2].Name=="Grate" or v[2].Material == Enum.Material.Wood or v[2].Material == Enum.Material.WoodPlanks or v[2] and v[2].Parent and v[2].Parent:FindFirstChild("Humanoid") then
                                            mod2 = 0.1
                                        end
                                        if v[2].Transparency == 1 or v[2].CanCollide == false or v[2].Name == "Glass" or v[2].Name == "Cardboard" or v[2]:IsDescendantOf(workspace["Ray_Ignore"]) or v[2]:IsDescendantOf(workspace.Debris) or v[2] and v[2].Parent and v[2].Parent.Name == "Hitboxes" then
                                            mod2 = 0
                                        end
                                        if v[2].Name == "nowallbang" then
                                            mod2 = 100
                                        end
                                        if v[2]:FindFirstChild("PartModifier") then
                                            mod2 = v[2].PartModifier.Value
                                        end

                                        -- // my own shitcode

                                        local dir = (v[2].Position - v[3]).Unit * math.clamp(client.gun.Range.Value, 1, 100)
                                        local ray2 = Ray.new(v[3] + (dir * 1), dir * -2)
                                        local _, temppos = workspace:FindPartOnRayWithWhitelist(ray2, {v[2]}, true)
                                        if temppos then
                                            pcall(function()
                                                limit = math.min(penetration, limit + ((temppos - v[3]).Magnitude * mod2))
                                            end)
                                            dmgmod = 1 - limit / penetration
                                        end
                                    end

                                    ragebot_wallbang = true
                                    ragebot_target = {v[1], v2}
                                end
                            end
                        end

                        if ragebot_target and getDamage(ragebot_target, plr, dmgmod) >= library.flags["rage_min"] then
                            if library.flags["rage_autoshoot"] then
                                client.firebullet()
                                if library.flags["rage_dt"] then
                                    client.firebullet()
                                end
                            end
                        elseif ragebot_target and getDamage(ragebot_target, plr, dmgmod) < library.flags["rage_min"] then
                            ragebot_target = nil
                        end
                    end
                end
            end

            if library.flags["kall_enabled"] and (not library.flags["kall_prep"] and not workspace.Status.Preparation.Value or true) and isTarget(plr, false) then
                local oh1 = plr.Character.HumanoidRootPart
				local oh2 = plr.Character.HumanoidRootPart.Position
				local oh3 = "Crowbar"
				local oh4 = 1/0
				local oh5 = lplr.Character:FindFirstChild("Gun")
				local oh8 = 100
				local oh9 = true
				local oh10 = true
				local oh11 = Vector3.new()
				local oh12 = 100
				local oh13 = Vector3.new()
                for i = 1, library.flags["kall_hpr"] do
                    game.ReplicatedStorage.Events.HitPart:FireServer(oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9, oh10, oh11, oh12, oh13)
                end
            end

            if library.flags["kbot_enabled"] and workspace.Status.Preparation.Value == false and isTarget(plr, false) and client.gun ~= nil and (plr.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude <= library.flags["kbot_dist"] and kbot_target == nil then
                if client.gun:FindFirstChild("Melee") then
                    if not client.DISABLED then

                        kbot_target = plr.Character.Head

                        if library.flags["kbot_stab"] then
                            client_rbm("Down")
                        end
                        client.firebullet()
                        if library.flags["kbot_stab"] then
                            client_rbm("Up")
                        end
                    end
                else
                    if library.flags["kbot_equip"] then
                        equip_weapon(3)
                    end
                end
            end
        end

    end

    if table.find(library.flags["gunmods"], "Recoil") then
        client.resetaccuracy()
        client.RecoilX = 0
        client.RecoilY = 0
    end

    for i, plr in pairs(to_kill) do
        local oh1 = plr.Character.HumanoidRootPart
		local oh2 = plr.Character.HumanoidRootPart.Position
		local oh3 = "Crowbar"
		local oh4 = 1/0
		local oh5 = lplr.Character:FindFirstChild("Gun")
		local oh8 = 100
		local oh9 = true
		local oh10 = true
		local oh11 = Vector3.new()
		local oh12 = 100
		local oh13 = Vector3.new()
        game.ReplicatedStorage.Events.Hit:FireServer(oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9, oh10, oh11, oh12, oh13)
    end
end)

utility:Connect(rs.RenderStepped, function() -- esp loop
    for _, plr in pairs(game.Players:GetPlayers()) do
        if library.flags["esp_enabled"] and isTarget(plr, library.flags["esp_teammates"]) and esp_stuff[plr] then
            local player_table = esp_stuff[plr]

            local cam = workspace.CurrentCamera

            local pos, size = plr.Character:GetBoundingBox()

            local a = (cam.CFrame - cam.CFrame.p) * Vector3.new(math.clamp(size.X / 2, 0, 10) + 0.5, 0, 0)
            local b = (cam.CFrame - cam.CFrame.p) * Vector3.new(0, math.clamp(size.Y / 2, 0, 10) + 0.5, 0)

            local width = (cam:WorldToViewportPoint(pos.p + a).X - cam:WorldToViewportPoint(pos.p - a).X)
            local height = (cam:WorldToViewportPoint(pos.p - b).Y - cam:WorldToViewportPoint(pos.p + b).Y)

            local size = Vector2.new(math.floor(width), math.floor(height))

            size = Vector2.new(size.X % 2 == 0 and size.X or size.X + 1, size.Y % 2 == 0 and size.Y or size.Y + 1)

            local rootPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)

            if onScreen then
                if library.flags["esp_box"] then
                    player_table.Box.Visible = onScreen
                    player_table.Box.Size = size
                    player_table.Box.Position = Vector2.new(math.floor(rootPos.X), math.floor(rootPos.Y)) - (player_table.Box.Size / 2)
                    player_table.Box.Color = library.flags["esp_box_color"]

                    player_table.BoxOutline.Visible = onScreen
                    player_table.BoxOutline.Size = size
                    player_table.BoxOutline.Position = Vector2.new(math.floor(rootPos.X), math.floor(rootPos.Y)) - (player_table.Box.Size / 2)
                else
                    player_table.Box.Visible = false
                    player_table.BoxOutline.Visible = false
                end

                if library.flags["esp_health"] then
                    player_table.Health.Visible = onScreen
                    player_table.Health.Size = Vector2.new(1, size.Y * (1-((plr.Character.Humanoid.MaxHealth - plr.Character.Humanoid.Health) / plr.Character.Humanoid.MaxHealth)))
                    player_table.Health.Position = Vector2.new(math.floor(rootPos.X) - 5, math.floor(rootPos.Y) + (size.Y - math.floor(player_table.Health.Size.Y))) - size / 2
                    player_table.Health.Color = library.flags["esp_health_color"]

                    player_table.HealthOutline.Visible = onScreen
                    player_table.HealthOutline.Size = Vector2.new(3, size.Y + 2)
                    player_table.HealthOutline.Position = Vector2.new(math.floor(rootPos.X) - 6, math.floor(rootPos.Y) - 1) - size / 2
                else
                    player_table.Health.Visible = false
                    player_table.HealthOutline.Visible = false
                end

                if library.flags["esp_name"] then
                    player_table.Name.Visible = onScreen
                    player_table.Name.Position = Vector2.new(math.floor(rootPos.X), math.floor(rootPos.Y) - size.Y / 2 - 16)
                    player_table.Name.Color = library.flags["esp_name_color"]
                else
                    player_table.Name.Visible = false
                end

                if library.flags["esp_weapon"] then
                    player_table.Weapon.Visible = onScreen
                    player_table.Weapon.Position = Vector2.new(math.floor(rootPos.X), math.floor(rootPos.Y) + size.Y / 2 + 4)
                    player_table.Weapon.Color = library.flags["esp_weapon_color"]
                    player_table.Weapon.Text = plr.Character:FindFirstChild("EquippedTool") and plr.Character.EquippedTool.Value or "-"
                else
                    player_table.Weapon.Visible = false
                end

                if library.flags["esp_chams"] then
                    if plr.Character:FindFirstChildOfClass("Highlight") == nil then
                        local highlight = Instance.new("Highlight", plr.Character)
                        highlight.FillTransparency = 0.3
                        highlight.OutlineTransparency = 1
                    end
                    plr.Character.Highlight.FillColor = library.flags["esp_chams_color"]
                    if library.flags["esp_chams_outline"] then
                        plr.Character.Highlight.OutlineTransparency = 0.3
                        plr.Character.Highlight.OutlineColor = library.flags["esp_chams_outline_color"]
                    else
                        plr.Character.Highlight.OutlineTransparency = 1
                    end
                else
                    if plr.Character:FindFirstChildOfClass("Highlight") then
                        plr.Character:FindFirstChildOfClass("Highlight"):Destroy()
                    end
                end

                player_table.Arrow.Visible = false
            else
                for i, v in pairs(player_table) do
                    if i ~= "Arrow" then
                        v.Visible = false
                    end
                end

                if library.flags["esp_arrows"] then
                    player_table.Arrow.Visible = true

                    local rel = workspace.CurrentCamera.CFrame:PointToObjectSpace(plr.Character.HumanoidRootPart.Position)
                    local angle = math.atan2(-rel.Y, rel.X)

                    local dir = Vector2.new(math.cos(angle), math.sin(angle))

                    local pos = (dir * utility:ScreenSize() * (library.flags["esp_arrows_offset"] / 100)) + (utility:ScreenSize() / 2)

                    local size = math.floor(utility:ScreenSize().X / 64)

                    player_table.Arrow.PointA = pos
                    player_table.Arrow.PointB = pos - getRotate(dir, .5) * size
                    player_table.Arrow.PointC = pos - getRotate(dir, -.5) * size

                    player_table.Arrow.Color = library.flags["esp_arrows_color"]
                end

                for i = 1, 4 do
                    esp_stuff[plr][i].Visible =false
                end

                if plr.Character:FindFirstChildOfClass("Highlight") then
                    plr.Character:FindFirstChildOfClass("Highlight"):Destroy()
                end
            end
        else
            if esp_stuff[plr] then
                for i, v in pairs(esp_stuff[plr]) do
                    if v.Visible ~= false then
                        v.Visible = false
                    end
                end
            end

            if isAlive(plr) then
                if plr.Character:FindFirstChildOfClass("Highlight") then
                    plr.Character:FindFirstChildOfClass("Highlight"):Destroy()
                end
            else
                if esp_stuff[plr] and frames_stuff[plr] and library.flags["esp_enabled"] then
                    local lastpos = frames_stuff[plr][#frames_stuff[plr]]

                    local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(lastpos)

                    pos = Vector2.new(pos.X, pos.Y)

                    for i = 1, 4 do
                        local xmi = ("12"):find(tostring(i)) and 4 or -4
                        local xma = ("12"):find(tostring(i)) and 10 or -10

                        local ymi = ("14"):find(tostring(i)) and 4 or -4
                        local yma = ("14"):find(tostring(i)) and 10 or -10

                        local object = esp_stuff[plr][i]

                        object.From = pos + Vector2.new(xmi, ymi)
                        object.To = pos + Vector2.new(xma, yma)

                        object.Visible = onScreen
                    end
                end
            end
        end
    end
end)

utility:Connect(rs.Heartbeat, function()
    if isAlive(lplr) and workspace.Status.Preparation.Value == false then
        if library.flags["desync_enabled"] and not desync_stuff["set_1"] then

            desync_stuff.step(library.flags["desync_frames_offset"], lplr.Character.HumanoidRootPart.CFrame)

            desync_stuff[1] = lplr.Character.HumanoidRootPart.CFrame

            local fakeCFrame = desync_stuff:GetOrigin()

            if library.flags["desync_mode"] == "Offset" then
                fakeCFrame = fakeCFrame * CFrame.new(Vector3.new(library.flags["desync_offset_x"], library.flags["desync_offset_y"], library.flags["desync_offset_z"]))
            elseif library.flags["desync_mode"] == "Random" then
                fakeCFrame = fakeCFrame * CFrame.new(RandomVectorRange(library.flags["desync_random_x"], library.flags["desync_random_y"], library.flags["desync_random_z"]))
            elseif library.flags["desync_mode"] == "Invisible" then
                fakeCFrame = CFrame.new()
            end

            if library.flags["desync_rotation"] == "Manual" then
                fakeCFrame = fakeCFrame * CFrame.Angles(math.rad(library.flags["desync_manual_x"]), math.rad(library.flags["desync_manual_y"]), math.rad(library.flags["desync_manual_z"]))
            elseif library.flags["desync_rotation"] == "Random" then
                fakeCFrame = fakeCFrame * CFrame.Angles(math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)))
            end

            lplr.Character.HumanoidRootPart.CFrame = fakeCFrame
            desync_stuff["set_1"] = true

            if library.flags["s_tper"] then
                --dummy.goto(fakeCFrame)
                lplr.Character.LowerTorso.Anchored = true
                lplr.Character.LowerTorso.Root.Part0 = lplr.Character.LowerTorso
                lplr.Character.LowerTorso.CFrame = fakeCFrame * CFrame.new(0, -0.8, 0)
            else
                lplr.Character.LowerTorso.Anchored = false
                lplr.Character.LowerTorso.Root.Part0 = lplr.Character.HumanoidRootPart
            end
        else
            desync_stuff[1] = nil
            --dummy.goto(CFrame.new(Vector3.new(1,1,1)*99e99))
            lplr.Character.LowerTorso.Anchored = false
            lplr.Character.LowerTorso.Root.Part0 = lplr.Character.HumanoidRootPart
        end
    else
        desync_stuff[1] = nil
        --dummy.goto(CFrame.new(Vector3.new(1,1,1)*99e99))
        if isAlive(lplr) then
            lplr.Character.LowerTorso.Anchored = false
            lplr.Character.LowerTorso.Root.Part0 = lplr.Character.HumanoidRootPart
        end
    end
end)

utility:Connect(rs.Heartbeat, function()
    if isAlive(lplr) then
        if library.flags["no_footstep"] then
            desync_stuff[2] = lplr.Character.HumanoidRootPart.Velocity

            lplr.Character.HumanoidRootPart.Velocity = Vector3.zero

            rs.RenderStepped:Wait()

            lplr.Character.HumanoidRootPart.Velocity = desync_stuff[2]
        end
    end
end)

utility:BindToRenderStep("desync_1", 1, function()
    if desync_stuff[1] and desync_stuff["set_1"] and isAlive(lplr) then
        lplr.Character.HumanoidRootPart.CFrame = desync_stuff[1]
        desync_stuff["set_1"] = false
    end
end)

local oldNamecall, oldIndex, oldNewIndex

oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local args = {...}
    if library.loaded then
        local method = getnamecallmethod()

        if method == "Kick" or method == "kick" and self == lplr then
            return
        elseif method == "FindPartOnRayWithIgnoreList" and args[2][1] == workspace.Debris then

            if library.flags["rage_enabled"] and ragebot_target ~= nil then
                local origin = lplr.Character.HumanoidRootPart.Position + Vector3.new(0, 1.5, 0)
                table.insert(args[2], workspace.Map)
                args[1] = Ray.new(origin, (ragebot_target[2] - origin).Unit * (ragebot_target[2] - origin).Magnitude)
            end

            if library.flags["kbot_enabled"] and kbot_target ~= nil then
                local origin = lplr.Character.HumanoidRootPart.Position + Vector3.new(0, 1.5, 0)
                table.insert(args[2], workspace.Map)
                args[1] = Ray.new(origin, (kbot_target.Position - origin).Unit * 2048)
                delay(0, function()
                    kbot_target = nil
                end)

            end

        elseif method == "FireServer" then
            if self.Name == "HitPart" or self.Name == "Hit" then
                if library.flags["rage_enabled"] and ragebot_target ~= nil then
                    --args[1] = ragebot_target
                    args[2] = args[2] + Vector3.new(0, 0/0, 0)
                    args[4] = 0
                    args[10] = true
                    args[12] = args[12] - 500
                end
            elseif self.Name == "ControlTurn" then
                if library.flags["aa_enabled"] and not workspace.Status.Preparation.Value then
                    local pitch = library.flags["aa_pitch"]
                    if pitch == "Up" then
                        args[1] = math.pi/2
                    elseif pitch == "Down" then
                        args[1] = -math.pi/2
                    elseif pitch == "Zero" then
                        args[1] = 0
                    elseif pitch == "Random" then
                        args[1] = math.random(-15, 15)
                    elseif pitch == "Smooth" then
                        args[1] = (tick()*5)%math.pi > (math.pi/2) and (tick()*10)%(math.pi/2) or (tick()*10)%(-math.pi/2)
                    end
                end
            end
        elseif method == "SetPrimaryPartCFrame" and self.Name == "Arms" then
            if library.flags["s_tper"] then
                args[1] = CFrame.new(Vector3.new(1, 1, 1) * 99e99)
            end

            if library.flags["view_enabled"] then
                args[1] = args[1] * CFrame.new(math.rad(library.flags["view_x"]), math.rad(library.flags["view_y"]), math.rad(library.flags["view_z"])) * CFrame.Angles(0, 0, math.rad(library.flags["view_roll"]))
            end
        elseif (method == "Play" or method == "Stop") and self.ClassName == "AnimationTrack" then
            if method == "Play" then
                dummy.play(self.Animation.AnimationId, unpack(args))
            else
                dummy.stop(self.Animation.AnimationId)
            end
        end
    end

    return oldNamecall(self, unpack(args))
end))

oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if library.loaded then
        if not checkcaller() then
            if key == "Velocity" and self.Parent == lplr.Character and library.flags["ot_no_bob"] then
                return Vector3.zero
            end
        end
    end
    return oldIndex(self, key)
end))

oldNewIndex = hookmetamethod(game, "__newindex", newcclosure(function(self, key, value)
    if not checkcaller() then
        if self.Name == "Crosshair" and key == "Visible" and library.flags["ot_fc"] and lplr.PlayerGui.GUI.Crosshairs.Scope.Visible then
            value = true
        end
    end

    return oldNewIndex(self, key, value)
end))

window:Update()
window:Load("Settings")
