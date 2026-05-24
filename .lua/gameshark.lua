-- this shit is actually pasted wtf
-- not fixing cuz this code is aids

if library then
    library:unload()
end

local loadtick = tick()
local drawing = loadstring(game:HttpGet("https://raw.githubusercontent.com/ShamblesHaxx/Watermark-LUA/main/drawing%20lib.lua"))()
local tween = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/utility/main/Tween.lua"))()
local services = setmetatable({}, {
    __index = function(_, k)
        k = (k == "InputService" and "UserInputService") or k
        return game:GetService(k)
    end
})
getgenv().utility = {}
getgenv().friends = {}
getgenv().priority = {}

local totalunnamedflags = 0

function utility.textlength(str, font, fontsize)
    local text = Drawing.new("Text")
    text.Text = str
    text.Font = font
    text.Size = fontsize

    local textbounds = text.TextBounds
    text:Remove()

    return textbounds
end

function utility.getcenter(sizeX, sizeY)
    return UDim2.new(0.5, -(sizeX / 2), 0.5, -(sizeY / 2))
end

function utility.table(tbl, usemt)
    tbl = tbl or {}

    local oldtbl = table.clone(tbl)
    table.clear(tbl)

    for i, v in next, oldtbl do
        if type(i) == "string" then
            tbl[i:lower()] = v
        else
            tbl[i] = v
        end
    end

    if usemt == true then
        setmetatable(tbl, {
            __index = function(t, k)
                return rawget(t, k:lower()) or rawget(t, k)
            end,

            __newindex = function(t, k, v)
                if type(k) == "string" then
                    rawset(t, k:lower(), v)
                else
                    rawset(t, k, v)
                end
            end
        })
    end

    return tbl
end

function utility.colortotable(color)
    local r, g, b = math.floor(color.R * 255),  math.floor(color.G * 255), math.floor(color.B * 255)
    return {r, g, b}
end

function utility.tabletocolor(tbl)
    return Color3.fromRGB(unpack(tbl))
end

function utility.round(number, float)
    return float * math.floor(number / float)
end

function utility.getrgb(color)
    local r = color.R * 255
    local g = color.G * 255
    local b = color.B * 255

    return r, g, b
end

function utility.changecolor(color, number)
    local r, g, b = utility.getrgb(color)
    r, g, b = math.clamp(r + number, 0, 255), math.clamp(g + number, 0, 255), math.clamp(b + number, 0, 255)
    return Color3.fromRGB(r, g, b)
end

function utility.lerp(delta, from, to)
    if (delta > 1) then
        return to
    end
    if (delta < 0) then
        return from
    end
    return from + (to - from) * delta
end

function utility.ColorRange(value, ranges) 
    if value <= ranges[1].start then
        return ranges[1].color
    end
    if value >= ranges[#ranges].start then
        return ranges[#ranges].color
    end

    local selected = #ranges
    for i = 1, #ranges - 1 do
        if value < ranges[i + 1].start then
            selected = i
            break
        end
    end
    local minColor = ranges[selected]
    local maxColor = ranges[selected + 1]
    local lerpValue = (value - minColor.start) / (maxColor.start - minColor.start)
    return Color3.new(
        utility.lerp(lerpValue, minColor.color.r, maxColor.color.r),
        utility.lerp(lerpValue, minColor.color.g, maxColor.color.g),
        utility.lerp(lerpValue, minColor.color.b, maxColor.color.b)
    )
end

function utility.NumberLerp(value, ranges)
    if value >= ranges[#ranges].start then
        return ranges[#ranges].number
    end

    local selected = #ranges
    for i = 1, #ranges - 1 do
        if value < ranges[i + 1].start then
            selected = i
            break
        end
    end
    local minnumb = ranges[selected]
    local maxnumb = ranges[selected + 1]
    local lerpValue = (value - minnumb.start) / (maxnumb.start - minnumb.start)
    return utility.lerp(lerpValue, minnumb.number, maxnumb.number)
end

function utility.nextflag()
    totalunnamedflags = totalunnamedflags + 1
    return string.format("%.14g", totalunnamedflags)
end

function utility.rgba(r, g, b, alpha)
    local rgb = Color3.fromRGB(r, g, b)
    local mt = table.clone(getrawmetatable(rgb))
    
    setreadonly(mt, false)
    local old = mt.__index
    
    mt.__index = newcclosure(function(self, key)
        if key:lower() == "a" then
            return alpha
        end
        
        return old(self, key)
    end)
    
    setrawmetatable(rgb, mt)
    
    return rgb
end

local decode = syn and syn.crypt.base64.decode
local accentobjs = {}
local flags = {}
local configignores = {}
local visValues = {}

local keys = {
    [Enum.KeyCode.LeftShift] = "LS",
    [Enum.KeyCode.RightShift] = "RS",
    [Enum.KeyCode.LeftControl] = "LC",
    [Enum.KeyCode.RightControl] = "RC",
    [Enum.KeyCode.LeftAlt] = "LA",
    [Enum.KeyCode.RightAlt] = "RA",
    [Enum.KeyCode.CapsLock] = "CAPS",
    [Enum.KeyCode.One] = "1",
    [Enum.KeyCode.Two] = "2",
    [Enum.KeyCode.Three] = "3",
    [Enum.KeyCode.Four] = "4",
    [Enum.KeyCode.Five] = "5",
    [Enum.KeyCode.Six] = "6",
    [Enum.KeyCode.Seven] = "7",
    [Enum.KeyCode.Eight] = "8",
    [Enum.KeyCode.Nine] = "9",
    [Enum.KeyCode.Zero] = "0",
    [Enum.KeyCode.KeypadOne] = "Num1",
    [Enum.KeyCode.KeypadTwo] = "Num2",
    [Enum.KeyCode.KeypadThree] = "Num3",
    [Enum.KeyCode.KeypadFour] = "Num4",
    [Enum.KeyCode.KeypadFive] = "Num5",
    [Enum.KeyCode.KeypadSix] = "Num6",
    [Enum.KeyCode.KeypadSeven] = "Num7",
    [Enum.KeyCode.KeypadEight] = "Num8",
    [Enum.KeyCode.KeypadNine] = "Num9",
    [Enum.KeyCode.KeypadZero] = "Num0",
    [Enum.KeyCode.Minus] = "-",
    [Enum.KeyCode.Equals] = "=",
    [Enum.KeyCode.Tilde] = "~",
    [Enum.KeyCode.LeftBracket] = "[",
    [Enum.KeyCode.RightBracket] = "]",
    [Enum.KeyCode.RightParenthesis] = ")",
    [Enum.KeyCode.LeftParenthesis] = "(",
    [Enum.KeyCode.Semicolon] = ",",
    [Enum.KeyCode.Quote] = "'",
    [Enum.KeyCode.BackSlash] = "\\",
    [Enum.KeyCode.Comma] = ",",
    [Enum.KeyCode.Period] = ".",
    [Enum.KeyCode.Slash] = "/",
    [Enum.KeyCode.Asterisk] = "*",
    [Enum.KeyCode.Plus] = "+",
    [Enum.KeyCode.Period] = ".",
    [Enum.KeyCode.Backquote] = "`",
    [Enum.UserInputType.MouseButton1] = "MB1",
    [Enum.UserInputType.MouseButton2] = "MB2",
    [Enum.UserInputType.MouseButton3] = "MB3",
    [Enum.KeyCode.Escape] = "ESC",
    [Enum.KeyCode.Space] = "SPC",
}

getgenv().themes = {
    ["Accent"] = Color3.fromRGB(32, 124, 229),
    ["Text"] = Color3.fromRGB(211, 211, 211),
    ["Dark Text"] = Color3.fromRGB(150, 150, 150),
    ["Outline"] = Color3.fromRGB(0, 0, 0),
    ["Inline"] = Color3.fromRGB(57, 57, 57),
    ["Background"] = Color3.fromRGB(35, 35, 35),
    ["Background 2"] = Color3.fromRGB(24, 24, 24),
    ["Element Background"] = Color3.fromRGB(63, 63, 63),
    ["Element Background 2"] = Color3.fromRGB(42, 42, 42),
}

local themeobjects = {}
getgenv().library = {
    drawings = {}, 
    drawing_amount = 0, 
    currentcolor = nil, 
    folder = "gameshark", 
    theme = table.clone(themes),
    flags = {}, 
    open = false, 
    unloaded = false,
    mousestate = services.InputService.MouseIconEnabled, 
    cursor = nil, 
    holder = nil,
    connections = {}, 
    notifications = {},
    clipboard = nil 
}

local images = {
    ['gradient90'] = "https://raw.githubusercontent.com/portallol/luna/main/Gradient.png",
    ['gradient180'] = "https://raw.githubusercontent.com/portallol/luna/main/Gradient180.png",
    ['gradient'] = "https://i.imgur.com/MwtBOA0.png",
    ['gradient reversed'] = "https://i.imgur.com/5fwnSGw.png",
    ['Checker bar'] = "https://i.imgur.com/kNGuTlj.png",
    ['rainbow'] = "https://i.imgur.com/YQkEPwO.png",
    ['checkers'] = "https://i.imgur.com/n5jlwQX.png",
    ['uparrow'] = "https://i.imgur.com/3L1njB1.png",
    ['downarrow'] = "https://i.imgur.com/RKO6jlP.png",
}

local pickers = {}
local allowedcharacters = {}
local shiftcharacters = {
    ["1"] = "!",
    ["2"] = "@",
    ["3"] = "#",
    ["4"] = "$",
    ["5"] = "%",
    ["6"] = "^",
    ["7"] = "&",
    ["8"] = "*",
    ["9"] = "(",
    ["0"] = ")",
    ["-"] = "_",
    ["="] = "+",
    ["["] = "{",
    ["]"] = "}",
    ["\\"] = "|",
    [""] = ":",
    ["'"] = "\"",
    [","] = "<",
    ["."] = ">",
    ["/"] = "?",
    ["`"] = "~"
}
for i = 32, 126 do
    table.insert(allowedcharacters, utf8.char(i))
end

if not isfolder(library.folder) then
    makefolder(library.folder)
end

if not isfolder(library.folder .. "/assets") then
    makefolder(library.folder .. "/assets")
end

if not isfolder(library.folder .. "/configs") then
    makefolder(library.folder .. "/configs")
end

for i,v in next, images do
    if not isfile(library.folder..'/assets/'..i..'.ln') then
        writefile(library.folder..'/assets/'..i..'.ln', syn.crypt.custom.encrypt('aes-ctr',game:HttpGet(v),'4XGudgFuutoHUM2Ctwsq4YrQ','zP5JJWPSIbf5Xuuy'))
    end
    images[i] = syn.crypt.custom.decrypt('aes-ctr',readfile(library.folder..'/assets/'..i..'.ln'),'4XGudgFuutoHUM2Ctwsq4YrQ','zP5JJWPSIbf5Xuuy')
end

function utility.outline(obj, color, zin, ignore)
    local outline = drawing:new("Square")
    table.insert(library.drawings, outline)
    library.drawing_amount = library.drawing_amount + 1
    outline.Parent = obj
    outline.Size = UDim2.new(1, 2, 1, 2)
    outline.Position = UDim2.new(0, -1, 0, -1)
    outline.ZIndex = zin or obj.ZIndex - 1

    outline.Color = library.theme[color]
    themeobjects[outline] = color

    outline.Parent = obj
    outline.Filled = true
    outline.Thickness = 1

    return outline
end

function utility.create(class, properties, ignore)
    local obj = drawing:new(class)
    if not ignore then
        table.insert(library.drawings, obj)
    end
    library.drawing_amount = library.drawing_amount + 1
    for prop, v in next, properties do
        if prop == "Theme" then
            themeobjects[obj] = v
            obj.Color = library.theme[v]
        else
            obj[prop] = v
        end
    end

    return obj
end

function utility.changeobjecttheme(object, color)
    themeobjects[object] = color
    object.Color = library.theme[color]
end

function utility.connect(signal, callback)
    local connection = signal:Connect(callback)
    table.insert(library.connections, connection)

    return connection
end

function utility.disconnect(connection)
    local index = table.find(library.connections, connection)
    connection:Disconnect()

    if index then
        table.remove(library.connections, index)
    end
end

function utility.drag(main, object)
    local start, objectposition, dragging, currentpos

    main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            start = input.Position
            objectposition = object.Position
        end
    end)

    utility.connect(services.InputService.InputChanged, function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            currentpos = UDim2.new(objectposition.X.Scale, objectposition.X.Offset + (input.Position - start).X, objectposition.Y.Scale, objectposition.Y.Offset + (input.Position - start).Y)
            object.Position = currentpos
        end
    end)

    utility.connect(services.InputService.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then 
            dragging = false
            object.Position = currentpos
        end
    end)
end

function library:ChangeThemeOption(option, color)
    self.theme[option] = color

    for obj, theme in next, themeobjects do
        if rawget(obj, "exists") == true and theme == option and obj.Visible then
            obj.Color = color
        end
    end
end

function library:SetOpen(bool)
    if typeof(bool) == 'boolean' then
        self.open = bool

        task.spawn(function()
            if not bool then
                task.wait(.1)
            end
            self.holder.Visible = bool
        end)

        local ContextActionService = game:GetService("ContextActionService")
        if bool then  
            local ContextActionService = game:GetService("ContextActionService")
            ContextActionService:BindAction(
                "Scrolling",
                function ()
                    return Enum.ContextActionResult.Sink
                end,
                false,
                Enum.UserInputType.MouseWheel
            )
            ContextActionService:BindAction(
                "Input",
                function()
                    return Enum.ContextActionResult.Sink
                end,
                false,
                Enum.UserInputType.MouseButton1
            )
        else
            ContextActionService:UnbindAction("Scrolling")
            ContextActionService:UnbindAction("Input")
        end

        for _,v in next, library.drawings do
            if not tostring(_):find("custom") then
                if v.__OBJECT_EXISTS and v.Transparency ~= 0 then
                    task.spawn(function()
                        if bool then
                            Transparency = visValues[v]
                        else
                            Transparency = 0
                        end
                    end)
                end
            end
        end
    end
end

function utility.lerp(delta, from, to)
    if (delta > 1) then
        return to
    end
    if (delta < 0) then
        return from
    end
    return from + (to - from) * delta
end

function utility.ColorRange(value, ranges) 
    if value <= ranges[1].start then
        return ranges[1].color
    end
    if value >= ranges[#ranges].start then
        return ranges[#ranges].color
    end

    local selected = #ranges
    for i = 1, #ranges - 1 do
        if value < ranges[i + 1].start then
            selected = i
            break
        end
    end
    local minColor = ranges[selected]
    local maxColor = ranges[selected + 1]
    local lerpValue = (value - minColor.start) / (maxColor.start - minColor.start)
    return Color3.new(
        utility.lerp(lerpValue, minColor.color.r, maxColor.color.r),
        utility.lerp(lerpValue, minColor.color.g, maxColor.color.g),
        utility.lerp(lerpValue, minColor.color.b, maxColor.color.b)
    )
end

function utility.NumberLerp(value, ranges)
    if value >= ranges[#ranges].start then
        return ranges[#ranges].number
    end

    local selected = #ranges
    for i = 1, #ranges - 1 do
        if value < ranges[i + 1].start then
            selected = i
            break
        end
    end
    local minnumb = ranges[selected]
    local maxnumb = ranges[selected + 1]
    local lerpValue = (value - minnumb.start) / (maxnumb.start - minnumb.start)
    return utility.lerp(lerpValue, minnumb.number, maxnumb.number)
end

function library.orig_slider(holder, name, text, min, max, float, default, flag, callback, zindex, suffix, Textval, Textstring)
    zindex  = zindex or 0

    local slider_tbl = {}
    local currentAmount = 0

    local slider_outline = utility.create("Square", {
        Parent = holder, 
        Visible = true, 
        Transparency = 1, 
        Color = Color3.new(0,0,0), 
        Size = UDim2.new(1, -42, 0, 7), 
        Theme = "Outline",
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(0, 21, 0, 14)
    })

    local slider_frame = utility.create("Square", {
        Parent = slider_outline, 
        Visible = true, 
        Transparency = 1, 
        Color = Color3.new(0,0,0), 
        Size = UDim2.new(1, -2, 1, -2), 
        Theme = "Element Background",
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(0, 1, 0, 1)
    })

    utility.create("Image", {
        Parent = slider_frame,
        Visible = true,
        Transparency = 0.6, 
        Data = images.gradient90,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = zindex + 21,
    })

    local slider_title = utility.create("Text", {
        Text = name, 
        Parent = holder, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Text", 
        Size = 13, 
        Font = 2, 
        Position = UDim2.new(0, 21, 0, -3), 
        ZIndex = zindex + 20,
    })

    local slider_page = utility.create("Square", {
        Parent = slider_frame, 
        Visible = true, 
        Size = UDim2.new(1, 0, 1, 0), 
        Transparency = 0,
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(0, 0, 0, 0)
    })

    local slider_accent = utility.create("Square", {
        Parent = slider_page, 
        Visible = true, 
        Transparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Theme = "Accent",
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(0, 0, 0, 0)
    })

    utility.create("Image", {
        Parent = slider_accent,
        Visible = true,
        Transparency = 0.6, 
        Data = images.gradient90,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = zindex + 21,
    })

    local slider_drag = utility.create("Square", {
        Parent = slider_frame, 
        Visible = true, 
        Transparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 21, 
        Transparency = 0,
        Position = UDim2.new(0, 0, 0, 0),
    })

    local slider_value = utility.create("Text", {
        Text = text, 
        Parent = slider_frame, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Text", 
        Size = 13, 
        Center = true, 
        Font = 2, 
        Position = UDim2.new(0.5, 1, 0, -1),
        ZIndex = zindex + 22
    })

    local slider_minus_button = utility.create("Square", {
        Parent = holder, 
        Visible = true, 
        Transparency = 0, 
        Size = UDim2.new(0, 7, 0, 7), 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(0, 12, 0, 14),
    })

    local slider_minus = utility.create("Text", {
        Text = "-", 
        Parent = holder, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Dark Text", 
        Size = 13, 
        Font = 2, 
        Position = UDim2.new(0, 12, 0, 10),
        ZIndex = zindex + 21
    })

    local slider_plus_button = utility.create("Square", {
        Parent = holder, 
        Visible = true, 
        Transparency = 0, 
        Size = UDim2.new(0, 7, 0, 7), 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(1, -19, 0, 14),
    })

    local slider_plus = utility.create("Text", {
        Text = "+", 
        Parent = holder, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Dark Text", 
        Size = 13, 
        Font = 2, 
        Position = UDim2.new(1, -19, 0, 10),
        ZIndex = zindex + 21
    })

    local function set(value)
        value = math.clamp(utility.round(value, float), min, max)
            
        if Textval and Textstring and value == Textval then
            slider_value.Text = tostring(Textstring)
        else 
            slider_value.Text = text:gsub("%[value%]", string.format("%.14g", value)) .. (suffix and suffix or "")
        end

        local sizeX = ((value - min) / (max - min))
        slider_accent.Size = UDim2.new(sizeX, 0, 1, 0)

        slider_value.Position = UDim2.new(sizeX, 0, 0, 0)

        currentAmount = value

        library.flags[flag] = value
        callback(value)
    end

    set(default)

    slider_plus_button.MouseButton1Click:Connect(function()
        set(currentAmount + float)
    end)

    slider_minus_button.MouseButton1Click:Connect(function()
        set(currentAmount - float)
    end)

    local sliding = false

    local function slide(input)
        local sizeX = (input.Position.X - slider_frame.AbsolutePosition.X) / slider_frame.AbsoluteSize.X
        local value = ((max - min) * sizeX) + min

        set(value)
    end

    utility.connect(slider_drag.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            sliding = true
            slide(input)
        end
    end)

    utility.connect(slider_drag.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            sliding = false
        end
    end)

    utility.connect(services.InputService.InputChanged, function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if sliding then
                slide(input)
            end
        end
    end)

    flags[flag] = set

    function slider_tbl:set(value)
        set(value)
    end

    return slider_tbl
end

function library.slider(holder, name, text, min, max, float, default, flag, callback, zindex, suffix, Textval, Textstring)
    zindex  = zindex or 0

    local slider_tbl = {}
    local currentAmount = 0

    local slider_outline = utility.create("Square", {
        Parent = holder, 
        Visible = true, 
        Transparency = 1, 
        Color = Color3.new(0,0,0), 
        Size = UDim2.new(1, -42, 0, 7), 
        Theme = "Outline",
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(0, 21, 0, 14)
    })

    local slider_frame = utility.create("Square", {
        Parent = slider_outline, 
        Visible = true, 
        Transparency = 1, 
        Color = Color3.new(0,0,0), 
        Size = UDim2.new(1, -2, 1, -2), 
        Theme = "Element Background",
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(0, 1, 0, 1)
    })

    utility.create("Image", {
        Parent = slider_frame,
        Visible = true,
        Transparency = 0.6, 
        Data = images.gradient90,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = zindex + 21,
    })

    local slider_title = utility.create("Text", {
        Text = name, 
        Parent = holder, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Text", 
        Size = 13, 
        Font = 2, 
        Position = UDim2.new(0, 21, 0, -3), 
        ZIndex = zindex + 20,
    })

    local slider_page = utility.create("Square", {
        Parent = slider_frame, 
        Visible = true, 
        Size = UDim2.new(1, 0, 1, 0), 
        Transparency = 0,
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(0, 0, 0, 0)
    })

    local slider_accent = utility.create("Square", {
        Parent = slider_page, 
        Visible = true, 
        Transparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Theme = "Accent",
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(0, 0, 0, 0)
    })

    utility.create("Image", {
        Parent = slider_accent,
        Visible = true,
        Transparency = 0.6, 
        Data = images.gradient90,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = zindex + 21,
    })

    local slider_drag = utility.create("Square", {
        Parent = slider_frame, 
        Visible = true, 
        Transparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 21, 
        Transparency = 0,
        Position = UDim2.new(0, 0, 0, 0),
    })

    local slider_value = utility.create("Text", {
        Text = text, 
        Parent = slider_frame, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Text", 
        Size = 13, 
        Center = true, 
        Font = 2, 
        Position = UDim2.new(0.5, 1, 0, -1),
        ZIndex = zindex + 22
    })

    local slider_minus_button = utility.create("Square", {
        Parent = holder, 
        Visible = true, 
        Transparency = 0, 
        Size = UDim2.new(0, 7, 0, 7), 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(0, 12, 0, 14),
    })

    local slider_minus = utility.create("Text", {
        Text = "-", 
        Parent = holder, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Dark Text", 
        Size = 13, 
        Font = 2, 
        Position = UDim2.new(0, 12, 0, 10),
        ZIndex = zindex + 21
    })

    local slider_plus_button = utility.create("Square", {
        Parent = holder, 
        Visible = true, 
        Transparency = 0, 
        Size = UDim2.new(0, 7, 0, 7), 
        Filled = true, 
        ZIndex = zindex + 21, 
        Position = UDim2.new(1, -19, 0, 14),
    })

    local slider_plus = utility.create("Text", {
        Text = "+", 
        Parent = holder, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Dark Text", 
        Size = 13, 
        Font = 2, 
        Position = UDim2.new(1, -19, 0, 10),
        ZIndex = zindex + 21
    })

    local function set(value)
        value = math.clamp(utility.round(value, float), min, max)
            
        if Textval and Textstring and value == Textval then
            slider_value.Text = tostring(Textstring)
        else 
            slider_value.Text = text:gsub("%[value%]", string.format("%.14g", value)) .. (suffix and suffix or "")
        end

        local sizeX = ((value - min) / (max - min))
        slider_accent.Size = UDim2.new(sizeX, 0, 1, 0)

        slider_value.Position = UDim2.new(sizeX, 0, 0, 0)

        currentAmount = value

        library.flags[flag] = value
        callback(value)
    end

    local window = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Parent = slider_drag,
        Theme = "Outline",
        Size = UDim2.new(0, 205, 0, 157),
        Visible = false,
        Position = UDim2.new(1, -185, 1, 6),
        ZIndex = zindex + 26,
    })

    local windowback = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Parent = window,
        Theme = "Background",
        Size = UDim2.new(1, -2, 1, -2),
        Visible = true,
        Position = UDim2.new(0, 1, 0, 1),
        ZIndex = zindex + 26,
    })

    utility.create("Text", {
        Text = "Animations", 
        Parent = windowback, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Text", 
        Size = 13, 
        Center = false, 
        Font = 2, 
        Position = UDim2.new(0, 5, 0, 2),
        ZIndex = zindex + 26
    })

    local togholder = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Transparency = 0,
        Parent = windowback,
        Color = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, -10, 0, 13),
        Visible = true,
        Position = UDim2.new(0, 5, 0, 25),
        ZIndex = zindex + 28,
    })

    local startholder = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Transparency = 0,
        Parent = windowback,
        Color = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, -10, 0, 13),
        Visible = true,
        Position = UDim2.new(0, 5, 0, 40),
        ZIndex = zindex + 28,
    })

    local endholder = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Transparency = 0,
        Parent = windowback,
        Color = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, -10, 0, 13),
        Visible = true,
        Position = UDim2.new(0, 5, 0, 71),
        ZIndex = zindex + 28,
    })

    local speedholder = utility.create("Square", {  
        Filled = true,
        Thickness = 0,
        Transparency = 0,
        Parent = windowback,
        Color = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, -10, 0, 13),
        Visible = true,
        Position = UDim2.new(0, 5, 0, 102),
        ZIndex = zindex + 28,
    })

    local togholder2 = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Transparency = 0,
        Parent = windowback,
        Color = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, -10, 0, 13),
        Visible = true,
        Position = UDim2.new(0, 5, 0, 138),
        ZIndex = zindex + 28,
    })

    library.toggle(togholder, "Fading", false, flag .. "_FADING", function() end, zindex + 26)
    
    library.orig_slider(startholder, "Start", "[value]", min, max, float, 0, flag .. "_FADING START", function() end, zindex + 26)

    library.orig_slider(endholder, "End", "[value]", min, max, float, 0, flag .. "_FADING END", function() end, zindex + 26)

    library.orig_slider(speedholder, "Speed", "[value]%", 0, 500, 0.01, 0, flag .. "_FADING SPEED", function() end, zindex + 26)

    library.toggle(togholder2, "Cut on end", false, flag .. "_CUT", function() end, zindex + 26)

    set(default)

    slider_plus_button.MouseButton1Click:Connect(function()
        set(currentAmount + float)
    end)

    slider_minus_button.MouseButton1Click:Connect(function()
        set(currentAmount - float)
    end)

    local sliding = false

    local function slide(input)
        local sizeX = (input.Position.X - slider_frame.AbsolutePosition.X) / slider_frame.AbsoluteSize.X
        local value = ((max - min) * sizeX) + min

        set(value)
    end

    utility.connect(slider_drag.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            sliding = true
            slide(input)
        end
    end)

    utility.connect(slider_drag.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            sliding = false
        end
    end)

    utility.connect(services.InputService.InputChanged, function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if sliding then
                slide(input)
            end
        end
    end)

    slider_drag.MouseButton2Click:Connect(function()
        window.Visible = not window.Visible
    end)

    task.spawn(function()
        while task.wait() do
            if not getgenv().library then break end
            local val = nil
            if library.flags[flag .. "_FADING"] then
                local sinwave = math.abs(math.sin(os.clock() * (library.flags[flag .. "_FADING SPEED"] / 80)))

                val = utility.NumberLerp(sinwave, {
                    [1] = {
                        start = 0,
                        number = library.flags[flag .. "_FADING START"],
                    },
                    [2] = {
                        start = 1,
                        number = library.flags[flag .. "_FADING END"] + 1,
                    },
                })	
            end
            if val ~= nil then 
                set(val) 
            end
        end
    end)

    flags[flag] = set

    function slider_tbl:set(value)
        set(value)
    end

    return slider_tbl
end

function library.keybind(holder, name, default, mode, blacklist, flag, callback, offset, keybind_name, ignore)
    local key_mode = mode

    local title = utility.create("Text", {
        Text = name,
        Font = 2,
        Size = 13,
        Position = UDim2.new(0, 21, 0, 0),
        Theme = "Text",
        ZIndex = 21,
        Parent = holder
    })
    --
    if not offset then
        offset = -1
    end

    local keybindname = ""

    local keytext = utility.create("Text", {
        Font = 2,
        Size = 13,
        Theme = "Dark Text",
        Text = "[]",
        Position = UDim2.new(1, -33, 0, 0),
        ZIndex = 21,
        Parent = holder,
    })

    local frame = utility.create("Square",{
        Size = UDim2.new(0, keytext.TextBounds.X, 0, keytext.TextBounds.Y),
        Position = UDim2.new(1, -35, 0, 0),
        Filled = true,
        Parent = holder,
        Visible = true,
        Transparency = 0,
        Thickness = 1,
        ZIndex = 24
    })

    local keymodeInline = utility.create("Square",{
        Theme = "Outline",
        Size = UDim2.new(0, 112, 0, 60),
        Position = UDim2.new(1, -35, 0, 20),
        Filled = true,
        Parent = holder,
        Visible = false,
        Thickness = 1,
        ZIndex = 24
    })

    local keymode = utility.create("Square",{
        Theme = "Background",
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        Filled = true,
        Parent = keymodeInline,
        Thickness = 1,
        ZIndex = 24
    })

    local togglemode = utility.create("Text", {
        Font = 2,
        Size = 13,
        Theme = "Text",
        Position = UDim2.new(0, 3, 0, 40),
        ZIndex = 24,
        Text = "Toggle",
        Parent = keymode,
    })

    local togglemodebutton = utility.create("Square",{
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 40),
        Filled = true,
        Parent = keymodeInline,
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = 0,
        Thickness = 1,
        ZIndex = 24
    })

    local holdmode = utility.create("Text", {
        Font = 2,
        Size = 13,
        Theme = "Text",
        Position = UDim2.new(0, 3, 0, 22),
        ZIndex = 24,
        Text = "On hotkey",
        Parent = keymode,
    })

    local holdmodebutton = utility.create("Square",{
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 20),
        Filled = true,
        Parent = keymodeInline,
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = 0,
        Thickness = 1,
        ZIndex = 24
    })

    local alwaysmode = utility.create("Text", {
        Font = 2,
        Size = 13,
        Theme = "Text",
        Position = UDim2.new(0, 3, 0, 3),
        ZIndex = 24,
        Text = "Always On",
        Parent = keymode,
    })

    local alwaysmodebutton = utility.create("Square",{
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 0),
        Filled = true,
        Parent = keymodeInline,
        Color = Color3.fromRGB(255, 255, 255),
        Thickness = 1,
        Transparency = 0,
        ZIndex = 24
    })

    if mode == "Toggle" then
        utility.changeobjecttheme(togglemode, "Accent")
    elseif mode == "Hold" then
        utility.changeobjecttheme(holdmode, "Accent")
    elseif mode == "Always" then
        utility.changeobjecttheme(alwaysmode, "Accent")
    end

    local key = default
    local state = false
    local binding

    local function set(newkey)
        if string.find(tostring(newkey), "Enum") then
            if c then
                c:Disconnect()
                if flag then
                    library.flags[flag] = false
                end
                callback(false)
            end
            if tostring(newkey):find("Enum.KeyCode.") then
                newkey = Enum.KeyCode[tostring(newkey):gsub("Enum.KeyCode.", "")]
            elseif tostring(newkey):find("Enum.UserInputType.") then
                newkey = Enum.UserInputType[tostring(newkey):gsub("Enum.UserInputType.", "")]
            end
    
            if newkey ~= nil and not table.find(blacklist, newkey) then
                key = newkey
                local text = (keys[newkey] or tostring(newkey):gsub("Enum.KeyCode.", ""))
                keytext.Text = "["..text.."]"

                keytext.Position = UDim2.new(1, -(keytext.TextBounds.X + 19), 0, 0)
                frame.Position = UDim2.new(1, -(keytext.TextBounds.X + 19), 0, 1)
                frame.Size = UDim2.new(0, keytext.TextBounds.X, 0, keytext.TextBounds.Y)
            else
                key = nil
                local text = ""
                keytext.Text = "["..text.."]"

                keytext.Position = UDim2.new(1, -(keytext.TextBounds.X + 19), 0, 0)
                frame.Position = UDim2.new(1, -(keytext.TextBounds.X + 19), 0, 1)
                frame.Size = UDim2.new(0, keytext.TextBounds.X, 0, keytext.TextBounds.Y)
            end

            if library.flags[flag .. "_KEY STATE"] == "Always" then 
                state = true
                if flag then
                    library.flags[flag] = true
                end
                callback(true)
            end 

            library.flags[flag .. "_KEY"] = newkey

            if not library.keybind_list:exists(keybind_name) and ignore ~= true then
                library.keybind_list:add(keybind_name, "Text")
            end

            if library.keybind_list:exists(keybind_name) and ignore ~= true then
                library.keybind_list:change(keybind_name, ("[%s]: %s"):format(tostring(newkey):gsub("Enum.", ""):gsub("KeyCode.", ""):gsub("UserInputType.", ""), keybind_name))
            end
        elseif table.find({"Always", "Toggle", "Hold"}, newkey) then
            library.flags[flag .. "_KEY STATE"] = newkey
            key_mode = newkey

            if newkey == "Toggle" then
                utility.changeobjecttheme(togglemode, "Accent")
                utility.changeobjecttheme(holdmode, "Text")
                utility.changeobjecttheme(alwaysmode, "Text")
            elseif newkey == "Hold" then
                utility.changeobjecttheme(holdmode, "Accent")
                utility.changeobjecttheme(togglemode, "Text")
                utility.changeobjecttheme(alwaysmode, "Text")
            elseif newkey == "Always" then
                utility.changeobjecttheme(alwaysmode, "Accent")
                utility.changeobjecttheme(togglemode, "Text")
                utility.changeobjecttheme(holdmode, "Text")

                state = true
                if flag then
                    library.flags[flag] = true
                end
                callback(true)
            end
        end
        if newkey == "Always" or library.flags[flag .. "_KEY STATE"] == "Always" then 
            state = true
            if flag then
                library.flags[flag] = true
            end
            callback(true)
            if library.keybind_list:exists(keybind_name) and ignore ~= true then
                library.keybind_list:changeobjecttheme(keybind_name .. " txt", "Accent")
            end
        elseif bind ~= '' or bind ~= nil then
            state = false
            if flag then
                library.flags[flag] = state
            end
            callback(false)
        end

        if library.keybind_list:exists(keybind_name) and ignore ~= true then
            library.keybind_list:changeobjecttheme(keybind_name .. " txt", state and "Accent" or "Text")
        end
    end

    utility.connect(services.InputService.InputBegan, function(inp)
        library.flags[flag .. "_KEY"] = key
        if (inp.KeyCode == key or inp.UserInputType == key) and not binding then
            if key_mode == "Hold" then
                if flag then
                    library.flags[flag] = true
                end
                c = utility.connect(game:GetService("RunService").RenderStepped, function()
                    if callback then
                        callback(true)
                    end
                end)

                if library.keybind_list:exists(keybind_name) and ignore ~= true then
                    library.keybind_list:changeobjecttheme(keybind_name .. " txt", "Accent")
                end
            elseif key_mode == "Toggle" then
                state = not state
                if flag then
                    library.flags[flag] = state
                end
                callback(state)

                if library.keybind_list:exists(keybind_name) and ignore ~= true then
                    library.keybind_list:changeobjecttheme(keybind_name .. " txt", state and "Accent" or "Text")
                end
            elseif key_mode == "Always" then
                state = true
                if flag then
                    library.flags[flag] = true
                end
                callback(true)

                if library.keybind_list:exists(keybind_name) and ignore ~= true then
                    library.keybind_list:changeobjecttheme(keybind_name .. " txt", state and "Accent" or "Text")
                end
            end
        end
    end)

    set(default)
    set(mode)

    frame.MouseButton2Click:Connect(function()
        keymodeInline.Visible = not keymodeInline.Visible
    end)

    frame.MouseButton1Click:Connect(function()
        if not binding then

            keytext.Text = "[...]"
            
            keytext.Position = UDim2.new(1, -(keytext.TextBounds.X + 19), 0, 0)
            frame.Position = UDim2.new(1, -(keytext.TextBounds.X + 19), 0, 1)
            frame.Size = UDim2.new(0, keytext.TextBounds.X, 0, keytext.TextBounds.Y)
            
            binding = utility.connect(services.InputService.InputBegan, function(input, gpe)
                set(input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode or input.UserInputType)
                utility.disconnect(binding)
                task.wait()
                binding = nil
            end)
        end
    end)

    utility.connect(services.InputService.InputEnded, function(inp)
        if key_mode == "Hold" then
            if key ~= '' or key ~= nil then
                if inp.KeyCode == key or inp.UserInputType == key then
                    if c then
                        c:Disconnect()
                        if flag then
                            library.flags[flag] = false
                        end
                        if callback then
                            callback(false)
                        end

                        if library.keybind_list:exists(keybind_name) and ignore ~= true then
                            library.keybind_list:changeobjecttheme(keybind_name .. " txt", "Text")
                        end
                    end
                end
            end
        end
    end)

    togglemodebutton.MouseButton1Click:Connect(function()
        set("Toggle")
        utility.changeobjecttheme(togglemode, "Accent")
        utility.changeobjecttheme(holdmode, "Text")
        utility.changeobjecttheme(alwaysmode, "Text")
        keymodeInline.Visible = false
    end)

    holdmodebutton.MouseButton1Click:Connect(function()
        set("Hold")
        utility.changeobjecttheme(holdmode, "Accent")
        utility.changeobjecttheme(togglemode, "Text")
        utility.changeobjecttheme(alwaysmode, "Text")
        keymodeInline.Visible = false
    end)

    alwaysmodebutton.MouseButton1Click:Connect(function()
        set("Always")
        utility.changeobjecttheme(alwaysmode, "Accent")
        utility.changeobjecttheme(togglemode, "Text")
        utility.changeobjecttheme(holdmode, "Text")
        keymodeInline.Visible = false
    end)

    local keybindtypes = {}

    function keybindtypes:set(newkey)
        set(newkey)
    end

    function keybindtypes:set_mode(newmode)
        if newmode == "Hold" then
            key_mode = "Hold"
        elseif newmode == "Toggle" then
            key_mode = "Toggle"
        end
    end

    library.flags[flag .. "_KEY"] = default
    library.flags[flag .. "_KEY STATE"] = mode

    flags[flag] = set
    flags[flag .. "_KEY"] = set
    flags[flag .. "_KEY STATE"] = set

    return keybindtypes
end

function library.toggle(holder, toggle_name, toggle_state, toggle_flag, callback, zindex)
    zindex = zindex or 0

    -- settings
    local toggle_tbl = {colorpickers = 0}
    local toggled = false  
    --

    local button = utility.create("Square", {
        Parent = holder, 
        Visible = true, 
        Transparency = 0, 
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1, -18, 0, 8), 
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 22
    })

    local toggle_outline = utility.create("Square", {
        Parent = holder, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Outline",
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(0, 8, 0, 8), 
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 20
    })

    local toggle_frame = utility.create("Square", {
        Parent = toggle_outline, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Element Background",
        Position = UDim2.new(0, 1, 0, 1),
        Size = UDim2.new(1, -2, 1, -2), 
        Thickness = 1, 
        Filled = true, 
        ZIndex = zindex + 20
    })
    --
    local toggle_title = utility.create("Text", {
        Text = toggle_name, 
        Parent = holder, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Text", 
        Size = 13, 
        Center = false, 
        Font = 2, 
        Position = UDim2.new(0, 21, 0, -4), 
        ZIndex = zindex + 20
    })
    -- functions
    local function setstate()
        toggled = not toggled
        if toggled then
            utility.changeobjecttheme(toggle_frame, "Accent")
        else
            utility.changeobjecttheme(toggle_frame, "Element Background")
        end
        library.flags[toggle_flag] = toggled
        callback(toggled)
    end
    --
    button.MouseButton1Click:Connect(setstate)
    --
    local function set(bool)
        bool = type(bool) == "boolean" and bool or false
        if toggled ~= bool then
            setstate()
        end
    end
    set(toggle_state)
    flags[toggle_flag] = set

    local toggletypes = {}

    function toggletypes:slider(cfg)
        local slider_text = cfg.text or cfg.Text or ("[value]")
        local slider_min = cfg.min or cfg.Min or 0
        local slider_max = cfg.max or cfg.Max or 100
        local slider_float = cfg.float or cfg.Float or 1
        local slider_default = cfg.default or cfg.Default or 50
        local slider_flag = cfg.flag or cfg.Flag or utility.nextflag()
        local slider_callback = cfg.callback or cfg.Callback or function() end
        local slider_customtext = cfg.customnumber or cfg.CustomNumber or nil
        local slider_customval = cfg.customtext or cfg.CustomText or nil
        local slider_suffix = cfg.suffix or cfg.Suffix or nil

        local holder2 = utility.create("Square", {
            Parent = holder, 
            Visible = true, 
            Transparency = 0, 
            Size = UDim2.new(1,0,0,21), 
            Thickness = 1, 
            Filled = true, 
            ZIndex = 21,
        })

        local slider_table = library.slider(holder2, "", slider_text, slider_min, slider_max, slider_float, slider_default, slider_flag, slider_callback, 0, slider_suffix, slider_customtext, slider_customval)

        holder.Size = holder.Size + UDim2.new(0, 0, 0, 15)

        return slider_table
    end
    
    function toggletypes:set(bool)
        set(bool)
    end

    function toggletypes:keybind(cfg)
        local keybind_default = cfg.default or cfg.Default or ""
        local keybind_mode = cfg.mode or cfg.Mode or "Toggle"
        local keybind_blacklist = cfg.blacklist or cfg.Blacklist or {}
        local keybind_flag = cfg.flag or cfg.Flag or utility.nextflag()
        local keybind_callback = cfg.callback or cfg.Callback or function() end
        local list_name = cfg.listname or cfg.Listname or ""
        local ignore = cfg.ignore or cfg.Ignore or false

        button.Size = button.Size - UDim2.new(0, 20, 0, 0)

        local holder2 = utility.create("Square", {
            Parent = button, 
            Visible = true, 
            Transparency = 0, 
            Size = UDim2.new(1,0,0,20), 
            Position = UDim2.new(0, 37, 0, -3),
            Thickness = 1, 
            Filled = true, 
            ZIndex = zindex + 21,
        })

        local keybind_table = library.keybind(holder2, "", keybind_default, keybind_mode, keybind_blacklist, keybind_flag, keybind_callback, 0, list_name, ignore)

        return keybind_table
    end

    function toggletypes:colorpicker(cfg)
        toggle_tbl.colorpickers = toggle_tbl.colorpickers + 1
        local cp_tbl = {}

        local default = cfg.default or cfg.Default or Color3.fromRGB(255, 0, 0)
        local flag = cfg.flag or cfg.Flag or utility.nextflag()
        local callback = cfg.callback or function() end
        local defaultalpha = cfg.alpha or cfg.Alpha or 1
        local name = cfg.name or cfg.Name or ""

        button.Size = button.Size - UDim2.new(0, 23, 0, 0)

        local cp = library.colorpicker(holder, name, default, defaultalpha, toggle_tbl.colorpickers - 1, flag, callback, 0, 0)
        function cp_tbl:set(color)
            cp:set(color, false, true)
        end
        return cp_tbl
    end

    return toggletypes
end

function library.dropdown(holder, content, flag, callback, default, max, scrollable, scrollingmax, islist, size, zindex)
    zindex = zindex or 0

    local inline = utility.create("Square", {
        Filled = true,
        Visible = not islist,
        Thickness = 1,
        Theme = "Outline",
        Size = UDim2.new(1, -42, 0, 20),
        Position = UDim2.new(0, 21, 0, 13),
        ZIndex = zindex + 21,
        Parent = holder
    })
    
    local dropdown = utility.create("Square", {
        Filled = true,
        Visible = true,
        Thickness = 1,
        Theme = "Element Background 2",
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        ZIndex = zindex + 21,
        Parent = inline,
    })

    utility.create("Image", {
        Parent = dropdown,
        Visible = true,
        Transparency = 0.2, 
        Data = images.gradient180,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = zindex + 21,
    })

    local value = utility.create("Text", {
        Text = "-",
        Font = 2,
        Size = 13,
        Position = UDim2.new(0, 4, 0, 2),
        Theme = "Text",
        ZIndex = zindex + 21,
        Parent = dropdown
    })

    local icon = utility.create("Image", {
        Parent = dropdown,
        Visible = true,
        Transparency = 1, 
        Data = images.downarrow,
        Size = UDim2.new(0, 5, 0, 4),
        Position = UDim2.new(1, -13, 0, 7),
        ZIndex = zindex + 21,
    })

    local contentframe = utility.create("Square", {
        Filled = true,
        Visible = islist and true or false,
        Thickness = 1,
        Theme = "Outline",
        Size = islist and UDim2.new(1, -42, 0, size) or UDim2.new(1, 2, 0, 0),
        Position = islist and UDim2.new(0, 21, 0, 9) or UDim2.new(0, -1, 1, 0),
        ZIndex = zindex + 25,
        Parent = islist and holder or dropdown
    })

    local contentback = utility.create("Square", {
        Filled = true,
        Visible = true,
        Thickness = 1,
        Theme = "Background",
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        ZIndex = zindex + 25,
        Parent = contentframe
    })

    local contentholder = utility.create("Square", {
        Transparency = 0,
        Size = UDim2.new(1, -6, 1, -6),
        Position = UDim2.new(0, 3, 0, 3),
        Color = Color3.fromRGB(255, 255, 255),
        Visible = true,
        Parent = contentframe
    })

    if scrollable then
        contentholder:MakeScrollable()
    end

    contentholder:AddListLayout(3)

    local mouseover = false

    local opened = false

    if not islist then
        dropdown.MouseButton1Click:Connect(function()
            opened = not opened

            icon.Data = opened and images.uparrow or images.downarrow

            contentframe.Visible = opened
        end)
    end

    local optioninstances = {}
    local count = 0
    local countindex = {}

    local function createoption(name)
        optioninstances[name] = {}

        countindex[name] = count + 1

        local button = utility.create("Square", {
            Filled = true,
            Transparency = 0,
            Thickness = 1,
            Size = UDim2.new(1, 0, 0, 16),
            ZIndex = zindex + 26,
            Parent = contentholder
        })

        optioninstances[name].button = button

        local title = utility.create("Text", {
            Text = name,
            Font = 2,
            Size = 13,
            Position = UDim2.new(0, 2, 0, 1),
            Theme = "Text",
            ZIndex = zindex + 26,
            Parent = button
        })

        optioninstances[name].text = title

        if scrollable then
            if count < scrollingmax and not islist then
                contentframe.Size = UDim2.new(1, 2, 0, contentholder.AbsoluteContentSize + 6)
            end
        else
            if not islist then
                contentframe.Size = UDim2.new(1, 2, 0, contentholder.AbsoluteContentSize + 6)
            end
        end

        if islist then
            holder.Position = holder.Position
        end

        count = count + 1

        return button, title
    end

    local chosen = max and {}

    local function handleoptionclick(option, button, text)
        button.MouseButton1Click:Connect(function()
            if max then
                if table.find(chosen, option) then
                    table.remove(chosen, table.find(chosen, option))

                    local textchosen = {}
                    local cutobject = false

                    for _, opt in next, chosen do
                        table.insert(textchosen, opt)

                        if utility.textlength(table.concat(textchosen, ", ") .. ", ...", Drawing.Fonts.Plex, 13).X > (dropdown.AbsoluteSize.X - 18) then
                            cutobject = true
                            table.remove(textchosen, #textchosen)
                        end
                    end

                    value.Text = #chosen == 0 and "-" or table.concat(textchosen, ", ") .. (cutobject and ", ..." or "")

                    utility.changeobjecttheme(text, "Text")

                    library.flags[flag] = chosen
                    callback(chosen)
                else
                    if #chosen == max then
                        utility.changeobjecttheme(optioninstances[chosen[1]].text, "Text")

                        table.remove(chosen, 1)
                    end

                    table.insert(chosen, option)

                    local textchosen = {}
                    local cutobject = false

                    for _, opt in next, chosen do
                        table.insert(textchosen, opt)

                        if utility.textlength(table.concat(textchosen, ", ") .. ", ...", Drawing.Fonts.Plex, 13).X > (dropdown.AbsoluteSize.X - 18) then
                            cutobject = true
                            table.remove(textchosen, #textchosen)
                        end
                    end

                    value.Text = #chosen == 0 and "-" or table.concat(textchosen, ", ") .. (cutobject and ", ..." or "")

                    utility.changeobjecttheme(text, "Accent")

                    library.flags[flag] = chosen
                    callback(chosen)
                end
            else
                for opt, tbl in next, optioninstances do
                    if opt ~= option then
                        utility.changeobjecttheme(tbl.text, "Text")
                    end
                end

                chosen = option

                value.Text = option

                utility.changeobjecttheme(text, "Accent")

                library.flags[flag] = option
                callback(option)

            end
        end)
    end

    local function createoptions(tbl)
        for _, option in next, tbl do
            local button, text = createoption(option)
            handleoptionclick(option, button, text)
        end
    end

    createoptions(content)

    local set
    set = function(option)
        if max then
            option = type(option) == "table" and option or {}
            table.clear(chosen)

            for opt, tbl in next, optioninstances do
                if not table.find(option, opt) then
                    --tbl.button.Transparency = 0
                    utility.changeobjecttheme(tbl.text, "Text")
                end
            end

            for i, opt in next, option do
                if table.find(content, opt) and #chosen < max then
                    table.insert(chosen, opt)
                    --optioninstances[opt].button.Transparency = 1
                    utility.changeobjecttheme(optioninstances[opt].text, "Accent")
                end
            end

            local textchosen = {}
            local cutobject = false

            for _, opt in next, chosen do
                table.insert(textchosen, opt)

                if utility.textlength(table.concat(textchosen, ", ") .. ", ...", Drawing.Fonts.Plex, 13).X > (dropdown.AbsoluteSize.X - 6) then
                    cutobject = true
                    table.remove(textchosen, #textchosen)
                end
            end

            value.Text = #chosen == 0 and "-" or table.concat(textchosen, ", ") .. (cutobject and ", ..." or "")

            library.flags[flag] = chosen
            callback(chosen)
        end

        if not max then
            for opt, tbl in next, optioninstances do
                if opt ~= option then
                    utility.changeobjecttheme(tbl.text, "Text")
                end
            end

            if table.find(content, option) then
                chosen = option

                value.Text = option

                utility.changeobjecttheme(optioninstances[option].text, "Accent")

                library.flags[flag] = chosen
                callback(chosen)
            else
                chosen = nil

                value.Text = "-"

                library.flags[flag] = chosen
                callback(chosen)
            end
        end
    end

    flags[flag] = set

    set(default)

    local dropdowntypes = utility.table({}, true)

    function dropdowntypes:set(option)
        set(option)
    end

    function dropdowntypes:refresh(tbl)
        content = table.clone(tbl)
        count = 0

        for _, opt in next, optioninstances do
            coroutine.wrap(function()
                opt.button:Remove()
            end)()
        end

        table.clear(optioninstances)

        createoptions(tbl)

        if scrollable then
            contentholder:RefreshScrolling()
        end

        value.Text = "-"

        if max then
            table.clear(chosen)
        else
            chosen = nil
        end

        library.flags[flag] = chosen
        callback(chosen)
    end

    function dropdowntypes:add(option)
        table.insert(content, option)
        local button, text = createoption(option)
        handleoptionclick(option, button, text)
    end

    function dropdowntypes:remove(option)
        if optioninstances[option] then
            count = count - 1

            optioninstances[option].button:Remove()

            if scrollable then
                contentframe.Size = UDim2.new(1, 2, 0, math.clamp(contentholder.AbsoluteContentSize, 0, (scrollingmax * 16) + ((scrollingmax - 1) * 3)) + 6)
            else
                contentframe.Size = UDim2.new(1, 2, 0, contentholder.AbsoluteContentSize + 6)
            end

            optioninstances[option] = nil

            if max then
                if table.find(chosen, option) then
                    table.remove(chosen, table.find(chosen, option))

                    local textchosen = {}
                    local cutobject = false

                    for _, opt in next, chosen do
                        table.insert(textchosen, opt)

                        if utility.textlength(table.concat(textchosen, ", ") .. ", ...", Drawing.Fonts.Plex, 13).X > (dropdown.AbsoluteSize.X - 6) then
                            cutobject = true
                            table.remove(textchosen, #textchosen)
                        end
                    end

                    value.Text = #chosen == 0 and "-" or table.concat(textchosen, ", ") .. (cutobject and ", ..." or "")

                    library.flags[flag] = chosen
                    callback(chosen)
                end
            end
        end
    end

    return dropdowntypes
end

function library.button(holder, button_name, button_confirm, callback)
    local button_inline = utility.create("Square", {
        Position = UDim2.new(0, 22, 0, 1),
        Parent = holder, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Inline",
        Size = UDim2.new(1, -44, 0, 23), 
        Thickness = 1, 
        Filled = true, 
        ZIndex = 21
    })

    utility.outline(button_inline, "Outline", 20)

    local button_frame = utility.create("Square", {
        Position = UDim2.new(0, 1, 0, 1),
        Parent = button_inline, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Background",
        Size = UDim2.new(1, -2, 1, -2), 
        Thickness = 1, 
        Filled = true, 
        ZIndex = 21
    })

    utility.create("Image", {
        Parent = button_frame,
        Visible = true,
        Transparency = 0.2, 
        Data = images.gradient180,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 21,
    })

    local button_title = utility.create("Text", {
        Text = button_name, 
        Parent = button_frame, 
        Visible = true, 
        Transparency = 1, 
        Theme = "Text", 
        Size = 13, 
        Center = true, 
        Font = 2, 
        Position = UDim2.new(0.5, 1, 0.5, -7), 
        ZIndex = 22
    })
    
    local clicked, counting = false, false
    utility.connect(button_frame.MouseButton1Click, function()
        task.spawn(function()
            if button_confirm then
                if clicked then
                    clicked = false
                    counting = false
                    utility.changeobjecttheme(button_title, "Text")
                    button_title.Text = button_name
                    callback()
                else
                    clicked = true
                    counting = true
                    for i = 3,1,-1 do
                        if not counting then
                            break
                        end
                        button_title.Text = 'confirm '..button_name..'? '..tostring(i)
                        utility.changeobjecttheme(button_title, "Accent")
                        wait(1)
                    end
                    clicked = false
                    counting = false
                    utility.changeobjecttheme(button_title, "Text")
                    button_title.Text = button_name
                end
            else
                callback()
            end
        end)
    end)
    utility.connect(button_frame.MouseButton1Down, function()
        utility.changeobjecttheme(button_frame, "Background 2")
    end)
    utility.connect(button_frame.MouseButton1Up, function()
        utility.changeobjecttheme(button_frame, "Background")
    end)
end

function library.text(box, text, callback, finishedcallback)
    box.MouseButton1Click:Connect(function()
        services.ContextActionService:BindActionAtPriority("disablekeyboard", function() return Enum.ContextActionResult.Sink end, false, 3000, Enum.UserInputType.Keyboard)

        local connection
        local backspaceconnection

        local keyqueue = 0

        if not connection then
            connection = utility.connect(services.InputService.InputBegan, function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    if input.KeyCode ~= Enum.KeyCode.Backspace then
                        local str = services.InputService:GetStringForKeyCode(input.KeyCode)

                        if table.find(allowedcharacters, str) then
                            keyqueue = keyqueue + 1
                            local currentqueue = keyqueue

                            if not services.InputService:IsKeyDown(Enum.KeyCode.RightShift) and not services.InputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                                text.Text = text.Text .. str:lower()
                                callback(text.Text)

                                local ended = false

                                coroutine.wrap(function()
                                    task.wait(0.5)

                                    while services.InputService:IsKeyDown(input.KeyCode) and currentqueue == keyqueue  do
                                        text.Text = text.Text .. str:lower()
                                        callback(text.Text)

                                        task.wait(0.02)
                                    end
                                end)()
                            else
                                text.Text = text.Text .. (shiftcharacters[str] or str:upper())
                                callback(text.Text)

                                coroutine.wrap(function()
                                    task.wait(0.5)

                                    while services.InputService:IsKeyDown(input.KeyCode) and currentqueue == keyqueue  do
                                        text.Text = text.Text .. (shiftcharacters[str] or str:upper())
                                        callback(text.Text)

                                        task.wait(0.02)
                                    end
                                end)()
                            end
                        end
                    end

                    if input.KeyCode == Enum.KeyCode.Return then
                        services.ContextActionService:UnbindAction("disablekeyboard")
                        utility.disconnect(backspaceconnection)
                        utility.disconnect(connection)
                        finishedcallback(text.Text)
                    end
                elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                    services.ContextActionService:UnbindAction("disablekeyboard")
                    utility.disconnect(backspaceconnection)
                    utility.disconnect(connection)
                    finishedcallback(text.Text)
                end
            end)

            local backspacequeue = 0

            backspaceconnection = utility.connect(services.InputService.InputBegan, function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Backspace then
                    backspacequeue = backspacequeue + 1

                    text.Text = text.Text:sub(1, -2)
                    callback(text.Text)

                    local currentqueue = backspacequeue

                    coroutine.wrap(function()
                        task.wait(0.5)

                        if backspacequeue == currentqueue then
                            while services.InputService:IsKeyDown(Enum.KeyCode.Backspace) do
                                text.Text = text.Text:sub(1, -2)
                                callback(text.Text)

                                task.wait(0.02)
                            end
                        end
                    end)()
                end
            end)
        end
    end)
end

function library.textbox(holder, placeholder, default, middle, flag, callback)
    local textbox_tbl = {}
    
    local textbox = utility.create("Square", {
        Filled = true,
        Visible = true,
        Thickness = 0,
        Theme = "Inline",
        Position = UDim2.new(0, 22, 0, 1),
        Size = UDim2.new(1,-44,0,18),
        ZIndex = 22,
        Parent = holder
    })

    local outline = utility.outline(textbox, "Outline", 21)
    
    local textboxback = utility.create("Square", {
        Filled = true,
        Visible = true,
        Thickness = 0,
        Theme = "Background 2",
        Position = UDim2.new(0, 1, 0, 1),
        Size = UDim2.new(1, -2, 1, -2),
        ZIndex = 22,
        Parent = textbox
    })

    local text = utility.create("Text", {
        Text = default,
        Font = 2,
        Size = 13,
        Center = middle,
        Position = middle and UDim2.new(0.5,0,0,2) or UDim2.new(0, 3, 0, 2),
        Theme = "Text",
        ZIndex = 22,
        Parent = textbox
    })
    --
    local placeholder = utility.create("Text", {
        Text = placeholder,
        Font = 2,
        Transparency = 0.5,
        Size = 13,
        Center = middle,
        Position = middle and UDim2.new(0.5,0,0,2) or UDim2.new(0, 3, 0, 2),
        Theme = "Dark Text",
        ZIndex = 22,
        Parent = textbox
    })
    -- functions
    library.text(textbox, text,  function(str) 
        if str == "" then
            placeholder.Visible = true
            text.Visible = false
        else
            placeholder.Visible = false
            text.Visible = true
        end
    end, function(str)
        library.flags[flag] = str
        callback(str)
    end)

    local function set(str)
        text.Visible = str ~= ""
        placeholder.Visible = str == ""
        text.Text = str
        library.flags[flag] = str
        callback(str)
    end

    set(default)

    flags[flag] = set

    function textbox_tbl:Set(str)
        set(str)
    end

    return textbox_tbl
end

function library.colorpicker(holder, name, default, defaultalpha, count, flag, callback, offset, zindex)
    local bkrc = utility.create("Square", {
        Theme = "Element Background",
        Filled = true,
        Thickness = 0,
        Color = default,
        Parent = holder,
        Transparency = 1,
        Size = UDim2.new(0, 15, 0, 7),
        Position = UDim2.new(1, -37 - (count * 15) - (count * 6), 0, 0 + offset),
        ZIndex = zindex + 21
    })

    local icon = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Color = default,
        Parent = bkrc,
        Transparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = zindex + 22
    })

    utility.create("Image", {
        Parent = icon,
        Visible = true,
        Transparency = 0.5, 
        Data = images.gradient90,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 23,
    })
    
    utility.outline(bkrc, "Outline", zindex + 20)

    local window = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Parent = icon,
        Theme = "Inline",
        Size = UDim2.new(0, 179, 0, 175),
        Visible = false,
        Position = UDim2.new(1, -185 + (count * 20) + (count * 6), 1, 6),
        ZIndex = zindex + 26,
    })

    table.insert(pickers, window)

    local windowback = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Parent = window,
        Theme = "Background",
        Size = UDim2.new(1, -2, 1, -2),
        Visible = true,
        Position = UDim2.new(0, 1, 0, 1),
        ZIndex = zindex + 26,
    })

    local outline1 = utility.outline(window, "Outline", zindex + 25)

    local saturationinline = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Parent = window,
        Color = default,
        Theme = "Outline",
        Size = UDim2.new(0, 154, 0, 150),
        Position = UDim2.new(0, 4, 0, 4),
        ZIndex = zindex + 28
    })

    local saturation = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Parent = saturationinline,
        Color = default,
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        ZIndex = zindex + 28
    })

    utility.create("Image", {
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = zindex + 28,
        Parent = saturation,
        Data = decode("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")
    })

    local saturationpicker = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Parent = saturation,
        Color = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(0, 2, 0, 2),
        ZIndex = zindex + 29
    })  

    utility.outline(saturationpicker, "Outline", zindex + 28)

    local hueframe = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Theme = "Outline",
        Parent = window,
        Size = UDim2.new(0,15, 0, 150),
        Position = UDim2.new(0, 160, 0, 4),
        ZIndex = zindex + 28
    })

    utility.create("Image", {
        Size = UDim2.new(1, -2, 1, -2),
        ZIndex = zindex + 28,
        Parent = hueframe,
        Position = UDim2.new(0, 1, 0, 1),
        Data = syn.crypt.base64.decode("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")
    })

    local huepicker = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Parent = hueframe,
        Color = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(1,0,0,1),
        ZIndex = zindex + 29
    })

    utility.outline(huepicker, "Outline", zindex + 28)

    local alphainlineframe = utility.create("Square", {
        Filled = true,
        Thickness = 1,
        Size = UDim2.new(0, 154, 0, 15),
        Position = UDim2.new(0, 4, 0, 156),
        Theme = "Outline",
        ZIndex = zindex + 28,
        Parent = window
    })

    local alphaframe = utility.create("Square", {
        Filled = true,
        Thickness = 1,
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        ZIndex = zindex + 28,
        Parent = alphainlineframe
    })

    local alphapicker = utility.create("Square", {
        Filled = true,
        Thickness = 0,
        Parent = alphaframe,
        Color = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(0, 1, 1, 0),
        ZIndex = zindex + 29
    })

    utility.outline(alphapicker, "Outline", zindex + 28)

    local mouseover = false

    local hue, sat, val = default:ToHSV()
    local hsv = default:ToHSV()
    local alpha = defaultalpha
    local oldcolor = hsv

    local function set(color, a, nopos, setcolor)
        if type(color) == "table" then
            a = color.alpha
            color = Color3.fromHex(color.color)
        end

        if type(color) == "string" then
            color = Color3.fromHex(color)
        end

        local oldcolor = hsv
        local oldalpha = alpha

        hue, sat, val = color:ToHSV()
        alpha = a or nil
        hsv = Color3.fromHSV(hue, sat, val)

        if hsv ~= oldcolor or alpha ~= oldalpha then
            icon.Color = hsv
            alphaframe.Color = hsv
            saturation.Color = hsv

            if alpha ~= nil then
                icon.Transparency = alpha
            end
            if not nopos then
                saturationpicker.Position = UDim2.new(0, (math.clamp(sat * saturation.AbsoluteSize.X, 0, saturation.AbsoluteSize.X - 2)), 0, (math.clamp((1 - val) * saturation.AbsoluteSize.Y, 0, saturation.AbsoluteSize.Y - 2)))
                huepicker.Position = UDim2.new(0, 0, 0, math.clamp(hue * hueframe.AbsoluteSize.Y, 0, hueframe.AbsoluteSize.Y - 2))
                if alpha ~= nil then
                    alphapicker.Position = UDim2.new(0,  math.clamp((1 - alpha) * alphaframe.AbsoluteSize.Y, 0, alphaframe.AbsoluteSize.X - 2), 0, 0)
                end
                if setcolor then
                    saturation.Color = hsv
                end
            end

            if flag then 
                library.flags[flag] = utility.rgba(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha)
            end

            callback(utility.rgba(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha))

        end
    end

    flags[flag] = set

    set(default, defaultalpha, false, true)

    local defhue, _, _ = default:ToHSV()

    local curhuesizey = defhue

    local function updatesatval(input, set_callback)
        local sizeX = math.clamp((input.Position.X - saturation.AbsolutePosition.X) / saturation.AbsoluteSize.X, 0, 1)
        local sizeY = 1 - math.clamp(((input.Position.Y - saturation.AbsolutePosition.Y) + 36) / saturation.AbsoluteSize.Y, 0, 1)
        local posY = math.clamp(((input.Position.Y - saturation.AbsolutePosition.Y) / saturation.AbsoluteSize.Y) * saturation.AbsoluteSize.Y + 36, 0, saturation.AbsoluteSize.Y - 2)
        local posX = math.clamp(((input.Position.X - saturation.AbsolutePosition.X) / saturation.AbsoluteSize.X) * saturation.AbsoluteSize.X, 0, saturation.AbsoluteSize.X - 2)

        saturationpicker.Position = UDim2.new(0, posX, 0, posY)

        if set_callback then
            set(Color3.fromHSV(curhuesizey or hue, sizeX, sizeY), alpha or defaultalpha, true, false)
        end
    end

    local slidingsaturation = false

    saturation.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            slidingsaturation = true
            updatesatval(input, true)
        end
    end)

    saturation.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            slidingsaturation = false
            updatesatval(input, true)
        end
    end)

    local slidinghue = false

    local function updatehue(input, set_callback)
        local sizeY = 1 - math.clamp(((input.Position.Y - hueframe.AbsolutePosition.Y) + 36) / hueframe.AbsoluteSize.Y, 0, 1)
        local posY = math.clamp(((input.Position.Y - hueframe.AbsolutePosition.Y) / hueframe.AbsoluteSize.Y) * hueframe.AbsoluteSize.Y + 36, 0, hueframe.AbsoluteSize.Y - 2)

        huepicker.Position = UDim2.new(0, 0, 0, posY)
        saturation.Color = Color3.fromHSV(sizeY, 1, 1)
        curhuesizey = sizeY
        if set_callback then
           set(Color3.fromHSV(sizeY, sat, val), alpha or defaultalpha, true, true)
        end
    end

    hueframe.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            slidinghue = true
            updatehue(input, true)
        end
    end)

    hueframe.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            slidinghue = false
            updatehue(input, true)
        end
    end)

    local slidingalpha = false

    local function updatealpha(input, set_callback)
        local sizeY = 1 - math.clamp(((input.Position.X - alphaframe.AbsolutePosition.X)) / alphaframe.AbsoluteSize.X, 0, 1)
        local posY = math.clamp(((input.Position.X - alphaframe.AbsolutePosition.X) / alphaframe.AbsoluteSize.X) * alphaframe.AbsoluteSize.X, 0, alphaframe.AbsoluteSize.X - 2)

        alphapicker.Position = UDim2.new(0, posY, 0, 0)
        if set_callback then
           set(Color3.fromHSV(curhuesizey, sat, val), sizeY, true)
        end
    end

    alphaframe.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            slidingalpha = true
            updatealpha(input, true)
        end
    end)

    alphaframe.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            slidingalpha = false
            updatealpha(input, true)
        end
    end)

    utility.connect(services.InputService.InputChanged, function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if slidingalpha then
                updatealpha(input, true)
            end

            if slidinghue then
                updatehue(input, true)
            end

            if slidingsaturation then
                updatesatval(input, true)
            end
        end
    end)

    icon.MouseButton1Click:Connect(function()
        window.Visible = not window.Visible

        if slidinghue then
            slidinghue = false
        end

        if slidingsaturation then
            slidingsaturation = false
        end

        if slidingalpha then
            slidingalpha = false
        end
    end)

    local colorpickertypes = {}

    function colorpickertypes:set(color)
        set(color)
    end

    return colorpickertypes, window
end

function library:list(cfg)
    local list_table = {}
    local icon = cfg.icon or cfg.Icon or nil
    local name = cfg.name or cfg.Name or "key-binds"
    local addon = cfg.addon or cfg.Addon or ""
    local followsize = cfg.fsize or false
    local size = cfg.fsize and 0 or cfg.size or cfg.Size or UDim2.new(0, 200, 0, 25)
    local pos = cfg.pos or cfg.Pos or UDim2.new(0, 5, 0, 500)
    if name:find("-") then
        name = name:split("-")
    end
    local fullstr = ""
    if type(name) == "table" then
        fullstr = name[1] .. name[2] .. addon
    else
        fullstr = name .. addon
    end

    local objects = {}
    local text = {}

    local txtsize = utility.textlength(fullstr, 2, 13)

    local window_outline = utility.create("Square", {
        Size = size,
        Position = pos,
        Theme = "Outline",
        Visible = true,
        Filled = true,
        ZIndex = 1,
    })

    local window_inline = utility.create("Square", {
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        Theme = "Inline",
        Parent = window_outline,
        Visible = true,
        Filled = true,
        ZIndex = 1,
    })

    local window_background = utility.create("Square", {
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        Theme = "Background",
        Parent = window_inline,
        Visible = true,
        Filled = true,
        ZIndex = 1,
    })

    utility.create("Square", {
        Size = UDim2.new(1, 2, 0, 1),
        Position = UDim2.new(0, -1, 0, -1),
        Theme = "Accent",
        Parent = window_background,
        Visible = true,
        Filled = true,
        ZIndex = 1,
    })

    local drag_holder = utility.create("Square", {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        Transparency = 0,
        Parent = window_background,
        Visible = true,
        Filled = true,
        ZIndex = 2,
    })

    utility.drag(drag_holder, window_outline)

    if type(name) == "table" then
        utility.create("Text", {
            Visible = true,
            Font = 2,
            Size = 13,
            ZIndex = 3,
            Parent = window_background,
            Text = name[1],
            Position = UDim2.new(0, 4, 0, 3),
            Theme = "Text",
        })

        utility.create("Text", {
            Visible = true,
            Font = 2,
            Size = 13,
            ZIndex = 3,
            Parent = window_background,
            Text = name[2],
            Position = UDim2.new(0, 3 + utility.textlength(name[1], 2, 13).X, 0, 3),
            Theme = "Accent",
        })
    else
        utility.create("Text", {
            Visible = true,
            Font = 2,
            Size = 13,
            ZIndex = 3,
            Parent = window_background,
            Center = false,
            Text = name,
            Position = UDim2.new(0, 4, 0, 3),
            Theme = "Text",
        })
    end

    local txt = utility.create("Text", {
        Visible = true,
        Font = 2,
        Size = 13,
        ZIndex = 2,
        Parent = window_background,
        Text = addon,
        Position = type(name) == "table" and UDim2.new(0, 3 + utility.textlength(name[1], 2, 13).X + utility.textlength(name[2], 2, 13).X, 0, 3) or UDim2.new(0, 3 + utility.textlength(name, 2, 13).X, 0, 3),
        Theme = "Text",
    })

    local window_content = utility.create("Square", {
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 0, 20),
        Transparency = 0,
        Visible = true,
        Filled = true,
        ZIndex = 2,
        Parent = window_background,
    })

    window_content:AddListLayout(3)

    local function add(str, theme)
        objects[str] = utility.create("Square", {
            Size = UDim2.new(1, 0, 0, 15),
            Position = UDim2.new(0, 0, 0, 0),
            Parent = window_content,
            Theme = "Background",
            Visible = true,
            Filled = true,
            ZIndex = 3,
        })

        objects[str .. " txt"] = utility.create("Text", {
            Text = str, 
            Parent = objects[str], 
            Visible = true, 
            Transparency = 1, 
            Theme = theme, 
            Size = 13, 
            Center = false, 
            Font = Drawing.Fonts.Plex, 
            Position = UDim2.new(0, 3, 0, 0), 
            ZIndex = 3
        })

        table.insert(text, objects[str .. " txt"])

        window_outline.Size += UDim2.new(0, 0, 0, 18)
    end

    local function divider(str, theme)
        objects[str .. "holder"] = utility.create("Square", {
            Size = UDim2.new(1, 1, 0, 4),
            Position = UDim2.new(0, 3, 0, 0),
            Parent = window_content,
            Transparency = 0,
            Visible = true,
            Filled = true,
            ZIndex = 3,
        })

        objects[str] = utility.create("Square", {
            Size = UDim2.new(1, -9, 0, 1),
            Position = UDim2.new(0, 4, 0, 1),
            Parent = objects[str .. "holder"] ,
            Theme = theme,
            Visible = true,
            Filled = true,
            ZIndex = 3,
        })

        window_outline.Size += UDim2.new(0, 0, 0, 7)
    end

    function list_table:add(str, theme)
        add(str, theme)
    end

    function list_table:divider(str, theme)
        divider(str, theme)
    end

    function list_table:exists(str)
        return objects[str] and true or false
    end

    function list_table:change(object, str)
        objects[object .. " txt"].Text = str
    end

    function list_table:changeobjecttheme(object, theme)
        utility.changeobjecttheme(objects[object], theme)
    end

    function list_table:addon(text)
        txt.Text = text
        addon = text
        fullstr = name[1] .. name[2] .. addon
        txtsize = utility.textlength(fullstr, 2, 13)
    end

    function list_table:remove(object)
        objects[object]:Remove()
        objects[object] = nil

        window_outline.Size -= UDim2.new(0, 0, 0, 17)
    end

    function list_table:size(size)
        window_outline.Size = UDim2.new(0, size.X, 0, size.Y)
    end

    function list_table:addsize(size)
        window_outline.Size += UDim2.new(0, size.X, 0, size.Y)
    end

    function list_table:getsize()
        return txtsize
    end
    
    function list_table:visible(vis)
        window_outline.Visible = vis
    end
    
    function list_table:sectioncontent()
        return window_content
    end

    function list_table:window()
        return window_background
    end

    function list_table:outline()
        return window_outline
    end

    function list_table:objects()
        return objects
    end

    function list_table:text()
        return text
    end

    return list_table
end

function library:window(cfg)
    local window_table = {sections = {}, buttons = {}, gradients = {}, outlines = {}, accents = {}, backgrounds = {}}
    local size = cfg.size or cfg.Size or UDim2.new(0, 440, 0, 520)
    local tabcount = cfg.tabs or cfg.Tabs or 4
    local name = cfg.name or cfg.Name or "game-shark"
    local keybinds = library:list({name = "Key-binds", pos = UDim2.new(0, 8, 0, 500)})
    keybinds:divider("hehe", "Element Background")
    library.keybind_list = keybinds

    name = name:split("-")

    local window_outline = utility.create("Square", {
        Size = size,
        Position = utility.getcenter(size.X.Offset, size.Y.Offset),
        Theme = "Outline",
        Visible = true,
        Filled = true,
        ZIndex = 2,
    })

    library.holder = window_outline

    local window_inline = utility.create("Square", {
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        Theme = "Inline",
        Parent = window_outline,
        Visible = true,
        Filled = true,
        ZIndex = 2,
    })

    local window_background = utility.create("Square", {
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        Theme = "Background",
        Parent = window_inline,
        Visible = true,
        Filled = true,
        ZIndex = 2,
    })

    local drag_holder = utility.create("Square", {
        Size = UDim2.new(1, 0, 0, 25),
        Position = UDim2.new(0, 0, 0, 0),
        Transparency = 0,
        Parent = window_background,
        Visible = true,
        Filled = true,
        ZIndex = 5,
    })

    utility.drag(drag_holder, window_outline)

    utility.create("Square", {
        Size = UDim2.new(1, 2, 0, 1),
        Position = UDim2.new(0, -1, 0, -1),
        Theme = "Accent",
        Parent = window_background,
        Visible = true,
        Filled = true,
        ZIndex = 2,
    })

    utility.create("Text", {
        Visible = true,
        Font = 2,
        Size = 13,
        ZIndex = 3,
        Parent = window_background,
        Text = name[1],
        Position = UDim2.new(0, 4, 0, 5),
        Theme = "Text",
    })

    utility.create("Text", {
        Visible = true,
        Font = 2,
        Size = 13,
        ZIndex = 3,
        Parent = window_background,
        Text = name[2],
        Position = UDim2.new(0, 3 + utility.textlength(name[1], 2, 13).X, 0, 5),
        Theme = "Accent",
    })

    local window_holder_outline = utility.create("Square", {
        Size = UDim2.new(1, -6, 1, -28),
        Position = UDim2.new(0, 3, 0, 25),
        Theme = "Inline",
        Parent = window_background,
        Visible = true,
        Filled = true,
        ZIndex = 2,
    })

    local window_holder = utility.create("Square", {
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        Theme = "Outline",
        Parent = window_holder_outline,
        Visible = true,
        Filled = true,
        ZIndex = 2,
    })

    utility.create("Image", {
        Parent = window_holder,
        Position = UDim2.new(0, 1, 0, 1),
        Data = images.checkers,
        Size = UDim2.new(1, -2, 1, -2),
        Visible = true,
        ZIndex = 3,
    })

    local tab_holder = utility.create("Square", {
        Size = UDim2.new(1, -2, 0, 23),
        Position = UDim2.new(0, 1, 0, 1),
        Transparency = 0,
        Parent = window_holder,
        Visible = true,
        Filled = true,
        ZIndex = 4,
    })
    
    local section_holder = utility.create("Square", {
        Size = UDim2.new(1, -8, 1, -39),
        Position = UDim2.new(0, 4, 0, 35),
        Transparency = 0,
        Parent = window_holder,
        Visible = true,
        Filled = true,
        ZIndex = 6,
    })
    
    function window_table:tab(cfg)
        local tab_table = {}
        local tab_name = cfg.name or cfg.Name or "tab"

        local button = utility.create("Square", {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0, 0, 0, 0),
            Color = Color3.new(1,1,1),
            Parent = tab_holder,
            Theme = "Inline",
            Visible = true,
            Filled = true,
            ZIndex = 4,
        })

        local background = utility.create("Square", {
            Size = UDim2.new(1, -2, 1, -1),
            Position = UDim2.new(0, 1, 0, 0),
            Color = Color3.new(1,1,1),
            Parent = button,
            Theme = "Background 2",
            Visible = true,
            Filled = true,
            ZIndex = 5,
        })

        local section = utility.create("Square", {
            Size = UDim2.new(1, 0, 1, 0),
            Transparency = 0,
            Parent = section_holder,
            Visible = true,
            Filled = true,
            ZIndex = 5,
        })

        local left = utility.create("Square", {
            Size = UDim2.new(0.5, -3, 1, 0),
            Transparency = 0,
            Parent = section,
            Visible = true,
            Filled = true,
            ZIndex = 5,
        })

        local right = utility.create("Square", {
            Size = UDim2.new(0.5, -3, 1, 0),
            Position = UDim2.new(0.5, 3, 0, 0),
            Transparency = 0,
            Parent = section,
            Visible = true,
            Filled = true,
            ZIndex = 5,
        })

        local middle = utility.create("Square", {
            Size = UDim2.new(1, 0, 1, 0),
            Transparency = 0,
            Parent = section,
            Visible = true,
            Filled = true,
            ZIndex = 5,
        })

        left:AddListLayout(5)
        right:AddListLayout(5)
        middle:AddListLayout(5)

        utility.create("Text", {
            Visible = true,
            Font = 2,
            Size = 13,
            ZIndex = 5,
            Parent = background,
            Center = true,
            Text = tab_name,
            Position = UDim2.new(0.5, 1, 0, 3),
            Theme = "Text",
        })

        table.insert(window_table.buttons, button)  
        table.insert(window_table.backgrounds, background)  
        table.insert(window_table.sections, section)  

        local buttonWidth = 1/(#self.buttons)

        for i, button in ipairs(self.buttons) do
            button.Size = UDim2.new(buttonWidth, i == #self.buttons and 0 or 1, 1, 0)
            button.Position = UDim2.new(buttonWidth *( i - 1), 0, 0, 0)
        end

        for _,v in next, self.backgrounds do
            v.Size = UDim2.new(1, _ == 1 and -1 or _ == #self.backgrounds and -1 or -2, 1, -1)
            v.Position = UDim2.new(0, _ == 1 and 0 or 1, 0, 0)
        end

        utility.connect(background.MouseButton1Click, function()
            for _,v in pairs(window_table.buttons) do
                if v ~= button then
                    v.Transparency = 1
                end
            end

            for _,v in pairs(window_table.backgrounds) do
                if v ~= background then
                    v.Transparency = 1
                end
            end

            for _,v in pairs(window_table.sections) do
                if v ~= section then
                    v.Visible = false
                end
            end
            
            button.Transparency = 0
            background.Transparency = 0
            section.Visible = true
        end)

        function tab_table:show()
            for _,v in pairs(window_table.buttons) do
                if v ~= button then
                    v.Transparency = 1
                end
            end

            for _,v in pairs(window_table.backgrounds) do
                if v ~= background then
                    v.Transparency = 1
                end
            end

            for _,v in pairs(window_table.sections) do
                if v ~= section then
                    v.Visible = false
                end
            end
            
            button.Transparency = 0
            background.Transparency = 0
            section.Visible = true
        end

        function tab_table:multisection(cfg)
            local multisection_table = {sections = {}, buttons = {}, gradients = {}, outlines = {}, accents = {}, backgrounds = {}}
            local size = cfg.size or cfg.Size or UDim2.new(1, 0, 1, 0)
            local side = cfg.side == "left" and left or cfg.side == "right" and right or cfg.side == "middle" and middle or left
            local scroll = cfg.scroll or cfg.Scroll or false

            local outline = utility.create("Square", {
                Theme = "Outline",
                Parent = side,
                Position = UDim2.new(0, 0, 0, 0),
                Size = size,
                Visible = true,
                Filled = true,
                ZIndex = 7,
            })

            local inline = utility.create("Square", {
                Theme = "Inline",
                Parent = outline,
                Position = UDim2.new(0, 1, 0, 1),
                Size = UDim2.new(1, -2, 1, -2),
                Visible = true,
                Filled = true,
                ZIndex = 7,
            })

            local background = utility.create("Square", {
                Theme = "Background 2",
                Parent = inline,
                Position = UDim2.new(0, 1, 0, 1),
                Size = UDim2.new(1, -2, 1, -2),
                Visible = true,
                Filled = true,
                ZIndex = 7,
            })

            local tab_holder = utility.create("Square", {
                Theme = "Background 2",
                Parent = background,
                Position = UDim2.new(0, 0, 0, 0),
                Size = UDim2.new(1, 0, 0, 20),
                Visible = true,
                Filled = true,
                Transparency = 0,
                ZIndex = 7,
            })

            local section_holder = utility.create("Square", {
                Transparency = 0,
                Parent = background,
                Position = UDim2.new(0, 20, 0, 39),
                Size = UDim2.new(1, -40, 1, -59),
                Visible = true,
                Filled = true,
                ZIndex = 7,
            })

            function multisection_table:tab(cfg)
                local tab_table = {}
                local tab_name = cfg.name or cfg.Name or "tab"
                local max = cfg.max or cfg.Max or 4
                local startindex = 0
                local count = 0
        
                local button = utility.create("Square", {
                    Size = UDim2.new(0, 0, 0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    Color = Color3.new(1,1,1),
                    Parent = tab_holder,
                    Theme = "Inline",
                    Visible = true,
                    Filled = true,
                    ZIndex = 8,
                })
        
                local background2 = utility.create("Square", {
                    Size = UDim2.new(1, -2, 1, -1),
                    Position = UDim2.new(0, 1, 0, 0),
                    Color = Color3.new(1,1,1),
                    Parent = button,
                    Theme = "Background 2",
                    Visible = true,
                    Filled = true,
                    ZIndex = 9,
                })

                utility.create("Text", {
                    Visible = true,
                    Font = 2,
                    Size = 13,
                    ZIndex = 9,
                    Parent = background2,
                    Center = true,
                    Text = tab_name,
                    Position = UDim2.new(0.5, 1, 0, 2),
                    Theme = "Text",
                })

                local section_content = utility.create("Square", {
                    Transparency = 0,
                    Parent = section_holder,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(1, 0, 1, 0),
                    Visible = true,
                    Filled = true,
                    ZIndex = 7,
                })

                local scroll_line
    
                section_content:AddListLayout(10)
                if scroll then
                    section_content:MakeScrollable()

                    scroll_line = utility.create("Square", {
                        Transparency = 1,
                        Theme = "Accent",
                        Parent = background,
                        Position = UDim2.new(1, -2, 0, 2),
                        Size = UDim2.new(0, 2, 1, -2),
                        Visible = true,
                        Filled = true,
                        ZIndex = 9,
                    })
                end

                table.insert(multisection_table.buttons, button)  
                table.insert(multisection_table.backgrounds, background2)  
                table.insert(multisection_table.sections, section_content)  
        
                local buttonWidth = 1/(#multisection_table.buttons)
                for i, button in ipairs(multisection_table.buttons) do
                    button.Size = UDim2.new(buttonWidth, i == 1 and 1 or i == 2 and #multisection_table.buttons == 3 and 2 or 1, 1, 0)
                    button.Position = UDim2.new(buttonWidth *( i - 1), 0, 0, 0)
                end
        
                for _,v in next, multisection_table.backgrounds do
                    v.Size = UDim2.new(1, _ == 1 and -1 or _ == #multisection_table.backgrounds and -1 or -2, 1, -1)
                    v.Position = UDim2.new(0, _ == 1 and 0 or 1, 0, 0)
                end
        
                utility.connect(background2.MouseButton1Click, function()
                    for _,v in pairs(multisection_table.buttons) do
                        if v ~= button then
                            v.Transparency = 1
                        end
                    end
        
                    for _,v in pairs(multisection_table.backgrounds) do
                        if v ~= background2 then
                            v.Transparency = 1
                        end
                    end

                    for _,v in pairs(multisection_table.sections) do
                        if v ~= section_content then
                            v.Visible = false
                        end
                    end
                    
                    button.Transparency = 0
                    background2.Transparency = 0
                    section_content.Visible = true
                end)
        
                function tab_table:show()
                    for _,v in pairs(multisection_table.buttons) do
                        if v ~= button then
                            v.Transparency = 1
                        end
                    end
        
                    for _,v in pairs(multisection_table.backgrounds) do
                        if v ~= background2 then
                            v.Transparency = 1
                        end
                    end

                    for _,v in pairs(multisection_table.sections) do
                        if v ~= section_content then
                            v.Visible = false
                        end
                    end
                    
                    button.Transparency = 0
                    background2.Transparency = 0
                    section_content.Visible = true
                end

                function tab_table:toggle(cfg)
                    local toggle_name = cfg.name or cfg.Name or "New Toggle"
                    local toggle_state = cfg.state or cfg.State or false
                    local toggle_flag = cfg.flag or cfg.Flag or utility.nextflag()
                    local callback = cfg.callback or cfg.Callback or function() end
    
                    local holder = utility.create("Square", {
                        Parent = section_content, 
                        Visible = true, 
                        Transparency = 0, 
                        Size = UDim2.new(1,0,0,8), 
                        Thickness = 1, 
                        Filled = true, 
                        ZIndex = 21,
                    })
    
                    local toggle_table = library.toggle(holder, toggle_name, toggle_state, toggle_flag, callback)
    
                    return toggle_table
                end
    
                function tab_table:slider(cfg)
                    local slider_name = cfg.name or cfg.Name or "New Slider"
                    local slider_text = cfg.text or cfg.Text or ("[value]")
                    local slider_min = cfg.min or cfg.Min or 0
                    local slider_max = cfg.max or cfg.Max or 100
                    local slider_float = cfg.float or cfg.Float or 1
                    local slider_default = cfg.default or cfg.Default or 50
                    local slider_flag = cfg.flag or cfg.Flag or utility.nextflag()
                    local slider_callback = cfg.callback or cfg.Callback or function() end
                    local slider_customtext = cfg.customnumber or cfg.CustomNumber or nil
                    local slider_customval = cfg.customtext or cfg.CustomText or nil
                    local slider_suffix = cfg.suffix or cfg.Suffix or nil
    
                    local holder = utility.create("Square", {
                        Parent = section_content, 
                        Visible = true, 
                        Transparency = 0, 
                        Size = UDim2.new(1,0,0,21), 
                        Thickness = 1, 
                        Filled = true, 
                        ZIndex = 21,
                    })
    
                    local slider_table = library.slider(holder, slider_name, slider_text, slider_min, slider_max, slider_float, slider_default, slider_flag, slider_callback, 0, slider_suffix, slider_customtext, slider_customval)
    
                    return slider_table
                end
    
                function tab_table:keybind(cfg)
                    local keybind_name = cfg.name or cfg.Name or "New Keybind"
                    local keybind_default = cfg.default or cfg.Default or ""
                    local keybind_mode = cfg.mode or cfg.Mode or "Toggle"
                    local keybind_blacklist = cfg.blacklist or cfg.Blacklist or {}
                    local keybind_flag = cfg.flag or cfg.Flag or utility.nextflag()
                    local keybind_callback = cfg.callback or cfg.Callback or function() end
                    local list_name = cfg.listname or cfg.Listname or ""
                    local ignore = cfg.ignore or cfg.Ignore or false
    
                    local holder = utility.create("Square", {
                        Parent = section_content, 
                        Visible = true, 
                        Transparency = 0, 
                        Size = UDim2.new(1,0,0,13), 
                        Thickness = 1, 
                        Filled = true, 
                        ZIndex = 21,
                    })
    
                    local keybind_table = library.keybind(holder, keybind_name, keybind_default, keybind_mode, keybind_blacklist, keybind_flag, keybind_callback, 0, list_name, ignore)
    
                    return keybind_table
                end
                    
                function tab_table:dropdown(cfg)
                    local dropdown_tbl = {}
                    local name = cfg.name or cfg.Name or "New Dropdown"
                    local default = cfg.default or cfg.Default or nil
                    local content = type(cfg.options or cfg.Options) == "table" and cfg.options or cfg.Options or {}
                    local max = cfg.max or cfg.Max and (cfg.max ~= nil and cfg.max) or nil
                    local scrollable = cfg.scrollable or false
                    local scrollingmax = cfg.scrollingmax or 10
                    local flag = cfg.flag or utility.nextflag()
                    local islist = cfg.list or false
                    local size = cfg.size or 200
                    local callback = cfg.callback or function() end
    
                    if not max and type(default) == "table" then
                        default = nil
                    end
    
                    if max and default == nil then
                        default = {}
                    end
    
                    if type(default) == "table" then
                        if max then
                            for i, opt in next, default do
                                if not table.find(content, opt) then
                                    table.remove(default, i)
                                elseif i > max then
                                    table.remove(default, i)
                                end
                            end
                        else
                            default = nil
                        end
                    elseif default ~= nil then
                        if not table.find(content, default) then
                            default = nil
                        end
                    end
    
                    local holder = utility.create("Square", {
                        Transparency = 0, 
                        ZIndex = 21,
                        Size = islist and UDim2.new(1, 0, 0, size + 9) or UDim2.new(1, 0, 0, 33),
                        Parent = section_content, 
                        Thickness = 1
                    })
    
                    local title = utility.create("Text", {
                        Text = name,
                        Font = 2,
                        Size = 13,
                        Position = islist and UDim2.new(0, 21, 0, -6) or UDim2.new(0, 21, 0, -3),
                        Theme = "Text",
                        ZIndex = 21,
                        Visible = name ~= "" and true or false,
                        Parent = holder
                    })
    
                    return library.dropdown(holder, content, flag, callback, default, max, scrollable, scrollingmax, islist, size)
                end
    
                function tab_table:button(cfg)
                    local button_name = cfg.name or cfg.Name or "New Button"
                    local button_confirm = cfg.confirm or cfg.Confirm or false
                    local button_callback = cfg.callback or cfg.Callback or function() end
    
                    local holder = utility.create("Square", {
                        Parent = section_content, 
                        Visible = true, 
                        Transparency = 0, 
                        Size = UDim2.new(1,0,0,25), 
                        Thickness = 1, 
                        Filled = true, 
                        ZIndex = 21,
                    })
    
                    library.button(holder, button_name, button_confirm, button_callback)
                end
    
                function tab_table:textbox(cfg)
                    local textbox_placeholder = cfg.placeholder or cfg.Placeholder or "Placeholder"
                    local textbox_default = cfg.default or cfg.Default or ""
                    local textbox_middle = cfg.middle or cfg.Middle or cfg.center or cfg.Center or false
                    local textbox_flag = cfg.flag or cfg.Flag or utility.nextflag()
                    local textbox_callback = cfg.callback or cfg.Callback or function() end
    
                    local holder = utility.create("Square", {
                        Transparency = 0, 
                        ZIndex = 21,
                        Size = UDim2.new(1, 0, 0, 20),
                        Parent = section_content, 
                        Thickness = 1
                    })
    
                    local textbox_table = library.textbox(holder, textbox_placeholder, textbox_default, textbox_middle, textbox_flag, textbox_callback)
    
                    return textbox_table
                end
                
                function tab_table:colorpicker(cfg)
                    local colorpicker_tbl = {}
                    local name = cfg.name or cfg.Name or "New Colorpicker"
                    local default = cfg.default or cfg.Default or Color3.fromRGB(255, 0, 0)
                    local flag = cfg.flag or cfg.Flag or utility.nextflag()
                    local callback = cfg.callback or function() end
                    local defaultalpha = cfg.alpha or cfg.Alpha or 1
        
                    local holder = utility.create("Square", {
                        Transparency = 0,
                        Filled = true,
                        Thickness = 1,
                        Size = UDim2.new(1, 0, 0, 7),
                        ZIndex = 21,
                        Parent = section_content
                    })
        
                    local title = utility.create("Text", {
                        Text = name,
                        Font = 2,
                        Size = 13,
                        Position = UDim2.new(0, 21, 0, -4),
                        Theme = "Text",
                        ZIndex = 21,
                        Parent = holder
                    })
        
                    local colorpickers = 0
        
                    colorpickertypes = library.colorpicker(holder, name, default, defaultalpha, colorpickers, flag, callback, 0, 0)
    
                    function colorpicker_tbl:set(color)
                        colorpickertypes:set(color, false, true)
                    end
    
                    return colorpicker_tbl
                end
    
                function tab_table:label(cfg)
                    local label_table = {}
                    local label_name = cfg.name or cfg.Name or "New Label"
                    local label_centered = cfg.center or cfg.Center or false
                    local text_size = utility.textlength(label_name, 2, 13)
    
                    local holder = utility.create("Square", {
                        Parent = section_content, 
                        Visible = true, 
                        Transparency = 0, 
                        Size = UDim2.new(1, 0, 0, text_size.Y - 2), 
                        Thickness = 1, 
                        Filled = true, 
                        ZIndex = 21,
                    })
                
                    local label_title = utility.create("Text", {
                        Text = label_name, 
                        Parent = holder, 
                        Visible = true, 
                        Transparency = 1, 
                        Theme = "Text", 
                        Size = 13, 
                        Center = label_centered, 
                        Font = 2, 
                        Position = UDim2.new(label_centered and 0.5 or 0, label_centered and 1 or 21,0,0), 
                        ZIndex = 22
                    })
    
                    function label_table.name(text)
                        label_title.Text = text
                    end
    
                    function label_table.color(color)
                        label_title.Color = color
                    end
    
                    return label_table
                end

                if scroll then
                    local function refreshscroll()
                        local scale = (startindex) / (count > 0 and count or 1)
                        scroll_line.Position = UDim2.new(1,-2, scale, 2)
                        scroll_line.Size = UDim2.new(0, 2, math.clamp(count == 0 and 1 or 1 / (count / max), 0, 1), -2)
                    end
    
                    section_content.MouseEnter:Connect(function()
                        scroll_connect = utility.connect(services.InputService.InputChanged, function(input)
                            if input.UserInputType == Enum.UserInputType.MouseWheel then
                                local down = input.Position.Z < 0 and true or false
                                if down then
                                    local indexesleft = count - max - startindex
                                    if indexesleft >= 0 then
                                        startindex = math.clamp(startindex + 1, 0, count - max)
                                        refreshscroll()
                                    end
                                else
                                    local indexesleft = count - max + startindex
                                    if indexesleft >= count - max then
                                        startindex = math.clamp(startindex - 1, 0, count - max)
                                        refreshscroll()
                                    end
                                end
                            end
                        end)
                    end)
    
                    section_content.MouseLeave:Connect(function()
                        if scroll_connect then
                            utility.disconnect(scroll_connect)
                        end
                    end)
    
                    refreshscroll()
                end
    

                return tab_table
            end

            return multisection_table
        end

        function tab_table:section(cfg)
            local section_table = {}
            local name = cfg.name or cfg.Name or "New Section"
            local size = cfg.size or cfg.Size or UDim2.new(1, 0, 1, 0)
            local side = cfg.side == "left" and left or cfg.side == "right" and right or cfg.side == "middle" and middle or left
            local scroll = cfg.scroll or cfg.Scroll or false
            local max = cfg.max or cfg.Max or 4
            local textsize = utility.textlength(name, 2, 13)
            local startindex = 0
            local count = 0

            local outline = utility.create("Square", {
                Theme = "Outline",
                Parent = side,
                Position = UDim2.new(0, 0, 0, 0),
                Size = size,
                Visible = true,
                Filled = true,
                ZIndex = 7,
            })

            local outlineupper = utility.create("Square", {
                Theme = "Outline",
                Parent = outline,
                Position = UDim2.new(0, 0, 0, 0),
                Size = UDim2.new(0, 11, 0, 2),
                Visible = true,
                Filled = true,
                ZIndex = 8,
            })

            local inlineupper = utility.create("Square", {
                Theme = "Inline",
                Parent = outline,
                Position = UDim2.new(0, 1, 0, 1),
                Size = UDim2.new(0, 10, 0, 1),
                Visible = true,
                Filled = true,
                ZIndex = 8,
            })

            local inline = utility.create("Square", {
                Theme = "Inline",
                Parent = outline,
                Position = UDim2.new(0, 1, 0, 0),
                Size = UDim2.new(1, -2, 1, -1),
                Visible = true,
                Filled = true,
                ZIndex = 7,
            })

            local background = utility.create("Square", {
                Theme = "Background 2",
                Parent = inline,
                Position = UDim2.new(0, 1, 0, 0),
                Size = UDim2.new(1, -2, 1, -1),
                Visible = true,
                Filled = true,
                ZIndex = 7,
            })
            
            local section_name = utility.create("Text", {
                Theme = "Text",
                Size = 13,
                Font = 2,
                Visible = true,
                ZIndex = 8,
                Parent = background,
                Transparency = 1,
                Text = name,
                Position = UDim2.new(0, 12, 0, -6)
            })

            local outlineupper2 = utility.create("Square", {
                Theme = "Outline",
                Parent = outline,
                Position = UDim2.new(0, 17 + textsize.X, 0, 0),
                Size = UDim2.new(1, -(17 + textsize.X), 0, 2),
                Visible = true,
                Filled = true,
                ZIndex = 7,
            })

            local inlineupper2 = utility.create("Square", {
                Theme = "Inline",
                Parent = outline,
                Position = UDim2.new(0, 17 + textsize.X, 0, 1),
                Size = UDim2.new(1, -(18 + textsize.X), 0, 1),
                Visible = true,
                Filled = true,
                ZIndex = 7,
            })

            local section_content = utility.create("Square", {
                Transparency = 0,
                Parent = background,
                Position = UDim2.new(0, 20, 0, 21),
                Size = UDim2.new(1, -40, 1, -42),
                Visible = true,
                Filled = true,
                ZIndex = 7,
            })

            local scroll_line
    
            section_content:AddListLayout(10)
            if scroll then
                section_content:MakeScrollable()

                utility.create("Image", {
                    Visible = true,
                    ZIndex = 8,
                    Parent = background,
                    Size = UDim2.new(0, 5, 0, 4),
                    Position = UDim2.new(1, -8, 0, 5),
                    Data = images.uparrow,
                })

                utility.create("Image", {
                    Visible = true,
                    ZIndex = 8,
                    Parent = background,
                    Size = UDim2.new(0, 5, 0, 4),
                    Position = UDim2.new(1, -8, 1, -7),
                    Data = images.downarrow,
                })
            end
            
            function section_table:toggle(cfg)
                local toggle_name = cfg.name or cfg.Name or "New Toggle"
                local toggle_state = cfg.state or cfg.State or false
                local toggle_flag = cfg.flag or cfg.Flag or utility.nextflag()
                local callback = cfg.callback or cfg.Callback or function() end

                local holder = utility.create("Square", {
                    Parent = section_content, 
                    Visible = true, 
                    Transparency = 0, 
                    Size = UDim2.new(1,0,0,8), 
                    Thickness = 1, 
                    Filled = true, 
                    ZIndex = 21,
                })

                local toggle_table = library.toggle(holder, toggle_name, toggle_state, toggle_flag, callback)

                return toggle_table
            end

            function section_table:slider(cfg)
                local slider_name = cfg.name or cfg.Name or "New Slider"
                local slider_text = cfg.text or cfg.Text or ("[value]")
                local slider_min = cfg.min or cfg.Min or 0
                local slider_max = cfg.max or cfg.Max or 100
                local slider_float = cfg.float or cfg.Float or 1
                local slider_default = cfg.default or cfg.Default or 50
                local slider_flag = cfg.flag or cfg.Flag or utility.nextflag()
                local slider_callback = cfg.callback or cfg.Callback or function() end
                local slider_customtext = cfg.customnumber or cfg.CustomNumber or nil
                local slider_customval = cfg.customtext or cfg.CustomText or nil
                local slider_suffix = cfg.suffix or cfg.Suffix or nil

                local holder = utility.create("Square", {
                    Parent = section_content, 
                    Visible = true, 
                    Transparency = 0, 
                    Size = UDim2.new(1,0,0,21), 
                    Thickness = 1, 
                    Filled = true, 
                    ZIndex = 21,
                })

                local slider_table = library.slider(holder, slider_name, slider_text, slider_min, slider_max, slider_float, slider_default, slider_flag, slider_callback, 0, slider_suffix, slider_customtext, slider_customval)

                return slider_table
            end

            function section_table:keybind(cfg)
                local keybind_name = cfg.name or cfg.Name or "New Keybind"
                local keybind_default = cfg.default or cfg.Default or ""
                local keybind_mode = cfg.mode or cfg.Mode or "Toggle"
                local keybind_blacklist = cfg.blacklist or cfg.Blacklist or {}
                local keybind_flag = cfg.flag or cfg.Flag or utility.nextflag()
                local keybind_callback = cfg.callback or cfg.Callback or function() end
                local list_name = cfg.listname or cfg.Listname or ""
                local ignore = cfg.ignore or cfg.Ignore or false

                local holder = utility.create("Square", {
                    Parent = section_content, 
                    Visible = true, 
                    Transparency = 0, 
                    Size = UDim2.new(1,0,0,13), 
                    Thickness = 1, 
                    Filled = true, 
                    ZIndex = 21,
                })

                local keybind_table = library.keybind(holder, keybind_name, keybind_default, keybind_mode, keybind_blacklist, keybind_flag, keybind_callback, 0, list_name, ignore)

                return keybind_table
            end
                
            function section_table:dropdown(cfg)
                local dropdown_tbl = {}
                local name = cfg.name or cfg.Name or "New Dropdown"
                local default = cfg.default or cfg.Default or nil
                local content = type(cfg.options or cfg.Options) == "table" and cfg.options or cfg.Options or {}
                local max = cfg.max or cfg.Max and (cfg.max ~= nil and cfg.max) or nil
                local scrollable = cfg.scrollable or false
                local scrollingmax = cfg.scrollingmax or 10
                local flag = cfg.flag or utility.nextflag()
                local islist = cfg.list or false
                local size = cfg.size or 200
                local callback = cfg.callback or function() end

                if not max and type(default) == "table" then
                    default = nil
                end

                if max and default == nil then
                    default = {}
                end

                if type(default) == "table" then
                    if max then
                        for i, opt in next, default do
                            if not table.find(content, opt) then
                                table.remove(default, i)
                            elseif i > max then
                                table.remove(default, i)
                            end
                        end
                    else
                        default = nil
                    end
                elseif default ~= nil then
                    if not table.find(content, default) then
                        default = nil
                    end
                end

                local holder = utility.create("Square", {
                    Transparency = 0, 
                    ZIndex = 21,
                    Size = islist and UDim2.new(1, 0, 0, size + 9) or UDim2.new(1, 0, 0, 33),
                    Parent = section_content, 
                    Thickness = 1
                })

                local title = utility.create("Text", {
                    Text = name,
                    Font = 2,
                    Size = 13,
                    Position = islist and UDim2.new(0, 21, 0, -6) or UDim2.new(0, 21, 0, -3),
                    Theme = "Text",
                    ZIndex = 21,
                    Visible = name ~= "" and true or false,
                    Parent = holder
                })

                return library.dropdown(holder, content, flag, callback, default, max, scrollable, scrollingmax, islist, size)
            end

            function section_table:button(cfg)
                local button_name = cfg.name or cfg.Name or "New Button"
                local button_confirm = cfg.confirm or cfg.Confirm or false
                local button_callback = cfg.callback or cfg.Callback or function() end

                local holder = utility.create("Square", {
                    Parent = section_content, 
                    Visible = true, 
                    Transparency = 0, 
                    Size = UDim2.new(1,0,0,25), 
                    Thickness = 1, 
                    Filled = true, 
                    ZIndex = 21,
                })

                library.button(holder, button_name, button_confirm, button_callback)
            end

            function section_table:textbox(cfg)
                local textbox_placeholder = cfg.placeholder or cfg.Placeholder or "Placeholder"
                local textbox_default = cfg.default or cfg.Default or ""
                local textbox_middle = cfg.middle or cfg.Middle or cfg.center or cfg.Center or false
                local textbox_flag = cfg.flag or cfg.Flag or utility.nextflag()
                local textbox_callback = cfg.callback or cfg.Callback or function() end

                local holder = utility.create("Square", {
                    Transparency = 0, 
                    ZIndex = 21,
                    Size = UDim2.new(1, 0, 0, 20),
                    Parent = section_content, 
                    Thickness = 1
                })

                local textbox_table = library.textbox(holder, textbox_placeholder, textbox_default, textbox_middle, textbox_flag, textbox_callback)



                return textbox_table
            end
            
            function section_table:colorpicker(cfg)
                local colorpicker_tbl = {}
                local name = cfg.name or cfg.Name or "New Colorpicker"
                local default = cfg.default or cfg.Default or Color3.fromRGB(255, 0, 0)
                local flag = cfg.flag or cfg.Flag or utility.nextflag()
                local callback = cfg.callback or function() end
                local defaultalpha = cfg.alpha or cfg.Alpha or 1
    
                local holder = utility.create("Square", {
                    Transparency = 0,
                    Filled = true,
                    Thickness = 1,
                    Size = UDim2.new(1, 0, 0, 7),
                    ZIndex = 21,
                    Parent = section_content
                })
    
                local title = utility.create("Text", {
                    Text = name,
                    Font = 2,
                    Size = 13,
                    Position = UDim2.new(0, 21, 0, -4),
                    Theme = "Text",
                    ZIndex = 21,
                    Parent = holder
                })
    
                local colorpickers = 0
    
                colorpickertypes = library.colorpicker(holder, name, default, defaultalpha, colorpickers, flag, callback, 0, 0)

                function colorpicker_tbl:set(color)
                    colorpickertypes:set(color, false, true)
                end



                return colorpicker_tbl
            end

            function section_table:label(cfg)
                local label_table = {}
                local label_name = cfg.name or cfg.Name or "New Label"
                local label_centered = cfg.center or cfg.Center or false
                local text_size = utility.textlength(label_name, 2, 13)

                local holder = utility.create("Square", {
                    Parent = section_content, 
                    Visible = true, 
                    Transparency = 0, 
                    Size = UDim2.new(1, 0, 0, text_size.Y - 2), 
                    Thickness = 1, 
                    Filled = true, 
                    ZIndex = 21,
                })
            
                local label_title = utility.create("Text", {
                    Text = label_name, 
                    Parent = holder, 
                    Visible = true, 
                    Transparency = 1, 
                    Theme = "Text", 
                    Size = 13, 
                    Center = label_centered, 
                    Font = 2, 
                    Position = UDim2.new(label_centered and 0.5 or 0, label_centered and 1 or 21,0,0), 
                    ZIndex = 22
                })

                function label_table.name(text)
                    label_title.Text = text
                end

                function label_table.color(color)
                    label_title.Color = color
                end

                return label_table
            end

            return section_table
        end

        function tab_table:playerlist(cfg)
            local playerlist = {}
            local max = 0
            local count = 0
            local startindex = 0
            local selected_plr = nil
            local optioninstances = {}
            local last_plr = nil
            local flag = cfg.flag or cfg.Flag or utility.nextflag()
            local players = game:GetService("Players")
            -- // Drawings

            local list_outline = utility.create("Square", {
                Parent = section, 
                Visible = true, 
                Transparency = 1, 
                Theme = "Outline", 
                Size = UDim2.new(1, 0, 0,((6 * 22) + 4) + 182), 
                Position = UDim2.new(0,0,0,0), 
                Thickness = 1, 
                Filled = true, 
                ZIndex = 14
            })

            local list_inline = utility.create("Square", {
                Parent = list_outline, 
                Visible = true, 
                Transparency = 1, 
                Theme = "Inline", 
                Size = UDim2.new(1, -2, 1, -2), 
                Position = UDim2.new(0, 1, 0, 1), 
                Thickness = 1, 
                Filled = true, 
                ZIndex = 14
            })

            local list_holder = utility.create("Square", {
                Parent = list_inline, 
                Visible = true, 
                Transparency = 1, 
                Theme = "Background 2", 
                Size = UDim2.new(1, -2, 1, -2), 
                Position = UDim2.new(0, 1, 0, 1), 
                Thickness = 1, 
                Filled = true, 
                ZIndex = 14
            })

            local list_title = utility.create("Text", {
                Text = "player list - 0 players", 
                Parent = list_holder, 
                Visible = true, 
                Transparency = 1, 
                Theme = "Text", 
                Size = 13, 
                Center = false, 
                Font = Drawing.Fonts.Plex, 
                Position = UDim2.new(0,3,0,3), 
                ZIndex = 14
            })
            --
            local list_inline = utility.create("Square", {
                Parent = list_holder, 
                Visible = true, 
                Transparency = 1, 
                Theme = "Background", 
                Size = UDim2.new(1, -10, 0, (6 * 20) + 100), 
                Position = UDim2.new(0, 5, 0, 22),
                Thickness = 1, 
                Filled = true, 
                ZIndex = 16
            })
            local outline = utility.outline(list_inline, "Inline", 15)
            utility.outline(outline, "Outline", 14)
            --
            local list_icon = utility.create("Square", {
                Parent = list_holder, 
                Visible = true, 
                Transparency = 1, 
                Theme = "Background", 
                Size = UDim2.new(0,60,0,60), 
                Position = UDim2.new(0,5,1,-65), 
                Thickness = 1, 
                Filled = true, 
                ZIndex = 16
            })
            local outline = utility.outline(list_icon, "Inline", 15)
            utility.outline(outline, "Outline", 14)
            --
            local player_data = utility.create("Text", {
                Text = "no player selected.", 
                Parent = list_holder, 
                Visible = true, 
                Transparency = 1, 
                Theme = "Text", 
                Size = 13, 
                Center = false, 
                Font = Drawing.Fonts.Plex, 
                Position = UDim2.new(0,70,1,-67), 
                ZIndex = 14
            })
            --
            local player_image = utility.create("Image", {
                Size = UDim2.new(1, 0, 1, 0),
                Visible = true,
                ZIndex = 18,
                Parent = list_icon,
                Data = nil
            })
            --
            local list_content = utility.create("Square", {
                Transparency = 0,
                Size = UDim2.new(1, -4, 1, -4),
                Position = UDim2.new(0, 2, 0, 3),
                Parent = list_inline
            })

            local friendholder = utility.create("Square", {
                Parent = list_holder, 
                Visible = true, 
                Transparency = 0, 
                Theme = "Accent", 
                Size = UDim2.new(0, 150, 0, 25), 
                Position = UDim2.new(1, -132, 1, -66),
                Thickness = 1, 
                Filled = true, 
                ZIndex = 14
            })

            local prioholder = utility.create("Square", {
                Parent = list_holder, 
                Visible = true, 
                Transparency = 0, 
                Theme = "Accent", 
                Size = UDim2.new(0, 150, 0, 25), 
                Position = UDim2.new(1, -242, 1, -66),
                Thickness = 1, 
                Filled = true, 
                ZIndex = 14
            })

            local telholder = utility.create("Square", {
                Parent = list_holder, 
                Visible = true, 
                Transparency = 0, 
                Theme = "Accent", 
                Size = UDim2.new(0, 150, 0, 25), 
                Position = UDim2.new(1, -132, 1, -39),
                Thickness = 1, 
                Filled = true, 
                ZIndex = 14
            })

            library.button(friendholder, "friend", false, function() 
                if last_plr ~= nil and last_plr ~= players.LocalPlayer then
                    if not table.find(friends, last_plr) then
                        table.insert(friends, last_plr)
                        optioninstances[last_plr].status.Text = "friendly"
                        optioninstances[last_plr].status.Color = Color3.fromRGB(55, 55, 200)
                    elseif table.find(friends, last_plr) then
                        for i,v in pairs(friends) do
                            if v == last_plr then
                                table.remove(friends, i)
                            end
                        end
                        optioninstances[last_plr].status.Text = "none"
                        utility.changeobjecttheme(optioninstances[last_plr].status, "Text")
                    end

                    for i,v in pairs(priority) do
                        if v == last_plr then
                            table.remove(priority, i)
                        end
                    end    
                end
            end)

            library.button(prioholder, "prioritize", false, function() 
                if last_plr ~= nil and last_plr ~= players.LocalPlayer then
                    if not table.find(priority, last_plr) then
                        table.insert(priority, last_plr)
                        optioninstances[last_plr].status.Text = "priority"
                        optioninstances[last_plr].status.Color = Color3.fromRGB(200, 55, 55)
                    elseif table.find(priority, last_plr) then
                        for i,v in pairs(priority) do
                            if v == last_plr then
                                table.remove(priority, i)
                            end
                        end
                        optioninstances[last_plr].status.Text = "none"
                        utility.changeobjecttheme(optioninstances[last_plr].status, "Text")
                    end

                    for i,v in pairs(friends) do
                        if v == last_plr then
                            table.remove(friends, i)
                        end
                    end
                end
            end)

            library.button(telholder, "teleport", false, function() 
                if last_plr ~= nil and last_plr ~= players.LocalPlayer then
                    desync[1] = last_plr.Character.HumanoidRootPart.CFrame
                    players.LocalPlayer.Character.HumanoidRootPart.CFrame = last_plr.Character.HumanoidRootPart.CFrame
                end
            end)

            list_content:AddListLayout(3)
            --// Scroll
            list_content:MakeScrollable()
            local scroll_connect = nil
            --
            --
            local function refreshfix()
                list_content.Visible = list_content.Visible
            end
            --
            list_content.MouseEnter:Connect(function()
                pcall(function()
                    scroll_connect = library:connect(services.InputService.InputChanged, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseWheel then
                            local down = input.Position.Z < 0 and true or false
                            if down then
                                local indexesleft = count - max - startindex
                                if indexesleft >= 0 then
                                    startindex = math.clamp(startindex + 1, 0, count - max)
                                end
                            else
                                local indexesleft = count - max + startindex
                                if indexesleft >= count - max then
                                    startindex = math.clamp(startindex - 1, 0, count - max)
                                end
                            end
                        end
                    end)
                end)
            end)
            --
            list_content.MouseLeave:Connect(function()
                if scroll_connect then
                    library:disconnect(scroll_connect)
                end
            end)
            -- // Main
            local chosen = nil
            local function handleoptionclick(option, button2)
                button2.MouseButton1Click:Connect(function()
                    for _,v in pairs(players:GetPlayers()) do
                        if optioninstances[v] then
                            local person = optioninstances[v]
    
                            if person.button ~= button2 then
                                utility.changeobjecttheme(person.text, "Text")
                            end
                        end
                    end

                    chosen = option
                    library.flags[flag] = option
                    selected_plr = option
                    --
                    if selected_plr ~= last_plr then
                        last_plr = selected_plr
                        --
                        local response = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=150x150&format=Png&isCircular=false", selected_plr.UserId))
                        local data = game:GetService("HttpService"):JSONDecode(response).data
                        local avatar_url = data[1].imageUrl
                        --
                        local imagedata = game:HttpGet(avatar_url)
                        player_data.Text = ("id: %s\nname: %s"):format(selected_plr.UserId, selected_plr.DisplayName ~= "" and selected_plr.DisplayName or selected_plr.Name)
                        player_image.Data = imagedata
                        utility.changeobjecttheme(optioninstances[option].text, "Accent")
                    end
                end)
            end
            --
            local function createoptions(tbl)
                for i, option in next, tbl do
                    optioninstances[option] = {}
        
                    local button = utility.create("Square", {
                        Filled = true,
                        Transparency = 0,
                        Thickness = 1,
                        Theme = "Element Background",
                        Size = UDim2.new(1, 0, 0, 16),
                        ZIndex = 19,
                        Parent = list_content
                    })
            
                    optioninstances[option].button = button
            
                    local title = utility.create("Text", {
                        Text = option.Name,
                        Font = Drawing.Fonts.Plex,
                        Size = 13,
                        Position = UDim2.new(0, 3, 0, 1),
                        Theme = "Text",
                        ZIndex = 19,
                        Parent = button
                    })

                    local team = utility.create("Text", {
                        Text = option.Team and tostring(option.Team) or "none",
                        Font = Drawing.Fonts.Plex,
                        Size = 13,
                        Position = UDim2.new(1/3, 6, 0, 1),
                        Theme = option.Team and "Accent" or "Text",
                        ZIndex = 19,
                        Parent = button
                    })

                    local status = utility.create("Text", {
                        Text = option == game.Players.LocalPlayer and "local player" or "none",
                        Font = Drawing.Fonts.Plex,
                        Size = 13,
                        Position = UDim2.new(2/3, 6, 0, 1),
                        Theme = option == game.Players.LocalPlayer and "Accent" or "Text",
                        ZIndex = 19,
                        Parent = button
                    })
                    optioninstances[option].team = team
                    optioninstances[option].status = status 
                    optioninstances[option].text = title
                    local firstline = utility.create("Square", {Transparency = 0.3,Size = UDim2.new(0,2,1,0),Position = UDim2.new(1/3,1,0,0),Parent = button,ZIndex = 19, Thickness = 1, Theme = "Inline", Filled = true})
                    local secondline = utility.create("Square", {Transparency = 0.3,Size = UDim2.new(0,2,1,0),Position = UDim2.new(2/3,1,0,0),Parent = button,ZIndex = 19, Thickness = 1, Theme = "Inline", Filled = true})
                    local bottomline = utility.create("Square", {Transparency = 0.3,Size = UDim2.new(1,-8,0,2),Position = UDim2.new(0,3,1,0),Parent = button,ZIndex = 19, Thickness = 1, Theme = "Inline", Filled = true})

                    count = count + 1
                    list_title.Text = tostring("player list - "..count.." players")
                    handleoptionclick(option, button)
                end
            end
            --
            function playerlist:refresh(tbl, dontchange)
                content = table.clone(tbl)
                count = 0

                for _, opt in next, optioninstances do
                    coroutine.wrap(function()
                        opt.button:Remove()
                    end)()
                end
        
                table.clear(optioninstances)
        
                createoptions(content)
                --list_content:RefreshScrolling()
        
                if dontchange then
                    chosen = selected_plr
                else
                    chosen = nil
                end
                library.flags[flag] = chosen
                selected_plr = nil
            end
            --
            createoptions(players:GetPlayers())
            --
            players.PlayerAdded:Connect(function()
                playerlist:refresh(players:GetPlayers(), true)
                refreshfix()
            end)
            --
            players.PlayerRemoving:Connect(function()
                playerlist:refresh(players:GetPlayers(), true)
                refreshfix()
            end)
            --
            -- // Fix page
            left.Size = UDim2.new(0.5, -3, 1, -(((6 * 22) + 4) + 187))
            right.Size = UDim2.new(0.5, -3, 1, -(((6 * 22) + 4) + 187))
            middle.Size = UDim2.new(1, 0, 1, -(((6 * 22) + 4) + 187))
            --
            left.Position = UDim2.new(0, 0, 0, ((6 * 22) + 4) + 187)
            right.Position = UDim2.new(0.5, 3, 0, ((6 * 22) + 4) + 187)
            middle.Position = UDim2.new(0, 0, 0, ((6 * 22) + 4) + 187)
        end

        return tab_table
    end

    function window_table:get_config()
        local configtbl = {}

        for flag, _ in next, flags do
            if not table.find(configignores, flag) then
                local value = library.flags[flag]

                if typeof(value) == "EnumItem" then
                    configtbl[flag] = tostring(value)
                elseif typeof(value) == "Color3" then
                    configtbl[flag] = {color = value:ToHex(), alpha = value.A}
                else
                    configtbl[flag] = value
                end
            end
        end

        local config = game:GetService("HttpService"):JSONEncode(configtbl)

        return config
    end

    return window_table
end

function library:load_config(cfg_name)
    if isfile(cfg_name) then
        local file = readfile(cfg_name)
        local config = game:GetService("HttpService"):JSONDecode(file)

        for flag, v in next, config do
            local func = flags[flag]
            
            if func and not string.find(flag, "menu bind") then
                func(v)
            end
        end
    end
end

local notifications = {}
local CreateRenderObject, SetRenderProperty, GetRenderProperty, DestroyRenderObject = getupvalue(Drawing.new, 1), getupvalue(getupvalue(Drawing.new, 7).__newindex, 4), getupvalue(getupvalue(Drawing.new, 7).__index, 4), getupvalue(getupvalue(Drawing.new, 7).__index, 3);
function library.notify(text, time)
    local notification = {fading = false}
    local size = utility.textlength(text, 2, 13)
    time = time or 5
    
    do -- renders
        local z = 5
        local objs = notification
        
        objs.holder = utility.create("Square", {
            Visible = true,
            Position = UDim2.new(0, 0, 0, 50),
            Transparency = 0,
        })
        
        objs.border = utility.create("Square", {
            Size = UDim2.new(0,0,1,0),
            Position = UDim2.new(0, 0, 0, 0),
            Parent = objs.holder,
            Theme = "Outline",
            ZIndex = z,
            Transparency = 0,
            Thickness = 1,
            Filled = true,
        })
    
        objs.inline = utility.create("Square", {
            Size = UDim2.new(1, -2, 1, -2),
            Position = UDim2.new(0, 1, 0, 1),
            Parent = objs.border,
            Theme = "Inline",
            ZIndex = z,
            Transparency = 0,
            Thickness = 1,
            Filled = true,
        })
    
        objs.background = utility.create("Square", {
            Size = UDim2.new(1, -2, 1, -2),
            Position = UDim2.new(0, 1, 0, 1),
            Parent = objs.inline,
            Theme = "Background",
            ZIndex = z,
            Thickness = 1,
            Transparency = 0,
            Filled = true,
        })
    
        objs.accent = utility.create("Square", {
            Size = UDim2.new(0, 1, 1, 0),
            Position = UDim2.new(0, 0, 0, 0),
            Parent = objs.inline,
            Theme = "Accent",
            ZIndex = z,
            Thickness = 1,
            Transparency = 0,
            Filled = true,
        })
    
        objs.text = utility.create("Text", {
            ZIndex = z,
            Visible = true,
            Text = text,
            Font = 2,
            Size = 13,
            Transparency = 0,
            Theme = "Text",
            Parent = objs.background,
            Position = UDim2.new(0, 5, 0, 2)
        })
    end
    
    do -- functions
        function notification:remove()
            self.holder:Remove();
            table.remove(notifications, table.find(notifications, notification))
            library.updatepos()
        end
    end
    
    table.insert(notifications, notification)
    
    task.spawn(function()
        notification.border.Size = UDim2.new(0, size.X + 10, 0, size.Y + 10)
        library.updatepos(notification)
        wait(time)
        library.updatepos2(notification, size)
        wait(0.5)
        notification:remove()
    end)
end

function library.updatepos(notification)
    for i,v in pairs(notifications) do
        if notification ~= nil then
            if v.holder == notification.holder then 
                v.holder.Position = UDim2.new(0, 0, 0, 20 + (i * 30))
                tween.new(v.holder, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 20, 0, v.holder.Position.Y.Offset)}):Play()
            else
                tween.new(v.holder, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 20, 0, 20 + (i * 30))}):Play()
            end
        end
        
        if notification == nil then
            tween.new(v.holder, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 20, 0, 20 + (i * 30))}):Play()
        end
        
        for _,a in pairs(v) do
            print(v[fading])
            if type(a) == "table" and v.fading ~= true then
                if _ ~= "holder" then
                    tween.new(a, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1}):Play()
                end
            end
        end
    end
end

function library.updatepos2(notification, size)
    tween.new(notification.border, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, notification.border.Position.X.Offset, 0, notification.border.Position.Y.Offset - 50)}):Play()
    
    for _,v in pairs(notification) do
        notification.fading = true
        if type(v) == "table" then
            tween.new(v, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Transparency = 0}):Play()
        end
    end   
end

function library:unload()
    for _,v in pairs(library.connections) do
        if v ~= nil then
            v:Disconnect()
            v = nil
        end
    end

    for i,v in pairs(library.drawings) do
        if tostring(i):find("custom") then
            DestroyRenderObject(v)
        else
            coroutine.wrap(function()
                if v.__OBJECT_EXISTS then
                    v:Remove()
                    v = nil
                end
            end)()
        end
    end

    getgenv().library = nil
end

function library:setpos()
    library.holder.Position = library.holder.Position + UDim2.new(0, 1, 0, 1)
    library.holder.Position = library.holder.Position - UDim2.new(0, 1, 0, 1)
end

if not isfile("gameshark/chatspam.txt") then
    writefile("gameshark/chatspam.txt", "insert your chatspam here\nhey gameshark user change your chatspam\nyou should change ur chatspam lel\nexample chat spam\nyou spaces to seperate the chatspam")
end

loadstring(readfile("gameshark/crosshair.lua"))()   

local list = library:list({name = "game-shark", pos = UDim2.new(0, 20, 0, 8)})
local window = library:window({size = UDim2.new(0, 536, 0, 550)})
local legit = window:tab({name = "Legit"})
local esp = window:tab({name = "ESP"})
local visuals = window:tab({name = "Visuals"})
local misc = window:tab({name = "Misc"})
local players = window:tab({name = "Players"})
local settings = window:tab({name = "Settings"})

local Camera = workspace.Camera
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local RunService = game.RunService
local UserInputService = game.UserInputService
local Lighting = game.Lighting
local ScreenSize = Camera.ViewportSize
local MousePos = UserInputService:GetMouseLocation()
local Mouse = LocalPlayer:GetMouse()
local flags = library.flags
local drawings = 0
local watermarkTick = tick()
local triggerbotting = false

local fps = 0
local oldMsg = ""

local aimbotPos = Vector2.zero
local aimbotFov = 0
local deadzoneFov = 0
local aimbotPlayers = {}

local silentPos = Vector2.zero
local silentFov = 0
local silentPlayers = {}

local messages = {
    ["gameshark"] = {
        "GET GAMESHARK LOL",
        "NO GAMESHARK SOB",
        "CANT HIT ME?",
        "GAMESHARK UID?",
        "SEEMS SAD THAT YOU DONT HAVE GAMESHARK",
        "GAMESHARK UID = NIL",
        "GAMESHARK USER = NIL",
        "GAMESHARK > ALL",
        "SCRIPTS THAT ARE BETTER THEN GAMESHARK - NIL",
        "UR PASTE CANT HIT ME",
        "OWNED BY GAMESHARK",
        "PASTED FROM NOTHING",
    },
    ["Toxic"] = {
        "YOUR TRASH LOL",
        "GET BETTER AT THE VIDEO GAME",
        "I DONT CHEAT IM JUST BETTER",
        "UR TRASH",
        "SEEMS LIKE YOU GOT OWNED",
        "PLEASE GET ON MY LEVEL",
        "SEEMS LIKE A SKILL ISSUE",
        "I WOULD NEVER RESPAWN",
        "HAHAH U SUCK!",
        "MAYBE GET BETTER PRO TIP",
        "OWNED",
    },
    ["Custom"] = readfile("gameshark/chatspam.txt"):split("\n"),
}
local utx = {
    ["symbols"] = {
        "~",
        "!",
        "@",
        "#",
        "$",
        "%",
        "^",
        "&",
        "*",
        "(",
        ")",
        "_",
        "+",
        "{",
        "}",
        "|",
        ":",
        '"',
        "<",
        ">",
        "?",
        ".",
        ",",
        "/",
        "'",
    },
    ["emojis"] = {
        "😎",
        "🤣",
        "👀",
        "🙄",
        "🔥",
        "😅",
        "😂",
        "😹",
        "😛",
        "🤩",
        "🌈",
        "😎",
        "🤠",
        "😔",
        "🤡",
        "💤",
        "🚶",
        "🙀",
        "😂",
        "📈",
        "🤏",
        "🌈",
        "😎",
        "🤠",
        "😔",
    },
}
local Target = {
    [1] = nil
}
local Utility = {
    Cache = {
        Line = {
            Thickness = 1,
            Color = Color3.fromRGB(0, 255, 0),
            Transparency = 1,
        },
        Text = {
            Size = 13,
            Center = true,
            Outline = true,
            Font = 2,
            Color = Color3.fromRGB(255, 255, 255),
            Transparency = 1,
        },
        Square = {
            Thickness = 1,
            Color = Color3.fromRGB(255, 255, 255),
            Filled = false,
            Transparency = 1,
        },
        Circle = {
            Filled = false,
            NumSides = 30,
            Thickness = 0,
            Transparency = 1,
        },
        Triangle = {
            Color = Color3.fromRGB(255, 255, 255),
            Filled = true,
            Visible = false,
            Thickness = 1,
            Transparency = 1,
        },
        Image = {
            Transparency = 1,
            Visible = true,
            Data = images.gradient180        
        },
    }
}
local Skyboxes = {
    ["Purple Nebula"] = {
        ["SkyboxBk"] = "rbxassetid://159454299",
        ["SkyboxDn"] = "rbxassetid://159454296",
        ["SkyboxFt"] = "rbxassetid://159454293",
        ["SkyboxLf"] = "rbxassetid://159454286",
        ["SkyboxRt"] = "rbxassetid://159454300",
        ["SkyboxUp"] = "rbxassetid://159454288"
    },
    ["Night Sky"] = {
        ["SkyboxBk"] = "rbxassetid://12064107",
        ["SkyboxDn"] = "rbxassetid://12064152",
        ["SkyboxFt"] = "rbxassetid://12064121",
        ["SkyboxLf"] = "rbxassetid://12063984",
        ["SkyboxRt"] = "rbxassetid://12064115",
        ["SkyboxUp"] = "rbxassetid://12064131"
    },
    ["Pink Daylight"] = {
        ["SkyboxBk"] = "rbxassetid://271042516",
        ["SkyboxDn"] = "rbxassetid://271077243",
        ["SkyboxFt"] = "rbxassetid://271042556",
        ["SkyboxLf"] = "rbxassetid://271042310",
        ["SkyboxRt"] = "rbxassetid://271042467",
        ["SkyboxUp"] = "rbxassetid://271077958"
    },
    ["Morning Glow"] = {
        ["SkyboxBk"] = "rbxassetid://1417494030",
        ["SkyboxDn"] = "rbxassetid://1417494146",
        ["SkyboxFt"] = "rbxassetid://1417494253",
        ["SkyboxLf"] = "rbxassetid://1417494402",
        ["SkyboxRt"] = "rbxassetid://1417494499",
        ["SkyboxUp"] = "rbxassetid://1417494643"
    },
    ["Setting Sun"] = {
        ["SkyboxBk"] = "rbxassetid://626460377",
        ["SkyboxDn"] = "rbxassetid://626460216",
        ["SkyboxFt"] = "rbxassetid://626460513",
        ["SkyboxLf"] = "rbxassetid://626473032",
        ["SkyboxRt"] = "rbxassetid://626458639",
        ["SkyboxUp"] = "rbxassetid://626460625"
    },
    ['Cache'] = {
        ['SkyboxBk'] = 'rbxassetid://220513302';
        ['SkyboxDn'] = 'rbxassetid://213221473';
        ['SkyboxFt'] = 'rbxassetid://220513328';
        ['SkyboxLf'] = 'rbxassetid://220513318';
        ['SkyboxRt'] = 'rbxassetid://220513279';
        ['SkyboxUp'] = 'rbxassetid://220513345';
    },
    ["Fade Blue"] = {
        ["SkyboxBk"] = "rbxassetid://153695414",
        ["SkyboxDn"] = "rbxassetid://153695352",
        ["SkyboxFt"] = "rbxassetid://153695452",
        ["SkyboxLf"] = "rbxassetid://153695320",
        ["SkyboxRt"] = "rbxassetid://153695383",
        ["SkyboxUp"] = "rbxassetid://153695471"
    },
    ["Elegant Morning"] = {
        ["SkyboxBk"] = "rbxassetid://153767241",
        ["SkyboxDn"] = "rbxassetid://153767216",
        ["SkyboxFt"] = "rbxassetid://153767266",
        ["SkyboxLf"] = "rbxassetid://153767200",
        ["SkyboxRt"] = "rbxassetid://153767231",
        ["SkyboxUp"] = "rbxassetid://153767288"
    },
    ["Neptune"] = {
        ["SkyboxBk"] = "rbxassetid://218955819",
        ["SkyboxDn"] = "rbxassetid://218953419",
        ["SkyboxFt"] = "rbxassetid://218954524",
        ["SkyboxLf"] = "rbxassetid://218958493",
        ["SkyboxRt"] = "rbxassetid://218957134",
        ["SkyboxUp"] = "rbxassetid://218950090"
    },
    ["Redshift"] = {
        ["SkyboxBk"] = "rbxassetid://401664839",
        ["SkyboxDn"] = "rbxassetid://401664862",
        ["SkyboxFt"] = "rbxassetid://401664960",
        ["SkyboxLf"] = "rbxassetid://401664881",
        ["SkyboxRt"] = "rbxassetid://401664901",
        ["SkyboxUp"] = "rbxassetid://401664936"
    },
    ["Aesthetic Night"] = {
        ["SkyboxBk"] = "rbxassetid://1045964490",
        ["SkyboxDn"] = "rbxassetid://1045964368",
        ["SkyboxFt"] = "rbxassetid://1045964655",
        ["SkyboxLf"] = "rbxassetid://1045964655",
        ["SkyboxRt"] = "rbxassetid://1045964655",
        ["SkyboxUp"] = "rbxassetid://1045962969"
    }
}
local Cache = {
    gravity = workspace.Gravity
}
local Dances = {
    ["Default"] = "rbxassetid://5917459365", 
    ["Floss"] = "rbxassetid://5917459365", 
    ["Lil Nas X"] = "rbxassetid://10714365721", 
    ["Dolphin"] = "rbxassetid://10714068222", 
    ["Monkey"] = "rbxassetid://10714388352",
}
desync = {
    [1] = nil,
    [2] = nil,
    [3] = nil,
}

local NoclipParts = {}
local espDrawings = {}
local clickTick = tick()

local Dance = Instance.new("Animation")
Dance.AnimationId = "rbxassetid://"

local Animation

local dummy = game:GetObjects("rbxassetid://9474737816")[1]
dummy.Head.Face:Destroy()
dummy.Parent = workspace
dummy.PrimaryPart = dummy.HumanoidRootPart

local skybox = Instance.new("Sky")
skybox.Name = "cs"
skybox.CelestialBodiesShown = false 
skybox.MoonTextureId = ""
skybox.SunTextureId = ""
skybox.StarCount = 0

local ignores = {}

do -- legit
    local aim = legit:section({name = "Aim Assist", scroll = true}) do
        aim:toggle({name = "Enabled", flag = "aim enabled"}):keybind({flag = "aim key", listname = "Aim Assist"})
        aim:slider({name = "Horizontal Smoothing (%)", flag = "aim hor", min = 0, max = 100, default = 5})
        aim:slider({name = "Vertical Smoothing (%)", flag = "aim ver", min = 0, max = 100, default = 5})
        aim:toggle({name = "Use Field Of View", flag = "aim use fov"})
        aim:slider({name = "Field Of View (°)", flag = "aim fov", min = 0, max = 360, default = 30}) 
        aim:dropdown({name = "FOV Type", flag = "aim fov type", options = {"Static", "Dynamic"}, default = "Static"})  
        aim:dropdown({name = "Hitscan", flag = "aim hitscan", options = {"Head", "Torso", "Arms", "Legs"}, default = {"Head", "Torso"}, max = 4})  
        aim:dropdown({name = "Hitscan Position", flag = "aim hitscan pos", options = {"Cursor", "Screen"}, default = "Cursor"})  
        aim:toggle({name = "Team Check", flag = "aim team"})
        aim:toggle({name = "Visible Check", flag = "aim vis"})
        aim:toggle({name = "Force Field Check", flag = "aim force"})
        aim:dropdown({name = "Priority", flag = "aim priority", options = {"Distance", "Cursor", "Health"}, default = "Distance"})  
        aim:toggle({name = "Minimum Health (hp)", flag = "aim health"}):slider({flag = "aim health amount", min = 0, max = 100, default = 20})
        aim:toggle({name = "Limit Distance (st)", flag = "aim distance"}):slider({flag = "aim distance amount", min =    0, max = 2000, default = 1000})
        aim:toggle({name = "Predict Velocity", flag = "aim velocity"})
        aim:toggle({name = "Jump Prediction (st)", flag = "aim jump"}):slider({flag = "aim jump amount", min = -5, max = 5, default = 1.5, float = 0.1})
        aim:toggle({name = "Deadzone (°)", flag = "aim dead"}):slider({flag = "aim dead amount", min = 0, max = 360, default = 5})
    end

    local legitbox = legit:multisection({side = "right"}) do 
        local tbot = legitbox:tab({name = "Trigger Bot"}) do
            tbot:toggle({name = "Enabled", flag = "tbot enabled"}):keybind({flag = "tbot key", listname = "Trigger Bot"})
            tbot:slider({name = "Delay (ms)", flag = "tbot delay", min = 0, max = 520, default = 36})
            tbot:slider({name = "Interval (ms)", flag = "tbot interval", min = 0, max = 100, default = 5})
            tbot:dropdown({name = "Hitscan", flag = "tbot hitscan", options = {"Head", "Torso", "Arms", "Legs"}, default = {"Head", "Torso"}, max = 4})  
            tbot:toggle({name = "Team Check", flag = "tbot team"})
            tbot:toggle({name = "Visible Check", flag = "tbot vis"})
            tbot:toggle({name = "Force Field Check", flag = "tbot force"})
            tbot:toggle({name = "Minimum Health (hp)", flag = "tbot health"}):slider({flag = "tbot health amount", min = 0, max = 100, default = 20})
            tbot:toggle({name = "Limit Distance (st)", flag = "tbot distance"}):slider({flag = "tbot distance amount", min = 0, max = 2000, default = 1000})
        end

        local silent = legitbox:tab({name = "Silent Aim"}) do
            silent:toggle({name = "Enabled", flag = "silent enabled"}):keybind({flag = "silent key", listname = "Silent Aim"})
            silent:slider({name = "Hitchance (%)", flag = "silent hit", min = 0, max = 100, default = 5})
            silent:toggle({name = "Use Field Of View", flag = "silent use fov"})
            silent:slider({name = "Field Of View (°)", flag = "silent fov", min = 0, max = 360, default = 30}) 
            silent:dropdown({name = "FOV Type", flag = "silent fov type", options = {"Static", "Dynamic"}, default = "Static"})  
            silent:dropdown({name = "Hitscan", flag = "silent hitscan", options = {"Head", "Torso", "Arms", "Legs"}, default = {"Head", "Torso"}, max = 4})  
            silent:dropdown({name = "Hitscan Position", flag = "silent hitscan pos", options = {"Cursor", "Screen"}, default = "Cursor"})  
            silent:toggle({name = "Team Check", flag = "silent team"})
            silent:toggle({name = "Visible Check", flag = "silent vis"})
            silent:toggle({name = "Force Field Check", flag = "silent force"})
            silent:dropdown({name = "Priority", flag = "silent priority", options = {"Distance", "Cursor", "Health"}, default = "Distance"})  
            silent:toggle({name = "Minimum Health (hp)", flag = "silent health"}):slider({flag = "silent health amount", min = 0, max = 100, default = 20})
            silent:toggle({name = "Limit Distance (st)", flag = "silent distance"}):slider({flag = "silent distance amount", min = 0, max = 2000, default = 1000})
            silent:dropdown({name = "Method", flag = "silent method", options = {"Raycast", "FindPartOnRay", "FindPartOnRayWithWL", "FindPartOnRayWithIL"}, default = "Raycast"})
        end

        tbot:show()
    end
end

do -- esp
    local espbox = esp:multisection({}) do
        local enemy = espbox:tab({name = "Enemy"}) do
            enemy:toggle({name = "Enabled", flag = "esp enemy enabled"})
            enemy:toggle({name = "Name", flag = "esp enemy name"}):colorpicker({flag = "esp enemy name color", default = Color3.new(1, 1, 1)})
            enemy:toggle({name = "Bounding Box", flag = "esp enemy box"}):colorpicker({flag = "esp enemy box color", default = Color3.new(1, 1, 1)})
            enemy:toggle({name = "Fill", flag = "esp enemy box fill"}):colorpicker({flag = "esp enemy box fill color", alpha = 0, default = Color3.new(1, 1, 1)})
            local health = enemy:toggle({name = "Health Bar", flag = "esp enemy health bar"})
            health:colorpicker({flag = "esp enemy health bar low color", default = Color3.fromRGB(0, 255, 0)})
            health:colorpicker({flag = "esp enemy health bar color", default = Color3.fromRGB(255, 0, 0)})
            enemy:toggle({name = "Health Number", flag = "esp enemy health number"}):colorpicker({flag = "esp enemy health number color", default = Color3.new(1, 1, 1)})
            local off = enemy:toggle({name = "Offscreen Arrows", flag = "esp enemy off"})
            off:colorpicker({flag = "esp enemy off color", alpha = 0.5, default = Color3.new(1, 1, 1)})
            off:colorpicker({flag = "esp enemy off outline color", default = Color3.new(1, 1, 1)})
            enemy:slider({name = "Arrow Size (px)", flag = "esp enemy off size", min = 0, max = 40, default = 13})
            enemy:slider({name = "Arrow Position (px)", flag = "esp enemy off pos", min = 0, max = 300, default = 50})
            enemy:toggle({name = "Weapon", flag = "esp enemy weapon"}):colorpicker({flag = "esp enemy weapon color", default = Color3.new(1, 1, 1)})
            enemy:toggle({name = "Distance", flag = "esp enemy distance"}):colorpicker({flag = "esp enemy distance color", default = Color3.new(1, 1, 1)})
            enemy:toggle({name = "Protected", flag = "esp enemy protection"}):colorpicker({flag = "esp enemy protection color", default = Color3.new(1, 1, 1)})
            enemy:toggle({name = "Visible", flag = "esp enemy visible"}):colorpicker({flag = "esp enemy visible color", default = Color3.new(1, 1, 1)})
            enemy:toggle({name = "Display Name", flag = "esp enemy display"}):colorpicker({flag = "esp enemy display color", default = Color3.new(1, 1, 1)})
            local chams = enemy:toggle({name = "Chams", flag = "esp enemy chams"})
            chams:colorpicker({flag = "esp enemy chams color", default = Color3.fromRGB(0, 157, 255)})
            chams:colorpicker({flag = "esp enemy chams outline color", default = Color3.fromRGB(0, 255, 153)})
        end

        local team = espbox:tab({name = "Team"}) do
            team:toggle({name = "Enabled", flag = "esp team enabled"})
            team:toggle({name = "Name", flag = "esp team name"}):colorpicker({flag = "esp team name color", default = Color3.new(1, 1, 1)})
            team:toggle({name = "Bounding Box", flag = "esp team box"}):colorpicker({flag = "esp team box color", default = Color3.new(1, 1, 1)})
            team:toggle({name = "Fill", flag = "esp team box fill"}):colorpicker({flag = "esp team box fill color", alpha = 0, default = Color3.new(1, 1, 1)})
            local health = team:toggle({name = "Health Bar", flag = "esp team health bar"})
            health:colorpicker({flag = "esp team health bar low color", default = Color3.fromRGB(0, 255, 0)})
            health:colorpicker({flag = "esp team health bar color", default = Color3.fromRGB(255, 0, 0)})            
            team:toggle({name = "Health Number", flag = "esp team health number"}):colorpicker({flag = "esp team health number color", default = Color3.new(1, 1, 1)})
            local off = team:toggle({name = "Offscreen Arrows", flag = "esp team off"})
            off:colorpicker({flag = "esp team off color", alpha = 0.5, default = Color3.new(1, 1, 1)})
            off:colorpicker({flag = "esp team off outline color", default = Color3.new(1, 1, 1)})
            team:slider({name = "Arrow Size (px)", flag = "esp team off size", min = 0, max = 40, default = 13})
            team:slider({name = "Arrow Position (px)", flag = "esp team off pos", min = 0, max = 300, default = 50})
            team:toggle({name = "Weapon", flag = "esp team weapon"}):colorpicker({flag = "esp team weapon color", default = Color3.new(1, 1, 1)})
            team:toggle({name = "Distance", flag = "esp team distance"}):colorpicker({flag = "esp team distance color", default = Color3.new(1, 1, 1)})
            team:toggle({name = "Protected", flag = "esp team protection"}):colorpicker({flag = "esp team protection color", default = Color3.new(1, 1, 1)})
            team:toggle({name = "Visible", flag = "esp team visible"}):colorpicker({flag = "esp team visible color", default = Color3.new(1, 1, 1)})
            team:toggle({name = "Display Name", flag = "esp team display"}):colorpicker({flag = "esp team display color", default = Color3.new(1, 1, 1)})
            local chams = team:toggle({name = "Chams", flag = "esp team chams"})
            chams:colorpicker({flag = "esp team chams color", default = Color3.fromRGB(0, 157, 255)})
            chams:colorpicker({flag = "esp team chams outline color", default = Color3.fromRGB(0, 255, 153)})
        end

        local self = espbox:tab({name = "Self"}) do
            self:toggle({name = "Enabled", flag = "esp self enabled"})
            self:toggle({name = "Name", flag = "esp self name"}):colorpicker({flag = "esp self name color", default = Color3.new(1, 1, 1)})
            self:toggle({name = "Bounding Box", flag = "esp self box"}):colorpicker({flag = "esp self box color", default = Color3.new(1, 1, 1)})
            self:toggle({name = "Fill", flag = "esp self box fill"}):colorpicker({flag = "esp self box fill color", alpha = 0, default = Color3.new(1, 1, 1)})
            local health = self:toggle({name = "Health Bar", flag = "esp self health bar"})
            health:colorpicker({flag = "esp self health bar low color", default = Color3.fromRGB(0, 255, 0)})
            health:colorpicker({flag = "esp self health bar color", default = Color3.fromRGB(255, 0, 0)})            
            self:toggle({name = "Health Number", flag = "esp self health number"}):colorpicker({flag = "esp self health number color", default = Color3.new(1, 1, 1)})
            self:toggle({name = "Weapon", flag = "esp self weapon"}):colorpicker({flag = "esp self weapon color", default = Color3.new(1, 1, 1)})
            self:toggle({name = "Protected", flag = "esp self protection"}):colorpicker({flag = "esp self protection color", default = Color3.new(1, 1, 1)})
            self:toggle({name = "Display Name", flag = "esp self display"}):colorpicker({flag = "esp self display color", default = Color3.new(1, 1, 1)})
            local chams = self:toggle({name = "Chams", flag = "esp self chams"})
            chams:colorpicker({flag = "esp self chams color", default = Color3.fromRGB(0, 157, 255)})
            self:toggle({name = "Desync", flag = "esp self desync"}):colorpicker({flag = "esp self desync color", default = Color3.fromRGB(0, 157, 255)})
            self:dropdown({name = "Material", flag = "esp self desync material", options = {"ForceField", "Plastic", "Neon", "Glass"}, default = "ForceField"})
        end

        enemy:show()
    end

    local settings = esp:section({name = "Settings", side = "right"}) do
        settings:slider({name = "Max HP Visibility Cap (hp)", flag = "esp hp", min = 0, max = 100, default = 90})
        settings:dropdown({name = "Text Font", flag = "esp font", options = {"Plex", "UI", "System", "Monospace"}, default = "Plex"})
        settings:dropdown({name = "Text Case", flag = "esp case", options = {"Normal", "UPPERCASE", "lowercase"}, default = "Normal"})
        settings:slider({name = "Text Size (px)", flag = "esp size", min = 1, max = 50, default = 13})
        settings:dropdown({name = "Flag Text Font", flag = "esp flag font", options = {"Plex", "UI", "System", "Monospace"}, default = "Plex"})
        settings:dropdown({name = "Flag Text Case", flag = "esp flag case", options = {"Normal", "UPPERCASE", "lowercase"}, default = "Normal"})
        settings:slider({name = "Flag Text Size (px)", flag = "esp flag size", min = 1, max = 50, default = 13})
        settings:toggle({name = "Limit Distance (st)", flag = "esp distance"}):slider({flag = "esp distance amount", min = 0, max = 2000, default = 500})
        settings:toggle({name = "Highlight Target", flag = "esp target"}):colorpicker({flag = "esp target color", default = Color3.fromRGB(184, 95, 95)})
        settings:toggle({name = "Highlight Friends", flag = "esp friend"}):colorpicker({flag = "esp friend color", default = Color3.fromRGB(0, 187, 255)})
        settings:toggle({name = "Highlight Priority", flag = "esp priority"}):colorpicker({flag = "esp priority color", default = Color3.fromRGB(0, 255, 128)})
    end
end

do -- visuals
    local world = visuals:section({name = "Environment", size = UDim2.new(1, 0, 0, 275)}) do 
        local ambient = world:toggle({name = "Ambient", flag = "ambient"})
        ambient:colorpicker({flag = "ambient outside", default = Lighting.OutdoorAmbient})
        ambient:colorpicker({flag = "ambient inside", default = Lighting.Ambient})
        world:toggle({name = "Brightness (ns)", flag = "bright"}):slider({flag = "bright amount", min = 0, max = 25, default = 3})
        world:toggle({name = "Time (hr)", flag = "time"}):slider({flag = "time amount", min = 0, max = 24, float = 0.5, default = 12})
        local shift = world:toggle({name = "Color Shift", flag = "shift"})
        shift:colorpicker({flag = "shift bottom", default = Lighting.ColorShift_Bottom})
        shift:colorpicker({flag = "shift top", default = Lighting.ColorShift_Top})
        world:toggle({name = "Fog", flag = "fog"}):colorpicker({flag = "fog color", default = Lighting.FogColor})
        world:slider({name = "Fog Start (st)", flag = "fog start", min = 0, max = 5000, default = Lighting.FogStart})
        world:slider({name = "Fog End (st)", flag = "fog end", min = 0, max = 5000, default = Lighting.FogEnd})
        world:toggle({name = "Skybox", flag = "skybox"})
        world:dropdown({name = "Skybox Type", flag = "skybox type", scrollingmax = 5, scrollable = true, options = {"Purple Nebula", "Night Sky", "Pink Daylight", "Cache", "Morning Glow", "Setting Sun", "Fade Blue", "Elegant Morning", "Neptune", "Redshift", "Aesthetic Night"}, default = "Purple Nebula"})
    end

    local camera = visuals:section({name = "Camera", size = UDim2.new(1, 0, 1, -280)}) do
        camera:toggle({name = "Field Of View (°)", flag = "camera fov"}):slider({flag = "camera fov amount", min = 1, max = 120, default = 90})
        camera:toggle({name = "Third Person", flag = "third person"}):keybind({flag = "third person key", listname = "Third Person"})
        camera:slider({name = "X Position (st)", flag = "third person x", min = -15, max = 15, default = 0})
        camera:slider({name = "Y Position (st)", flag = "third person y", min = -15, max = 15, default = 0})
        camera:slider({name = "Z Position (st)", flag = "third person z", min = -15, max = 15, default = 0})
    end

    local visbox = visuals:multisection({side = "right"}) do
        local interface = visbox:tab({name = "Interface"}) do 
            local aimassist = interface:toggle({name = "Aim Assist", flag = "fov aim"})
            aimassist:colorpicker({
                flag = "fov aim outline color",
                default = Color3.fromRGB(0, 0, 0),
            })
            aimassist:colorpicker({
                flag = "fov aim color",
                default = Color3.fromRGB(255, 255, 255),
            })
            interface:toggle({name = "Filled", flag = "fov aim filled"})
            interface:slider({
                flag = "fov aim sides",
                name = "Num Sides (px)", 
                min = 1, 
                max = 50, 
                default = 20, 
                float = 1,
            })
            interface:slider({
                flag = "fov aim thick",
                name = "Thickness (px)", 
                min = 0, 
                max = 100, 
                default = 1, 
                float = 1,
            })

            local deadassist = interface:toggle({name = "Deadzone", flag = "fov dead"})
            deadassist:colorpicker({
                flag = "fov dead outline color",
                default = Color3.fromRGB(0, 0, 0),
            })
            deadassist:colorpicker({
                flag = "fov dead color",
                default = Color3.fromRGB(255, 255, 255),
            })
            interface:toggle({name = "Filled", flag = "fov dead filled"})
            interface:slider({
                flag = "fov dead sides",
                name = "Num Sides (px)", 
                min = 1, 
                max = 50, 
                default = 20, 
                float = 1,
            })
            interface:slider({
                flag = "fov dead thick",
                name = "Thickness (px)", 
                min = 0, 
                max = 100, 
                default = 1, 
                float = 1,
            })

            local silentaim = interface:toggle({name = "Silent Aim", flag = "fov silent"})
            silentaim:colorpicker({
                flag = "fov silent outline color",
                default = Color3.fromRGB(0, 0, 0),
            })
            silentaim:colorpicker({
                flag = "fov silent color",
                default = Color3.fromRGB(255, 255, 255),
            })
            interface:toggle({name = "Filled", flag = "fov silent filled"})
            interface:slider({
                flag = "fov silent sides",
                name = "Num Sides (px)", 
                min = 1, 
                max = 50, 
                default = 20, 
                float = 1,
            })
            interface:slider({
                flag = "fov silent thick",
                name = "Thickness (px)", 
                min = 0, 
                max = 100, 
                default = 1, 
                float = 1,
            })
        end
        
        local cursor = visbox:tab({name = "Cursor"}) do
            local tgl = cursor:toggle({name = "Enabled", flag = "cursor enabled", callback = function(v)
                crosshair.enabled = v
            end})
            tgl:colorpicker({flag = "cursor outline color", default = Color3.new(0, 0, 0), callback = function(v)
                crosshair.outlinecolor = v
                crosshair.outlinetransparency = v.a
            end})
            tgl:colorpicker({flag = "cursor color", default = Color3.new(1, 1, 1), callback = function(v)
                crosshair.color = v
                crosshair.transparency = v.a
            end})
            local tgl2 = cursor:toggle({name = "Dot", flag = "cursor dot enabled", callback = function(v)
                crosshair.dot = v
            end})
            tgl2:colorpicker({flag = "cursor dot outline color", default = Color3.new(0, 0, 0), callback = function(v)
                crosshair.dotoutlinecolor = v
                crosshair.dotoutlinetransparency = v.a
            end})
            tgl2:colorpicker({flag = "cursor dot color", default = Color3.new(1, 1, 1), callback = function(v)
                crosshair.dotcolor = v
                crosshair.dottransparency = v.a
            end})
            cursor:toggle({name = "Rotate", flag = "cursor rotate", callback = function(v)
                crosshair.spin = v
            end})
            cursor:toggle({name = "Dynamic Sizing", flag = "cursor dynamic size", callback = function(v)
                crosshair.dynamicsizing = v
            end})
            cursor:toggle({name = "Follow Mouse", flag = "cursor mouse", callback = function(v)
                crosshair.mouse = v
            end})
            cursor:slider({
                name = "Size (px)", 
                flag = "cursor size",
                min = 1, 
                max = 200, 
                default = 12,
                float = 1,
                callback = function(v)
                    crosshair.length = v
                end
            })
            cursor:slider({
                name = "Gap (px)", 
                flag = "cursor gap",
                min = 1, 
                max = 200, 
                default = 3, 
                float = 1,
                callback = function(v)
                    crosshair.radius = v
                end
            })
            cursor:slider({
                name = "Thickness (px)", 
                flag = "cursor thickness",
                min = 1, 
                max = 50, 
                default = 2, 
                float = 1,
                callback = function(v)
                    crosshair.width = v
                end
            })
            cursor:slider({
                name = "Dot Size (px)", 
                flag = "cursor dot size",
                min = 1, 
                max = 30, 
                default = 2, 
                float = 1,
                callback = function(v)
                    crosshair.dotsize = v
                end
            })
            cursor:slider({
                name = "Speed (ms)", 
                flag = "cursor spin speed",
                min = 1, 
                max = 500, 
                default = 50, 
                float = 1,
                callback = function(v)
                    crosshair.speed = v
                end
            })
            cursor:dropdown({name = "Easing Style", flag = "cursor easing style", scrollingmax = 5, scrollable = true, options = {"Linear", "Sine", "Back", "Quad", "Quart", "Quint", "Bounce", "Elastic", "Exponential", "Circular", "Cubic"}, default = "Linear", callback = function(v)
                crosshair.easingstyle = v
            end})
            cursor:dropdown({name = "Easing Direction", flag = "cursor easing direction", options = {"In", "Out", "InOut"}, default = "Out", callback = function(v)
                crosshair.easingdirection = v
            end})
        end

        interface:show()
    end 
end

do -- misc
    local movement = misc:section({name = "Movement", size = UDim2.new(1, 0, 1, -183)}) do
        local fly = movement:toggle({name = "Fly (st)", flag = "fly"})
        fly:keybind({flag = "fly key", listname = "Fly"})
        fly:slider({flag = "fly amount", min = 0, max = 300, default = 60})
        movement:dropdown({name = "Fly Type", flag = "fly type", options = {"Velocity", "Noclip"}, default = "Velocity"})
        movement:toggle({name = "Auto Jump", flag = "speed auto"})
        local speed = movement:toggle({name = "Speed (st)", flag = "speed"})
        speed:keybind({flag = "speed key", listname = "Speed"})
        speed:slider({flag = "speed amount", min = 0, max = 300, default = 60})
        local gravity = movement:toggle({name = "Gravity (st)", flag = "gravity"})
        gravity:keybind({flag = "gravity key", listname = "Gravity"})
        gravity:slider({flag = "gravity factor", min = 0, max = 1000})
        local jump = movement:toggle({name = "Jump Power (st)", flag = "jump"})
        jump:keybind({flag = "jump key", listname = "Jump Power"})
        jump:slider({flag = "jump amount", min = 0, max = 1000})
        movement:toggle({name = "Noclip", flag = "noclip"}):keybind({flag = "noclip key", listname = "Noclip"})
        movement:toggle({name = "Click Teleport", flag = "click"}):keybind({flag = "click key", listname = "Click Teleport"})
    end

    local chatspam = misc:section({name = "Chat Spam", size = UDim2.new(1, 0, 0, 178)}) do
        chatspam:toggle({name = "Enabled", flag = "chat spam"})
        chatspam:slider({name = "Delay (s)", flag = "chat spam delay", min = 0, max = 12, default = 3, float = 0.1})
        chatspam:dropdown({name = "Type", flag = "chat spam type", options = {"gameshark", "Toxic", "Custom"}, default = "gameshark"})
        chatspam:toggle({name = "Repeat", flag = "chat spam repeat"})
        chatspam:toggle({name = "Emojis", flag = "chat spam emojis"})
        chatspam:toggle({name = "Symbols", flag = "chat spam symbols"})
    end

    local desync = misc:section({name = "Client Desync", side = "right", size = UDim2.new(1, 0, 0, 200), scroll = true}) do
        desync:toggle({name = "Enabled", flag = "desync"}):keybind({flag = "desync key", listname = "Desync"})
        desync:slider({name = "X Position (st)", flag = "desync x", min = -200, max = 200, float = 1, default = 0})
        desync:slider({name = "Y Position (st)", flag = "desync y", min = -200, max = 200, float = 1, default = 0})
        desync:slider({name = "Z Position (st)", flag = "desync z", min = -200, max = 200, float = 1, default = 0})
        desync:slider({name = "Pitch (°)", flag = "desync pitch", min = -180, max = 180, default = 0})
        desync:slider({name = "Yaw (°)", flag = "desync yaw", min = -180, max = 180, default = 0})
        desync:slider({name = "Roll (°)", flag = "desync roll", min = -180, max = 180, default = 0})
        desync:dropdown({name = "Position Method", flag = "desync pos", options = {"Off", "Static", "Random"}, default = "Off"})
        desync:dropdown({name = "Turn Method", flag = "desync turn", options = {"Off", "Static", "Random"}, default = "Off"})
        desync:dropdown({name = "Velocity Method", flag = "desync velocity", options = {"Off", "Static", "Random", "Fling"}, default = "Off"})
        desync:slider({name = "Velocity Multiplier (st)", flag = "desync velocity mult", min = 0, max = 200, default = 1})
    end

    local extra = misc:section({name = "Extra", side = "right", size = UDim2.new(1, 0, 1, -205)}) do
        extra:toggle({name = "Fake Lag", flag = "fakelag"}):keybind({flag = "fakelag key", listname = "Fake Lag"})
        extra:toggle({name = "Visualize", flag = "fake lag visualize"}):colorpicker({flag = "fake lag vis", default = Color3.new(1, 1, 1)})
        extra:slider({name = "Delay (ms)", flag = "fakelag delay", min = 1, max = 8000, float = 1, default = 2000})
        extra:toggle({name = "Dance", flag = "dance", callback = function(v)
            if v then
                Animation = LocalPlayer.Character.Humanoid:LoadAnimation(Dance) 
                Animation.Priority = Enum.AnimationPriority.Action 
                Animation:Play()
            else
                pcall(function()
                    Animation:Stop()
                end)
            end
        end})
        extra:dropdown({name = "Type", flag = "dance type", options = {"Default", "Floss", "Lil Nas X", "Dolphin", "Monkey"}, default = "Default", callback = function(v)
            Dance.AnimationId = Dances[v]

            pcall(function()
                Animation:Stop()
            end)

            if library.flags["dance"] then
                Animation = LocalPlayer.Character.Humanoid:LoadAnimation(Dance) 
                Animation.Priority = Enum.AnimationPriority.Action 
                Animation:Play(0.100000001, 1, library.flags["dance speed"])
            end
        end})
        extra:slider({name = "Speed (s)", flag = "dance speed", min = 0, max = 10, default = 1, float = 0.1, callback = function(v)
            pcall(function()
                Animation:Stop()
            end)

            if library.flags["dance"] then
                Animation = LocalPlayer.Character.Humanoid:LoadAnimation(Dance) 
                Animation.Priority = Enum.AnimationPriority.Action 
                Animation:Play(0.100000001, 1, v)
            end
        end})
    end
end

do -- player list 
    players:playerlist({})

    local options = players:section({name = "extra", side = "middle"}) do
        options:toggle({name = "ignore friends", flag = "ignore friends"})
        options:toggle({name = "priority only", flag = "prio only"})
    end
end

do -- settings
    local presets = settings:section({name = "Presets"}) do
        local cfgname = nil
        local configs_list = presets:dropdown({name = "", flag = "cfg_list", list = true, scrollable = true, size = 120, callback = function(v)
            if cfgname ~= nil then
                cfgname:Set(v)
            end
        end})
        local current_list = {}
        local function update_config_list()
            local list = {}
            for idx, file in ipairs(listfiles(library.folder .. "/configs")) do
                local file_name = file:gsub(library.folder .. "/configs\\", ""):gsub(".cfg", "")
                list[#list + 1] = file_name
            end
        
            local is_new = #list ~= #current_list
            if not is_new then
                for idx, file in ipairs(list) do
                    if file ~= current_list[idx] then
                        is_new = true
                        break
                    end
                end
            end
        
            if is_new then
                current_list = list
                configs_list:refresh(list)
            end
        end

        update_config_list()
        cfgname = presets:textbox({placeholder = "Preset Name", flag = "cfg_name"})
        presets:button({name = "Load", callback = function()
            if isfile(library.folder .. "/configs/".. library.flags["cfg_list"] .. ".cfg") then
                library:load_config(library.folder .. "/configs/".. library.flags["cfg_list"] .. ".cfg")
                library.notify(("loaded config (%s.cfg)!"):format(library.flags["cfg_list"]), 5)
            end
        end})
        presets:button({name = "Save", callback = function()
            if not isfile(library.folder .. "/configs/".. library.flags.cfg_name .. ".cfg") then
                writefile(library.folder .. "/configs/".. library.flags.cfg_name .. ".cfg", window:get_config())
                library.notify(("created config (%s.cfg)!"):format(library.flags.cfg_name), 5)
            else
                writefile(library.folder .. "/configs/".. library.flags.cfg_name .. ".cfg", window:get_config())
                library.notify(("saved config (%s.cfg)!"):format(library.flags.cfg_name), 5)
            end

            update_config_list()
        end})
        presets:button({name = "Delete", callback = function()
            if isfile(library.folder .. "/configs/".. library.flags.cfg_name .. ".cfg") then
                delfile(library.folder .. "/configs/".. library.flags.cfg_name .. ".cfg")
                library.notify(("deleted config (%s.cfg)!"):format(library.flags.cfg_name), 5)
            end

            update_config_list()
        end})
        presets:button({name = "Reset", callback = function()
            if isfile(library.folder .. "/configs/".. library.flags.cfg_name .. ".cfg") then
                writefile(library.folder .. "/configs/".. library.flags.cfg_name .. ".cfg", "")
                library.notify(("reseted config (%s.cfg)!"):format(library.flags.cfg_name), 5)
            end

            update_config_list()
        end})
        presets:button({name = "Refresh", callback = function()
            update_config_list()
        end})
    end

    local other = settings:section({name = "Other", side = "right"}) do
        other:keybind({name = "Menu Bind", flag = "menu bind", ignore = true, default = Enum.KeyCode.RightShift, callback = function()
            library:SetOpen(not library.open)
        end})  
        other:colorpicker({name = "Accent", flag = "menu accent", default = themes["Accent"], callback = function(v)
            library:ChangeThemeOption("Accent", v)
        end})
        other:colorpicker({name = "Text", flag = "menu text", default = themes["Text"], callback = function(v)
            library:ChangeThemeOption("Text", v)
        end})
        other:colorpicker({name = "Dark Text", flag = "menu text", default = themes["Dark Text"], callback = function(v)
            library:ChangeThemeOption("Dark Text", v)
        end})
        other:colorpicker({name = "Outline", flag = "menu outline", default = themes["Outline"], callback = function(v)
            library:ChangeThemeOption("Outline", v)
        end})
        other:colorpicker({name = "Inline", flag = "menu inline", default = themes["Inline"], callback = function(v)
            library:ChangeThemeOption("Inline", v)
        end})
        other:colorpicker({name = "Background", flag = "menu background", default = themes["Background"], callback = function(v)
            library:ChangeThemeOption("Background", v)
        end})
        other:colorpicker({name = "Background 2", flag = "menu background 2", default = themes["Background 2"], callback = function(v)
            library:ChangeThemeOption("Background 2", v)
        end})
        other:colorpicker({name = "Background 3", flag = "menu element background", default = themes["Element Background"], callback = function(v)
            library:ChangeThemeOption("Element Background", v)
        end})
        other:colorpicker({name = "Background 4", flag = "menu element background 2", default = themes["Element Background 2"], callback = function(v)
            library:ChangeThemeOption("Element Background 2", v)
        end})
        library.keybind_list:visible(false)
        other:toggle({name = "Keybinds", flag = "keybinds enaled", state = false, callback = function(v)
            library.keybind_list:visible(v)
        end})
        other:toggle({name = "Watermark", flag = "watermark enaled", state = true, callback = function(v)
            list:visible(v)
        end})
        other:slider({name = "Watermark Tickrate (t)", flag = "watermark tick", min = 0, max = 50, float = 1, default = 30})
        other:textbox({placeholder = "Watermark Text", default = " | {user} | {date}", flag = "watermark text"})
        other:button({name = "Rejoin", callback = function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end})
        other:button({name = "Unload", callback = function()
            library:unload()
        end})
    end
end 

do -- function
    function Utility.New(type, prop, outline)
        local obj = CreateRenderObject(type)

        if prop then
            for _,v in pairs(prop) do
                SetRenderProperty(obj, _, v)
            end
        end

        library.drawings["custom " .. drawings + 1] = obj
        drawings += 1

        if outline then
            SetRenderProperty(obj, "Filled", false)
            SetRenderProperty(obj, "Thickness", 3)
            SetRenderProperty(obj, "Color", Color3.new(0, 0, 0))
        end

        return obj
    end     

    function Utility.newEsp(player)
        if not espDrawings[player] then
            espDrawings[player] = {
                BoxOutline = Utility.New("Square", Utility.Cache.Square, true),
                Box = Utility.New("Square", Utility.Cache.Square),
                BoxFill = Utility.New("Square", Utility.Cache.Square),
                Name = Utility.New("Text", Utility.Cache.Text),
                HealthBarOutline = Utility.New("Square", Utility.Cache.Square, true),
                HealthBar = Utility.New("Square", Utility.Cache.Square),
                HealthGradient = Utility.New("Image", Utility.Cache.Image),
                HealthNumber = Utility.New("Text", Utility.Cache.Text),
                Weapon = Utility.New("Text", Utility.Cache.Text),
                Distance = Utility.New("Text", Utility.Cache.Text),
                Protected = Utility.New("Text", Utility.Cache.Text),
                DisplayName = Utility.New("Text", Utility.Cache.Text),
                Visible = Utility.New("Text", Utility.Cache.Text),
                OffOutline = Utility.New("Triangle", Utility.Cache.Triangle),
                Off = Utility.New("Triangle", Utility.Cache.Triangle),
            }
        end
    end

    function Utility.removeEsp(player)
        if espDrawings[player] then
            for _,v in pairs(espDrawings[player]) do 
                DestroyRenderObject(v)
                v = nil
            end

            espDrawings[player] = nil
        end
    end

    function Utility.findRoot(player)
        local Character = player.Character

        return Character:FindFirstChild("HumanoidRootPart") or Character:FindFirstChild("RootPart") or Character:FindFirstChild("Torso")
    end

    function Utility.isAlive(player)
        local boolean = false

        if player.Character and player.Character:FindFirstChild("Humanoid") and Utility.findRoot(player) and player.Character.Humanoid.Health ~= 0 then 
            boolean = true
        end

        return boolean
    end

    function Utility.espFlag(group, flag) -- pointless
        return flags["esp " .. group .. " " .. flag]
    end

    function Utility.GetCase(text, case) -- pointless AGAIN
        if case:lower() == "normal" then
            return text
        elseif case:lower() == "uppercase" then
            return text:upper()
        elseif case:lower() == "lowercase" then
            return text:lower()
        end
    end

    function Utility.BoundingBox(torso) -- bbot paste
        local vTop = torso.Position + (torso.CFrame.UpVector * 1.8) + Camera.CFrame.UpVector
        local vBottom = torso.Position - (torso.CFrame.UpVector * 2.5) - Camera.CFrame.UpVector
    
        local top, topIsRendered = Camera:WorldToViewportPoint(vTop)
        local bottom, bottomIsRendered = Camera:WorldToViewportPoint(vBottom)
    
        local _width = math.max(math.floor(math.abs(top.x - bottom.x)), 3)
        local _height = math.max(math.floor(math.max(math.abs(bottom.y - top.y), _width / 2)), 3)
        local boxSize = Vector2.new(math.floor(math.max(_height / 1.5, _width)), _height)
        local boxPosition = Vector2.new(math.floor(top.x * 0.5 + bottom.x * 0.5 - boxSize.x * 0.5), math.floor(math.min(top.y, bottom.y)))
    
        return boxSize, boxPosition
    end

    function Utility.espColor(player, color) -- nigga stop adding pointless functions
        if table.find(friends, player) and flags["esp friend"] then
            return flags["esp friend color"]
        elseif table.find(priority, player) and flags["esp priority"] then
            return flags["esp priority color"]
        elseif Target[1] == player and flags["esp target"] then
            return flags["esp target color"]
        else
            return color
        end
    end

    function Utility.isVisible(part, player)
        local char = player.Character
        if not (char and char:IsDescendantOf(workspace)) then
            return false
        end
        local ignoreList = {}
        table.insert(ignoreList, Camera)
        table.insert(ignoreList, LocalPlayer.Character)

        for _, part in ipairs(char:GetDescendants()) do
            if not part:IsA("BasePart") or not part.Transparency == 0 then
                table.insert(ignoreList, part)
            end
        end
        local ignoreFolderNames = {"ignore", "Ignore", "Ingored", "ingored", "ingores", "Ignores"}
        local ignoreFolder
        for _, name in ipairs(ignoreFolderNames) do
            ignoreFolder = workspace:FindFirstChild(name)
            if ignoreFolder and ignoreFolder:IsA("Folder") then
                break
            end
        end
        if ignoreFolder then
            table.insert(ignoreList, ignoreFolder:GetDescendants())
        end
        local raycastParams = RaycastParams.new()
        raycastParams.IgnoreWater = true
        raycastParams.FilterDescendantsInstances = ignoreList
        local origin = Camera.CFrame.p
        local direction = (char.Head.Position - Camera.CFrame.p).unit
        local raycastResult = workspace:Raycast(origin, direction * 1000, raycastParams)
        return raycastResult and raycastResult.Instance:IsDescendantOf(char)    
    end
    
    function Utility.RotateVector2(v2n, r)
        local c = math.cos(r);
        local s = math.sin(r);
        return Vector2.new(c * v2n.X - s*v2n.Y, s*v2n.X + c*v2n.Y)
    end

    function Utility.getHitboxes(part, tbl)
        if (part.Name:find("Arm") or part.Name:find("Hand")) and table.find(tbl, "Arms") then
            return true
        elseif (part.Name:find("Leg") or part.Name:find("Foot")) and table.find(tbl, "Legs") then
            return true
        elseif (part.Name:find("Torso") or part.Name:find("Root")) and table.find(tbl, "Torso") then
            return true
        elseif table.find(tbl, part.Name) then
            return true
        elseif part.Name == "Handle" and table.find(tbl, "Head") then
            return true
        end
        
        return false
    end

    function Utility.closestHitbox(character, flag)
        local hitboxes = {}

        for _,v in pairs(character:GetChildren()) do
            if Utility.getHitboxes(v, flag) then
                local Pos = Camera:WorldToViewportPoint(v.Position)
                local Magnitude = (Vector2.new(Pos.X, Pos.Y) - MousePos).Magnitude

                hitboxes[#hitboxes + 1] = {v, Magnitude}
            end
        end

        table.sort(hitboxes, function(a, b) 
            return a[2] < b[2] 
        end)
        
        return hitboxes[1]
    end
 
    function Utility.MouseMove(pos, smoothx, smoothy)
        local mouse = LocalPlayer:GetMouse()
        local targetPos = Camera:WorldToScreenPoint(pos)
        local mousePos = Camera:WorldToScreenPoint(mouse.Hit.p)
        mousemoverel((targetPos.X - mousePos.X) / smoothx, (targetPos.Y - mousePos.Y) / smoothy)
    end

    function Utility.Resolve(player)
        local Character = player.Character
        local HumanoidRootPart = Utility.findRoot(player)
        local oldpos = HumanoidRootPart.Position
        local elapsed = RunService.Heartbeat:wait()
        local newpos = HumanoidRootPart.Position 
    
        local Velocity = (newpos - oldpos) / elapsed
        return Velocity * (game.Stats.PerformanceStats.Ping:GetValue() / 1000) -- gayyy
    end

    function Utility.FindRandomText(text)
        if text:find(' @r ') then 
            local b = text:split(' @r ')
            return b[math.random(#b)]
        else 
            return text
        end
    end
    
    function Utility.TextTriggers(text) -- why tf would u need this
        local triggers = {
            ['{user}'] = "office",
            ['{hour}'] = os.date("%H"),
            ['{minute}'] = os.date("%M"),
            ['{second}'] = os.date("%S"),
            ['{ap}'] = os.date("%p"),
            ['{month}'] = os.date("%b"),
            ['{day}'] = os.date("%d"),
            ['{year}'] = os.date("%Y"),
            ['{version}'] = "0.5.5",
            ['{fps}'] = fps,
            ['{ping}'] = math.floor(game.Stats.PerformanceStats.Ping:GetValue() or 1),
            ['{game}'] = "universal",
            ['{time}'] = os.date("%H:%M:%S"),
            ['{date}'] = os.date("%b. %d, %Y")
        }        
    
        for a,b in next, triggers do 
            text = string.gsub(text, a, b)
        end
    
        return Utility.FindRandomText(text)
    end

    function Utility.toVector3(cframe)
        return Vector3.new(cframe.X, cframe.Y, cframe.Z)
    end

    function Utility.CheckMsg(tbl)
        local msg = tbl[math.random(1, #tbl)]
        
        if msg == oldMsg then
            return Utility.CheckMsg(tbl)
        else
            oldMsg = msg
            return msg
        end
    end

    function Utility.ChatSpam(tp, rp, emojis, symbols)
        local message = ""
        messages["custom"] = readfile("gameshark/chatspam.txt"):split("\n")
        
        for i = 1, rp and math.random(2, 5) or 1 do
            for i = 1, math.random(1, 5) do
                local index = math.random(0, 1) == 0 and "symbols" or "emojis"
                
                if index == "symbols" and symbols then
                    message = message .. tostring(utx[index][math.random(1, #utx[index])])
                elseif index == "emojis" and emojis then
                    message = message .. tostring(utx[index][math.random(1, #utx[index])])
                end
            end
            
            message = message .. Utility.CheckMsg(messages[tp])
                        
            for i = 1, math.random(1, 5) do
                local index = math.random(0, 1) == 0 and "symbols" or "emojis"
                
                if index == "symbols" and symbols then
                    message = message .. tostring(utx[index][math.random(1, #utx[index])])
                elseif index == "emojis" and emojis then
                    message = message .. tostring(utx[index][math.random(1, #utx[index])])
                end
            end
            
            message = message .. " "
        end
        
        return message
    end

    function Utility.Direction(Origin, Position)
        return (Position - Origin).Unit * 1000
    end   
end

for _,v in pairs(Players:GetPlayers()) do
    Utility.newEsp(v)
end

local fovcircles = {
    aimoutline = Utility.New("Circle"),
    aim = Utility.New("Circle"),

    deadoutline = Utility.New("Circle"),
    dead = Utility.New("Circle"),

    silentoutline = Utility.New("Circle"),
    silent = Utility.New("Circle"),
}

utility.connect(Players.PlayerAdded, function(plr) Utility.newEsp(plr) end)
utility.connect(Players.PlayerRemoving, function(plr) Utility.removeEsp(plr) end)

local desyncTick = tick()
utility.connect(RunService.Heartbeat, function() -- desync (PASTED!!!)
    if flags["desync"] and flags["desync key"] and  Utility.isAlive(LocalPlayer) then
        local Character = LocalPlayer.Character

        if not Character then
            return
        end

        local HumanoidRootPart = Character.HumanoidRootPart

        if not HumanoidRootPart then
            return
        end

        local OldCFrame = HumanoidRootPart.CFrame
        local NewCFrame = HumanoidRootPart.CFrame
        local OldVelocity = HumanoidRootPart.Velocity
        local NewVelocity = nil

        desync[1] = OldCFrame

        if flags["desync pos"] == "Static" then
            NewCFrame *= CFrame.new(Vector3.new(flags["desync x"], flags["desync y"], flags["desync z"]))
        elseif flags["desync pos"] == "Random" then
            NewCFrame *= CFrame.new(Vector3.new(math.random(-200, 200), math.random(-200, 200), math.random(-200, 200)))
        end

        if flags["desync turn"] == "Static" then
            NewCFrame *= CFrame.Angles(math.rad(flags["desync pitch"]), math.rad(flags["desync yaw"]), math.rad(flags["desync roll"]))
            desync[3] = Vector3.new(math.rad(flags["desync pitch"]), math.rad(flags["desync yaw"]), math.rad(flags["desync roll"]))
        elseif flags["desync turn"] == "Random" then
            NewCFrame *= CFrame.Angles(math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)))
        end
        
        if flags["desync velocity"] == "Static" then
            NewVelocity = Vector3.new(flags["desync velocity mult"], flags["desync velocity mult"], flags["desync velocity mult"])
        elseif flags["desync velocity"] == "Random" then
            NewVelocity = Vector3.new(math.random(-200, 200), math.random(-200, 200), math.random(-200, 200))
        elseif flags["desync velocity"] == "Fling" then
            NewVelocity = Vector3.new(1, 1, 1) * (2^16)
        end

        HumanoidRootPart.CFrame = NewCFrame

        if NewVelocity then
            HumanoidRootPart.Velocity = NewVelocity
        end

        desync[2] = NewCFrame
        
        RunService.RenderStepped:Wait()

        HumanoidRootPart.CFrame = OldCFrame
        HumanoidRootPart.Velocity = OldVelocity
    end
end)

utility.connect(RunService.RenderStepped, function(step) -- watermark
    fps = math.floor(1/step)

    if tick() - watermarkTick > flags["watermark tick"] / 50 then
        list:addon(Utility.TextTriggers(library.flags["watermark text"]))
        list:size(list:getsize() + Vector2.new(12, 12) +  Vector2.new(0, list:sectioncontent().AbsoluteContentSize ~= 0 and list:sectioncontent().AbsoluteContentSize + 2 or 0))

        watermarkTick = tick()
    end
end)

utility.connect(RunService.RenderStepped, function() -- visuals
    ScreenSize = Camera.ViewportSize
    MousePos = UserInputService:GetMouseLocation()
    Mouse = LocalPlayer:GetMouse()

    -- // Silent FOV
    if flags["silent use fov"] then
        if flags["silent fov type"] == "Static" then
            silentFov = flags["silent fov"] * 1.7
        elseif flags["silent fov type"] == "Dynamic" then
            silentFov = (flags["silent fov"] * 1.7) / (Camera.FieldOfView / 45)
        end
    end

    -- // Silent Pos
    if flags["silent hitscan pos"] == "Screen" then
        silentPos = ScreenSize / 2
    elseif flags["silent hitscan pos"] == "Cursor" then
        silentPos = MousePos
    end

    -- // Aimbot FOV
    if flags["aim use fov"] then
        if flags["aim fov type"] == "Static" then
            aimbotFov = flags["aim fov"] * 1.7
        elseif flags["aim fov type"] == "Dynamic" then
            aimbotFov = (flags["aim fov"] * 1.7) / (Camera.FieldOfView / 45)
        end
    end

    -- // Aimbot Pos
    if flags["aim hitscan pos"] == "Screen" then
        aimbotPos = ScreenSize / 2
    elseif flags["aim hitscan pos"] == "Cursor" then
        aimbotPos = MousePos
    end

    -- // Deadzone FOV
    if flags["aim fov type"] == "Static" then
        deadzoneFov = flags["aim dead amount"] * 1.7
    elseif flags["aim fov type"] == "Dynamic" then
        deadzoneFov = (flags["aim dead amount"] * 1.7) / (Camera.FieldOfView / 45)
    end

    -- // Aimbot FOV Circle
    SetRenderProperty(fovcircles.aim, "Visible", flags["fov aim"])
    SetRenderProperty(fovcircles.aimoutline, "Visible", flags["fov aim"])

    if GetRenderProperty(fovcircles.aim, "Visible") then
        -- // Aimbot Circle
        SetRenderProperty(fovcircles.aim, "Visible", true)
        SetRenderProperty(fovcircles.aim, "Color", flags["fov aim color"])
        SetRenderProperty(fovcircles.aim, "Transparency", flags["fov aim color"].a)
        SetRenderProperty(fovcircles.aim, "Thickness", flags["fov aim thick"])
        SetRenderProperty(fovcircles.aim, "NumSides", flags["fov aim sides"])
        SetRenderProperty(fovcircles.aim, "Radius", aimbotFov)
        SetRenderProperty(fovcircles.aim, "Position", aimbotPos)
        SetRenderProperty(fovcircles.aim, "Filled", flags["fov aim filled"])

        -- // Aimbot Outline Circle
        SetRenderProperty(fovcircles.aimoutline, "Visible", true)
        SetRenderProperty(fovcircles.aimoutline, "Color", flags["fov aim outline color"])
        SetRenderProperty(fovcircles.aimoutline, "Transparency", flags["fov aim outline color"].a)
        SetRenderProperty(fovcircles.aimoutline, "Thickness", flags["fov aim filled"] and 2 or flags["fov aim thick"] + 2)
        SetRenderProperty(fovcircles.aimoutline, "NumSides", flags["fov aim sides"])
        SetRenderProperty(fovcircles.aimoutline, "Radius", aimbotFov)
        SetRenderProperty(fovcircles.aimoutline, "Position", aimbotPos)
    end

    -- // Deadzone FOV Circle
    SetRenderProperty(fovcircles.dead, "Visible", flags["fov dead"])
    SetRenderProperty(fovcircles.deadoutline, "Visible", flags["fov dead"])

    if GetRenderProperty(fovcircles.dead, "Visible") then
        -- // Deadzone Circle
        SetRenderProperty(fovcircles.dead, "Visible", true)
        SetRenderProperty(fovcircles.dead, "Color", flags["fov dead color"])
        SetRenderProperty(fovcircles.dead, "Transparency", flags["fov dead color"].a)
        SetRenderProperty(fovcircles.dead, "Thickness", flags["fov dead thick"])
        SetRenderProperty(fovcircles.dead, "NumSides", flags["fov dead sides"])
        SetRenderProperty(fovcircles.dead, "Radius", deadzoneFov)
        SetRenderProperty(fovcircles.dead, "Position", aimbotPos)
        SetRenderProperty(fovcircles.dead, "Filled", flags["fov dead filled"])

        -- // Deadzone Outline Circle
        SetRenderProperty(fovcircles.deadoutline, "Visible", true)
        SetRenderProperty(fovcircles.deadoutline, "Color", flags["fov dead outline color"])
        SetRenderProperty(fovcircles.deadoutline, "Transparency", flags["fov dead outline color"].a)
        SetRenderProperty(fovcircles.deadoutline, "Thickness", flags["fov dead filled"] and 2 or flags["fov dead thick"] + 2)
        SetRenderProperty(fovcircles.deadoutline, "NumSides", flags["fov dead sides"])
        SetRenderProperty(fovcircles.deadoutline, "Radius", deadzoneFov)
        SetRenderProperty(fovcircles.deadoutline, "Position", aimbotPos)
    end

    -- // Silent Aim FOV Circle
    SetRenderProperty(fovcircles.silent, "Visible", flags["fov silent"])
    SetRenderProperty(fovcircles.silentoutline, "Visible", flags["fov silent"])

    if GetRenderProperty(fovcircles.silent, "Visible") then
        -- // Silent Aim Circle
        SetRenderProperty(fovcircles.silent, "Visible", true)
        SetRenderProperty(fovcircles.silent, "Color", flags["fov silent color"])
        SetRenderProperty(fovcircles.silent, "Transparency", flags["fov silent color"].a)
        SetRenderProperty(fovcircles.silent, "Thickness", flags["fov silent thick"])
        SetRenderProperty(fovcircles.silent, "NumSides", flags["fov silent sides"])
        SetRenderProperty(fovcircles.silent, "Radius", silentFov)
        SetRenderProperty(fovcircles.silent, "Position", silentPos)
        SetRenderProperty(fovcircles.silent, "Filled", flags["fov silent filled"])

        -- // Silent Aim Outline Circle
        SetRenderProperty(fovcircles.silentoutline, "Visible", true)
        SetRenderProperty(fovcircles.silentoutline, "Color", flags["fov silent outline color"])
        SetRenderProperty(fovcircles.silentoutline, "Transparency", flags["fov silent outline color"].a)
        SetRenderProperty(fovcircles.silentoutline, "Thickness", flags["fov silent filled"] and 2 or flags["fov silent thick"] + 2)
        SetRenderProperty(fovcircles.silentoutline, "NumSides", flags["fov silent sides"])
        SetRenderProperty(fovcircles.silentoutline, "Radius", silentFov)
        SetRenderProperty(fovcircles.silentoutline, "Position", silentPos)
    end

    -- // Time Changer
    if flags["time"] then
        Lighting.TimeOfDay = flags["time amount"]
    end

    -- // Ambient
    if flags["ambient"] then
        -- // Indoor Ambient
        Lighting.Ambient = flags["ambient inside"]

        -- // Outdoor Ambient
        Lighting.OutdoorAmbient = flags["ambient outside"]
    end

    -- // Colorshift
    if flags["shift"] then
        -- // Colorshift Top
        Lighting.ColorShift_Top = flags["shift top"]

        -- // Colorshift Bottom
        Lighting.ColorShift_Bottom = flags["shift bottom"]
    end

    -- // Fog
    if flags["fog"] then
        -- // Fog Color
        Lighting.FogColor = flags["fog color"]

        -- // Fog Start
        Lighting.FogStart = flags["fog start"]

        -- // Fog End
        Lighting.FogEnd = flags["fog end"]
    end

    -- // Brightness
    if flags["bright"] then
        Lighting.Brightness = flags["bright amount"] / 3.5
    end

    -- // Skybox Changer
    if flags["skybox"] then
        local Skybox = Lighting:FindFirstChildOfClass("Sky")

        if Skybox then
            local SkyboxType = Skyboxes[flags["skybox type"]]

            if SkyboxType then
                for _,v in pairs(SkyboxType) do
                    Skybox[_] = v
                end
            end
        else
            local SkyboxType = Skyboxes[flags["skybox type"]]

            if SkyboxType then
                for _,v in pairs(SkyboxType) do
                    skybox[_] = v
                end

                skybox.Parent = Lighting
            end
        end
    end
end)

utility.connect(RunService.RenderStepped, function() -- triggerbot
    if flags["tbot enabled"] and flags["tbot key"] and Utility.isAlive(LocalPlayer) then
        if triggerbotting then 
            return 
        end

        local Hitbox = Mouse.Target
        local Player = nil

        if not Hitbox then
            return
        end

        local Character = Hitbox.Name == "Handle" and Hitbox.Parent.Parent or Hitbox.Parent

        if not Character then
            return
        end

        Player = Players:GetPlayerFromCharacter(Character)

        if not Player then
            return
        end

        if flags["tbot team"] and Player.Team == LocalPlayer.Team then
            return
        end

        if not Utility.isAlive(Player) then
            return
        end

        local HumanoidRootPart = Character.HumanoidRootPart

        if not HumanoidRootPart then
            return
        end

        local Humanoid = Character.Humanoid
        local DistanceFromCharacter = (HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        
        if flags["tbot vis"] and not Utility.isVisible(HumanoidRootPart, Player) then
            return
        end

        if flags["tbot force"] and Character:FindFirstChildWhichIsA("ForceField") then
            return
        end

        if flags["tbot health"] and Humanoid.Health < flags["tbot health amount"] then
            return
        end

        if flags["tbot distance"] and DistanceFromCharacter > flags["tbot distance amount"] then
            return
        end

        if not Utility.getHitboxes(Hitbox, flags["tbot hitscan"]) then
            return
        end

        triggerbotting = true
        task.spawn(function()
            if flags["tbot delay"] / 1000 > 0.035 then
                wait(flags["tbot delay"] / 1000)
            end

            mouse1press()

            repeat
                RunService.RenderStepped:Wait()
            until not Mouse.Target or not Mouse.Target.Parent or Players:GetPlayerFromCharacter(Mouse.Target.Parent) ~= Player or Players:GetPlayerFromCharacter(Mouse.Target.Parent) == LocalPlayer
            
            mouse1release()

            triggerbotting = false
        end)
    end
end)

utility.connect(RunService.RenderStepped, function() -- aimbot
    aimbotPlayers = {}

    if flags["aim enabled"] and flags["aim key"] then
        for _,v in pairs(Players:GetPlayers()) do
            if Utility.isAlive(v) and Utility.isAlive(LocalPlayer) then
                if v == LocalPlayer then
                    continue
                end

                if flags["aim team"] and v.Team == LocalPlayer.Team then
                    continue
                end

                local Character = v.Character

                if not Character then
                    continue
                end

                local HumanoidRootPart = Utility.findRoot(v)

                if not HumanoidRootPart then
                    continue
                end

                local Humanoid = Character.Humanoid
                local Pos, OnScreen = Camera:WorldToViewportPoint(HumanoidRootPart.Position)

                if not (Pos and OnScreen) then
                    continue
                end

                local FovMagnitude = (Vector2.new(Pos.X, Pos.Y) - aimbotPos).Magnitude
                local DistanceFromCharacter = (HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

                if flags["aim use fov"] and aimbotFov < FovMagnitude then
                    continue
                end

                if flags["aim dead"] and deadzoneFov > FovMagnitude then
                    continue
                end

                if flags["aim vis"] and not Utility.isVisible(HumanoidRootPart, v) then
                    continue
                end

                if flags["aim force"] and Character:FindFirstChildWhichIsA("ForceField") then
                    continue
                end

                if flags["aim health"] and Humanoid.Health < flags["aim health amount"] then
                    continue
                end

                if flags["aim distance"] and DistanceFromCharacter > flags["aim distance amount"] then
                    continue
                end

                table.insert(aimbotPlayers, {v, FovMagnitude, DistanceFromCharacter, Humanoid.Health})
            end
        end

        if flags["aim priority"] == "Cursor" then
            table.sort(aimbotPlayers, function(a, b) 
                return a[2] < b[2] 
            end)
        elseif flags["aim priority"] == "Distance" then
            table.sort(aimbotPlayers, function(a, b) 
                return a[3] < b[3] 
            end)
        elseif flags["aim priority"] == "Health" then
            table.sort(aimbotPlayers, function(a, b) 
                return a[4] < b[4] 
            end)
        end

        if #aimbotPlayers ~= 0 then
            local v = aimbotPlayers[1][1]
            local hitbox = Utility.closestHitbox(v.Character, flags["aim hitscan"])[1]
            local Pos, OnScreen = Camera:WorldToViewportPoint(hitbox.Position)

            if Pos and OnScreen then
                local pos = hitbox.Position + (flags["aim velocity"] and Utility.Resolve(v) or Vector3.new(0, 0, 0)) + Vector3.new(0, flags["aim jump"] and flags["aim jump amount"] or 0, 0)
                Utility.MouseMove(pos, flags["aim hor"] + 1, flags["aim ver"] + 1)
            end
        end
    end
end)

utility.connect(RunService.RenderStepped, function() -- silent aim
    silentPlayers = {}

    if flags["silent enabled"] and flags["silent key"] then
        for _,v in pairs(Players:GetPlayers()) do
            if Utility.isAlive(v) and Utility.isAlive(LocalPlayer) then
                if v == LocalPlayer then
                    continue
                end

                if flags["silent team"] and v.Team == LocalPlayer.Team then
                    continue
                end

                local Character = v.Character

                if not Character then
                    continue
                end

                local HumanoidRootPart = Utility.findRoot(v)

                if not HumanoidRootPart then
                    continue
                end

                local Humanoid = Character.Humanoid
                local Pos, OnScreen = Camera:WorldToViewportPoint(HumanoidRootPart.Position)

                if not (Pos and OnScreen) then
                    continue
                end

                local FovMagnitude = (Vector2.new(Pos.X, Pos.Y) - silentPos).Magnitude
                local DistanceFromCharacter = (HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

                if flags["silent use fov"] and silentFov < FovMagnitude then
                    continue
                end

                if flags["silent vis"] and not Utility.isVisible(HumanoidRootPart, v) then
                    continue
                end

                if flags["silent force"] and Character:FindFirstChildWhichIsA("ForceField") then
                    continue
                end

                if flags["silent health"] and Humanoid.Health < flags["silent health amount"] then
                    continue
                end

                if flags["silent distance"] and DistanceFromCharacter > flags["silent distance amount"] then
                    continue
                end

                local hitbox = Utility.closestHitbox(Character, flags["silent hitscan"])[1]

                table.insert(silentPlayers, {v, FovMagnitude, DistanceFromCharacter, Humanoid.Health, hitbox})
            end
        end

        if flags["silent priority"] == "Cursor" then
            table.sort(silentPlayers, function(a, b) 
                return a[2] < b[2] 
            end)
        elseif flags["silent priority"] == "Distance" then
            table.sort(silentPlayers, function(a, b) 
                return a[3] < b[3] 
            end)
        elseif flags["silent priority"] == "Health" then
            table.sort(silentPlayers, function(a, b) 
                return a[4] < b[4] 
            end)
        end
    end
end)

utility.connect(RunService.RenderStepped, function() -- esp
    for _,v in pairs(Players:GetPlayers()) do
        local group = "enemy"

        if v == LocalPlayer then
            group = "self"
        elseif v.Team == LocalPlayer.Team then
            group = "team"
        end

        if Utility.espFlag(group, "enabled") and Utility.isAlive(v) and Utility.isAlive(LocalPlayer) then
            local Drawings = espDrawings[v]

            if not Drawings then
                continue
            end

            for _,v in pairs(Drawings) do
                SetRenderProperty(v, "Visible", false)
            end

            local Character = v.Character

            if not Character then
                continue
            end

            local HumanoidRootPart = Utility.findRoot(v)
            local Humanoid = Character.Humanoid

            if not HumanoidRootPart then
                continue
            end

            local DistanceFromCharacter = (HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

            if flags["esp distance"] and DistanceFromCharacter > flags["esp distance amount"] then
                continue
            end

            local Pos, OnScreen = Camera:WorldToViewportPoint(HumanoidRootPart.Position)

            if not Pos then
                continue
            end

            if OnScreen then
                local BoxOutline = Drawings.BoxOutline
                local Box = Drawings.Box

                local BoxFill = Drawings.BoxFill

                local Name = Drawings.Name

                local HealthBarOutline = Drawings.HealthBarOutline
                local HealthBar = Drawings.HealthBar
                local HealthGradient = Drawings.HealthGradient

                local HealthNumber = Drawings.HealthNumber

                local Weapon = Drawings.Weapon

                local Distance = Drawings.Distance

                local Protected = Drawings.Protected

                local Visible = Drawings.Visible

                local DisplayName = Drawings.DisplayName

                local BoxSize, BoxPos = Utility.BoundingBox(HumanoidRootPart)

                local y_bottom = 0
                local y_right = 0

                function createFlag(obj, text, side, flag)
                    if side:lower() == "bottom" then
                        SetRenderProperty(obj, "Visible", true)
                        SetRenderProperty(obj, "Color", Utility.espColor(v, Utility.espFlag(group, flag .. " color")))
                        SetRenderProperty(obj, "Transparency", Utility.espFlag(group, flag .. " color").a)
                        SetRenderProperty(obj, "Size", flags["esp size"])
                        SetRenderProperty(obj, "Font", Drawing.Fonts[flags["esp font"]])
                        SetRenderProperty(obj, "Text", Utility.GetCase(text, flags["esp case"]))
                        SetRenderProperty(obj, "Position", BoxPos + Vector2.new(BoxSize.X / 2, BoxSize.Y + y_bottom))

                        y_bottom += GetRenderProperty(Name, "TextBounds").Y + 1
                    elseif side:lower() == "right" then
                        SetRenderProperty(obj, "Visible", true)
                        SetRenderProperty(obj, "Center", false)
                        SetRenderProperty(obj, "Color", Utility.espColor(v, Utility.espFlag(group, flag .. " color")))
                        SetRenderProperty(obj, "Transparency", Utility.espFlag(group, flag .. " color").a)
                        SetRenderProperty(obj, "Size", flags["esp flag size"])
                        SetRenderProperty(obj, "Font", Drawing.Fonts[flags["esp flag font"]])
                        SetRenderProperty(obj, "Text", Utility.GetCase(text, flags["esp flag case"]))
                        SetRenderProperty(obj, "Position", BoxPos + Vector2.new(BoxSize.X + 5, y_right))

                        y_right += GetRenderProperty(Name, "TextBounds").Y + 1
                    end
                end

                -- // Box ESP
                if Utility.espFlag(group, "box") then
                    -- // Box
                    SetRenderProperty(Box, "Visible", true)
                    SetRenderProperty(Box, "Color", Utility.espColor(v, Utility.espFlag(group, "box color")))
                    SetRenderProperty(Box, "Transparency", Utility.espFlag(group, "box color").a)
                    SetRenderProperty(Box, "Size", BoxSize)
                    SetRenderProperty(Box, "Position", BoxPos)

                    -- // Box Outline
                    SetRenderProperty(BoxOutline, "Visible", true)
                    SetRenderProperty(BoxOutline, "Transparency", Utility.espFlag(group, "box color").a - 0.4)
                    SetRenderProperty(BoxOutline, "Size", BoxSize)
                    SetRenderProperty(BoxOutline, "Position", BoxPos)
                end

                -- // Box Fill ESP
                if Utility.espFlag(group, "box fill") then
                    -- // Box Fill
                    SetRenderProperty(BoxFill, "Visible", true)
                    SetRenderProperty(BoxFill, "Color", Utility.espColor(v, Utility.espFlag(group, "box fill color")))
                    SetRenderProperty(BoxFill, "Transparency", Utility.espFlag(group, "box fill color").a)
                    SetRenderProperty(BoxFill, "Size", BoxSize - Vector2.new(4, 4))
                    SetRenderProperty(BoxFill, "Position", BoxPos + Vector2.new(2, 2))
                    SetRenderProperty(BoxFill, "Filled", true)
                end

                -- // Name ESP
                if Utility.espFlag(group, "name") then
                    -- // Name
                    SetRenderProperty(Name, "Visible", true)
                    SetRenderProperty(Name, "Color", Utility.espColor(v, Utility.espFlag(group, "name color")))
                    SetRenderProperty(Name, "Transparency", Utility.espFlag(group, "name color").a)
                    SetRenderProperty(Name, "Size", flags["esp size"])
                    SetRenderProperty(Name, "Font", Drawing.Fonts[flags["esp font"]])
                    SetRenderProperty(Name, "Text", Utility.GetCase(v.Name, flags["esp case"]))
                    SetRenderProperty(Name, "Position", BoxPos + Vector2.new(BoxSize.X / 2, -GetRenderProperty(Name, "TextBounds").Y - 3))
                end

                -- // Health Bar ESP
                if Utility.espFlag(group, "health bar") then
                    local posY = math.max(BoxPos.Y, (BoxPos.Y + BoxSize.Y) - GetRenderProperty(HealthBar, "Size").Y)

                    -- // Health Bar
                    SetRenderProperty(HealthBar, "Visible", true)
                    SetRenderProperty(HealthBar, "Color", Utility.espColor(v, Utility.espFlag(group, "health bar color"):Lerp(Utility.espFlag(group, "health bar low color"), Humanoid.Health / Humanoid.MaxHealth)))
                    SetRenderProperty(HealthBar, "Transparency", Utility.espFlag(group, "health bar color").a)
                    SetRenderProperty(HealthBar, "Size", Vector2.new(2, (BoxSize.Y) * math.clamp((Humanoid.Health / Humanoid.MaxHealth), 0, 1)))
                    SetRenderProperty(HealthBar, "Position", Vector2.new(BoxPos.X - 6, posY))
                    SetRenderProperty(HealthBar, "Filled", true)

                    -- // Health Bar Outline
                    SetRenderProperty(HealthBarOutline, "Visible", true)
                    SetRenderProperty(HealthBarOutline, "Transparency", Utility.espFlag(group, "health bar color").a - 0.4)
                    SetRenderProperty(HealthBarOutline, "Size", Vector2.new(4, BoxSize.Y + 2))
                    SetRenderProperty(HealthBarOutline, "Position", Vector2.new(BoxPos.X - 7, BoxPos.Y - 1))
                    SetRenderProperty(HealthBarOutline, "Filled", true)

                    -- // Health Bar Gradient
                    SetRenderProperty(HealthGradient, "Visible", true)
                    SetRenderProperty(HealthGradient, "Transparency", Utility.espFlag(group, "health bar color").a)
                    SetRenderProperty(HealthGradient, "Size", Vector2.new(2, (BoxSize.Y) * (Humanoid.Health / Humanoid.MaxHealth)))
                    SetRenderProperty(HealthGradient, "Position", Vector2.new(BoxPos.X - 6, posY))
                end

                -- // Health Number ESP
                if Utility.espFlag(group, "health number") and Humanoid.Health <= flags["esp hp"] then
                    -- // Health Number
                    SetRenderProperty(HealthNumber, "Visible", true)
                    SetRenderProperty(HealthNumber, "Color", Utility.espColor(v, Utility.espFlag(group, "health number color")))
                    SetRenderProperty(HealthNumber, "Transparency", Utility.espFlag(group, "health number color").a)
                    SetRenderProperty(HealthNumber, "Size", flags["esp flag size"])
                    SetRenderProperty(HealthNumber, "Font", Drawing.Fonts[flags["esp flag font"]])
                    SetRenderProperty(HealthNumber, "Text", tostring(math.clamp(math.round(Humanoid.Health), 0, 100)))
                    SetRenderProperty(HealthNumber, "Position", BoxPos + Vector2.new(BoxSize.X / 2, -GetRenderProperty(Name, "TextBounds").Y - 3))

                    local TextBounds = GetRenderProperty(HealthNumber, "TextBounds")

                    if Utility.espFlag(group, "health bar") then
                        SetRenderProperty(HealthNumber, "Position", Vector2.new(BoxPos.X - 6, ((BoxPos.Y + BoxSize.Y) - GetRenderProperty(HealthBar, "Size").Y) - TextBounds.Y / 2))
                    else
                        SetRenderProperty(HealthNumber, "Position", Vector2.new(BoxPos.X - TextBounds.X - 3, (BoxPos.Y - 3)))
                    end 
                end

                -- // Weapon ESP
                if Utility.espFlag(group, "weapon") and Character:FindFirstChildWhichIsA("Tool") then
                    createFlag(Weapon, Character:FindFirstChildWhichIsA("Tool").Name, "Bottom", "weapon")
                end

                -- // Distance ESP
                if Utility.espFlag(group, "distance") then
                    createFlag(Distance, math.floor(DistanceFromCharacter) .. " st", "Bottom", "distance")
                end

                -- // Protected ESP
                if Utility.espFlag(group, "protection") and Character:FindFirstChildWhichIsA("ForceField") then
                    createFlag(Protected, "Protection", "Right", "protection")
                end

                -- // Display Name ESP
                if Utility.espFlag(group, "display") and v.DisplayName ~= v.Name then
                    createFlag(DisplayName, v.DisplayName, "Right", "display")
                end

                -- // Visible ESP
                if Utility.espFlag(group, "visible") and Utility.isVisible(HumanoidRootPart, v) then
                    createFlag(Visible, "Visible", "Right", "visible")
                end

                -- // Desync ESP
                if Utility.espFlag(group, "desync") and flags["desync"] and flags["desync key"] and desync[2] then
                    dummy.HumanoidRootPart.Velocity = Vector3.zero
                    dummy:SetPrimaryPartCFrame(desync[2])

                    for _,a in pairs(dummy:GetChildren()) do
                        a.Material = Utility.espFlag(group, "desync material")
                        a.Color = Utility.espFlag(group, "desync color")
                        a.Transparency = 1 - Utility.espFlag(group, "desync color").a
                        a.CanCollide = false
                        a.Anchored = true
                    end
                else
                    if group == "self" then
                        dummy:SetPrimaryPartCFrame(CFrame.new())
                    end
                end

                -- // Chams ESP
                for _,g in pairs(Character:GetChildren()) do
                    if Utility.espFlag(group, "chams") and (g:IsA("BasePart") or g:IsA("MeshPart") or g:IsA("Part")) and g.Transparency ~= 1 then
                        if not (g:FindFirstChild("Cham") and g:FindFirstChild("Glow")) then
                            local Cham = Instance.new("BoxHandleAdornment", g)
                            local Glow = Instance.new("BoxHandleAdornment", g)

                            Cham.Name = "Cham"
                            Glow.Name = "Glow"
                        end

                        g.Cham.Adornee = g
                        g.Cham.Transparency = 1 - Utility.espFlag(group, "chams color").a
                        g.Cham.Color3 = Utility.espColor(v, Utility.espFlag(group, "chams color"))
                        g.Cham.Size = g.Size * 1.01
                        g.Cham.ZIndex = 1
                        g.Cham.AlwaysOnTop = true
                        
                        g.Glow.Adornee = g
                        g.Glow.Transparency = 1 - Utility.espFlag(group, "chams outline color").a
                        g.Glow.Color3 = Utility.espColor(v, Utility.espFlag(group, "chams outline color"))
                        g.Glow.Size = g.Size * 1.1
                        g.Glow.ZIndex = -1
                        g.Glow.AlwaysOnTop = false
                    else
                        if g:FindFirstChild("Cham") and g:FindFirstChild("Glow") then
                            g.Cham:Destroy()
                            g.Glow:Destroy()
                        end
                    end
                end
            elseif group ~= "self" then
                local PosT = Camera.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                local Angle = math.atan2(PosT.Z, PosT.X)
                local Direction = Vector2.new(math.cos(Angle), math.sin(Angle))
                local Pos = (Direction * Utility.espFlag(group, "off pos") * 1.5) + ScreenSize / 2

                local OffOutline = Drawings.OffOutline
                local Off = Drawings.Off

                -- // Out Of View Arrow ESP
                if Utility.espFlag(group, "off") then
                    -- // Out Of View Arrow
                    SetRenderProperty(Off, "Visible", true)
                    SetRenderProperty(Off, "Color", Utility.espColor(v, Utility.espFlag(group, "off color")))
                    SetRenderProperty(Off, "Transparency", Utility.espFlag(group, "off color").a)
                    SetRenderProperty(Off, "PointA", Pos)
                    SetRenderProperty(Off, "PointB", Pos - Utility.RotateVector2(Direction, math.rad(35)) * Utility.espFlag(group, "off size"))
                    SetRenderProperty(Off, "PointC", Pos - Utility.RotateVector2(Direction, -math.rad(35)) * Utility.espFlag(group, "off size"))

                    -- // Out Of View Arrow Outline
                    SetRenderProperty(OffOutline, "Visible", true)
                    SetRenderProperty(OffOutline, "Color", Utility.espColor(v, Utility.espFlag(group, "off outline color")))
                    SetRenderProperty(OffOutline, "Transparency", Utility.espFlag(group, "off outline color").a)
                    SetRenderProperty(OffOutline, "PointA", Pos)
                    SetRenderProperty(OffOutline, "PointB", Pos - Utility.RotateVector2(Direction, math.rad(35)) * Utility.espFlag(group, "off size"))
                    SetRenderProperty(OffOutline, "PointC", Pos - Utility.RotateVector2(Direction, -math.rad(35)) * Utility.espFlag(group, "off size"))
                    SetRenderProperty(OffOutline, "Filled", false)
                end
            end
        else
            local Drawings = espDrawings[v]

            if not Drawings then
                continue
            end

            for _,v in pairs(Drawings) do
                SetRenderProperty(v, "Visible", false)
            end

            if group == "self" then
                dummy:SetPrimaryPartCFrame(CFrame.new())
            end
        end
    end
end)

utility.connect(RunService.RenderStepped, function() -- misc
    if Utility.isAlive(LocalPlayer) then
        local Character = LocalPlayer.Character

        if not Character then
            return
        end

        local HumanoidRootPart = Utility.findRoot(LocalPlayer)

        if not HumanoidRootPart then
            return
        end

        local Humanoid = Character.Humanoid

        -- // Speed
        if flags["speed"] and flags["speed key"] then -- retarded speed lmao
            local travel = Vector3.new()
            local looking = Camera.CFrame.lookVector

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

            if flags["speed auto"] then
                Humanoid.Jump = true
            end

            local newDir = Vector3.new(travel.x * flags["speed amount"], HumanoidRootPart.Velocity.y, travel.Z * flags["speed amount"])

            if travel.Unit.x == travel.Unit.x then
                HumanoidRootPart.Velocity = newDir
            end
        end

        -- // Fly
        if flags["fly"] and flags["fly key"] then -- nice fly
            local travel = Vector3.new()
            local looking = Camera.CFrame.lookVector

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                travel += looking
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                travel -= looking
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                travel += Vector3.new(-looking.Z, 0, looking.x)
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                travel += Vector3.new(looking.Z, 0, -looking.x)
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                travel += Vector3.new(0, 1, 0)
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                travel -= Vector3.new(0, 1, 0)
            end

            if travel.Unit.x == travel.Unit.x then
                HumanoidRootPart.Anchored = false
                HumanoidRootPart.Velocity = travel.Unit * flags["fly amount"]
            else
                HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                HumanoidRootPart.Anchored = true
            end
        else
            HumanoidRootPart.Anchored = false
        end

        -- // Gravity
        if flags["gravity"] and flags["gravity key"] then
            workspace.Gravity = flags["gravity factor"]
        end

        -- // Jump
        if flags["jump"] and flags["jump key"] then
            Humanoid.JumpPower = flags["jump amount"]
        end

        -- // Click Teleport
        if flags["click"] and flags["click key"] and (tick() - clickTick) > 0.5 then
            local Pos = Mouse.Hit.p
            HumanoidRootPart.CFrame = CFrame.new(Pos)
            clickTick = tick()
        end

        -- // Noclip Parts
        for _, part in pairs(Character:GetChildren()) do
            if part:IsA("BasePart") and part.CanCollide and not table.find(NoclipParts, part) then
                table.insert(NoclipParts, part)
            end
        end

        -- // Noclip
        for _, part in pairs(NoclipParts) do
            if part.CanCollide == (not ((flags["fly"] and flags["fly key"] and flags["fly type"] == "Noclip") or (flags["noclip"] and flags["noclip key"]))) then continue end
            part.CanCollide = not ((flags["fly"] and flags["fly key"] and flags["fly type"] == "Noclip") or (flags["noclip"] and flags["noclip key"]))
        end
    end
end)

local lagTick = 0
task.spawn(function() -- fake lag
    while wait(1/16) do
        -- // Fakelag
        if flags["fakelag"] and flags["fakelag key"] then
            lagTick = math.clamp(lagTick + 1, 0, (flags["fakelag delay"] * 4) / 1000)
            if lagTick == (flags["fakelag delay"] * 4) / 1000 then
                if LocalPlayer.Character:FindFirstChild("Fakelag") then
                    LocalPlayer.Character.Fakelag:ClearAllChildren()
                else
                    local folder = Instance.new("Folder", LocalPlayer.Character)
                    folder.Name = "Fakelag"
                end

                if flags["fake lag visualize"] then
                    LocalPlayer.Character.Archivable = true
                    local Clone = LocalPlayer.Character:Clone()

                    for _,v in pairs(Clone:GetDescendants()) do
                        if v.Name == "HumanoidRootPart" or v:IsA("Humanoid") or v:IsA("LocalScript") or v:IsA("Script") or v:IsA("Decal") then
                            v:Destroy()
                        elseif v:IsA("BasePart") or v:IsA("Meshpart") or v:IsA("Part") then
                            if v.Transparency == 1 then
                                v:Destroy()
                            else
                                v.CanCollide = false  
                                v.Anchored = true
                                v.Material = "ForceField"
                                v.Color = flags["fake lag vis"]
                                v.Transparency = 1 - flags["fake lag vis"].a
                                v.Size = v.Size + Vector3.new(0.03, 0.03, 0.03)
                            end
                        end
                    end

                    Clone.Parent = LocalPlayer.Character.Fakelag
                end

                --setfflag("S2PhysicsSenderRate", math.pi * 5 ^ 90)
                --setfflag("PhysicsSenderMaxBandwidthBps", math.pi * 5 ^ 90)
                game.NetworkClient:SetOutgoingKBPSLimit(9e9)
                --sethiddenproperty(LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", false)
                lagTick = 0
            else    
                game.NetworkClient:SetOutgoingKBPSLimit(1)
                --sethiddenproperty(LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", true)
            end
        else
            game.NetworkClient:SetOutgoingKBPSLimit(9e9)

            if LocalPlayer.Character:FindFirstChild("Fakelag") then
                LocalPlayer.Character.Fakelag:ClearAllChildren()
            else
                local folder = Instance.new("Folder", LocalPlayer.Character)
                folder.Name = "Fakelag"
            end

            --sethiddenproperty(LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", false)
        end
    end
end)

local old; old = hookmetamethod(game, "__newindex", function(self, index, value)
    if checkcaller() then
        return old(self, index, value)
    end

    if self == Camera and index == "CFrame" and flags["third person"] and flags["third person key"] then
        value *= CFrame.new(Vector3.new(flags["third person x"], flags["third person y"], flags["third person z"]))
    end

    return old(self, index, value)
end)

local old; old = hookmetamethod(game, "__namecall", newcclosure(function(...) -- silent aim
    local args = {...}
    local self = args[1]
    local method = getnamecallmethod()

    if method == "FindPartOnRayWithIgnoreList" and flags["silent method"] == "FindPartOnRayWithIL" and math.random(1, 100) <= flags["silent hit"] then
        if #silentPlayers ~= 0 then
            local origin = args[2].Origin
            local direction = Utility.Direction(origin, silentPlayers[1][5].Position)
            args[2] = Ray.new(origin, direction)
        end
    elseif method == "FindPartOnRayWithWhiteList" and flags["silent method"] == "FindPartOnRayWithWL" and math.random(1, 100) <= flags["silent hit"] then
        if #silentPlayers ~= 0 then
            local origin = args[2].Origin
            local direction = Utility.Direction(origin, silentPlayers[1][5].Position)
            args[2] = Ray.new(origin, direction)
        end
    elseif (method == "FindPartOnRay" or method == "findPartOnRay") and flags["silent method"]:lower() == method:lower() and math.random(1, 100) <= flags["silent hit"] then
        if #silentPlayers ~= 0 then
            local origin = args[2].Origin
            local direction = Utility.Direction(origin, silentPlayers[1][5].Position)
            args[2] = Ray.new(origin, direction)
        end
    elseif method == "Raycast" and flags["silent method"] == method and math.random(1, 100) <= flags["silent hit"] then
        if #silentPlayers ~= 0 then            
            local origin = args[2]
            args[3] = Utility.Direction(origin, silentPlayers[1][5].Position)
        end
    end

    return old(unpack(args))
end))

task.spawn(function() -- chat spam
    while wait(flags["chat spam delay"]) do
        if flags["chat spam"] then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Utility.ChatSpam(flags["chat spam type"], flags["chat spam repeat"], flags["chat spam emojis"], flags["chat spam symbols"]), "All")
        end
    end
end)

RunService:BindToRenderStep('cool desync', Enum.RenderPriority.Camera.Value + 1, function()
    if flags["desync"] and flags["desync key"] and  Utility.isAlive(LocalPlayer) and desync[1] and desync[2] then
        Camera.CFrame = Camera.CFrame - Utility.toVector3(desync[2] - Utility.toVector3(desync[1]))
    end
end)

library.notify(("Welcome to gameshark, %s. Loaded in (%sms)."):format("office", math.floor((tick() - loadtick) * 1000)), 5)
library.notify("Cheat is currently being re-wrote, so report any bugs to office.", 15)

settings:show()
library:setpos()