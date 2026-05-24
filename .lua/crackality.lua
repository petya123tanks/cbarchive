for _, line in ipairs({
" ██████╗██████╗  █████╗  ██████╗██╗  ██╗ █████╗ ██╗     ██╗████████╗██╗   ██╗",
"██╔════╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██║     ██║╚══██╔══╝╚██╗ ██╔╝",
"██║     ██████╔╝███████║██║     █████╔╝ ███████║██║     ██║   ██║    ╚████╔╝ ",
"██║     ██╔══██╗██╔══██║██║     ██╔═██╗ ██╔══██║██║     ██║   ██║     ╚██╔╝  ",
"╚██████╗██║  ██║██║  ██║╚██████╗██║  ██╗██║  ██║███████╗██║   ██║      ██║   ",
" ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝   ╚═╝      ╚═╝   ",
"                                                                             "
}) do print(line) end
--
(function()
-- [[ Drawing Library ]] --

local textService = cloneref(game:GetService("TextService"));

local drawing = {
      Fonts = {
            UI = 0,
            System = 1,
            Plex = 2,
            Monospace = 3
      }
};

local renv                    = getrenv();
local genv                    = getgenv();
local pi                      = renv.math.pi;
local huge                    = renv.math.huge;
local _assert                 = clonefunction(renv.assert);
local _color3new              = clonefunction(renv.Color3.new);
local _instancenew            = clonefunction(renv.Instance.new);
local _mathatan2              = clonefunction(renv.math.atan2);
local _mathclamp              = clonefunction(renv.math.clamp);
local _mathmax                = clonefunction(renv.math.max);
local _setmetatable           = clonefunction(renv.setmetatable);
local _stringformat           = clonefunction(renv.string.format);
local _typeof                 = clonefunction(renv.typeof);
local _tostring               = clonefunction(renv.tostring);
local _type                   = clonefunction(renv.type);
local _taskspawn              = clonefunction(renv.task.spawn);
local _udimnew                = clonefunction(renv.UDim.new);
local _udim2fromoffset        = clonefunction(renv.UDim2.fromOffset);
local _udim2new               = clonefunction(renv.UDim2.new);
local _vector2new             = clonefunction(renv.Vector2.new);
local _destroy                = clonefunction(game.Destroy);
local _gettextboundsasync     = clonefunction(textService.GetTextBoundsAsync);
local _httpget                = clonefunction(game.HttpGet);
local _writecustomasset       = writecustomasset and clonefunction(writecustomasset);
local _protectinstance        = protectinstance and clonefunction(protectinstance);
local _eventfire              = clonefunction(_instancenew('BindableEvent').Fire);

local _metatableclone         = {};
for index, value in getrawmetatable(game) do
      if (_type(value) == 'function') then
            _metatableclone[index] = clonefunction(value);
      end;
end;

local fetchedvariable;
local fetchvariable           = _instancenew('BindableEvent');
local runfunction             = _instancenew('BindableEvent');

fetchvariable.Event:Connect(function(...)
      fetchedvariable = ...;
end);
runfunction.Event:Connect(function(f, ...)
      f(...);
end);

local _instancenew2 = function(classname: string, parent: Instance)
      local instance = _instancenew(classname);
      local instanceObject = setmetatable({}, {
            __index = function(self, index)
                  if (index == 'instance') then
                        return instance;
                  end;
                  _eventfire(runfunction, function()
                        _eventfire(fetchvariable, _metatableclone.__index(instance, index));
                  end);
                  return fetchedvariable;
            end;
            __newindex = function(self, index, new)
                  if (_tostring(new) == 'CustomInstance') then
                        new = new.instance;
                  end;
                  _eventfire(runfunction, function()
                        _metatableclone.__newindex(instance, index, new);
                  end);
            end;
            __tostring = function()
                  return 'CustomInstance';
            end;
      });
      return instanceObject;
end;




local create = function(className, properties, children, normal)
      local inst = normal and _instancenew(className) or _instancenew2(className);
      for i, v in properties do
            if i ~= "Parent" then
                  inst[i] = v;
            end
      end
      if children then
            for i, v in children do
                  v.Parent = inst;
            end
      end
      -- if _protectinstance then
      --       _protectinstance(inst);
      -- end
      inst.Parent = properties.Parent;
      return inst;
end

do -- This may look completely useless, but it allows TextBounds to update without yielding and therefore breaking the metamethods.
      local fonts = {
            Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
            Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
            Font.new("rbxasset://fonts/families/Roboto.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
            Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
      };

      for i, v in fonts do
            game:GetService("TextService"):GetTextBoundsAsync(create("GetTextBoundsParams", {
                  Text = "Hi",
                  Size = 12,
                  Font = v,
                  Width = huge
            }, nil, true));
      end
end

do
      local drawingDirectory = create("ScreenGui", {
            DisplayOrder = 15,
            IgnoreGuiInset = true,
            Name = "drawingDirectory",
            Parent = gethui(),
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
      });

      local function updatePosition(frame, from, to, thickness)
            local central = (from + to) / 2;
            local offset = to - from;
            frame.Position = _udim2fromoffset(central.X, central.Y);
            frame.Rotation = _mathatan2(offset.Y, offset.X) * 180 / pi;
            frame.Size = _udim2fromoffset(offset.Magnitude, thickness);
      end

      local itemCounter = 0;
      local cache = {};

      local classes = {};
      -- line class
      do
            local line = {};

            function line.new()
                  itemCounter = itemCounter + 1;
                  local id = itemCounter;

                  local newLine = _setmetatable({
                        _id = id,
                        __OBJECT_EXISTS = true,
                        _properties = {
                              Color = _color3new(),
                              From = _vector2new(),
                              Thickness = 1,
                              To = _vector2new(),
                              Transparency = 1,
                              Visible = false,
                              ZIndex = 0
                        },
                        _frame = create("Frame", {
                              Name = id,
                              AnchorPoint = _vector2new(0.5, 0.5),
                              BackgroundColor3 = _color3new(),
                              BorderSizePixel = 0,
                              Parent = drawingDirectory,
                              Position = _udim2new(),
                              Size = _udim2new(),
                              Visible = false,
                              ZIndex = 0
                        })
                  }, line);

                  cache[id] = newLine;
                  return newLine;
            end

            function line:__index(k)
                  local prop = self._properties[k];
                  if prop ~= nil then
                        return prop;
                  end
                  return line[k];
            end

            function line:__newindex(k, v)
                  if self.__OBJECT_EXISTS == true then
                        local props = self._properties;

                        if props[k] == nil or props[k] == v or typeof(props[k]) ~= typeof(v) then
                              return;
                        end

                        props[k] = v;

                        if k == "Color" then
                              self._frame.BackgroundColor3 = v;
                        elseif k == "From" then
                              self:_updatePosition();
                        elseif k == "Thickness" then
                              self._frame.Size = _udim2fromoffset(self._frame.AbsoluteSize.X, _mathmax(v, 1));
                        elseif k == "To" then
                              self:_updatePosition();
                        elseif k == "Transparency" then
                              self._frame.BackgroundTransparency = _mathclamp(1 - v, 0, 1);
                        elseif k == "Visible" then
                              self._frame.Visible = v;
                        elseif k == "ZIndex" then
                              self._frame.ZIndex = v;
                        end
                  end
            end

            function line:__iter()
                  return next, self._properties;
            end

            function line:__tostring()
                  return "Drawing";
            end

            function line:Destroy()
                  cache[self._id] = nil;
                  self.__OBJECT_EXISTS = false;
                  _eventfire(runfunction, _destroy, self._frame.instance);
                  -- _destroy(self._frame);
            end

            function line:_updatePosition()
                  local props = self._properties;
                  updatePosition(self._frame, props.From, props.To, props.Thickness);
            end

            line.Remove = line.Destroy;
            classes.Line = line;
      end

      -- circle class
      do
            local circle = {};

            function circle.new()
                  itemCounter = itemCounter + 1;
                  local id = itemCounter;

                  local newCircle = _setmetatable({
                              _id = id,
                              __OBJECT_EXISTS = true,
                              _properties = {
                              Color = _color3new(),
                              Filled = false,
                              NumSides = 0,
                              Position = _vector2new(),
                              Radius = 0,
                              Thickness = 1,
                              Transparency = 1,
                              Visible = false,
                              ZIndex = 0
                        },
                        _frame = create("Frame", {
                              Name = id,
                              AnchorPoint = _vector2new(0.5, 0.5),
                              BackgroundColor3 = _color3new(),
                              BackgroundTransparency = 1,
                              BorderSizePixel = 0,
                              Parent = drawingDirectory,
                              Position = _udim2new(),
                              Size = _udim2new(),
                              Visible = false,
                              ZIndex = 0
                        }, {
                              create("UICorner", {
                                    Name = "_corner",
                                    CornerRadius = _udimnew(1, 0)
                              }),
                              create("UIStroke", {
                                    Name = "_stroke",
                                    Color = _color3new(),
                                    Thickness = 1
                              })
                        })
                  }, circle);

                  cache[id] = newCircle;
                  return newCircle;
            end

            function circle:__index(k)
                  local prop = self._properties[k];
                  if prop ~= nil then
                        return prop;
                  end
                  return circle[k];
            end

            function circle:__newindex(k, v)
                  if self.__OBJECT_EXISTS == true then
                        local props = self._properties;
                        if props[k] == nil or props[k] == v or typeof(props[k]) ~= typeof(v) then
                              return;
                        end
                        props[k] = v;
                        if k == "Color" then
                              self._frame.BackgroundColor3 = v;
                              self._frame._stroke.Color = v;
                        elseif k == "Filled" then
                              self._frame.BackgroundTransparency = v and 1 - props.Transparency or 1;
                        elseif k == "Position" then
                              self._frame.Position = _udim2fromoffset(v.X, v.Y);
                        elseif k == "Radius" then
                              self:_updateRadius();
                        elseif k == "Thickness" then
                              self._frame._stroke.Thickness = _mathmax(v, 1);
                              self:_updateRadius();
                        elseif k == "Transparency" then
                              self._frame._stroke.Transparency = 1 - v;
                              if props.Filled then
                                    self._frame.BackgroundTransparency = 1 - v;
                              end
                        elseif k == "Visible" then
                              self._frame.Visible = v;
                        elseif k == "ZIndex" then
                              self._frame.ZIndex = v;
                        end
                  end
            end

            function circle:__iter()
                  return next, self._properties;
            end

            function circle:__tostring()
                  return "Drawing";
            end

            function circle:Destroy()
                  cache[self._id] = nil;
                  self.__OBJECT_EXISTS = false;
                  _eventfire(runfunction, _destroy, self._frame.instance);
                  -- _destroy(self._frame);
            end

            function circle:_updateRadius()
                  local props = self._properties;
                  local diameter = (props.Radius * 2) - (props.Thickness * 2);
                  self._frame.Size = _udim2fromoffset(diameter, diameter);
            end

            circle.Remove = circle.Destroy;
            classes.Circle = circle;
      end

      -- text class
      do
            local enumToFont = {
                  [drawing.Fonts.UI] = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                  [drawing.Fonts.System] = Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                  [drawing.Fonts.Plex] = Font.new("rbxasset://fonts/families/Roboto.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                  [drawing.Fonts.Monospace] = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            };

            local text = {};

            function text.new()
                  itemCounter = itemCounter + 1;
                  local id = itemCounter;

                  local newText = _setmetatable({
                        _id = id,
                        __OBJECT_EXISTS = true,
                        _properties = {
                                    Center = false,
                                    Color = _color3new(),
                                    Font = 0,
                                    Outline = false,
                                    OutlineColor = _color3new(),
                                    Position = _vector2new(),
                                    Size = 12,
                                    Text = "",
                                    TextBounds = _vector2new(),
                                    Transparency = 1,
                                    Visible = false,
                                    ZIndex = 0
                        },
                        _frame = create("TextLabel", {
                                    Name = id,
                                    BackgroundTransparency = 1,
                                    FontFace = enumToFont[0],
                        Parent = drawingDirectory,
                        Position = _udim2new(),
                        Size = _udim2new(),
                                    Text = "",
                                    TextColor3 = _color3new(),
                                    TextSize = 12,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    TextYAlignment = Enum.TextYAlignment.Top,
                        Visible = false,
                        ZIndex = 0
                              }, {
                                    create("UIStroke", {
                                          Name = "_stroke",
                                          Color = _color3new(),
                                          Enabled = false,
                                          Thickness = 1
                                    })
                              })
                  }, text);

                  cache[id] = newText;
                  return newText;
            end

            function text:__index(k)
                  local prop = self._properties[k];
                  if prop ~= nil then
                        return prop;
                  end
                  return text[k];
            end

            function text:__newindex(k, v)
                  if self.__OBJECT_EXISTS == true then
                        local props = self._properties;
                        if k == "TextBounds" or props[k] == nil or props[k] == v or typeof(props[k]) ~= typeof(v) then
                              return;
                        end
                        props[k] = v;
                        if k == "Center" then
                              self._frame.TextXAlignment = v and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left;
                        elseif k == "Color" then
                              self._frame.TextColor3 = v;
                        elseif k == "Font" then
                              self._frame.FontFace = enumToFont[v];
                              self:_updateTextBounds();
                        elseif k == "Outline" then
                              self._frame._stroke.Enabled = v;
                        elseif k == "OutlineColor" then
                              self._frame._stroke.Color = v;
                        elseif k == "Position" then
                              self._frame.Position = _udim2fromoffset(v.X, v.Y);
                        elseif k == "Size" then
                              self._frame.TextSize = v;
                              self:_updateTextBounds();
                        elseif k == "Text" then
                              self._frame.Text = v;
                              self:_updateTextBounds();
                        elseif k == "Transparency" then
                              self._frame.TextTransparency = 1 - v;
                              self._frame._stroke.Transparency = 1 - v;
                        elseif k == "Visible" then
                              self._frame.Visible = v;
                        elseif k == "ZIndex" then
                              self._frame.ZIndex = v;
                        end
                  end
            end

            function text:__iter()
                  return next, self._properties;
            end

            function text:__tostring()
                  return "Drawing";
            end

            function text:Destroy()
                  cache[self._id] = nil;
                  self.__OBJECT_EXISTS = false;
                  _eventfire(runfunction, _destroy, self._frame.instance);
                  -- _destroy(self._frame);
            end

            function text:_updateTextBounds()
                  local props = self._properties;
                  props.TextBounds = _gettextboundsasync(textService, create("GetTextBoundsParams", {
                        Text = props.Text,
                        Size = props.Size,
                        Font = enumToFont[props.Font],
                        Width = huge
                  }).instance);
            end

            text.Remove = text.Destroy;
            classes.Text = text;
      end

      -- square class
      do
            local square = {};

            function square.new()
                  itemCounter = itemCounter + 1;
                  local id = itemCounter;

                  local newSquare = _setmetatable({
                        _id = id,
                        __OBJECT_EXISTS = true,
                        _properties = {
                              Color = _color3new(),
                              Filled = false,
                              Position = _vector2new(),
                              Size = _vector2new(),
                              Thickness = 1,
                              Transparency = 1,
                              Visible = false,
                              ZIndex = 0
                        },
                        _frame = create("Frame", {
                              BackgroundColor3 = _color3new(),
                              BackgroundTransparency = 1,
                              BorderSizePixel = 0,
                              Parent = drawingDirectory,
                              Position = _udim2new(),
                              Size = _udim2new(),
                              Visible = false,
                              ZIndex = 0
                        }, {
                              create("UIStroke", {
                                    Name = "_stroke",
                                    Color = _color3new(),
                                    Thickness = 1
                              })
                        })
                  }, square);

                  cache[id] = newSquare;
                  return newSquare;
            end

            function square:__index(k)
                  local prop = self._properties[k];
                  if prop ~= nil then
                        return prop;
                  end
                  return square[k];
            end

            function square:__newindex(k, v)
                  if self.__OBJECT_EXISTS == true then
                        local props = self._properties;
                        if props[k] == nil or props[k] == v or typeof(props[k]) ~= typeof(v) then
                              return;
                        end
                        props[k] = v;
                        if k == "Color" then
                              self._frame.BackgroundColor3 = v;
                              self._frame._stroke.Color = v;
                        elseif k == "Filled" then
                              self._frame.BackgroundTransparency = v and 1 - props.Transparency or 1;
                        elseif k == "Position" then
                              self:_updateScale();
                        elseif k == "Size" then
                              self:_updateScale();
                        elseif k == "Thickness" then
                              self._frame._stroke.Thickness = v;
                              self:_updateScale();
                        elseif k == "Transparency" then
                              self._frame._stroke.Transparency = 1 - v;
                              if props.Filled then
                                    self._frame.BackgroundTransparency = 1 - v;
                              end
                        elseif k == "Visible" then
                              self._frame.Visible = v;
                        elseif k == "ZIndex" then
                              self._frame.ZIndex = v;
                        end
                  end
            end

            function square:__iter()
                  return next, self._properties;
            end

            function square:__tostring()
                  return "Drawing";
            end

            function square:Destroy()
                  cache[self._id] = nil;
                  self.__OBJECT_EXISTS = false;
                  _eventfire(runfunction, _destroy, self._frame.instance);
                  -- _destroy(self._frame);
            end

            function square:_updateScale()
                  local props = self._properties;
                  self._frame.Position = _udim2fromoffset(props.Position.X + props.Thickness, props.Position.Y + props.Thickness);
                  self._frame.Size = _udim2fromoffset(props.Size.X - props.Thickness * 2, props.Size.Y - props.Thickness * 2);
            end

            square.Remove = square.Destroy;
            classes.Square = square;
      end

      -- image class
      do
            local image = {};

            function image.new()
                  itemCounter = itemCounter + 1;
                  local id = itemCounter;

                  local newImage = _setmetatable({
                        _id = id,
                        _imageId = 0,
                        __OBJECT_EXISTS = true,
                        _properties = {
                              Color = _color3new(1, 1, 1),
                              Data = "",
                              Position = _vector2new(),
                              Rounding = 0,
                              Size = _vector2new(),
                              Transparency = 1,
                              Uri = "",
                              Visible = false,
                              ZIndex = 0
                        },
                        _frame = create("ImageLabel", {
                              BackgroundTransparency = 1,
                              BorderSizePixel = 0,
                              Image = "",
                              ImageColor3 = _color3new(1, 1, 1),
                              Parent = drawingDirectory,
                              Position = _udim2new(),
                              Size = _udim2new(),
                              Visible = false,
                              ZIndex = 0
                        }, {
                              create("UICorner", {
                                    Name = "_corner",
                                    CornerRadius = _udimnew()
                              })
                        })
                  }, image);

                  cache[id] = newImage;
                  return newImage;
            end

            function image:__index(k)
                  _assert(k ~= "Data", _stringformat("Attempt to read writeonly property '%s'", k));
                  if k == "Loaded" then
                        return self._frame.IsLoaded;
                  end
                  local prop = self._properties[k];
                  if prop ~= nil then
                        return prop;
                  end
                  return image[k];
            end

            function image:__newindex(k, v)
                  if self.__OBJECT_EXISTS == true then
                        local props = self._properties;
                        if props[k] == nil or props[k] == v or typeof(props[k]) ~= typeof(v) then
                              return;
                        end
                        props[k] = v;
                        if k == "Color" then
                              self._frame.ImageColor3 = v;
                        elseif k == "Data" then
                              self:_newImage(v);
                        elseif k == "Position" then
                              self._frame.Position = _udim2fromoffset(v.X, v.Y);
                        elseif k == "Rounding" then
                              self._frame._corner.CornerRadius = _udimnew(0, v);
                        elseif k == "Size" then
                              self._frame.Size = _udim2fromoffset(v.X, v.Y);
                        elseif k == "Transparency" then
                              self._frame.ImageTransparency = 1 - v;
                        elseif k == "Uri" then
                              self:_newImage(v, true);
                        elseif k == "Visible" then
                              self._frame.Visible = v;
                        elseif k == "ZIndex" then
                              self._frame.ZIndex = v;
                        end
                  end
            end

            function image:__iter()
                  return next, self._properties;
            end

            function image:__tostring()
                  return "Drawing";
            end

            function image:Destroy()
                  cache[self._id] = nil;
                  self.__OBJECT_EXISTS = false;
                  _eventfire(runfunction, _destroy, self._frame.instance);
                  -- _destroy(self._frame);
            end

            function image:_newImage(data, isUri)
                  _taskspawn(function() -- this is fucked but u can't yield in a metamethod
                        self._imageId = self._imageId + 1;
                        local path = _stringformat("%s-%s.png", self._id, self._imageId);
                        if isUri then
                              local newData;
                              while newData == nil do
                                    local success, res = pcall(_httpget, game, data, true);
                                    if success then
                                          newData = res;
                                    elseif string.find(string.lower(res), "too many requests") then
                                          task.wait(3);
                                    else
                                          error(res, 2);
                                          return;
                                    end
                              end
                              self._properties.Data = data;
                        else
                              self._properties.Uri = "";
                        end
                        self._frame.Image = _writecustomasset(path, data);
                  end);
            end

            image.Remove = image.Destroy;
            classes.Image = image;
      end

      -- triangle class
      do
            local triangle = {};

            function triangle.new()
                  itemCounter = itemCounter + 1;
                  local id = itemCounter;

                  local newTriangle = _setmetatable({
                        _id = id,
                        __OBJECT_EXISTS = true,
                        _properties = {
                              Color = _color3new(),
                              Filled = false,
                              PointA = _vector2new(),
                              PointB = _vector2new(),
                              PointC = _vector2new(),
                              Thickness = 1,
                              Transparency = 1,
                              Visible = false,
                              ZIndex = 0
                        },
                        _frame = create("Frame", {
                              BackgroundTransparency = 1,
                              Parent = drawingDirectory,
                              Size = _udim2new(1, 0, 1, 0),
                              Visible = false,
                              ZIndex = 0
                        }, {
                              create("Frame", {
                                    Name = "_line1",
                                    AnchorPoint = _vector2new(0.5, 0.5),
                                    BackgroundColor3 = _color3new(),
                                    BorderSizePixel = 0,
                                    Position = _udim2new(),
                                    Size = _udim2new(),
                                    ZIndex = 0
                              }),
                              create("Frame", {
                                    Name = "_line2",
                                    AnchorPoint = _vector2new(0.5, 0.5),
                                    BackgroundColor3 = _color3new(),
                                    BorderSizePixel = 0,
                                    Position = _udim2new(),
                                    Size = _udim2new(),
                                    ZIndex = 0
                              }),
                              create("Frame", {
                                    Name = "_line3",
                                    AnchorPoint = _vector2new(0.5, 0.5),
                                    BackgroundColor3 = _color3new(),
                                    BorderSizePixel = 0,
                                    Position = _udim2new(),
                                    Size = _udim2new(),
                                    ZIndex = 0
                              })
                        })
                  }, triangle);

                  cache[id] = newTriangle;
                  return newTriangle;
            end

            function triangle:__index(k)
                  local prop = self._properties[k];
                  if prop ~= nil then
                        return prop;
                  end
                  return triangle[k];
            end

            function triangle:__newindex(k, v)
                  if self.__OBJECT_EXISTS == true then
                        local props, frame = self._properties, self._frame;
                        if props[k] == nil or props[k] == v or typeof(props[k]) ~= typeof(v) then
                              return;
                        end
                        props[k] = v;
                        if k == "Color" then
                              frame._line1.BackgroundColor3 = v;
                              frame._line2.BackgroundColor3 = v;
                              frame._line3.BackgroundColor3 = v;
                        elseif k == "Filled" then
                        -- TODO
                        elseif k == "PointA" then
                              self:_updateVertices({
                                    { frame._line1, props.PointA, props.PointB },
                                    { frame._line3, props.PointC, props.PointA }
                              });
                              if props.Filled then
                                    self:_calculateFill();
                              end
                        elseif k == "PointB" then
                              self:_updateVertices({
                                    { frame._line1, props.PointA, props.PointB },
                                    { frame._line2, props.PointB, props.PointC }
                              });
                              if props.Filled then
                                    self:_calculateFill();
                              end
                        elseif k == "PointC" then
                              self:_updateVertices({
                                    { frame._line2, props.PointB, props.PointC },
                                    { frame._line3, props.PointC, props.PointA }
                              });
                              if props.Filled then
                                    self:_calculateFill();
                              end
                        elseif k == "Thickness" then
                              local thickness = _mathmax(v, 1);
                              frame._line1.Size = _udim2fromoffset(frame._line1.AbsoluteSize.X, thickness);
                              frame._line2.Size = _udim2fromoffset(frame._line2.AbsoluteSize.X, thickness);
                              frame._line3.Size = _udim2fromoffset(frame._line3.AbsoluteSize.X, thickness);
                        elseif k == "Transparency" then
                              frame._line1.BackgroundTransparency = 1 - v;
                              frame._line2.BackgroundTransparency = 1 - v;
                              frame._line3.BackgroundTransparency = 1 - v;
                        elseif k == "Visible" then
                              self._frame.Visible = v;
                        elseif k == "ZIndex" then
                              self._frame.ZIndex = v;
                        end
                  end
            end

            function triangle:__iter()
                  return next, self._properties;
            end

            function triangle:__tostring()
                  return "Drawing";
            end

            function triangle:Destroy()
                  cache[self._id] = nil;
                  self.__OBJECT_EXISTS = false;
                  _eventfire(runfunction, _destroy, self._frame.instance);
                  -- _destroy(self._frame);
            end

            function triangle:_updateVertices(vertices)
                  local thickness = self._properties.Thickness;
                  for i, v in vertices do
                        updatePosition(v[1], v[2], v[3], thickness);
                  end
            end

            function triangle:_calculateFill()

            end

            triangle.Remove = triangle.Destroy;
            classes.Triangle = triangle;
      end

      -- quad class
      do
            local quad = {};

            function quad.new()
                  itemCounter = itemCounter + 1;
                  local id = itemCounter;

                  local newQuad = _setmetatable({
                        _id = id,
                        __OBJECT_EXISTS = true,
                        _properties = {
                              Color = _color3new(),
                              Filled = false,
                              PointA = _vector2new(),
                              PointB = _vector2new(),
                              PointC = _vector2new(),
                              PointD = _vector2new(),
                              Thickness = 1,
                              Transparency = 1,
                              Visible = false,
                              ZIndex = 0
                        },
                        _frame = create("Frame", {
                              BackgroundTransparency = 1,
                              Parent = drawingDirectory,
                              Size = _udim2new(1, 0, 1, 0),
                              Visible = false,
                              ZIndex = 0
                        }, {
                              create("Frame", {
                                    Name = "_line1",
                                    AnchorPoint = _vector2new(0.5, 0.5),
                                    BackgroundColor3 = _color3new(),
                                    BorderSizePixel = 0,
                                    Position = _udim2new(),
                                    Size = _udim2new(),
                                    ZIndex = 0
                              }),
                              create("Frame", {
                                    Name = "_line2",
                                    AnchorPoint = _vector2new(0.5, 0.5),
                                    BackgroundColor3 = _color3new(),
                                    BorderSizePixel = 0,
                                    Position = _udim2new(),
                                    Size = _udim2new(),
                                    ZIndex = 0
                              }),
                              create("Frame", {
                                    Name = "_line3",
                                    AnchorPoint = _vector2new(0.5, 0.5),
                                    BackgroundColor3 = _color3new(),
                                    BorderSizePixel = 0,
                                    Position = _udim2new(),
                                    Size = _udim2new(),
                                    ZIndex = 0
                              }),
                              create("Frame", {
                                    Name = "_line4",
                                    AnchorPoint = _vector2new(0.5, 0.5),
                                    BackgroundColor3 = _color3new(),
                                    BorderSizePixel = 0,
                                    Position = _udim2new(),
                                    Size = _udim2new(),
                                    ZIndex = 0
                              })
                        })
                  }, quad);

                  cache[id] = newQuad;
                  return newQuad;
            end

            function quad:__index(k)
                  local prop = self._properties[k];
                  if prop ~= nil then
                        return prop;
                  end
                  return quad[k];
            end

            function quad:__newindex(k, v)
                  if self.__OBJECT_EXISTS == true then
                        local props, frame = self._properties, self._frame;
                        if props[k] == nil or props[k] == v or typeof(props[k]) ~= typeof(v) then
                        return;
                        end
                        props[k] = v;
                        if k == "Color" then
                        frame._line1.BackgroundColor3 = v;
                        frame._line2.BackgroundColor3 = v;
                        frame._line3.BackgroundColor3 = v;
                        frame._line4.BackgroundColor3 = v;
                        elseif k == "Filled" then
                        -- TODO
                        elseif k == "PointA" then
                        self:_updateVertices({
                              { frame._line1, props.PointA, props.PointB },
                              { frame._line4, props.PointD, props.PointA }
                        });
                        if props.Filled then
                              self:_calculateFill();
                        end
                        elseif k == "PointB" then
                        self:_updateVertices({
                              { frame._line1, props.PointA, props.PointB },
                              { frame._line2, props.PointB, props.PointC }
                        });
                        if props.Filled then
                              self:_calculateFill();
                        end
                        elseif k == "PointC" then
                        self:_updateVertices({
                              { frame._line2, props.PointB, props.PointC },
                              { frame._line3, props.PointC, props.PointD }
                        });
                        if props.Filled then
                              self:_calculateFill();
                        end
                        elseif k == "PointD" then
                        self:_updateVertices({
                              { frame._line3, props.PointC, props.PointD },
                              { frame._line4, props.PointD, props.PointA }
                        });
                        if props.Filled then
                              self:_calculateFill();
                        end
                        elseif k == "Thickness" then
                        local thickness = _mathmax(v, 1);
                        frame._line1.Size = _udim2fromoffset(frame._line1.AbsoluteSize.X, thickness);
                        frame._line2.Size = _udim2fromoffset(frame._line2.AbsoluteSize.X, thickness);
                        frame._line3.Size = _udim2fromoffset(frame._line3.AbsoluteSize.X, thickness);
                        frame._line4.Size = _udim2fromoffset(frame._line3.AbsoluteSize.X, thickness);
                        elseif k == "Transparency" then
                        frame._line1.BackgroundTransparency = 1 - v;
                        frame._line2.BackgroundTransparency = 1 - v;
                        frame._line3.BackgroundTransparency = 1 - v;
                        frame._line4.BackgroundTransparency = 1 - v;
                        elseif k == "Visible" then
                        self._frame.Visible = v;
                        elseif k == "ZIndex" then
                        self._frame.ZIndex = v;
                        end
                  end
            end

            function quad:__iter()
                  return next, self._properties;
            end

            function quad:__tostring()
                  return "Drawing";
            end

            function quad:Destroy()
                  cache[self._id] = nil;
                  self.__OBJECT_EXISTS = false;
                  _eventfire(runfunction, _destroy, self._frame.instance);
                  -- _destroy(self._frame);
            end

            function quad:_updateVertices(vertices)
                  local thickness = self._properties.Thickness;
                  for i, v in vertices do
                        updatePosition(v[1], v[2], v[3], thickness);
                  end
            end

            function quad:_calculateFill()

            end

            quad.Remove = quad.Destroy;
            classes.Quad = quad;
      end

      drawing.new = newcclosure(function(x)
            return _assert(classes[x], _stringformat("Invalid drawing type '%s'", x)).new();
      end);

      drawing.clear = newcclosure(function()
            for i, v in cache do
                  if v.__OBJECT_EXISTS then
                        v:Destroy();
                  end
            end
      end);

      drawing.cache = cache;
end

setreadonly(drawing, true);
setreadonly(drawing.Fonts, true);

genv.Drawing = drawing;
genv.cleardrawcache = drawing.clear;
end)();
--
local Camera = game:GetService("Workspace").Camera
local lighting = game:GetService("Lighting")
local OsClock = os.clock()
local RunService = game:GetService("RunService")
--
if not LPH_OBFUSCATED then
LPH_JIT = function(...) return ... end
LPH_JIT_MAX = function(...) return ... end
LPH_JIT_ULTRA = function(...) return ... end
LPH_NO_VIRTUALIZE = function(...) return ... end
LPH_ENCSTR = function(...) return ... end
LPH_STRENC = function(...) return ... end
LPH_HOOK_FIX = function(...) return ... end
LPH_CRASH = function() return print(debug.traceback()) end
end;
--
getgenv().Novat = {
};
local Nova = getgenv().Novat
local char = {};
--
do -- Enviorment Setup
    local SetupEnviorment = function(Table)
        local Environment = getfenv(2);
        for Index, Value in pairs(Table) do
            Environment[Index] = Value;
        end;
        --
        return Environment;
    end;
    --
    SetupEnviorment({
        ReplicatedStorage       = cloneref(game:GetService("ReplicatedStorage"));
        UserInputService        = cloneref(game:GetService("UserInputService"));
        TeleportService         = cloneref(game:GetService("TeleportService"));
        HttpService             = cloneref(game:GetService("HttpService"));
        RunService              = cloneref(game:GetService("RunService"));
        Workspace               = cloneref(game:GetService("Workspace"));
        Lighting                = cloneref(game:GetService("Lighting"));
        CoreGui                 = cloneref(game:GetService("CoreGui"));
        Players                 = cloneref(game:GetService("Players"));
        Stats                   = cloneref(game:GetService("Stats"));
        ContentProvider         = cloneref(game:GetService("ContentProvider"));
        TweenService            = cloneref(game:GetService("TweenService"));
        VirtualInputManager     = cloneref(game:GetService("VirtualInputManager"));
        LogService              = cloneref(game:GetService("LogService"));
        Camera                  = cloneref(game:GetService("Workspace")).CurrentCamera;
    })
end
--
Nova.modules = {Classes={};Character={};PlayerClient={};Camera={};FPS={};Recoil={}}; Nova.playerlist = {};
--
do --// Set Modules
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and islclosure(v) then
            local info = debug.getinfo(v)
            local scriptName = string.match(info.short_src, "%.([%w_]+)$")
            if scriptName and Nova.modules[scriptName] and info.name then
                Nova.modules[scriptName][info.name] = info.func
            end
        elseif typeof(v) == "table" and rawget(v, "EntityGhosts") and v.M4A1.ProjectileDrop then
            Nova.modules.Classes = v
        end
    end
end
--
Nova.playerlist = debug.getupvalue(Nova.modules.PlayerClient.updatePlayers, 1)
repeat wait(0.1) until Nova.playerlist ~= nil
--
do
local Library = (function()

------ * Fatality.gg priv_9 Menu * ------
--[[
    # Rewriten by: Fatality.gg
]]

repeat
    task.wait()
 until game:IsLoaded()

-- Menu/UI Creation
if not isfile("Fatality.gg") then
    makefolder("Fatality.gg")
 end
 
 local menu = game:GetObjects("rbxassetid://119061873259635")[1] 
 print(menu)
 local tabholder = menu.bg.bg.bg.bg.bg.bg.main.group;
 local tabviewer = menu.bg.bg.bg.bg.bg.bg.tabbuttons;
 for _, obj in pairs(menu:GetDescendants()) do
    if obj.Name:lower():find('userlabel') then
        obj.Text = 'active user: <font color="rgb(61, 255, 200)">' .. game.Players.LocalPlayer.Name .. '</font>'
    end
    if obj.Name:lower():find('buildlabel') then
        obj.Text = 'build: <font color="rgb(61, 255, 200)">Public</font>'
    end
 end
 
 --vars
 local CloneCore = cloneref(game.CoreGui)
 local CloneScreenGui = cloneref(Instance.new("ScreenGui"))
 local RunService = game:GetService("RunService")
 local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
 local InputService = game:GetService("UserInputService")
 local TweenService = game:GetService("TweenService")
 local HttpService = cloneref(game:GetService("HttpService"))

 --// LPH
 if not LPH_OBFUSCATED then
    LPH_JIT = function(...) return ... end
    LPH_JIT_MAX = function(...) return ... end
    LPH_JIT_ULTRA = function(...) return ... end
    LPH_NO_VIRTUALIZE = function(...) return ... end
    LPH_NO_UPVALUES = function(f) return(function(...) return f(...) end) end
    LPH_ENCSTR = function(...) return ... end
    LPH_STRENC = function(...) return ... end
    LPH_HOOK_FIX = function(...) return ... end
    LPH_CRASH = function() return print(debug.traceback()) end
 end
 
 -- custom fonts
 local Fonts = {}
 function Fonts:Register_Font(Name, Weight, Style, Asset)
     if not isfile(Asset.Id) then
         writefile(Asset.Id, Asset.Font)
     end
     if isfile(Name .. ".font") then
         delfile(Name .. ".font")
     end
     local Data = {
         name = Name,
         faces = {
             {
                 name = "Regular",
                 weight = Weight,
                 style = Style,
                 assetId = getcustomasset(Asset.Id),
             },
         },
     }
     writefile(Name .. ".font", HttpService:JSONEncode(Data))
     return getcustomasset(Name .. ".font");
 end
 
 Fonts.ProggyTiny = Font.new(Fonts:Register_Font("ProggyClean", 200, "normal", {
     Id = "ProggyClean.ttf",
     Font = crypt.base64.decode("AAEAAAAMAIAAAwBAT1MvMofrcxAAAAFIAAAATmNtYXACEiN1AAADoAAAAVJjdnQgAAAAAAAABPwAAAACZ2x5ZtPuYNAAAAcEAAB81GhlYWTXEWiyAAAAzAAAADZoaGVhBsIBwwAAAQQAAAAkaG10eFiATIAAAAGYAAACBmxvY2FF82T0AAAFAAAAAgRtYXhwAaYAugAAASgAAAAgbmFtZQH8brwAAIPYAAABm3Bvc3SmrIPvAACFdAAABdJwcmVwaQIBEgAABPQAAAAIAAEAAAABAAD2pBDqXw889QADCAAAAAAAt2d3hAAAAAC9kqkzAAD/AAMABAAAAAAGAAIAAAAAAAAAAQAAA8D+wAAAAwAAAAAAAwAAAQAAAAAAAAAAAAAAAAAAAAIAAQAAAQEAcAAcAAAAAAACAAgAQAAKAAAAdgAIAAAAAAAAAwABkAAFAAACvAKKAAAAjwK8AooAAAHFADIBgAAAAAAECQAAAAAAAAAAAAAAAAAAAAAAAAAAAABBbHRzAEAAACCsCAAAAAAABAABAAAAAwAAAAMAAwADAAMAAwADAAMAAwADAAMAAwADAAMAAwADAAMAAwADAAMAAwADAAMAAwADAAMAAwADAAMAAwADAAMAAwADAAMAAQAAgAAAAAAAAAAAAQAAgACAAAAAAACAAAABAAAAAAAAgAAAAAAAAAAAAAAAAAAAAAABAACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAIAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAIAAAACAAIAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAIABAACAAAADAAAAAwABAACAAIAAAAAAAAAAgAAAAAAAgAAAAwAAAAMAAwABAAEAAIAAgAEAAAAAAACAAAAAAAEAAAADAAAAAAADAAEAAIAAAAAAAAABAAAAAIAAAACAAAAAgAMAAAAAAACAAAAAgACAAQAAAAAAAQABAACAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAgACAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAIAAgACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMAAAAAAAAAHAABAAAAAABMAAMAAQAAABwABAAwAAAACAAIAAIAAAB/AP8grP//AAAAAACBIKz//wABAAHf1QABAAAAAAAAAAAAAAEGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACxAAGNuAH/hQAAAAAAAACcAJwAnACcAJwAnACcAJwAnACcAJwAnACcAJwAnACcAJwAnACcAJwAnACcAJwAnACcAJwAnACcAJwAnACcAJwAnACcAMYA7gFQAbACBAJmAn4CuALwAzIDaAN6A5gDpAPgBEIEfgTSBSIFdAXQBiYGZgbIBx4HMgdMB3wHsgfiCBoIngjsCVoJpgoECmQKsgsUC3gLuAv+DFIMkg0CDXgN1g4sDpQO+g9OD44P6BAyEJQQ5BEsEYARzBICEk4SchKUEqYS9BNUE5IT9BRGFJIU8hVKFXgVuhYIFkAWlhbeFyYXghfeGBQYWhiaGOIZHBlkGZ4Z+hpCGnwathruGxQbFBt+G34bkBveG/ocEBxcHLwc1B0YHXodnh4KHgoeZB5kHmQefB6UHrwe5B8AHx4fQB9eH7QgDCAwIIYghiDgITAhMCFaIaIh/CJYIq4i4iNKI1wj2iQMJEwkdiR2JOwlCiUoJXYlpiXWJeomPibMJtom9icoJ1InkigCKG4o7CkkKWwptioGKloqpCr4K2grwCwgLIIs6i1KLYwtzi4WLlguxC8yL4Qv2DAyMJAw4jEcMXgxyDIYMm4yvjMOM2AzyDQgNHo02jU+NZY1+jZONpg29jdUN7g4FjhIOHw4tjjoOUI5ojn0Okg6ojsAO1I7fjvaPC48hDzePTI9nD4CPmoAHAAA/wADAAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwBHAEsATwBTAFcAWwBfAGMAZwBrAG8AABE1MxUxNTMVMTUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVMTUzFTE1MxWAgICAgID9AIACAID9AIACAID9AIACAID9AIACAID9AIACAID9AIACAID9AIACAID9AIACAID9AICAgICAgAOAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAABgEAAAABgAOAAAMABwALAA8AEwAXAAABNTMVBzUzFQc1MxUHNTMVBzUzFQM1MxUBAICAgICAgICAgICAAwCAgICAgICAgICAgICAgP8AgIAAAAAABgCAAoACAAQAAAMABwALAA8AEwAXAAATNTMVMzUzFQU1MxUzNTMVBTUzFTM1MxWAgICA/oCAgID+gICAgAOAgICAgICAgICAgICAgIAAAAASAAAAAAKAAwAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcAABM1MxUzNTMVBTUzFTE1MxUxNTMVMTUzFTE1MxUFNTMVMzUzFQU1MxUzNTMVBTUzFTE1MxUxNTMVMTUzFTE1MxUFNTMVMzUzFYCAgID+AICAgICA/gCAgID+gICAgP4AgICAgID+AICAgAKAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAEQAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwAAATUzFQU1MxUxNTMVMTUzFTE1MxUFNTMVMzUzFQU1MxUxNTMVMTUzFQU1MxUzNTMVBTUzFTE1MxUxNTMVMTUzFQU1MxUBAID/AICAgID9gICAgP8AgICA/wCAgID9gICAgID/AIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAADgAAAAADAAMAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwAAEzUzFSE1MxUFNTMVMzUzFTM1MxUFNTMVMzUzFQU1MxUzNTMVBTUzFTM1MxUzNTMVBTUzFSE1MxWAgAGAgP0AgICAgID+AICAgP8AgICA/gCAgICAgP0AgAGAgAKAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAEQAAAAADAAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwAAEzUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUFNTMVITUzFTM1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTM1MxWAgID+gIABAID+AIABAID+gICA/oCAAQCAgID9AIABgID+AICAgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAMBAAKAAYAEAAADAAcACwAAATUzFQc1MxUHNTMVAQCAgICAgAOAgICAgICAgIAAAAkAgP+AAgAEAAADAAcACwAPABMAFwAbAB8AIwAAATUzFQU1MxUFNTMVBzUzFQc1MxUHNTMVBzUzHQE1Mx0BNTMVAYCA/wCA/wCAgICAgICAgICAgAOAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAACQCA/4ACAAQAAAMABwALAA8AEwAXABsAHwAjAAATNTMdATUzHQE1MxUHNTMVBzUzFQc1MxUHNTMVBTUzFQU1MxWAgICAgICAgICAgID/AID/AIADgICAgICAgICAgICAgICAgICAgICAgICAgICAAAsAAACAAoADAAADAAcACwAPABMAFwAbAB8AIwAnACsAAAE1MxUFNTMVMzUzFTM1MxUFNTMVMTUzFTE1MxUFNTMVMzUzFTM1MxUFNTMVAQCA/oCAgICAgP4AgICA/gCAgICAgP6AgAKAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAkAAACAAoADAAADAAcACwAPABMAFwAbAB8AIwAAATUzFQc1MxUFNTMVMTUzFTE1MxUxNTMVMTUzFQU1MxUHNTMVAQCAgID+gICAgICA/oCAgIACgICAgICAgICAgICAgICAgICAgICAgIAAAAIAgP+AAYAAgAADAAcAACE1MxUFNTMVAQCA/wCAgICAgIAAAAUAAAGAAoACAAADAAcACwAPABMAABE1MxUxNTMVMTUzFTE1MxUxNTMVgICAgIABgICAgICAgICAgIAAAAEBAAAAAYAAgAADAAAhNTMVAQCAgIAAAAkAAP+AAoAEAAADAAcACwAPABMAFwAbAB8AIwAAATUzFQc1MxUFNTMVBzUzFQU1MxUHNTMVBTUzFQc1MxUFNTMVAgCAgID/AICAgP8AgICA/wCAgID/AIADgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAABEAAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMAABM1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMzUzFTM1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVgICAgP4AgAGAgP2AgAGAgP2AgICAgID9gIABgID9gIABgID+AICAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAKAIAAAAIAA4AAAwAHAAsADwATABcAGwAfACMAJwAAATUzFQU1MxUxNTMVBzUzFQc1MxUHNTMVBzUzFQU1MxUxNTMVMTUzFQEAgP8AgICAgICAgICAgP8AgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgAAPAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAABM1MxUxNTMVMTUzFQU1MxUhNTMVBzUzFQU1MxUxNTMVBTUzFQU1MxUHNTMVMTUzFTE1MxUxNTMVMTUzFYCAgID+AIABgICAgP6AgID+gID/AICAgICAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAOAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3AAATNTMVMTUzFTE1MxUFNTMVITUzFQc1MxUFNTMVMTUzHQE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFYCAgID+AIABgICAgP6AgICA/YCAAYCA/gCAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAADgAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwAAATUzFQU1MxUxNTMVBTUzFTM1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUxNTMVBTUzFQc1MxUBgID/AICA/oCAgID+AIABAID+AICAgICA/wCAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAARAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAAARNTMVMTUzFTE1MxUxNTMVMTUzFQU1MxUHNTMVBzUzFTE1MxUxNTMVMTUzHQE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFYCAgICA/YCAgICAgICAgID9gIABgID+AICAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAADwAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AAABNTMVMTUzFQU1MxUFNTMVBzUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUBAICA/oCA/wCAgICAgID+AIABgID9gIABgID+AICAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAsAAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsAABE1MxUxNTMVMTUzFTE1MxUxNTMVBzUzFQU1MxUHNTMVBTUzFQc1MxUFNTMVgICAgICAgP8AgICA/wCAgID/AIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAEQAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwAAEzUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxWAgICA/gCAAYCA/YCAAYCA/gCAgID+AIABgID9gIABgID+AICAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAA8AAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwAAEzUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUHNTMVBTUzFQU1MxUxNTMVgICAgP4AgAGAgP2AgAGAgP4AgICAgICA/wCA/oCAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAACAQAAgAGAAoAAAwAHAAABNTMVAzUzFQEAgICAAgCAgP6AgIAAAAAAAwCAAAABgAKAAAMABwALAAABNTMVAzUzFQU1MxUBAICAgP8AgAIAgID+gICAgICAAAAAAAgAAACAAoADAAADAAcACwAPABMAFwAbAB8AAAE1MxUFNTMVMTUzFQU1MxUxNTMdATUzFTE1Mx0BNTMVAgCA/oCAgP4AgICAgIACgICAgICAgICAgICAgICAgICAgICAAAoAAAEAAoACgAADAAcACwAPABMAFwAbAB8AIwAnAAARNTMVMTUzFTE1MxUxNTMVMTUzFQE1MxUxNTMVMTUzFTE1MxUxNTMVgICAgID9gICAgICAAgCAgICAgICAgICA/wCAgICAgICAgICAAAgAAACAAoADAAADAAcACwAPABMAFwAbAB8AABE1Mx0BNTMVMTUzHQE1MxUxNTMVBTUzFTE1MxUFNTMVgICAgID+AICA/oCAAoCAgICAgICAgICAgICAgICAgICAgAAAAAkAAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAAEzUzFTE1MxUxNTMVBTUzFSE1MxUHNTMVBTUzFQU1MxUDNTMVgICAgP4AgAGAgICA/wCA/wCAgIADAICAgICAgICAgICAgICAgICAgICA/wCAgAAZAAAAAAMAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcASwBPAFMAVwBbAF8AYwAAEzUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFTM1MxUxNTMVMzUzFQU1MxUzNTMVMTUzFTM1MxUFNTMVMzUzFTE1MxUxNTMVMTUzFQU1Mx0BNTMVMTUzFTE1MxUxNTMVMTUzFYCAgICA/YCAAgCA/QCAgICAgID9AICAgICAgP0AgICAgICA/QCAgICAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAANAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwAAATUzFQc1MxUFNTMVMzUzFQU1MxUzNTMVBTUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQEAgICA/wCAgID+gICAgP6AgICA/gCAAYCA/YCAAYCAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAUAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcASwBPAAARNTMVMTUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFYCAgID+AIABgID9gIABgID9gICAgID+AIABgID9gIABgID9gICAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAADQAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMAABM1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFQc1MxUHNTMVBzUzFSE1MxUFNTMVMTUzFTE1MxWAgICA/gCAAYCA/YCAgICAgICAAYCA/gCAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAQAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwAAETUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFYCAgP6AgAEAgP4AgAGAgP2AgAGAgP2AgAGAgP2AgAEAgP4AgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAABIAAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMARwAAETUzFTE1MxUxNTMVMTUzFTE1MxUFNTMVBzUzFQc1MxUxNTMVMTUzFTE1MxUFNTMVBzUzFQc1MxUxNTMVMTUzFTE1MxUxNTMVgICAgID9gICAgICAgICA/gCAgICAgICAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAA4AAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAABE1MxUxNTMVMTUzFTE1MxUxNTMVBTUzFQc1MxUHNTMVMTUzFTE1MxUxNTMVBTUzFQc1MxUHNTMVgICAgID9gICAgICAgICA/gCAgICAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAABEAAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMAABM1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFQc1MxUhNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVgICAgP4AgAGAgP2AgICAAQCAgP2AgAGAgP2AgAGAgP4AgICAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAAARAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAAARNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFYABgID9gIABgID9gIABgID9gICAgICA/YCAAYCA/YCAAYCA/YCAAYCAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAAAsAgAAAAgADgAADAAcACwAPABMAFwAbAB8AIwAnACsAABM1MxUxNTMVMTUzFQU1MxUHNTMVBzUzFQc1MxUHNTMVBTUzFTE1MxUxNTMVgICAgP8AgICAgICAgICA/wCAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgIAADAAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvAAABNTMVMTUzFTE1MxUHNTMVBzUzFQc1MxUHNTMVBzUzFQU1MxUxNTMVMTUzFTE1MxUBAICAgICAgICAgICAgID9gICAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAAAOAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3AAARNTMVITUzFQU1MxUhNTMVBTUzFTM1MxUFNTMVMTUzFQU1MxUzNTMVBTUzFSE1MxUFNTMVITUzFYABgID9gIABAID+AICAgP6AgID/AICAgP6AgAEAgP4AgAGAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAALAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAAARNTMVBzUzFQc1MxUHNTMVBzUzFQc1MxUHNTMVMTUzFTE1MxUxNTMVMTUzFYCAgICAgICAgICAgICAgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAABQAAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMARwBLAE8AABE1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTM1MxUxNTMVBTUzFTE1MxUzNTMVMTUzFQU1MxUzNTMVMzUzFQU1MxUzNTMVMzUzFQU1MxUhNTMVgAGAgP2AgAGAgP2AgICAgID9gICAgICA/YCAgICAgP2AgICAgID9gIABgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAFQAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwBHAEsATwBTAAARNTMVMTUzFSE1MxUFNTMVMTUzFSE1MxUFNTMVMzUzFTM1MxUFNTMVMzUzFTM1MxUFNTMVMzUzFTM1MxUFNTMVITUzFTE1MxUFNTMVITUzFTE1MxWAgAEAgP2AgIABAID9gICAgICA/YCAgICAgP2AgICAgID9gIABAICA/YCAAQCAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAQAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwAAEzUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFYCAgID+AIABgID9gIABgID9gIABgID9gIABgID9gIABgID+AICAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAA8AAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwAAETUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVBTUzFQc1MxUHNTMVgICAgP4AgAGAgP2AgAGAgP2AgICAgP4AgICAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAAASAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcAABM1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUxNTMVBTUzFTE1MxUxNTMVMTUzFYCAgID+AIABgID9gIABgID9gIABgID9gIABgID9gIABAICA/gCAgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAAEgAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwBHAAARNTMVMTUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxWAgICA/gCAAYCA/YCAAYCA/YCAgICA/gCAAYCA/YCAAYCA/YCAAYCAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAADwAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AAATNTMVMTUzFTE1MxUFNTMVITUzFQU1Mx0BNTMVMTUzFTE1Mx0BNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxWAgICA/gCAAYCA/YCAgICAgP2AgAGAgP4AgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAACwAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAAETUzFTE1MxUxNTMVMTUzFTE1MxUFNTMVBzUzFQc1MxUHNTMVBzUzFQc1MxWAgICAgP6AgICAgICAgICAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAPAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAABE1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFYABgID9gIABgID9gIABgID9gIABgID9gIABgID9gIABgID+AICAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAMAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AABE1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUzNTMVBTUzFTM1MxUFNTMVBzUzFYABgID9gIABgID9gIABgID+AICAgP6AgICA/wCAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAEQAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwAAETUzFSE1MxUFNTMVMzUzFTM1MxUFNTMVMzUzFTM1MxUFNTMVMzUzFTM1MxUFNTMVMzUzFQU1MxUzNTMVBTUzFTM1MxWAAYCA/YCAgICAgP2AgICAgID9gICAgICA/gCAgID+gICAgP6AgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAA0AAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzAAARNTMVITUzFQU1MxUhNTMVBTUzFTM1MxUFNTMVBTUzFTM1MxUFNTMVITUzFQU1MxUhNTMVgAGAgP2AgAGAgP4AgICA/wCA/wCAgID+AIABgID9gIABgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAMAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AABE1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFQU1MxUHNTMVBzUzFYABgID9gIABgID9gIABgID+AICAgP8AgICAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAPAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAABE1MxUxNTMVMTUzFTE1MxUxNTMVBzUzFQU1MxUFNTMVBTUzFQU1MxUHNTMVMTUzFTE1MxUxNTMVMTUzFYCAgICAgID/AID/AID/AID/AICAgICAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAAANAID/gAIABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwAAEzUzFTE1MxUxNTMVBTUzFQc1MxUHNTMVBzUzFQc1MxUHNTMVBzUzFQc1MxUxNTMVMTUzFYCAgID+gICAgICAgICAgICAgICAgICAA4CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAAAkAAP+AAoAEAAADAAcACwAPABMAFwAbAB8AIwAAETUzFQc1Mx0BNTMVBzUzHQE1MxUHNTMdATUzFQc1Mx0BNTMVgICAgICAgICAgICAgAOAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAA0AgP+AAgAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzAAATNTMVMTUzFTE1MxUHNTMVBzUzFQc1MxUHNTMVBzUzFQc1MxUHNTMVBTUzFTE1MxUxNTMVgICAgICAgICAgICAgICAgICA/oCAgIADgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAABQAAAgACgAOAAAMABwALAA8AEwAAATUzFQU1MxUzNTMVBTUzFSE1MxUBAID/AICAgP4AgAGAgAMAgICAgICAgICAgICAAAAABgAA/4ADAAAAAAMABwALAA8AEwAXAAAVNTMVMTUzFTE1MxUxNTMVMTUzFTE1MxWAgICAgICAgICAgICAgICAgICAAAACAQACgAIAA4AAAwAHAAABNTMdATUzFQEAgIADAICAgICAAAAOAAAAAAKAAoAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3AAATNTMVMTUzFTE1Mx0BNTMVBTUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFYCAgICA/gCAgICA/YCAAYCA/gCAgICAAgCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAAARAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAAARNTMVBzUzFQc1MxUHNTMVMTUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFYCAgICAgICAgID+AIABgID9gIABgID9gIABgID9gICAgIADgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAALAAAAAAKAAoAAAwAHAAsADwATABcAGwAfACMAJwArAAATNTMVMTUzFTE1MxUxNTMVBTUzFQc1MxUHNTMdATUzFTE1MxUxNTMVMTUzFYCAgICA/YCAgICAgICAgIACAICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAEQAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwAAATUzFQc1MxUHNTMVBTUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUCAICAgICA/gCAgICA/YCAAYCA/YCAAYCA/YCAAYCA/gCAgICAA4CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAA8AAAAAAoACgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwAAEzUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVMTUzFQU1Mx0BNTMVMTUzFTE1MxUxNTMVgICAgP4AgAGAgP2AgICAgID9gICAgICAAgCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAADQAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMAAAE1MxUxNTMVMTUzFQU1MxUHNTMVBTUzFTE1MxUxNTMVMTUzFQU1MxUHNTMVBzUzFQc1MxUBAICAgP4AgICA/wCAgICA/oCAgICAgICAA4CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAARAAD/AAKAAoAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAAATNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVBzUzFQU1MxUxNTMVMTUzFYCAgID+AIABgID9gIABgID9gIABgID+AICAgICAgP4AgICAAgCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAPAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAABE1MxUHNTMVBzUzFQc1MxUxNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFYCAgICAgICAgID+AIABgID9gIABgID9gIABgID9gIABgIADgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAcAgAAAAYADgAADAAcACwAPABMAFwAbAAABNTMVATUzFTE1MxUHNTMVBzUzFQc1MxUHNTMVAQCA/wCAgICAgICAgICAAwCAgP8AgICAgICAgICAgICAgICAgAAACwAA/wACAAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAAATUzFQE1MxUxNTMVBzUzFQc1MxUHNTMVBzUzFQc1MxUFNTMVMTUzFTE1MxUBgID/AICAgICAgICAgICAgP4AgICAAwCAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgIAADQCAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMAABM1MxUHNTMVBzUzFQc1MxUhNTMVBTUzFTM1MxUFNTMVMTUzFQU1MxUzNTMVBTUzFSE1MxWAgICAgICAgAEAgP4AgICA/oCAgP8AgICA/oCAAQCAA4CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAACQCAAAABgAQAAAMABwALAA8AEwAXABsAHwAjAAATNTMVMTUzFQc1MxUHNTMVBzUzFQc1MxUHNTMVBzUzFQc1MxWAgICAgICAgICAgICAgICAgAOAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAA8AAAAAAoACgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwAAETUzFTE1MxUzNTMVBTUzFTM1MxUzNTMVBTUzFTM1MxUzNTMVBTUzFTM1MxUzNTMVBTUzFTM1MxUzNTMVgICAgP4AgICAgID9gICAgICA/YCAgICAgP2AgICAgIACAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAMAAAAAAKAAoAAAwAHAAsADwATABcAGwAfACMAJwArAC8AABE1MxUxNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFYCAgID+AIABgID9gIABgID9gIABgID9gIABgIACAICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAMAAAAAAKAAoAAAwAHAAsADwATABcAGwAfACMAJwArAC8AABM1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFYCAgID+AIABgID9gIABgID9gIABgID+AICAgAIAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAAAQAAD/AAKAAoAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwAAETUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUFNTMVBzUzFYCAgID+AIABgID9gIABgID9gIABgID9gICAgID+AICAgAIAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAAEAAA/wACgAKAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AABM1MxUxNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVBzUzFQc1MxWAgICAgP2AgAGAgP2AgAGAgP2AgAGAgP4AgICAgICAgIACAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAAAkAAAAAAoACgAADAAcACwAPABMAFwAbAB8AIwAAETUzFTM1MxUxNTMVBTUzFTE1MxUhNTMVBTUzFQc1MxUHNTMVgICAgP4AgIABAID9gICAgICAAgCAgICAgICAgICAgICAgICAgICAgICAAA0AAAAAAoACgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzAAATNTMVMTUzFTE1MxUxNTMVBTUzHQE1MxUxNTMVMTUzHQE1MxUFNTMVMTUzFTE1MxUxNTMVgICAgID9gICAgICA/YCAgICAAgCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAACwCAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAAEzUzFQc1MxUHNTMVMTUzFTE1MxUFNTMVBzUzFQc1Mx0BNTMVMTUzFTE1MxWAgICAgICAgP6AgICAgICAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAMAAAAAAKAAoAAAwAHAAsADwATABcAGwAfACMAJwArAC8AABE1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFYABgID9gIABgID9gIABgID9gIABgID+AICAgIACAICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAJAAAAAAKAAoAAAwAHAAsADwATABcAGwAfACMAABE1MxUhNTMVBTUzFSE1MxUFNTMVMzUzFQU1MxUzNTMVBTUzFYABgID9gIABgID+AICAgP6AgICA/wCAAgCAgICAgICAgICAgICAgICAgICAgICAAAAAAAwAAAAAAoACgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAAETUzFSE1MxUFNTMVMzUzFTM1MxUFNTMVMzUzFTM1MxUFNTMVMzUzFQU1MxUzNTMVgAGAgP2AgICAgID9gICAgICA/gCAgID+gICAgAIAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAAkAAAAAAoACgAADAAcACwAPABMAFwAbAB8AIwAAETUzFSE1MxUFNTMVMzUzFQU1MxUFNTMVMzUzFQU1MxUhNTMVgAGAgP4AgICA/wCA/wCAgID+AIABgIACAICAgICAgICAgICAgICAgICAgICAgIAAAAAAEAAA/wACgAKAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AABE1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFQc1MxUFNTMVMTUzFTE1MxWAAYCA/YCAAYCA/YCAAYCA/YCAAYCA/gCAgICAgID+AICAgAIAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAA0AAAAAAoACgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzAAARNTMVMTUzFTE1MxUxNTMVMTUzFQU1MxUFNTMVBTUzFQU1MxUxNTMVMTUzFTE1MxUxNTMVgICAgID/AID/AID/AID/AICAgICAAgCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAkAgP+AAgAEAAADAAcACwAPABMAFwAbAB8AIwAAATUzFQU1MxUHNTMVBzUzFQU1Mx0BNTMVBzUzFQc1Mx0BNTMVAYCA/wCAgICAgP8AgICAgICAgAOAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAACQEA/4ABgAQAAAMABwALAA8AEwAXABsAHwAjAAABNTMVBzUzFQc1MxUHNTMVBzUzFQc1MxUHNTMVBzUzFQc1MxUBAICAgICAgICAgICAgICAgICAA4CAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAAAJAID/gAIABAAAAwAHAAsADwATABcAGwAfACMAABM1Mx0BNTMVBzUzFQc1Mx0BNTMVBTUzFQc1MxUHNTMVBTUzFYCAgICAgICA/wCAgICAgP8AgAOAgICAgICAgICAgICAgICAgICAgICAgICAgIAABgAAAQADAAIAAAMABwALAA8AEwAXAAATNTMVMTUzFSE1MxUFNTMVITUzFTE1MxWAgIABAID9AIABAICAAYCAgICAgICAgICAgICAABMAAAAAAwADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMARwBLAAABNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUFNTMVBTUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVAQCAgID+AIABgID9AICAgID+gID/AICAgID+gIABgID+AICAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAAAgEA/4ACAACAAAMABwAAITUzFQU1MxUBgID/AICAgICAgAAADQCA/wACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMAAAE1MxUxNTMVBTUzFQc1MxUFNTMVMTUzFTE1MxUFNTMVBzUzFQc1MxUHNTMVBzUzFQU1MxUBgICA/oCAgID/AICAgP8AgICAgICAgICA/wCAA4CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAABACA/4ACAACAAAMABwALAA8AADM1MxUzNTMVBTUzFTM1MxWAgICA/oCAgICAgICAgICAgIAAAAADAAAAAAKAAIAAAwAHAAsAADE1MxUzNTMVMzUzFYCAgICAgICAgICAAAAAAA0AAP+AAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzAAABNTMVBzUzFQU1MxUxNTMVMTUzFTE1MxUxNTMVBTUzFQc1MxUHNTMVBzUzFQc1MxUHNTMVAQCAgID+gICAgICA/oCAgICAgICAgICAgAOAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAEQAA/4ACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwAAATUzFQc1MxUFNTMVMTUzFTE1MxUxNTMVMTUzFQU1MxUFNTMVMTUzFTE1MxUxNTMVMTUzFQU1MxUHNTMVBzUzFQc1MxUBAICAgP6AgICAgID+gID+gICAgICA/oCAgICAgICAA4CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAAAwCAAwACAAQAAAMABwALAAABNTMVBTUzFTM1MxUBAID/AICAgAOAgICAgICAgAAACwAAAIADAAMAAAMABwALAA8AEwAXABsAHwAjACcAKwAAEzUzFSE1MxUFNTMVMzUzFQU1MxUFNTMVMzUzFTM1MxUFNTMVITUzFTM1MxWAgAEAgP4AgICA/wCA/wCAgICAgP0AgAEAgICAAoCAgICAgICAgICAgICAgICAgICAgICAgICAgAAAABIAAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMARwAAEzUzFTM1MxUFNTMVATUzFTE1MxUxNTMVMTUzFQU1MxUHNTMVMTUzFTE1MxUxNTMVMTUzFQc1MxUFNTMVMTUzFTE1MxUxNTMVgICAgP8AgP8AgICAgP2AgICAgICAgICA/YCAgICAA4CAgICAgICA/wCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAFAIAAAAIAAoAAAwAHAAsADwATAAABNTMVBTUzFQU1Mx0BNTMdATUzFQGAgP8AgP8AgICAAgCAgICAgICAgICAgICAgAAAAAATAAAAAAMAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcASwAAEzUzFTE1MxUzNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUzNTMVMTUzFYCAgICAgP0AgAEAgP4AgAEAgP4AgAEAgID9gIABAID+AIABAID+gICAgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAQAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwAAEzUzFTM1MxUFNTMVATUzFTE1MxUxNTMVMTUzFTE1MxUFNTMVBTUzFQU1MxUFNTMVMTUzFTE1MxUxNTMVMTUzFYCAgID/AID+gICAgICA/wCA/wCA/wCA/wCAgICAgAOAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAADAQACgAIABAAAAwAHAAsAAAE1MxUHNTMdATUzFQEAgICAgAOAgICAgICAgIAAAAADAQACgAIABAAAAwAHAAsAAAE1MxUHNTMVBTUzFQGAgICA/wCAA4CAgICAgICAgAAGAIACgAKABAAAAwAHAAsADwATABcAABM1MxUzNTMVBTUzFTM1MxUFNTMVMzUzFYCAgID+gICAgP8AgICAA4CAgICAgICAgICAgICAgAAAAAYAgAKAAoAEAAADAAcACwAPABMAFwAAATUzFTM1MxUFNTMVMzUzFQU1MxUzNTMVAQCAgID+gICAgP4AgICAA4CAgICAgICAgICAgICAgAAABAEAAQACAAIAAAMABwALAA8AAAE1MxUxNTMVBTUzFTE1MxUBAICA/wCAgAGAgICAgICAgICAAAAFAAABAAKAAYAAAwAHAAsADwATAAARNTMVMTUzFTE1MxUxNTMVMTUzFYCAgICAAQCAgICAgICAgICAAAAGAAABAAMAAYAAAwAHAAsADwATABcAABE1MxUxNTMVMTUzFTE1MxUxNTMVMTUzFYCAgICAgAEAgICAgICAgICAgICAAAQAgAEAAoACAAADAAcACwAPAAABNTMVMzUzFQU1MxUzNTMVAQCAgID+AICAgAGAgICAgICAgICAAAAAABAAAACAAwACgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AAARNTMVMTUzFTE1MxUxNTMVMTUzFTE1MxUFNTMVMzUzFTE1MxUxNTMVBTUzFTM1MxUzNTMVBTUzFTM1MxUzNTMVgICAgICA/YCAgICAgP2AgICAgID9gICAgICAAgCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAQAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwAAEzUzFTM1MxUFNTMVATUzFTE1MxUxNTMVMTUzFQU1Mx0BNTMVMTUzFTE1Mx0BNTMVBTUzFTE1MxUxNTMVMTUzFYCAgID/AID/AICAgID9gICAgICA/YCAgICAA4CAgICAgICA/wCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAUBAAAAAoACgAADAAcACwAPABMAAAE1Mx0BNTMdATUzFQU1MxUFNTMVAQCAgID/AID/AIACAICAgICAgICAgICAgICAAAAAAA8AAAAAAwACgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwAAEzUzFTE1MxUzNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUxNTMVBTUzFSE1MxUFNTMVMTUzFTM1MxUxNTMVgICAgICA/QCAAQCA/gCAAQCAgP2AgAEAgP6AgICAgIACAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAQAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwAAEzUzFTM1MxUFNTMVATUzFTE1MxUxNTMVMTUzFTE1MxUFNTMVBTUzFQU1MxUFNTMVMTUzFTE1MxUxNTMVMTUzFYCAgID/AID+gICAgICA/wCA/wCA/wCA/wCAgICAgAOAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAANAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwAAEzUzFTM1MxUBNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUFNTMVBzUzFYCAgID+AIABgID9gIABgID9gIABgID+AICAgP8AgICAA4CAgICA/wCAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAABgEAAAABgAOAAAMABwALAA8AEwAXAAABNTMVAzUzFQc1MxUHNTMVBzUzFQc1MxUBAICAgICAgICAgICAAwCAgP8AgICAgICAgICAgICAgIAAAAAADACAAAACgAMAAAMABwALAA8AEwAXABsAHwAjACcAKwAvAAABNTMVBTUzFTE1MxUxNTMVBTUzFTM1MxUFNTMVMzUzFQU1MxUxNTMVMTUzFQU1MxUBgID/AICAgP4AgICA/oCAgID/AICAgP8AgAKAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAAEAAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AAAE1MxUxNTMVBTUzFQc1MxUFNTMVMTUzFTE1MxUxNTMVBTUzFQU1MxUFNTMVBzUzFTE1MxUxNTMVMTUzFTE1MxUBgICA/oCAgID/AICAgID+gID/AID/AICAgICAgIADgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAEAAAAAADAAMAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AABE1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVBTUzFSE1MxWAAgCA/YCAgICA/gCAAQCA/gCAAQCA/gCAgICA/YCAAgCAAoCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAAA8AAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwAAETUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFQU1MxUFNTMVMTUzFTE1MxUxNTMVMTUzFQU1MxUHNTMVgAGAgP2AgAGAgP4AgICA/wCA/oCAgICAgP6AgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAIAQD/gAGABAAAAwAHAAsADwATABcAGwAfAAABNTMVBzUzFQc1MxUHNTMVAzUzFQc1MxUHNTMVBzUzFQEAgICAgICAgICAgICAgICAA4CAgICAgICAgICAgP8AgICAgICAgICAgIAAABIAAP8AAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMARwAAATUzFTE1MxUFNTMVBzUzFQU1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUFNTMVBzUzFQU1MxUxNTMVAYCAgP6AgICA/wCAgID+AIABgID9gIABgID+AICAgP8AgICA/oCAgAOAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAACAIADAAIAA4AAAwAHAAATNTMVMzUzFYCAgIADAICAgIAAAAAXAAAAAAMAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcASwBPAFMAVwBbAAATNTMVMTUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVMzUzFTE1MxUzNTMVBTUzFTM1MxUhNTMVBTUzFTM1MxUxNTMVMzUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFYCAgICA/YCAAgCA/QCAgICAgID9AICAgAEAgP0AgICAgICA/QCAAgCA/YCAgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAIAIABgAIABAAAAwAHAAsADwATABcAGwAfAAABNTMdATUzFQU1MxUxNTMVBTUzFTM1MxUFNTMVMTUzFQEAgID/AICA/oCAgID/AICAA4CAgICAgICAgICAgICAgICAgICAgAAACgAAAAADAAKAAAMABwALAA8AEwAXABsAHwAjACcAAAE1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUBAIABAID9gIABAID9gIABAID+gIABAID+gIABAIACAICAgICAgICAgICAgICAgICAgICAgICAgAAHAIAAAAKAAgAAAwAHAAsADwATABcAGwAAEzUzFTE1MxUxNTMVMTUzFQc1MxUHNTMVBzUzFYCAgICAgICAgICAAYCAgICAgICAgICAgICAgICAgAAVAAAAAAMAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcASwBPAFMAABM1MxUxNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVMzUzFQU1MxUzNTMVITUzFQU1MxUzNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFYCAgICA/YCAAgCA/QCAAQCAgID9AICAgAEAgP0AgICAAQCA/QCAAgCA/YCAgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAUAAAMAAoADgAADAAcACwAPABMAABE1MxUxNTMVMTUzFTE1MxUxNTMVgICAgIADAICAgICAgICAgIAAAAQAgAIAAgADgAADAAcACwAPAAABNTMVBTUzFTM1MxUFNTMVAQCA/wCAgID/AIADAICAgICAgICAgIAAAA4AAAAAAoADAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAAAE1MxUHNTMVBTUzFTE1MxUxNTMVMTUzFTE1MxUFNTMVBzUzFQU1MxUxNTMVMTUzFTE1MxUxNTMVAQCAgID+gICAgICA/oCAgID+gICAgICAAoCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAgAgAGAAgAEAAADAAcACwAPABMAFwAbAB8AABM1MxUxNTMdATUzFQU1MxUFNTMVBzUzFTE1MxUxNTMVgICAgP8AgP8AgICAgIADgICAgICAgICAgICAgICAgICAgICAAAgAgAGAAgAEAAADAAcACwAPABMAFwAbAB8AABM1MxUxNTMdATUzFQU1MxUxNTMdATUzFQU1MxUxNTMVgICAgP6AgICA/oCAgAOAgICAgICAgICAgICAgICAgICAgIAAAAIBAAMAAgAEAAADAAcAAAE1MxUFNTMVAYCA/wCAA4CAgICAgAAAAAAOAAD/AAMAAoAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3AAATNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTM1MxUFNTMVBTUzFYCAAQCA/gCAAQCA/gCAAQCA/gCAAQCA/gCAgICAgP2AgP8AgAIAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAaAAD/AAMAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcASwBPAFMAVwBbAF8AYwBnAAATNTMVMTUzFTE1MxUxNTMVMTUzFQU1MxUxNTMVMTUzFTM1MxUFNTMVMTUzFTE1MxUzNTMVBTUzFTE1MxUzNTMVBTUzFTM1MxUFNTMVMzUzFQU1MxUzNTMVBTUzFTM1MxUFNTMVMzUzFYCAgICAgP0AgICAgID9gICAgICA/gCAgICA/oCAgID+gICAgP6AgICA/oCAgID+gICAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAAAEBAAGAAYACAAADAAABNTMVAQCAAYCAgAAAAAAEAQD/AAIAAIAAAwAHAAsADwAAITUzFTE1MxUHNTMVBTUzFQEAgICAgP8AgICAgICAgICAgIAAAAgAgAGAAgAEAAADAAcACwAPABMAFwAbAB8AAAE1MxUFNTMVMTUzFQc1MxUHNTMVBTUzFTE1MxUxNTMVAQCA/wCAgICAgID/AICAgAOAgICAgICAgICAgICAgICAgICAgIAAAAAGAIACAAIABAAAAwAHAAsADwATABcAAAE1MxUFNTMVMzUzFQU1MxUzNTMVBTUzFQEAgP8AgICA/oCAgID/AIADgICAgICAgICAgICAgICAgAAAAAAKAAAAAAMAAoAAAwAHAAsADwATABcAGwAfACMAJwAAETUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFYABAID+gIABAID+gIABAID9gIABAID9gIABAIACAICAgICAgICAgICAgICAgICAgICAgICAgAAAABMAAP+AAwAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMARwBLAAABNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMzUzFTE1MxUFNTMVMzUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVAgCA/YCAAYCA/YCAAQCA/gCAAQCA/wCAAQCA/gCAgICA/YCAgICAgP2AgAGAgP0AgAOAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAEgAA/4ADAAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwBHAAABNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTM1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVMTUzFQU1MxUCAID9gIABgID9gIABAID+AIABAID/AICAgID+AIABAID9gIABAID+AIABAICA/QCAA4CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAFgAA/4ADAAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwBHAEsATwBTAFcAABE1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTM1MxUFNTMVMzUzFQU1MxUzNTMVITUzFQU1MxUzNTMVMTUzFQU1MxUzNTMVMTUzFTE1MxUFNTMVITUzFQU1MxWAAYCA/gCAAQCA/YCAgICA/oCAgID+AICAgAEAgP4AgICAgP2AgICAgID9gIABgID9AIADgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAACQAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjAAABNTMVAzUzHQE1Mx0BNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUBAICAgICA/YCAAYCA/gCAgIADAICA/wCAgICAgICAgICAgICAgICAgICAgAAAAAwAAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAAEzUzHQE1MxUDNTMVBTUzFTM1MxUFNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVgICAgID/AICAgP6AgICA/gCAAYCA/YCAAYCAA4CAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAAAwAAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAAATUzFQU1MxURNTMVBTUzFTM1MxUFNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVAQCA/wCAgP8AgICA/oCAgID+AIABgID9gIABgIADgICAgICA/wCAgICAgICAgICAgICAgICAgICAgICAgIAAAAANAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwAAATUzFQU1MxUzNTMVATUzFQU1MxUzNTMVBTUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQEAgP8AgICA/wCA/wCAgID+gICAgP4AgAGAgP2AgAGAgAOAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAAAAADgAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwAAATUzFTM1MxUFNTMVMzUzFQE1MxUFNTMVMzUzFQU1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUBAICAgP4AgICA/wCA/wCAgID+gICAgP4AgAGAgP2AgAGAgAOAgICAgICAgICA/wCAgICAgICAgICAgICAgICAgICAgICAgIAADAAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvAAATNTMVMzUzFQE1MxUFNTMVMzUzFQU1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxWAgICA/wCA/wCAgID+gICAgP4AgAGAgP2AgAGAgAMAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAAAAAAA4AAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAAAE1MxUFNTMVMzUzFQU1MxUHNTMVBTUzFTM1MxUFNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVAQCA/wCAgID/AICAgP8AgICA/oCAgID+AIABgID9gIABgIADgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAABQAAAAAAwADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMARwBLAE8AAAE1MxUxNTMVMTUzFTE1MxUFNTMVMzUzFQU1MxUzNTMVBTUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFTE1MxUxNTMVAQCAgICA/YCAgID+gICAgP6AgICAgP2AgAEAgP4AgAEAgP4AgAEAgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAADwAA/wACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AAATNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUHNTMVBzUzFQc1MxUhNTMVBTUzFTE1MxUxNTMVBTUzFQU1MxWAgICA/gCAAYCA/YCAgICAgICAAYCA/gCAgID/AID/AIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAASAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcAABM1Mx0BNTMVATUzFTE1MxUxNTMVMTUzFTE1MxUFNTMVBzUzFTE1MxUxNTMVMTUzFQU1MxUHNTMVMTUzFTE1MxUxNTMVMTUzFYCAgP6AgICAgID9gICAgICAgP4AgICAgICAgAOAgICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAASAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcAAAE1MxUFNTMVATUzFTE1MxUxNTMVMTUzFTE1MxUFNTMVBzUzFTE1MxUxNTMVMTUzFQU1MxUHNTMVMTUzFTE1MxUxNTMVMTUzFQEAgP8AgP8AgICAgID9gICAgICAgP4AgICAgICAgAOAgICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAEwAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwBHAEsAAAE1MxUFNTMVMzUzFQE1MxUxNTMVMTUzFTE1MxUxNTMVBTUzFQc1MxUxNTMVMTUzFTE1MxUFNTMVBzUzFTE1MxUxNTMVMTUzFTE1MxUBAID/AICAgP4AgICAgID9gICAgICAgP4AgICAgICAgAOAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAABIAAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMARwAAEzUzFTM1MxUBNTMVMTUzFTE1MxUxNTMVMTUzFQU1MxUHNTMVMTUzFTE1MxUxNTMVBTUzFQc1MxUxNTMVMTUzFTE1MxUxNTMVgICAgP4AgICAgID9gICAgICAgP4AgICAgICAgAMAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAsAgAAAAgAEAAADAAcACwAPABMAFwAbAB8AIwAnACsAABM1Mx0BNTMVATUzFTE1MxUxNTMVBTUzFQc1MxUHNTMVBTUzFTE1MxUxNTMVgICA/wCAgID/AICAgICA/wCAgIADgICAgICA/wCAgICAgICAgICAgICAgICAgICAgICAAAAAAAsAgAAAAgAEAAADAAcACwAPABMAFwAbAB8AIwAnACsAAAE1MxUFNTMVAzUzFTE1MxUxNTMVBTUzFQc1MxUHNTMVBTUzFTE1MxUxNTMVAQCA/wCAgICAgP8AgICAgID/AICAgAOAgICAgID/AICAgICAgICAgICAgICAgICAgICAgIAAAAwAgAAAAgAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAAATUzFQU1MxUzNTMVATUzFTE1MxUxNTMVBTUzFQc1MxUHNTMVBTUzFTE1MxUxNTMVAQCA/wCAgID+gICAgP8AgICAgID/AICAgAOAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgAAAAAsAgAAAAgADgAADAAcACwAPABMAFwAbAB8AIwAnACsAABM1MxUzNTMVATUzFTE1MxUxNTMVBTUzFQc1MxUHNTMVBTUzFTE1MxUxNTMVgICAgP6AgICA/wCAgICAgP8AgICAAwCAgICA/wCAgICAgICAgICAgICAgICAgICAgICAAAAAABMAAAAAAwADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMARwBLAAATNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFTM1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVgICAgP6AgAEAgP4AgAGAgP0AgICAgICA/YCAAYCA/YCAAQCA/gCAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAABMAAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMARwBLAAABNTMVMzUzFQU1MxUzNTMVATUzFTE1MxUhNTMVBTUzFTM1MxUzNTMVBTUzFTM1MxUzNTMVBTUzFSE1MxUxNTMVBTUzFSE1MxUxNTMVAQCAgID+AICAgP4AgIABAID9gICAgICA/YCAgICAgP2AgAEAgID9gIABAICAA4CAgICAgICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAOAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3AAATNTMdATUzFQE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFYCAgP8AgICA/gCAAYCA/YCAAYCA/YCAAYCA/gCAgIADgICAgICA/wCAgICAgICAgICAgICAgICAgICAgICAgICAgICAAA4AAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAAAE1MxUFNTMVAzUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVAQCA/wCAgICAgP4AgAGAgP2AgAGAgP2AgAGAgP4AgICAA4CAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAA8AAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwAAATUzFQU1MxUzNTMVATUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVAQCA/wCAgID+gICAgP4AgAGAgP2AgAGAgP2AgAGAgP4AgICAA4CAgICAgICA/wCAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAABAAAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AAABNTMVMzUzFQU1MxUzNTMVATUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVAQCAgID+AICAgP6AgICA/gCAAYCA/YCAAYCA/YCAAYCA/gCAgIADgICAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAADgAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwAAEzUzFTM1MxUBNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxWAgICA/oCAgID+AIABgID9gIABgID9gIABgID+AICAgAMAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAJAAAAgAKAAwAAAwAHAAsADwATABcAGwAfACMAABE1MxUhNTMVBTUzFTM1MxUFNTMVBTUzFTM1MxUFNTMVITUzFYABgID+AICAgP8AgP8AgICA/gCAAYCAAoCAgICAgICAgICAgICAgICAgICAgICAAAAAABAAAAAAAwADAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AAABNTMVMTUzFTM1MxUFNTMVITUzFQU1MxUzNTMVMTUzFQU1MxUxNTMVMzUzFQU1MxUhNTMVBTUzFTM1MxUxNTMVAQCAgICA/YCAAQCA/gCAgICA/gCAgICA/gCAAQCA/YCAgICAAoCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAANAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwAAEzUzHQE1MxUBNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFYCAgP6AgAGAgP2AgAGAgP2AgAGAgP2AgAGAgP4AgICAA4CAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAADQAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMAAAE1MxUFNTMVATUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUBAID/AID/AIABgID9gIABgID9gIABgID9gIABgID+AICAgAOAgICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAAA4AAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAAAE1MxUFNTMVMzUzFQE1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVAQCA/wCAgID+AIABgID9gIABgID9gIABgID9gIABgID+AICAgAOAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAANAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwAAEzUzFTM1MxUBNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFYCAgID+AIABgID9gIABgID9gIABgID9gIABgID+AICAgAMAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAADQAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMAAAE1MxUFNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVBTUzFQc1MxUBgID/AID+gIABgID9gIABgID9gIABgID+AICAgP8AgICAA4CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAA4AgP+AAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAABM1MxUHNTMVBzUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFQU1MxUHNTMVgICAgICAgID+gIABAID+AIABAID+AICAgP6AgICAAwCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAEgAA/4ACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwBHAAATNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFQU1MxWAgICA/oCAAQCA/gCAAQCA/gCAgID+gIABAID+AIABAID+AICAgP4AgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAABAAAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AAATNTMdATUzFQE1MxUxNTMVMTUzHQE1MxUFNTMVMTUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVgICA/wCAgICA/gCAgICA/YCAAYCA/gCAgICAA4CAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAEAAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AAAE1MxUFNTMVAzUzFTE1MxUxNTMdATUzFQU1MxUxNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUBAID/AICAgICAgP4AgICAgP2AgAGAgP4AgICAgAOAgICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAEQAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwAAATUzFQU1MxUzNTMVATUzFTE1MxUxNTMdATUzFQU1MxUxNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUBAID/AICAgP6AgICAgP4AgICAgP2AgAGAgP4AgICAgAOAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAAEgAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwBHAAABNTMVMzUzFQU1MxUzNTMVATUzFTE1MxUxNTMdATUzFQU1MxUxNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUBAICAgP4AgICA/oCAgICA/gCAgICA/YCAAYCA/gCAgICAA4CAgICAgICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAQAAAAAAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwAAEzUzFTM1MxUBNTMVMTUzFTE1Mx0BNTMVBTUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFYCAgID+gICAgID+AICAgID9gIABgID+AICAgIADAICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAABIAAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMARwAAATUzFQU1MxUzNTMVBTUzFQU1MxUxNTMVMTUzHQE1MxUFNTMVMTUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVAQCA/wCAgID/AID/AICAgID+AICAgID9gIABgID+AICAgIADgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAADwAAAAADAAKAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AAATNTMVMTUzFTM1MxUFNTMVMzUzFQU1MxUxNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUxNTMVMzUzFTE1MxWAgICAgP8AgICA/YCAgICA/YCAAQCA/oCAgICAgAIAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAADQAA/wACgAKAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMAABM1MxUxNTMVMTUzFTE1MxUFNTMVBzUzFQc1Mx0BNTMVMTUzFTE1MxUxNTMVBTUzFQU1MxWAgICAgP2AgICAgICAgICA/oCA/wCAAgCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAABEAAAAAAoAEAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMAABM1Mx0BNTMVATUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVMTUzFQU1Mx0BNTMVMTUzFTE1MxUxNTMVgICA/wCAgID+AIABgID9gICAgICA/YCAgICAgAOAgICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAAEQAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwAAATUzFQU1MxUDNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUxNTMVBTUzHQE1MxUxNTMVMTUzFTE1MxUBAID/AICAgICA/gCAAYCA/YCAgICAgP2AgICAgIADgICAgICA/wCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAASAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcAAAE1MxUFNTMVMzUzFQE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFTE1MxUFNTMdATUzFTE1MxUxNTMVMTUzFQEAgP8AgICA/oCAgID+AIABgID9gICAgICA/YCAgICAgAOAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAABEAAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AEMAABM1MxUzNTMVATUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVMTUzFQU1Mx0BNTMVMTUzFTE1MxUxNTMVgICAgP6AgICA/gCAAYCA/YCAgICAgP2AgICAgIADAICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAACACAAAABgAQAAAMABwALAA8AEwAXABsAHwAAEzUzHQE1MxUBNTMVMTUzFQc1MxUHNTMVBzUzFQc1MxWAgID/AICAgICAgICAgIADgICAgICA/wCAgICAgICAgICAgICAgICAAAgAgAAAAYAEAAADAAcACwAPABMAFwAbAB8AAAE1MxUFNTMVAzUzFTE1MxUHNTMVBzUzFQc1MxUHNTMVAQCA/wCAgICAgICAgICAgIADgICAgICA/wCAgICAgICAgICAgICAgICAAAAACQCAAAACAAQAAAMABwALAA8AEwAXABsAHwAjAAABNTMVBTUzFTM1MxUBNTMVMTUzFQc1MxUHNTMVBzUzFQc1MxUBAID/AICAgP6AgICAgICAgICAgAOAgICAgICAgP8AgICAgICAgICAgICAgICAgAAAAAAIAIAAAAIAA4AAAwAHAAsADwATABcAGwAfAAATNTMVMzUzFQE1MxUxNTMVBzUzFQc1MxUHNTMVBzUzFYCAgID+gICAgICAgICAgIADAICAgID/AICAgICAgICAgICAgICAgIAAEAAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AABM1MxUxNTMVMzUzFQU1Mx0BNTMVBTUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxWAgICAgP8AgID+AICAgID9gIABgID9gIABgID+AICAgAMAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAEAAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AAAE1MxUzNTMVBTUzFTM1MxUBNTMVMTUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUBAICAgP4AgICA/gCAgICA/gCAAYCA/YCAAYCA/YCAAYCA/YCAAYCAA4CAgICAgICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAADgAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwAAEzUzHQE1MxUBNTMVMTUzFTE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxWAgID/AICAgP4AgAGAgP2AgAGAgP2AgAGAgP4AgICAA4CAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAOAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3AAABNTMVBTUzFQM1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFQEAgP8AgICAgID+AIABgID9gIABgID9gIABgID+AICAgAOAgICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAPAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAAAE1MxUFNTMVMzUzFQE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFQEAgP8AgICA/oCAgID+AIABgID9gIABgID9gIABgID+AICAgAOAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAAAQAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwAAEzUzFTM1MxUFNTMVMzUzFQE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFYCAgID+AICAgP8AgICA/gCAAYCA/YCAAYCA/YCAAYCA/gCAgIADgICAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAA4AAAAAAoADgAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAABM1MxUzNTMVATUzFTE1MxUxNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVgICAgP6AgICA/gCAAYCA/YCAAYCA/YCAAYCA/gCAgIADAICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgIAABwAAAIACgAMAAAMABwALAA8AEwAXABsAAAE1MxUBNTMVMTUzFTE1MxUxNTMVMTUzFQE1MxUBAID+gICAgICA/oCAAoCAgP8AgICAgICAgICAgP8AgIAAABAAAAAAAwADAAADAAcACwAPABMAFwAbAB8AIwAnACsALwAzADcAOwA/AAABNTMVMTUzFTM1MxUFNTMVITUzFQU1MxUzNTMVMTUzFQU1MxUxNTMVMzUzFQU1MxUhNTMVBTUzFTM1MxUxNTMVAQCAgICA/YCAAQCA/gCAgICA/gCAgICA/gCAAQCA/YCAgICAAoCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAOAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3AAATNTMdATUzFQE1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFYCAgP6AgAGAgP2AgAGAgP2AgAGAgP2AgAGAgP4AgICAgAOAgICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAOAAAAAAKABAAAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3AAABNTMVBTUzFQE1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFQEAgP8AgP8AgAGAgP2AgAGAgP2AgAGAgP2AgAGAgP4AgICAgAOAgICAgID/AICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAAADwAAAAACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AAABNTMVBTUzFTM1MxUBNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUBAID/AICAgP4AgAGAgP2AgAGAgP2AgAGAgP2AgAGAgP4AgICAgAOAgICAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAADgAAAAACgAOAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwAAEzUzFTM1MxUBNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxWAgICA/gCAAYCA/YCAAYCA/YCAAYCA/YCAAYCA/gCAgICAAwCAgICA/wCAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAAAEgAA/wACgAQAAAMABwALAA8AEwAXABsAHwAjACcAKwAvADMANwA7AD8AQwBHAAABNTMVBTUzFQE1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFTE1MxUxNTMVMTUzFQc1MxUFNTMVMTUzFTE1MxUBAID/AID/AIABgID9gIABgID9gIABgID9gIABgID+AICAgICAgP4AgICAA4CAgICAgP8AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAAAAASAAD/AAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcAABE1MxUHNTMVBzUzFTE1MxUxNTMVMTUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVITUzFQU1MxUxNTMVMTUzFTE1MxUFNTMVBzUzFYCAgICAgICA/gCAAYCA/YCAAYCA/YCAAYCA/YCAgICA/gCAgIADAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAAAASAAD/AAKAA4AAAwAHAAsADwATABcAGwAfACMAJwArAC8AMwA3ADsAPwBDAEcAABM1MxUzNTMVATUzFSE1MxUFNTMVITUzFQU1MxUhNTMVBTUzFSE1MxUFNTMVMTUzFTE1MxUxNTMVBzUzFQU1MxUxNTMVMTUzFYCAgID+AIABgID9gIABgID9gIABgID9gIABgID+AICAgICAgP4AgICAAwCAgICA/wCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgAAAAAAVAQIAAAAAAAAAAAAkAEcAAAAAAAAAAQAYAIEAAAAAAAAAAgAOAGsAAAAAAAAAAwAYAIEAAAAAAAAABAAYAIEAAAAAAAAABQAUAAAAAAAAAAAABgAYAIEAAQAAAAAAAAASABQAAQAAAAAAAQAMADEAAQAAAAAAAgAHACYAAQAAAAAAAwAQAC0AAQAAAAAABAAMADEAAQAAAAAABQAKAD0AAQAAAAAABgAMADEAAwABBAkAAAAkAEcAAwABBAkAAQAYAIEAAwABBAkAAgAOAGsAAwABBAkAAwAgAHkAAwABBAkABAAYAIEAAwABBAkABQAUAAAAAwABBAkABgAYAIEAMgAwADAANAAvADAANAAvADEANWJ5IFRyaXN0YW4gR3JpbW1lclJlZ3VsYXJUVFggUHJvZ2d5VGlueVRUMjAwNC8wNC8xNQBiAHkAIABUAHIAaQBzAHQAYQBuACAARwByAGkAbQBtAGUAcgBSAGUAZwB1AGwAYQByAFQAVABYACAAUAByAG8AZwBnAHkAVABpAG4AeQBUAFQAAAIAAAAAAAAAAAAUAAAAAQAAAAAAAAAAAAAAAAAAAAABAQAAAAEBAgEDAQQBBQEGAQcBCAEJAQoBCwEMAQ0BDgEPARABEQESARMBFAEVARYBFwEYARkBGgEbARwBHQEeAR8BIAADAAQABQAGAAcACAAJAAoACwAMAA0ADgAPABAAEQASABMAFAAVABYAFwAYABkAGgAbABwAHQAeAB8AIAAhACIAIwAkACUAJgAnACgAKQAqACsALAAtAC4ALwAwADEAMgAzADQANQA2ADcAOAA5ADoAOwA8AD0APgA/AEAAQQBCAEMARABFAEYARwBIAEkASgBLAEwATQBOAE8AUABRAFIAUwBUAFUAVgBXAFgAWQBaAFsAXABdAF4AXwBgAGEBIQEiASMBJAElASYBJwEoASkBKgErASwBLQEuAS8BMAExATIBMwE0ATUBNgE3ATgBOQE6ATsBPAE9AT4BPwFAAUEArACjAIQAhQC9AJYA6ACGAI4AiwCdAKkApADvAIoA2gCDAJMA8gDzAI0AlwCIAMMA3gDxAJ4AqgD1APQA9gCiAK0AyQDHAK4AYgBjAJAAZADLAGUAyADKAM8AzADNAM4A6QBmANMA0ADRAK8AZwDwAJEA1gDUANUAaADrAO0AiQBqAGkAawBtAGwAbgCgAG8AcQBwAHIAcwB1AHQAdgB3AOoAeAB6AHkAewB9AHwAuAChAH8AfgCAAIEA7ADuALoOdW5pY29kZSMweDAwMDEOdW5pY29kZSMweDAwMDIOdW5pY29kZSMweDAwMDMOdW5pY29kZSMweDAwMDQOdW5pY29kZSMweDAwMDUOdW5pY29kZSMweDAwMDYOdW5pY29kZSMweDAwMDcOdW5pY29kZSMweDAwMDgOdW5pY29kZSMweDAwMDkOdW5pY29kZSMweDAwMGEOdW5pY29kZSMweDAwMGIOdW5pY29kZSMweDAwMGMOdW5pY29kZSMweDAwMGQOdW5pY29kZSMweDAwMGUOdW5pY29kZSMweDAwMGYOdW5pY29kZSMweDAwMTAOdW5pY29kZSMweDAwMTEOdW5pY29kZSMweDAwMTIOdW5pY29kZSMweDAwMTMOdW5pY29kZSMweDAwMTQOdW5pY29kZSMweDAwMTUOdW5pY29kZSMweDAwMTYOdW5pY29kZSMweDAwMTcOdW5pY29kZSMweDAwMTgOdW5pY29kZSMweDAwMTkOdW5pY29kZSMweDAwMWEOdW5pY29kZSMweDAwMWIOdW5pY29kZSMweDAwMWMOdW5pY29kZSMweDAwMWQOdW5pY29kZSMweDAwMWUOdW5pY29kZSMweDAwMWYGZGVsZXRlBEV1cm8OdW5pY29kZSMweDAwODEOdW5pY29kZSMweDAwODIOdW5pY29kZSMweDAwODMOdW5pY29kZSMweDAwODQOdW5pY29kZSMweDAwODUOdW5pY29kZSMweDAwODYOdW5pY29kZSMweDAwODcOdW5pY29kZSMweDAwODgOdW5pY29kZSMweDAwODkOdW5pY29kZSMweDAwOGEOdW5pY29kZSMweDAwOGIOdW5pY29kZSMweDAwOGMOdW5pY29kZSMweDAwOGQOdW5pY29kZSMweDAwOGUOdW5pY29kZSMweDAwOGYOdW5pY29kZSMweDAwOTAOdW5pY29kZSMweDAwOTEOdW5pY29kZSMweDAwOTIOdW5pY29kZSMweDAwOTMOdW5pY29kZSMweDAwOTQOdW5pY29kZSMweDAwOTUOdW5pY29kZSMweDAwOTYOdW5pY29kZSMweDAwOTcOdW5pY29kZSMweDAwOTgOdW5pY29kZSMweDAwOTkOdW5pY29kZSMweDAwOWEOdW5pY29kZSMweDAwOWIOdW5pY29kZSMweDAwOWMOdW5pY29kZSMweDAwOWQOdW5pY29kZSMweDAwOWUOdW5pY29kZSMweDAwOWYAAA=="),
 }))

 --keybinds
 local Keybinds = CloneScreenGui
 local Background = Instance.new("Frame", Keybinds)
 local Gradient = Instance.new("Frame", Background)
 local KeybindGradient = Instance.new("UIGradient", Gradient)
 local Tab = Instance.new("Frame", Background)
 local Name = Instance.new("TextLabel", Background)
 local Element = Instance.new("Frame", Background)
 local UIListLayout = Instance.new("UIListLayout", Tab)
 local Name_2 = Instance.new("TextLabel", Tab)
 
 Keybinds.Name = "Keybinds"
 Keybinds.Parent = CloneCore
 Keybinds.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 Keybinds.ResetOnSpawn = false
 
 Background.Name = "Background"
 Background.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
 Background.BorderColor3 = Color3.fromRGB(25, 25, 25)
 Background.Position = UDim2.new(0.01, 0, 0.488, 0)
 Background.Size = UDim2.new(0, 180, 0, 24)
 Background.Visible = false
 
 Gradient.Name = "Gradient"
 Gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Gradient.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Gradient.BorderSizePixel = 0
 Gradient.Position = UDim2.new(0, 0, 0, 1)
 Gradient.Size = UDim2.new(0, 180, 0, 1)
 
 KeybindGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(61, 255, 200)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
 
 Name.Name = "Name"
 Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Name.BackgroundTransparency = 1.000
 Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Name.BorderSizePixel = 0
 Name.Size = UDim2.new(0, 175, 0, 28)
 Name.FontFace = Fonts.ProggyTiny
 Name.Text = "[<font color=\"rgb(61, 255, 200)\">Keybinds</font>]"
 Name.TextColor3 = Color3.fromRGB(255, 255, 255)
 Name.TextSize = 9
 Name.RichText = true
 Name.BorderSizePixel = 1
 
 Element.Name = "Element"
 Element.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
 Element.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Element.BorderSizePixel = 0
 Element.Position = UDim2.new(0, 0, 1, 0)
 Element.Size = UDim2.new(0, 140, 0, 1)
 
 Tab.Name = "Tab"
 Tab.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
 Tab.BackgroundTransparency = 0
 Tab.BorderSizePixel = 1
 Tab.BorderMode = "Inset"
 Tab.BorderColor3 = Color3.fromRGB(25, 25, 25)
 Tab.Position = UDim2.new(-0.007, 0, 1.833, 0)
 Tab.Size = UDim2.new(1.01199996, 0, 0, -20)
 
 UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
 UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
 
 Name_2.Name = "Name"
 Name_2.AnchorPoint = Vector2.new(0.5, 0.5)
 Name_2.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
 Name_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Name_2.BorderSizePixel = 0
 Name_2.Position = UDim2.new(0.5, 0, -1.85000002, 0)
 Name_2.Size = UDim2.new(1, 0, 1, 0)
 Name_2.FontFace = Fonts.ProggyTiny
 Name_2.Text = "Silent Aim: <font color=\"rgb(61, 255, 200)\">[MB1]</font>"
 Name_2.TextColor3 = Color3.fromRGB(125, 125, 125)
 Name_2.TextSize = 9
 Name_2.BorderSizePixel = 1
 Name_2.RichText = true
 Name_2.Visible = false
 
 local dragging
 local dragInput
 local dragStart
 local startPos
 
 Background.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
       dragging = true
       dragStart = input.Position
       startPos = Background.Position
 
       input.Changed:Connect(function()
          if input.UserInputState == Enum.UserInputState.End then
             dragging = false
          end
       end)
    end
 end)
 
 Background.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
       dragInput = input
    end
 end)
 
 game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
       local delta = input.Position - dragStart
       Background.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
 end)
 
 local function createWatermark()
    local Watermark = {}

    local WatermarkGui = CloneScreenGui
    local WatermarkFrame = Instance.new("Frame", WatermarkGui)
    local WaterMarkLabel = Instance.new("TextLabel", WatermarkFrame)
    local WatermarkGradient = Instance.new("UIGradient", WatermarkFrame)
    local WatermarkStroke = Instance.new("UIStroke", WatermarkFrame)
 
    WatermarkGui.Parent = CloneCore
    WatermarkGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    WatermarkFrame.Parent = WatermarkGui
    WatermarkFrame.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    WatermarkFrame.BorderColor3 = Color3.fromRGB(61, 255, 200)
    WatermarkFrame.BorderSizePixel = 2
    WatermarkFrame.Position = UDim2.new(0.0452012382, 33, 0.0223325081, -48)
    WatermarkFrame.Size = UDim2.new(0, 200, 0, 20)
    WatermarkFrame.Visible = false
    
    WaterMarkLabel.Parent = WatermarkFrame
    WaterMarkLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WaterMarkLabel.BackgroundTransparency = 1.000
    WaterMarkLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    WaterMarkLabel.BorderSizePixel = 0
    WaterMarkLabel.Position = UDim2.new(0, 0, 0, 0)
    WaterMarkLabel.FontFace = Fonts.ProggyTiny
    WaterMarkLabel.RichText = true
    WaterMarkLabel.Text = "Build: Private"
    WaterMarkLabel.TextColor3 = Color3.fromRGB(152, 152, 152)
    WaterMarkLabel.TextSize = 9
    WaterMarkLabel.TextWrapped = false
    
    WaterMarkLabel:GetPropertyChangedSignal("TextBounds"):Connect(function()
       local textSize = WaterMarkLabel.TextBounds
       local width = textSize.X + 10
       WatermarkFrame.Size = UDim2.new(0, width, 0, 20) 
       WaterMarkLabel.Size = UDim2.new(1, 0, 1, 0)
    end)
    
    WatermarkStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    WatermarkStroke.Color = Color3.fromRGB(71, 71, 71)
    WatermarkStroke.Thickness = 1
    WatermarkStroke.Parent = WatermarkFrame
    
    WatermarkGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(11, 11, 11)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(230, 230, 230))}
    WatermarkGradient.Rotation = 180
    WatermarkGradient.Parent = WatermarkFrame
    
    local function rotateGradient()
       local rotationAngle = WatermarkGradient.Rotation + 1
       WatermarkGradient.Rotation = rotationAngle
    end
 
    function Watermark:SetVisible(Visible)
       WatermarkFrame.Visible = Visible
    end
 
    function Watermark:Color(Color)
       WatermarkGradient.Color = ColorSequence.new{
           ColorSequenceKeypoint.new(0.00, Color3.fromRGB(11, 11, 11)),
           ColorSequenceKeypoint.new(1.00, Color)
       }
    end  
 
    local dragging
    local dragInput
    local dragStart
    local startPos
 
    WatermarkFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = WatermarkFrame.Position
 
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
 
    WatermarkFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
 
    game:GetService("UserInputService").InputChanged:Connect(function(input)
       if input == dragInput and dragging then
          local delta = input.Position - dragStart
          WatermarkFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
       end
    end)
 
    task.spawn(function()
       while task.wait() do
         rotateGradient()
         local time = os.date("%X", os.time())
         local ping = string.format('%.0f', game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
         local uid = "1"
         local fpsValue = string.split(game.Stats.Workspace.Heartbeat:GetValueString(), ".")[1]
         WaterMarkLabel.Text = 'Fatality.gg<font color="rgb(74, 74, 74)"></font> - uid: <font color="rgb(74, 74, 74)">' .. uid .. '</font> / fps: <font color="rgb(61, 255, 200)">' .. fpsValue .. '</font> / ping: <font color="rgb(61, 255, 200)">' .. ping .. '</font> / time: <font color="rgb(61, 255, 200)">' .. time .. '</font>'
       end
    end)
    return Watermark
 end
 
 local library = {
    Title = 'Fatality.gg<font color="rgb(74, 74, 74)"></font> | Private',
    keybind = Enum.KeyCode.RightBracket,
    Watermark = createWatermark(),
       Colors = {
          libColor = Color3.fromRGB(61, 255, 200),
          riskyColor = Color3.fromRGB(255, 0, 0),
          FontColor = Color3.fromRGB(255, 255, 255),
          MainColor = Color3.fromRGB(14, 14, 14),
          AccentColor = Color3.fromRGB(61, 255, 200),
          OutlineColor = Color3.fromRGB(15, 15, 15),
       },
       Enabled = true,
       colorpicking = false,
       scrolling = true,
       multiZindex = 200,
       blacklisted = {
          Enum.KeyCode.W,
          Enum.KeyCode.A,
          Enum.KeyCode.S,
          Enum.KeyCode.D,
          Enum.UserInputType.MouseMovement
       },
       tabbuttons = {},
       tabs = {},
       options = {},
       flags = {},
       toInvis = {},
       Registry = {},
       RegistryMap = {},
       HudRegistry = {}
    }
    local keynames = {
       [Enum.KeyCode.LeftAlt] = 'LALT',
       [Enum.KeyCode.RightAlt] = 'RALT',
       [Enum.KeyCode.LeftControl] = 'LCTRL',
       [Enum.KeyCode.RightControl] = 'RCTRL',
       [Enum.KeyCode.LeftShift] = 'LSHIFT',
       [Enum.KeyCode.RightShift] = 'RSHIFT',
       [Enum.KeyCode.Underscore] = '_',
       [Enum.KeyCode.Minus] = '-',
       [Enum.KeyCode.Plus] = '+',
       [Enum.KeyCode.Period] = '.',
       [Enum.KeyCode.Slash] = '/',
       [Enum.KeyCode.BackSlash] = '\\',
       [Enum.KeyCode.Question] = '?',
       [Enum.UserInputType.MouseButton1] = 'MB1',
       [Enum.UserInputType.MouseButton2] = 'MB2',
       [Enum.UserInputType.MouseButton3] = 'MB3'
    }
    
    menu.bg.Position = UDim2.new(0.5,-menu.bg.Size.X.Offset/2,0.5,-menu.bg.Size.Y.Offset/2)
    menu.Parent = CloneCore
    menu.Name = "Fatality.gg_gui"
    local ProtectGui = protectgui or (syn and syn.protect_gui) or (function() end)
    local CloneScreenGui = cloneref(Instance.new("ScreenGui"))
    ProtectGui(CloneScreenGui)   
    CloneScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    CloneScreenGui.Parent = CloneCore
    CloneScreenGui.Name = "Fatality.gg_gui"


    local TweenService = game:GetService("TweenService")

    local function fadeTextIn(TextLabel)
        local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(TextLabel, tweenInfo, {TextTransparency = 0})
        tween:Play()
    end
    
    local function fadeTextOut(TextLabel)
        local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(TextLabel, tweenInfo, {TextTransparency = 1})
        tween:Play()
    end
    
    local function animateTextLabel(TextLabel)
        while true do
            fadeTextIn(TextLabel)
            wait(2)
            fadeTextOut(TextLabel)
            wait(2)
        end
    end
    
    local function createUI()
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Parent = menu.bg.Frame
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.BorderSizePixel = 0
        TextLabel.Size = UDim2.new(0, 567, 0, 26)
        TextLabel.Font = Enum.Font.SourceSans
        TextLabel.Text = "Fatality.gg | #1"
        TextLabel.TextColor3 = Color3.fromRGB(61, 255, 200)
        TextLabel.TextSize = 14.000
        
        coroutine.wrap(animateTextLabel)(TextLabel)
    end
    
    createUI()

    for _, obj in pairs(menu:GetDescendants()) do
        if obj.Name:lower():find('name_esp') then
           obj.Text = '<font color="rgb(61, 255, 200)">' .. game.Players.LocalPlayer.Name .. '</font>'
        end
    end
    function library:visualize(state)
        Background.Visible = state
    end
    function library:keybind_color(Color)
     KeybindGradient.Color = ColorSequence.new{
         ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), 
         ColorSequenceKeypoint.new(0.50, Color), 
         ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))
        }
    end  
 
    function library:AddToRegistry(Instance, Properties, IsHud)
        local Idx = #library.Registry + 3
        local Data = {Instance = Instance; Properties = Properties; Idx = Idx}
        table.insert(library.Registry, Data)
        library.RegistryMap[Instance] = Data
        if IsHud then table.insert(library.HudRegistry, Data) end
    end
    
    function library:CreateLabel(Properties, IsHud)
        local _Instance = library:Create('TextLabel', {BackgroundTransparency = 1; FontFace = Fonts.ProggyTiny; TextColor3 = library.Colors.FontColor; TextSize = 9; TextStrokeTransparency = 0})
        library:AddToRegistry(_Instance, {TextColor3 = 'FontColor'}, IsHud)
        return library:Create(_Instance, Properties)
    end
    
    function library:GetTextBounds(Text, FontFace, Size, Resolution)
        local Bounds = game:GetService('TextService'):GetTextSize(Text, Size, FontFace, Resolution or Vector2.new(1920, 1080))
        return Bounds.X, Bounds.Y
    end
    
    function library:Create(Class, Properties)
        if not library.Enabled then return end
        local _Instance = type(Class) == 'string' and Instance.new(Class) or Class
        for Property, Value in next, Properties do
            _Instance[Property] = Value
        end
        return _Instance
    end
    
    library.NotificationArea = library:Create('Frame', {BackgroundTransparency = 1; Position = UDim2.new(0.003, 0, 0, 40); Size = UDim2.new(0, 300, 0, 200); ZIndex = 100; Parent = CloneScreenGui})
    library:Create('UIListLayout', {Padding = UDim.new(0, 4); FillDirection = Enum.FillDirection.Vertical; SortOrder = Enum.SortOrder.LayoutOrder; Parent = library.NotificationArea})
    
        function library:Notify(Text, Time)
            local XSize, YSize = library:GetTextBounds(Text, Enum.Font.Code, 9); YSize = YSize + 8
            local NotifyOuter = library:Create('Frame', {BorderColor3 = Color3.new(61, 255, 200); Position = UDim2.new(0, 100, 0, 10); Size = UDim2.new(0, 0, 0, YSize); ClipsDescendants = true; Transparency = 0; ZIndex = 100; Parent = library.NotificationArea})
            library:Create('UIGradient', {Color = ColorSequence.new{ColorSequenceKeypoint.new(0, library.Colors.MainColor), ColorSequenceKeypoint.new(0.1, library.Colors.MainColor), ColorSequenceKeypoint.new(0.6, library.Colors.MainColor), ColorSequenceKeypoint.new(1, library.Colors.MainColor)}, Rotation = -120; Parent = NotifyOuter})
            local NotifyInner = library:Create('Frame', {BackgroundColor3 = library.Colors.MainColor; BorderColor3 = library.Colors.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1, 0, 1, 0); ZIndex = 101; Parent = NotifyOuter})
            local InnerFrame = library:Create('Frame', {BackgroundColor3 = Color3.new(1, 1, 1); BorderSizePixel = 0; Position = UDim2.new(0, 1, 0, 1); Size = UDim2.new(1, -2, 1, -2); ZIndex = 102; Parent = NotifyInner})
            local Line = library:Create('Frame', {BackgroundColor3 = library.Colors.AccentColor; BorderSizePixel = 0; Position = UDim2.new(1, 0, 0.97, 0); Size = UDim2.new(-0.999, -0.5, 0, 1.9); ZIndex = 102; Parent = NotifyInner})
            local LeftColor = library:Create('Frame', {BackgroundColor3 = library.Colors.AccentColor; BorderSizePixel = 0; Position = UDim2.new(0, -1, 0, 22); Size = UDim2.new(0, 2, -1.2, 0); ZIndex = 104; Parent = NotifyOuter})
            local Gradient = library:Create('UIGradient', {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, library.Colors.MainColor), ColorSequenceKeypoint.new(1, library.Colors.MainColor)}); Rotation = -90; Parent = InnerFrame})
            library:AddToRegistry(NotifyInner, {BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor';}, true)
            library:AddToRegistry(Gradient, {Color = function() return ColorSequence.new({ColorSequenceKeypoint.new(0, library.Colors.MainColor), ColorSequenceKeypoint.new(1, library.Colors.MainColor)}); end})
            library:CreateLabel({Position = UDim2.new(0, 6, 0, 0); Size = UDim2.new(1, -4, 1, 0); Text = Text; TextXAlignment = Enum.TextXAlignment.Left; TextSize = 9; ZIndex = 103; Parent = InnerFrame})
            pcall(NotifyOuter.TweenSize, NotifyOuter, UDim2.new(0, XSize + 42 + 4, 0, YSize), 'Out', 'Quad', 0.6, true)
            pcall(LeftColor.TweenSize, LeftColor, UDim2.new(0, 2, 0, 0), 'Out', 'Linear', 1, true)
            wait(0.9)
            pcall(Line.TweenSize, Line, UDim2.new(0, 0, 0, 2), 'Out', 'Linear', Time, true)
                task.spawn(function()
                    wait(Time or 5)
                    pcall(NotifyOuter.TweenSize, NotifyOuter, UDim2.new(0, 0, 0, YSize), 'Out', 'Quad', 0.4, true)
                    wait(0.4)
                    NotifyOuter:Destroy()
                end)
            end    
 
            function draggable(frame)
                local userInputService = game:GetService("UserInputService")
                local isDragging = false
                local startPosition
                local startOffset
                local lastInput

                local function onMouseInput(input)
                    if not library.colorpicking then
                        local delta = input.Position - startPosition
                        local newPosition = UDim2.new(startOffset.X.Scale, startOffset.X.Offset + delta.X,
                                                    startOffset.Y.Scale, startOffset.Y.Offset + delta.Y)
                        frame.Position = newPosition
                    end
                end
                
                frame.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or
                        input.UserInputType == Enum.UserInputType.Touch then
                        isDragging = true
                        startPosition = input.Position
                        startOffset = frame.Position
                        lastInput = input
                        input.Changed:Connect(function()
                            if input.UserInputState == Enum.UserInputState.End then
                                isDragging = false
                            end
                        end)
                    end
                end)
                
                frame.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement or
                        input.UserInputType == Enum.UserInputType.Touch then
                        lastInput = input
                    end
                end)
                
                userInputService.InputChanged:Connect(function(input)
                    if input == lastInput and isDragging then
                        onMouseInput(input)
                    end
                end)
            end           

            draggable(menu.bg)
                InputService.MouseIconEnabled = false
                local Cursor = Drawing.new('Triangle');Cursor.Thickness = 1;Cursor.Filled = true;Cursor.Visible = true;Cursor.ZIndex = math.huge;local CursorOutline = Drawing.new('Triangle');CursorOutline.Thickness = 1;CursorOutline.Filled = false;CursorOutline.Color = Color3.new(61, 255, 200);CursorOutline.Visible = true;CursorOutline.ZIndex = math.huge
                function cursorupdate()
                    local mPos = InputService:GetMouseLocation();
                    Cursor.Color = library.Colors.libColor;Cursor.PointA = Vector2.new(mPos.X, mPos.Y);Cursor.PointB = Vector2.new(mPos.X + 16, mPos.Y + 6);Cursor.PointC = Vector2.new(mPos.X + 6, mPos.Y + 16) CursorOutline.PointA = Cursor.PointA;CursorOutline.PointB = Cursor.PointB;CursorOutline.PointC = Cursor.PointC;RunService.RenderStepped:Wait() end task.spawn(function() while true do cursorupdate() end
                end)
                InputService.InputEnded:Connect(function(key)
                if key.KeyCode == library.keybind then 
                    menu.Enabled = not menu.Enabled;library.scrolling = false;
                    library.colorpicking = false;
                    Cursor.Visible = not Cursor.Visible;
                    InputService.MouseIconEnabled = not InputService.MouseIconEnabled;
                    CursorOutline.Visible = not CursorOutline.Visible; 
                    for i,v in next, 
                        library.toInvis 
                        do v.Visible = false 
                        end 
                    end
                end)

                LPH_NO_VIRTUALIZE(function()
                function library:Tween(...) TweenService:Create(...):Play() end
                    function library:addTab(name,image)
                        local newTab = tabholder.tab:Clone()
                        local newButton = tabviewer.button:Clone()

                        table.insert(library.tabs,newTab)
                        newTab.Parent = tabholder
                        newTab.Visible = false

                        table.insert(library.tabbuttons,newButton)
                        newButton.Parent = tabviewer
                        newButton.Modal = true
                        newButton.Visible = true
                        newButton.Image = image
                        newButton.text.Text = name

                        for i, v in next, library.tabbuttons do
                        v.ImageColor3 = Color3.fromRGB(25, 25, 25)
                        end

                        newButton.MouseButton1Click:Connect(function()
                        for i,v in next, library.tabs do v.Visible = v == newTab end
                        for i,v in next, library.toInvis do v.Visible = false end
                        for i,v in next, library.tabbuttons do
                        local state = v == newButton
                        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                        local imageTweenStart = TweenService:Create(v, tweenInfo, {ImageColor3 = Color3.fromRGB(61, 255, 200)})
                        local textTweenStart = TweenService:Create(v.text, tweenInfo, {TextColor3 = Color3.fromRGB(61, 255, 200)})
                        local imageTweenEnd = TweenService:Create(v, tweenInfo, {ImageColor3 = Color3.fromRGB(25,25,25)})
                        local textTweenEnd = TweenService:Create(v.text, tweenInfo, {TextColor3 = Color3.fromRGB(125, 125, 125)})
                        if state then
                            imageTweenStart:Play()
                            textTweenStart:Play()
                        else
                            imageTweenEnd:Play()
                            textTweenEnd:Play()
                        end
                        end
                        end)

                        local tab = {}
                        local groupCount = 0
                        local jigCount = 0
                        local topStuff = 2000

                        function tab:createGroup(pos,groupname)
                        local groupbox = Instance.new("Frame")
                        local grouper = Instance.new("Frame")
                        local UIListLayout = Instance.new("UIListLayout")
                        local UIPadding = Instance.new("UIPadding")
                        local element = Instance.new("Frame")
                        local element2 = Instance.new("UIGradient")
                        local title = Instance.new("TextLabel")

                        groupCount = 1
                        groupbox.Parent = newTab[pos]
                        groupbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        groupbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        groupbox.BorderSizePixel = 0
                        groupbox.Size = UDim2.new(0, 211, 0, 8)
                        groupbox.ZIndex = groupCount

                        grouper.Parent = groupbox
                        grouper.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                        grouper.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        grouper.Size = UDim2.new(1, 0, 1, 0)

                        UIListLayout.Parent = grouper
                        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

                        UIPadding.Parent = grouper
                        UIPadding.PaddingBottom = UDim.new(0, 4)
                        UIPadding.PaddingTop = UDim.new(0, 7)

                        element.Name = "element_frame"
                        element.Parent = groupbox
                        element.BackgroundColor3 = Color3.fromRGB(210, 210, 210)
                        element.BorderSizePixel = 0
                        element.Size = UDim2.new(1, 0, 0, 1)
  
                        element2.Name = "element1"
                        element2.Parent = element
                        element2.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)),
                            ColorSequenceKeypoint.new(0.05, library.Colors.libColor),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))
                        })                  

                        title.Parent = groupbox
                        title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        title.BackgroundTransparency = 1.000
                        title.BorderSizePixel = 0
                        title.Position = UDim2.new(0, 17, 0, 0)
                        title.ZIndex = 2
                        title.FontFace = Fonts.ProggyTiny
                        title.Text = groupname or ""
                        title.TextColor3 = Color3.fromRGB(255, 255, 255)
                        title.TextSize = 9
                        title.TextStrokeTransparency = 0.000
                        title.TextXAlignment = Enum.TextXAlignment.Left

                        local group = {}
                        function group:addToggle(args)
                            if not args.flag and args.text then args.flag = args.text end
                            if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on recent toggle") end
                            function riskyCfg(state)
                                args.risky = state
                            end
                            groupbox.Size += UDim2.new(0, 0, 0, 20)

                            local toggleframe = Instance.new("Frame")
                            local tobble = Instance.new("Frame")
                            local mid = Instance.new("Frame")
                            local front = Instance.new("Frame")
                            local text = Instance.new("TextLabel")
                            local button = Instance.new("TextButton")

                            jigCount -= 1
                            library.multiZindex -= 1

                            toggleframe.Name = "toggleframe"
                            toggleframe.Parent = grouper
                            toggleframe.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                            toggleframe.BackgroundTransparency = 1.000
                            toggleframe.BorderSizePixel = 0
                            toggleframe.Size = UDim2.new(1, 0, 0, 20)
                            toggleframe.ZIndex = library.multiZindex

                            tobble.Name = "tobble"
                            tobble.Parent = toggleframe
                            tobble.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                            tobble.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            tobble.BorderSizePixel = 3
                            tobble.Position = UDim2.new(0.0209999000, 0, 0.242000015, 0)
                            tobble.Size = UDim2.new(0, 11, 0, 11)

                            mid.Name = "mid"
                            mid.Parent = tobble
                            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
                            mid.BorderColor3 = Color3.fromRGB(25,25,25)
                            mid.BorderSizePixel = 2
                            mid.Size = UDim2.new(0, 12, 0, 12)

                            front.Name = "front"
                            front.Parent = mid
                            front.BackgroundColor3 = Color3.fromRGB(21,21,21)
                            front.BorderColor3 = Color3.fromRGB(25, 25, 25)
                            front.Size = UDim2.new(0, 12, 0, 12)

                            local front2 = Instance.new("UIGradient", front)
                            front2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)), ColorSequenceKeypoint.new(0.320, Color3.fromRGB(100, 100, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
                            front2.Rotation = 45

                            text.Name = "text"
                            text.Parent = toggleframe
                            text.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0, 22, 0, 0)
                            text.Size = UDim2.new(0, 0, 1, 2)
                            text.FontFace = Fonts.ProggyTiny
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(155, 155, 155)
                            text.TextSize = 9
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left

                            button.Name = "button"
                            button.Parent = toggleframe
                            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button.BackgroundTransparency = 1.000
                            button.BorderSizePixel = 0
                            button.Size = UDim2.new(0, 101, 1, 0)
                            button.FontFace = Fonts.ProggyTiny
                            button.Text = ""
                            button.TextColor3 = Color3.fromRGB(0, 0, 0)
                            button.TextSize = 9

                            local state = args.default
                            if args.risky then text.TextColor3 = state and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(139, 0, 0) end
                            if state == true then
                                front.Name = state and "accent" or "back"
                                library.flags[args.flag] = state
                                mid.BorderColor3 = Color3.fromRGB(25,25,25)
                                front.BackgroundColor3 = state and library.Colors.libColor or Color3.fromRGB(25, 25, 25)
                                if args.risky then text.TextColor3 = state and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(139, 0, 0) else text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144) end
                                if args.callback then args.callback(state) end
                            else
                                if args.risky then text.TextColor3 = Color3.fromRGB(139, 0, 0) else text.TextColor3 = Color3.fromRGB(144, 144, 144) end
                            end

                            function toggle(newState)
                                state = newState
                                library.flags[args.flag] = state
                                front.BackgroundColor3 = state and library.Colors.libColor or Color3.fromRGB(25, 25, 25)
                                --library:Tween(front, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = state and library.libColor or Color3.fromRGB(25, 25, 25)})
                                if args.risky then text.TextColor3 = state and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(139, 0, 0) else text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144) end
                                if args.callback then args.callback(state) end
                            end

                            button.MouseButton1Click:Connect(function()
                            state = not state
                            front.Name = state and "accent" or "back"
                            library.flags[args.flag] = state
                            mid.BorderColor3 = Color3.fromRGB(25,25,25)
                            front.BackgroundColor3 = state and library.Colors.libColor or Color3.fromRGB(25, 25, 25)
                            --library:Tween(front, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = state and library.libColor or Color3.fromRGB(25, 25, 25)})
                            if args.risky then text.TextColor3 = state and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(139, 0, 0) else text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144) end
                            if args.callback then args.callback(state) end
                            end)

                            button.MouseEnter:Connect(function()
                                library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                            end)
                            
                            button.MouseLeave:Connect(function()
                                library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                            end)                            

                            library.flags[args.flag] = false
                            library.options[args.flag] = {text = "",type = "toggle",gui = args.gui,changeState = toggle,skipflag = args.skipflag,oldargs = args,toggle = state,risky = args.risky or false,riskcfg = riskyCfg}
                            local toggle = {}
                            function toggle:addKeybind(args)
                                if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on toggle:keybind") end
                                local next = false
                                local keybind = Instance.new("Frame")
                                local button = Instance.new("TextButton")
                                local Name = Instance.new("TextLabel")

                                Name.Name = "Name"
                                Name.Parent = Tab
                                Name.AnchorPoint = Vector2.new(0.5, 0.5)
                                Name.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                                Name.BorderColor3 = Color3.fromRGB(25, 25, 25)
                                Name.BorderSizePixel = 1
                                Name.Position = UDim2.new(0.5, 0, -1.85000002, 0)
                                Name.Size = UDim2.new(1, 0, 1, 0)
                                Name.FontFace = Fonts.ProggyTiny
                                Name.TextColor3 = Color3.fromRGB(125, 125, 125)
                                Name.TextSize = 9
                                Name.RichText = true
                                Name.Visible = false

                                keybind.Parent = toggleframe
                                keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                keybind.BackgroundTransparency = 0
                                keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                keybind.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                                keybind.BorderColor3 = Color3.fromRGB(20, 20, 20)
                                keybind.BorderSizePixel = 1
                                keybind.Visible = true
                                keybind.Position = UDim2.new(0.82, 4, 0.15, 0)
                                keybind.Size = UDim2.new(0, 30, 0, 13)

                                button.Parent = keybind
                                button.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                                button.BackgroundTransparency = 1
                                button.BorderSizePixel = 1
                                button.Position = UDim2.new(0.1, 0, 0, 2)
                                button.Size = UDim2.new(0.9, 0, 1, 0)
                                button.FontFace = Fonts.ProggyTiny
                                button.Text = ""
                                button.TextColor3 = Color3.fromRGB(155, 155, 155)
                                button.TextSize = 9
                                button.TextStrokeTransparency = 0.000
                                button.TextXAlignment = Enum.TextXAlignment.Center

                                local status = false
                                local Toggle = false
                                function updateValue(val)
                                    if library.colorpicking then return end
                                        library.flags[args.flag] = val
                                        if val.Name == "Unknown" or val.Name == "Unknown" then
                                        button.Text = "None"
                                        else
                                        button.Text = keynames[val] or ""..val.Name..""
                                    end
                                end
                                InputService.InputBegan:Connect(function(input)
                                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                    return  
                                end
                                    
                                local key = input.KeyCode == Enum.KeyCode.Unknown and input.UserInputType or input.KeyCode
                                if next then
                                    if not table.find(library.blacklisted,key) then
                                    next = false
                                    library.flags[args.flag] = key
                                    if key.Name == "Unknown" or key.Name == "Unknown" then
                                        button.Text = "None"
                                    else
                                        button.Text = keynames[key] or ""..key.Name..""
                                        local keyName = tostring(library.flags[args.flag]):split(".")[3] -- Extracts the key name from the enum value
                                        if args.gui then
                                            Name.Visible = true
                                            if args.type == "hold" then
                                                Name.Text = "<font color=\"rgb(255,255,255)\">" ..args.text.. ":</font>".." <font color=\"rgb(61, 255, 200)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                            else
                                                if not Toggle then
                                                    Toggle = true
                                                    Name.Text = "<font color=\"rgb(255,255,255)\">" ..args.text.. ":</font>".." <font color=\"rgb(61, 255, 200)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                                else
                                                    Toggle = false
                                                    Name.Text = "<font color=\"rgb(125, 125, 125)\">" ..args.text.. ": /font>".." <font color=\"rgb(61, 255, 200)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                                end
                                            end
                                        end
                                    end
                                    button.TextColor3 = Color3.fromRGB(155, 155, 155)
                                    end
                                end
                                if not next and key == library.flags[args.flag] and args.callback then
                                    status = not status
                                    args.callback(key, status)
                                    local keyName = tostring(library.flags[args.flag]):split(".")[3] -- Extracts the key name from the enum value
                                    if args.gui then
                                        Name.Visible = true
                                        if args.type == "hold" then
                                            Name.Text = "<font color=\"rgb(255,255,255)\">" ..args.text.. ":</font>".." <font color=\"rgb(61, 255, 200)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                        else
                                            if not Toggle then
                                                Toggle = true
                                                Name.Text = "<font color=\"rgb(255,255,255)\">" ..args.text.. ":</font>".." <font color=\"rgb(61, 255, 200)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                            else
                                                Toggle = false
                                                Name.Text = "<font color=\"rgb(125, 125, 125)\">" ..args.text.. ":</font>".." <font color=\"rgb(61, 255, 200)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                            end
                                        end
                                    end
                                end
                                end)

                                if args.type == "hold" then
                                    InputService.InputEnded:Connect(function(input)
                                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                            return  
                                        end
                                        local key = input.KeyCode == Enum.KeyCode.Unknown and input.UserInputType or input.KeyCode
                                        if next then
                                        if not table.find(library.blacklisted,key) then
                                            next = false
                                            library.flags[args.flag] = key
                                            if key.Name == "Unknown" or key.Name == "Unknown" then
                                                button.Text = "None"
                                            else
                                                button.Text = keynames[key] or ""..key.Name..""
                                                local keyName = tostring(library.flags[args.flag]):split(".")[3] -- Extracts the key name from the enum value
                                                if args.gui then
                                                    Name.Visible = true
                                                    if args.type == "hold" then
                                                        Name.Text = "<font color=\"rgb(125, 125, 125)\">" ..args.text.. ":</font>".." <font color=\"rgb(61, 255, 200)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                                    else
                                                        Name.Text = "<font color=\"rgb(125, 125, 125)\">" ..args.text.. ":</font>".." <font color=\"rgb(61, 255, 200)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                                    end
                                                end
                                            end
                                        end
                                        end
                                        if not next and key == library.flags[args.flag] and args.callback then
                                        status = not status
                                        args.callback(key, status)
                                        local keyName = tostring(library.flags[args.flag]):split(".")[3] -- Extracts the key name from the enum value
                                        if args.gui then
                                            Name.Visible = true
                                            Name.Text = args.text..": <font color=\"rgb(125, 125, 125)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                        end
                                        end
                                    end)
                                end

                                button.MouseButton1Click:Connect(function()
                                if library.colorpicking then return end
                                library.flags[args.flag] = Enum.KeyCode.Unknown
                                button.Text = "--"
                                button.TextColor3 = library.Colors.libColor
                                next = true
                                end)

                                library.flags[args.flag] = Enum.KeyCode.Unknown
                                library.options[args.flag] = {type = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}

                                local keyName = tostring(args.key):split(".")[3] -- Extracts the key name from the enum value
                                if args.gui then
                                    Name.Visible = true
                                    Name.Text = args.text..": <font color=\"rgb(61, 255, 200)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                end

                                updateValue(args.key or Enum.KeyCode.Unknown)
                            end
                            function toggle:addColorpicker(args)
                                if not args.flag and args.text then args.flag = args.text end
                                if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
                                local colorpicker = Instance.new("Frame")
                                local mid = Instance.new("Frame")
                                local front = Instance.new("Frame")
                                local button2 = Instance.new("TextButton")
                                local colorFrame = Instance.new("Frame")
                                local colorFrame_2 = Instance.new("Frame")
                                local hueframe = Instance.new("Frame")
                                local main = Instance.new("Frame")
                                local hue = Instance.new("ImageLabel")
                                local pickerframe = Instance.new("Frame")
                                local main_2 = Instance.new("Frame")
                                local picker = Instance.new("ImageLabel")
                                local clr = Instance.new("Frame")
                                local copy = Instance.new("TextButton")
                                local CurrentColorFrame = Instance.new("Frame")
                                local CurrentColorFrame_Text = Instance.new("TextLabel")

                                library.multiZindex -= 1
                                jigCount -= 1
                                topStuff -= 1

                                colorpicker.Parent = toggleframe
                                colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                colorpicker.BorderSizePixel = 3
                                colorpicker.Position = args.second and UDim2.new(0.720000029, 4, 0.272000015, 0) or UDim2.new(0.860000014, 4, 0.272000015, 0)
                                colorpicker.Size = UDim2.new(0, 20, 0, 10)

                                mid.Name = "mid"
                                mid.Parent = colorpicker
                                mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
                                mid.BorderColor3 = Color3.fromRGB(25,25,25)
                                mid.BorderSizePixel = 2
                                mid.Size = UDim2.new(1, 0, 1, 0)

                                front.Name = "front"
                                front.Name = "dontchange"
                                front.Parent = mid
                                front.BackgroundColor3 = library.Colors.libColor
                                front.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                front.Size = UDim2.new(1, 0, 1, 0)

                                local ColorPickerGradient = Instance.new("UIGradient", front)
                                ColorPickerGradient.Name = "dontchange"
                                ColorPickerGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)), ColorSequenceKeypoint.new(0.320, Color3.fromRGB(100, 100, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
                                ColorPickerGradient.Rotation = 270

                                button2.Name = "button2"
                                button2.Parent = front
                                button2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                button2.BackgroundTransparency = 1.000
                                button2.Size = UDim2.new(1, 0, 1, 0)
                                button2.Text = ""
                                button2.FontFace = Fonts.ProggyTiny
                                button2.TextColor3 = Color3.fromRGB(0, 0, 0)
                                button2.TextSize = 9

                                colorFrame.Name = "colorFrame"
                                colorFrame.Parent = toggleframe
                                colorFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
                                colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                colorFrame.BorderSizePixel = 2
                                colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)
                                colorFrame.Size = UDim2.new(0, 187, 0, 178)

                                colorFrame_2.Name = "colorFrame"
                                colorFrame_2.Parent = colorFrame
                                colorFrame_2.BackgroundColor3 = Color3.fromRGB(15,15,15)
                                colorFrame_2.BorderColor3 = Color3.fromRGB(30, 30, 30)
                                colorFrame_2.Size = UDim2.new(1, 0, 1, 0)

                                hueframe.Name = "hueframe"
                                hueframe.Parent = colorFrame_2
                                hueframe.BackgroundColor3 = Color3.fromRGB(15,15,15)
                                hueframe.BorderColor3 = Color3.fromRGB(30, 30, 30)
                                hueframe.BorderSizePixel = 2
                                hueframe.Position = UDim2.new(-0.0830000022, 18, -0.0559999987, 13)
                                hueframe.Size = UDim2.new(0.25, 110, 0.25, 110)

                                main.Name = "main"
                                main.Parent = hueframe
                                main.BackgroundColor3 = Color3.fromRGB(15,15,15)
                                main.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                main.Size = UDim2.new(1, 0, 1, 0)
                                main.ZIndex = 6

                                picker.Name = "picker"
                                picker.Parent = main
                                picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
                                picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                picker.BorderSizePixel = 0
                                picker.Size = UDim2.new(1, 0, 1, 0)
                                picker.ZIndex = 104
                                picker.Image = "rbxassetid://2615689005"

                                pickerframe.Name = "pickerframe"
                                pickerframe.Parent = colorFrame
                                pickerframe.BackgroundColor3 = Color3.fromRGB(15,15,15)
                                pickerframe.BorderColor3 = Color3.fromRGB(30, 30, 30)
                                pickerframe.BorderSizePixel = 2
                                pickerframe.Position = UDim2.new(0.801000025, 14, -0.0559999987, 13)
                                pickerframe.Size = UDim2.new(0, 20, 0.25, 110)

                                CurrentColorFrame.Name = "CurrentColorFrame"
                                CurrentColorFrame.Parent = colorFrame
                                CurrentColorFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
                                CurrentColorFrame.BorderColor3 = Color3.fromRGB(15,15,15)
                                CurrentColorFrame.BorderSizePixel = 2
                                CurrentColorFrame.Position = UDim2.new(0.98, 0, 0.915, 0)
                                CurrentColorFrame.Size = UDim2.new(-0.965, 0, 0, 12)

                                CurrentColorFrame_Text.Name = "CurrentColorFrame_Text"
                                CurrentColorFrame_Text.Parent = CurrentColorFrame
                                CurrentColorFrame_Text.BackgroundColor3 = Color3.fromRGB(15,15,15)
                                CurrentColorFrame_Text.BackgroundTransparency = 1.000
                                CurrentColorFrame_Text.BorderSizePixel = 0
                                CurrentColorFrame_Text.Size = UDim2.new(1, 0, 1, 0)
                                CurrentColorFrame_Text.FontFace = Fonts.ProggyTiny
                                CurrentColorFrame_Text.Text = args.text or args.flag
                                CurrentColorFrame_Text.TextColor3 = library.Colors.libColor
                                CurrentColorFrame_Text.TextSize = 9
                                CurrentColorFrame_Text.TextStrokeTransparency = 0.000

                                main_2.Name = "main"
                                main_2.Parent = pickerframe
                                main_2.BackgroundColor3 = Color3.fromRGB(15,15,15)
                                main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                main_2.Size = UDim2.new(0, 20, 1, 0)
                                main_2.ZIndex = 6

                                hue.Name = "hue"
                                hue.Parent = main_2
                                hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
                                hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                hue.BorderSizePixel = 0
                                hue.Size = UDim2.new(0, 20, 1, 0)
                                hue.ZIndex = 104
                                hue.Image = "rbxassetid://2615692420"

                                clr.Name = "clr"
                                clr.Parent = colorFrame
                                clr.BackgroundColor3 = Color3.fromRGB(15,15,15)
                                clr.BackgroundTransparency = 1.000
                                clr.BorderColor3 = Color3.fromRGB(60, 60, 60)
                                clr.BorderSizePixel = 2
                                clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
                                clr.Size = UDim2.new(0, 0, 0, 14)
                                clr.ZIndex = 5

                                copy.MouseButton1Click:Connect(function()
                                colorFrame.Visible = false
                                end)

                                button2.MouseButton1Click:Connect(function()
                                colorFrame.Visible = not colorFrame.Visible
                                mid.BorderColor3 = Color3.fromRGB(25,25,25)
                                end)

                                button2.MouseEnter:Connect(function()
                                    library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                                end)
                                
                                button2.MouseLeave:Connect(function()
                                    library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                                end)  

                                local function updateValue(value,fakevalue)
                                    if typeof(value) == "table" then value = fakevalue end
                                    library.flags[args.flag] = value
                                    front.BackgroundColor3 = value

                                    local r, g, b = value.r * 255, value.g * 255, value.b * 255
                                    CurrentColorFrame_Text.TextColor3 = value
                                    CurrentColorFrame_Text.Text = "RGB(" .. math.floor(r) .. ", " .. math.floor(g) .. ", " .. math.floor(b) .. ")"

                                    if args.callback then
                                    args.callback(value)
                                    end
                                end

                                local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
                                local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
                                local heartbeat = RunService.Heartbeat
                                local pickerX,pickerY,hueY = 0,0,0
                                local oldpercentX,oldpercentY = 0,0

                                hue.MouseEnter:Connect(function()
                                local input = hue.InputBegan:connect(function(key)
                                if key.UserInputType == Enum.UserInputType.MouseButton1 then
                                    while heartbeat:wait() and InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    library.colorpicking = true
                                    local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                                    local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                                    local startC = colors[math.floor(num)]
                                    local endC = colors[math.ceil(num)]
                                    local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                                    picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                                    updateValue(color)
                                    end
                                    library.colorpicking = false
                                end
                                end)
                                local leave
                                leave = hue.MouseLeave:connect(function()
                                input:disconnect()
                                leave:disconnect()
                                end)
                                end)

                                picker.MouseEnter:Connect(function()
                                local input = picker.InputBegan:connect(function(key)
                                if key.UserInputType == Enum.UserInputType.MouseButton1 then
                                    while heartbeat:wait() and InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    library.colorpicking = true
                                    local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                                    local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                                    local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                                    updateValue(color)
                                    oldpercentX,oldpercentY = xPercent,yPercent
                                    end
                                    library.colorpicking = false
                                end
                                end)
                                local leave
                                leave = picker.MouseLeave:connect(function()
                                input:disconnect()
                                leave:disconnect()
                                end)
                                end)

                                hue.MouseMoved:connect(function(_, y)
                                hueY = y
                                end)

                                picker.MouseMoved:connect(function(x, y)
                                pickerX,pickerY = x,y
                                end)

                                table.insert(library.toInvis,colorFrame)
                                library.flags[args.flag] = Color3.new(1,1,1)
                                library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
                                updateValue(args.color or Color3.new(1,1,1))
                            end
                            return toggle
                        end
                        function group:addButton(args)
                            if not args.callback or not args.text then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 20)

                            local buttonframe = Instance.new("Frame")
                            local bg = Instance.new("Frame")
                            local main = Instance.new("Frame")
                            local button = Instance.new("TextButton")
                            local gradient = Instance.new("UIGradient")

                            buttonframe.Name = "buttonframe"
                            buttonframe.Parent = grouper
                            buttonframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            buttonframe.BackgroundTransparency = 1.000
                            buttonframe.BorderSizePixel = 0
                            buttonframe.Size = UDim2.new(1, 0, 0, 20)

                            bg.Name = "bg"
                            bg.Parent = buttonframe
                            bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                            bg.BorderColor3 = Color3.fromRGB(25, 25, 25)
                            bg.BorderSizePixel = 2
                            bg.Position = UDim2.new(0.02, -1, 0.12, 0)
                            bg.Size = UDim2.new(0, 205, 0, 15)

                            main.Name = "main"
                            main.Parent = bg
                            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                            main.BorderColor3 = Color3.fromRGB(25, 25, 25)
                            main.Size = UDim2.new(1, 0, 1, 0)

                            button.Name = "button"
                            button.Parent = main
                            button.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                            button.BackgroundTransparency = 1.000
                            button.BorderSizePixel = 0
                            button.Size = UDim2.new(1, 0, 1, 0)
                            button.FontFace = Fonts.ProggyTiny
                            button.Text = args.text or args.flag
                            button.TextColor3 = Color3.fromRGB(255, 255, 255)
                            button.TextSize = 9
                            button.TextStrokeTransparency = 0.000

                            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(59, 59, 59)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(83, 83, 83))}
                            gradient.Rotation = 90
                            gradient.Name = "gradient"
                            gradient.Parent = main

                            button.MouseButton1Click:Connect(function()
                            if not library.colorpicking then
                                args.callback()
                            end
                            end)
                            button.MouseEnter:Connect(function()
                                library:Tween(main, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                            end)
                            
                            button.MouseLeave:Connect(function()
                                library:Tween(main, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                            end) 
                        end
                        function group:addSlider(args,sub)
                            if not args.flag or not args.max then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 31)
                            function riskyCfg(state)
                                args.risky = state
                            end

                            local slider = Instance.new("Frame")
                            local bg = Instance.new("Frame")
                            local main = Instance.new("Frame")
                            local fill = Instance.new("Frame")
                            local button = Instance.new("TextButton")
                            local valuetext = Instance.new("TextLabel")
                            local UIGradient = Instance.new("UIGradient")
                            local text = Instance.new("TextLabel")
                            local textAdd = Instance.new("TextLabel")
                            local textRemove = Instance.new("TextLabel")

                            slider.Name = "slider"
                            slider.Parent = grouper
                            slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            slider.BackgroundTransparency = 1.000
                            slider.BorderSizePixel = 0
                            slider.Size = UDim2.new(1, 0, 0, 30)

                            bg.Name = "bg"
                            bg.Parent = slider
                            bg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            bg.BorderColor3 = Color3.fromRGB(25,25,25)
                            bg.BorderSizePixel = 2
                            bg.Position = UDim2.new(0.02, -1, 0, 15)
                            bg.Size = UDim2.new(0, 205, 0, 13)

                            main.Name = "main"
                            main.Parent = bg
                            main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            main.BorderColor3 = Color3.fromRGB(20, 20, 20)
                            main.Size = UDim2.new(1, 0, 1, 0)

                            fill.Name = "fill"
                            fill.Parent = main
                            fill.BackgroundColor3 = library.Colors.libColor
                            fill.BackgroundTransparency = 0.200
                            fill.BorderColor3 = Color3.fromRGB(60, 60, 60)
                            fill.BorderSizePixel = 0
                            fill.Size = UDim2.new(0.617238641, 13, 1, 0)
                            if args.min < 0 then
                                fill.Position = UDim2.new(0.5,0,0,0)
                            end

                            local Fill_UIGradient = Instance.new("UIGradient", fill)
                            Fill_UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(0.8, Color3.fromRGB(100, 100, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 75, 75))}
                            Fill_UIGradient.Rotation = 90

                            button.Name = "button"
                            button.Parent = main
                            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button.BackgroundTransparency = 1.000
                            button.Size = UDim2.new(0, 191, 1, 0)
                            button.FontFace = Fonts.ProggyTiny
                            button.Text = ""
                            button.TextColor3 = Color3.fromRGB(0, 0, 0)
                            button.TextSize = 9

                            valuetext.Parent = main
                            valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            valuetext.BackgroundTransparency = 1.000
                            valuetext.Position = UDim2.new(0.5, 0, 0.5, 0)
                            valuetext.FontFace = Fonts.ProggyTiny
                            valuetext.Text = "1/10"
                            valuetext.TextColor3 = Color3.fromRGB(255, 255, 255)
                            valuetext.TextSize = 9
                            valuetext.TextStrokeTransparency = 0.000

                            UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 105, 105)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 121, 121))}
                            UIGradient.Rotation = 90
                            UIGradient.Parent = main

                            text.Name = "text"
                            text.Parent = slider
                            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
                            text.ZIndex = 2
                            text.FontFace = Fonts.ProggyTiny
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            text.TextSize = 9
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left

                            if args.risky then
                                text.TextColor3 = library.Colors.riskyColor
                            end

                            textAdd.Name = "Add"
                            textAdd.Parent = slider
                            textAdd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            textAdd.BackgroundTransparency = 1.000
                            textAdd.Position = UDim2.new(0.9111111111, -1, 0, 7)
                            textAdd.ZIndex = 2
                            textAdd.FontFace = Fonts.ProggyTiny
                            textAdd.Text = "+"
                            textAdd.TextColor3 = Color3.fromRGB(125, 125, 125)
                            textAdd.TextSize = 9
                            textAdd.TextStrokeTransparency = 0.000
                            textAdd.TextXAlignment = Enum.TextXAlignment.Left

                            textRemove.Name = "Remove"
                            textRemove.Parent = slider
                            textRemove.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            textRemove.BackgroundTransparency = 1.000
                            textRemove.Position = UDim2.new(0.9599999999, -1, 0, 7)
                            textRemove.ZIndex = 2
                            textRemove.FontFace = Fonts.ProggyTiny
                            textRemove.Text = "-"
                            textRemove.TextColor3 = Color3.fromRGB(125, 125, 125)
                            textRemove.TextSize = 9
                            textRemove.TextStrokeTransparency = 0.000
                            textRemove.TextXAlignment = Enum.TextXAlignment.Left

                            button.MouseEnter:Connect(function()
                                library:Tween(bg, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                            end)
                            
                            button.MouseLeave:Connect(function()
                                library:Tween(bg, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                            end)            

                            local entered = false
                            local scrolling = false
                            local function round(value, decimalPlaces)
                                local shift = 10 ^ decimalPlaces return math.floor(value * shift + 0.5) / shift
                            end

                            local function updateValue(value)
                                if library.colorpicking then return end
                                if args.min < 0 then
                                    fill:TweenSize(UDim2.new(value / 2 / args.max, 0, 1, 0), Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.1)
                                end
                                if value ~= 0 then
                                    if args.min < 0 then
                                    fill:TweenSize(UDim2.new(value  / 2 / args.max, 0, 1, 0), Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.1)
                                    else
                                    fill:TweenSize(UDim2.new(value / args.max, 0, 1, 0), Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.1)
                                    end
                                else
                                    fill:TweenSize(UDim2.new(0, 1, 1, 0), Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.1)
                                end
                                valuetext.Text = value .. args.suffix .. "/" .. args.max .. args.suffix
                                library.flags[args.flag] = value
                                if args.callback then
                                    args.callback(value)
                                end
                            end
                            local function updateScroll()
                                while InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and menu.Enabled do
                                    RunService.RenderStepped:Wait()
                                    library.scrolling = true
                                    valuetext.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    scrolling = true
                                    local floatStep = args.float or 0.1
                                    local range = args.max - args.min
                                    local normalizedMouseX = (Mouse.X - button.AbsolutePosition.X) / button.AbsoluteSize.X
                                    local value = args.min + normalizedMouseX * range
                                    local snappedValue = args.min + floatStep * math.floor((value - args.min) / floatStep + 0.5)
                                    value = math.min(args.max, snappedValue)
                                    value = math.max(args.min, value)
                                    value = round(value, 2)
                                    updateValue(value)
                                    fill.BackgroundColor3 = library.Colors.libColor
                                end
                                if scrolling and not entered then
                                    valuetext.TextColor3 = Color3.fromRGB(255, 255, 255)
                                end
                                if not menu.Enabled then
                                    entered = false
                                end
                                scrolling = false
                                library.scrolling = false
                            end
                            button.MouseEnter:Connect(function()
                            if library.colorpicking then return end
                            if scrolling or entered then return end
                            entered = true
                            main.BorderColor3 = library.Colors.libColor
                            while entered do
                                wait() updateScroll()
                            end
                            end)
                            button.MouseLeave:Connect(function()
                            entered = false
                            main.BorderColor3 = Color3.fromRGB(20, 20, 20)
                            end)
                            library.flags[args.flag] = args.value or args.default
                            library.options[args.flag] = { type = "slider", changeState = updateValue, skipflag = args.skipflag, oldargs = args }
                            updateValue(args.value or args.default)
                        end
                        function group:addTextbox(args)
                            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 35)

                            local textbox = Instance.new("Frame")
                            local bg = Instance.new("Frame")
                            local main = Instance.new("ScrollingFrame")
                            local box = Instance.new("TextBox")
                            local gradient = Instance.new("UIGradient")
                            local text = Instance.new("TextLabel")

                            box:GetPropertyChangedSignal('Text'):Connect(function(val)
                            if library.colorpicking then return end
                            library.flags[args.flag] = box.Text
                            args.value = box.Text
                            if args.callback then
                                args.callback()
                            end
                            end)
                            textbox.Name = "textbox"
                            textbox.Parent = grouper
                            textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            textbox.BackgroundTransparency = 1.000
                            textbox.BorderSizePixel = 0
                            textbox.Size = UDim2.new(1, 0, 0, 35)
                            textbox.ZIndex = 10

                            bg.Name = "bg"
                            bg.Parent = textbox
                            bg.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
                            bg.BorderColor3 = Color3.fromRGB(2, 2, 2)
                            bg.BorderSizePixel = 2
                            bg.Position = UDim2.new(0.02, -1, 0, 16)
                            bg.Size = UDim2.new(0, 205, 0, 15)

                            main.Name = "main"
                            main.Parent = bg
                            main.Active = true
                            main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
                            main.BorderColor3 = Color3.fromRGB(12, 12, 12)
                            main.Size = UDim2.new(1, 0, 1, 0)
                            main.CanvasSize = UDim2.new(0, 0, 0, 0)
                            main.ScrollBarThickness = 0

                            box.Name = "box"
                            box.Parent = main
                            box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            box.BackgroundTransparency = 1.000
                            box.Selectable = false
                            box.Size = UDim2.new(1, 0, 1, 0)
                            box.FontFace = Fonts.ProggyTiny
                            box.Text = args.value or ""
                            box.TextColor3 = Color3.fromRGB(255, 255, 255)
                            box.TextSize = 9
                            box.TextStrokeTransparency = 0.000
                            box.TextXAlignment = Enum.TextXAlignment.Left

                            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(59, 59, 59)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(83, 83, 83))}
                            gradient.Rotation = 90
                            gradient.Name = "gradient"
                            gradient.Parent = main

                            text.Name = "text"
                            text.Parent = textbox
                            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
                            text.ZIndex = 2
                            text.FontFace = Fonts.ProggyTiny
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            text.TextSize = 9
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left

                            library.flags[args.flag] = args.value or ""
                            library.options[args.flag] = {type = "textbox",changeState = function(text) box.Text = text end,skipflag = args.skipflag,oldargs = args}
                        end
                        function group:addDivider(args)
                            groupbox.Size += UDim2.new(0, 0, 0, 10)

                            local div = Instance.new("Frame")
                            local bg = Instance.new("Frame")
                            local main = Instance.new("Frame")

                            div.Name = "div"
                            div.Parent = grouper
                            div.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            div.BackgroundTransparency = 1.000
                            div.BorderSizePixel = 0
                            div.Position = UDim2.new(0, 0, 0.743662, 0)
                            div.Size = UDim2.new(0, 202, 0, 10)

                            bg.Name = "bg"
                            bg.Parent = div
                            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            bg.BorderSizePixel = 2
                            bg.Position = UDim2.new(0.02, 0, 0, 4)
                            bg.Size = UDim2.new(0, 191, 0, 1)

                            main.Name = "main"
                            main.Parent = bg
                            main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            main.BorderColor3 = Color3.fromRGB(40, 40, 40)
                            main.Size = UDim2.new(0, 191, 0, 1)
                        end
                        function group:addLabel(args)
                            groupbox.Size += UDim2.new(0, 0, 0, 20)
                            library.multiZindex -= 1

                            local div = Instance.new("Frame")
                            local Text = Instance.new("TextLabel")

                            div.Name = "div"
                            div.Parent = grouper
                            div.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            div.BackgroundTransparency = 1.000
                            div.BorderSizePixel = 0
                            div.Size = UDim2.new(1, 0, 0, 20)
                            div.ZIndex = topStuff

                            Text.Name = "Text"
                            Text.Parent = div
                            Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            Text.BackgroundTransparency = 1.000
                            Text.Position = UDim2.new(0.02, -1, 0, 10)
                            Text.FontFace = Fonts.ProggyTiny
                            Text.Text = args.text
                            Text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            Text.TextSize = 9
                            Text.TextStrokeTransparency = 0.000
                            Text.TextXAlignment = Enum.TextXAlignment.Left
                        end
                        function group:addList(args)
                            if not args.flag or not args.values then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 34)
                            library.multiZindex -= 1

                            local list = Instance.new("Frame")
                            local bg = Instance.new("Frame")
                            local main = Instance.new("ScrollingFrame")
                            local button = Instance.new("TextButton")
                            local dumbtriangle = Instance.new("ImageLabel")
                            local valuetext = Instance.new("TextLabel")
                            local gradient = Instance.new("UIGradient")
                            local text = Instance.new("TextLabel")
                            local frame = Instance.new("Frame")
                            local holder = Instance.new("ScrollingFrame")
                            local UIListLayout = Instance.new("UIListLayout")

                            list.Name = "list"
                            list.Parent = grouper
                            list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            list.BackgroundTransparency = 1.000
                            list.BorderSizePixel = 0
                            list.Size = UDim2.new(1, 0, 0, 35)
                            list.ZIndex = library.multiZindex

                            bg.Name = "bg"
                            bg.Parent = list
                            bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            bg.BorderSizePixel = 0
                            bg.Position = UDim2.new(0.02, -1, 0, 16)
                            bg.Size = UDim2.new(0, 205, 0, 15)

                            main.Name = "main"
                            main.Parent = bg
                            main.Active = true
                            main.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                            main.BorderColor3 = Color3.fromRGB(25, 25, 25)
                            main.Size = UDim2.new(1, 0, 1, 0)
                            main.CanvasSize = UDim2.new(0, 0, 0, 0)
                            main.ScrollBarThickness = 0

                            button.Name = "button"
                            button.Parent = main
                            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button.BackgroundTransparency = 1.000
                            button.Size = UDim2.new(0, 191, 1, 0)
                            button.FontFace = Fonts.ProggyTiny
                            button.Text = ""
                            button.TextColor3 = Color3.fromRGB(0, 0, 0)
                            button.TextSize = 9

                            dumbtriangle.Name = "dumbtriangle"
                            dumbtriangle.Parent = main
                            dumbtriangle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                            dumbtriangle.BackgroundTransparency = 1.000
                            dumbtriangle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            dumbtriangle.BorderSizePixel = 0
                            dumbtriangle.Position = UDim2.new(1, -11, 0.5, -3)
                            dumbtriangle.Size = UDim2.new(0, 7, 0, 6)
                            dumbtriangle.ZIndex = 3
                            dumbtriangle.Image = "rbxassetid://8532000591"
                            dumbtriangle.ImageColor3 = Color3.fromRGB(255, 255, 255)

                            valuetext.Name = "valuetext"
                            valuetext.Parent = main
                            valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            valuetext.BackgroundTransparency = 1.000
                            valuetext.Position = UDim2.new(0.00200000009, 2, 0, 7)
                            valuetext.ZIndex = 2
                            valuetext.FontFace = Fonts.ProggyTiny
                            valuetext.Text = ""
                            valuetext.TextColor3 = Color3.fromRGB(244, 244, 244)
                            valuetext.TextSize = 9
                            valuetext.TextStrokeTransparency = 0.000
                            valuetext.TextXAlignment = Enum.TextXAlignment.Left

                            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 105, 105)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 121, 121))}
                            gradient.Rotation = 90
                            gradient.Name = "gradient"
                            gradient.Parent = main

                            text.Name = "text"
                            text.Parent = list
                            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
                            text.ZIndex = 2
                            text.FontFace = Fonts.ProggyTiny
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            text.TextSize = 9
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left

                            frame.Name = "frame"
                            frame.Parent = list
                            frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            frame.BorderSizePixel = 0
                            frame.Position = UDim2.new(0.0299999993, -1, 0.605000019, 15)
                            frame.Size = UDim2.new(0, 203, 0, 0)
                            frame.Visible = false
                            frame.ZIndex = library.multiZindex

                            holder.Name = "holder"
                            holder.Parent = frame
                            holder.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                            holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            holder.Size = UDim2.new(1, 0, 1, 0)
                            holder.ScrollBarThickness = 1

                            UIListLayout.Parent = holder
                            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

                            local function updateValue(value)
                                if value == nil then valuetext.Text = "nil" return end
                                if args.multiselect then
                                    if type(value) == "string" then
                                    if not table.find(library.options[args.flag].values,value) then return end
                                    if table.find(library.flags[args.flag],value) then
                                        for i,v in pairs(library.flags[args.flag]) do
                                            if v == value then
                                                table.remove(library.flags[args.flag],i)
                                            end
                                        end
                                    else
                                        table.insert(library.flags[args.flag],value)
                                    end
                                    else
                                    library.flags[args.flag] = value
                                    end
                                    local buttonText = ""
                                    for i,v in pairs(library.flags[args.flag]) do
                                    local jig = i ~= #library.flags[args.flag] and "," or ""
                                    buttonText = buttonText..v..jig
                                    end
                                    if buttonText == "" then buttonText = "..." end
                                    for i,v in next, holder:GetChildren() do
                                    if v.ClassName ~= "Frame" then continue end
                                    v.off.TextColor3 = Color3.fromRGB(155, 155, 155)
                                        for _i,_v in next, library.flags[args.flag] do
                                            if v.Name == _v then
                                                v.off.TextColor3 = Color3.new(1,1,1)
                                            end
                                        end
                                    end
                                    valuetext.Text = buttonText
                                    if args.callback then
                                    args.callback(library.flags[args.flag])
                                    end
                                else
                                    if not table.find(library.options[args.flag].values,value) then value = library.options[args.flag].values[1] end
                                    library.flags[args.flag] = value
                                    for i,v in next, holder:GetChildren() do
                                    if v.ClassName ~= "Frame" then continue end
                                    v.off.TextColor3 = Color3.new(0.65,0.65,0.65)
                                    if v.Name == library.flags[args.flag] then
                                            v.off.TextColor3 = library.Colors.libColor
                                        end
                                    end
                                    frame.Visible = false
                                    if library.flags[args.flag] then
                                    valuetext.Text = library.flags[args.flag]
                                    if args.callback then
                                            args.callback(library.flags[args.flag])
                                        end
                                    end
                                end
                            end
                            function refresh(tbl)
                                for i,v in next, holder:GetChildren() do
                                    if v.ClassName == "Frame" then
                                    v:Destroy()
                                    end
                                    frame.Size = UDim2.new(0, 203, 0, 0)
                                end
                                for i,v in pairs(tbl) do
                                    frame.Size += UDim2.new(0, 0, 0, 20)
                                    local option = Instance.new("Frame")
                                    local button_2 = Instance.new("TextButton")
                                    local text_2 = Instance.new("TextLabel")

                                    option.Name = v
                                    option.Parent = holder
                                    option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    option.BackgroundTransparency = 1.000
                                    option.Size = UDim2.new(1, 0, 0, 20)

                                    button_2.Name = "button"
                                    button_2.Parent = option
                                    button_2.BackgroundColor3 = Color3.fromRGB(10,10,10)
                                    button_2.BackgroundTransparency = 0.850
                                    button_2.BorderSizePixel = 0
                                    button_2.Size = UDim2.new(1, 0, 1, 0)
                                    button_2.FontFace = Fonts.ProggyTiny
                                    button_2.BorderColor3 = Color3.fromRGB(25,25,25)
                                    button_2.Text = ""
                                    button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
                                    button_2.TextSize = 9

                                    text_2.Name = "off"
                                    text_2.Parent = option
                                    text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    text_2.BackgroundTransparency = 1.000
                                    text_2.Position = UDim2.new(0, 4, 0, 0)
                                    text_2.Size = UDim2.new(0, 0, 1, 0)
                                    text_2.FontFace = Fonts.ProggyTiny
                                    text_2.Text = v
                                    text_2.TextColor3 = args.multiselect and Color3.fromRGB(125, 125, 125) or library.Colors.libColor
                                    text_2.TextSize = 9
                                    text_2.TextStrokeTransparency = 0.000
                                    text_2.TextXAlignment = Enum.TextXAlignment.Left

                                    button_2.MouseButton1Click:Connect(function()
                                            updateValue(v)
                                        end)
                                            button_2.MouseEnter:connect(function()
                                            button_2.BorderColor3 = library.Colors.libColor
                                            button_2.BorderSizePixel = 1
        
                                            button_2.MouseLeave:connect(function()
                                            button_2.BorderColor3 = Color3.fromRGB(1,1,1)
                                            button_2.BorderSizePixel = 0
                                        end)
                                    end)
                                end
                                library.options[args.flag].values = tbl
                                updateValue(table.find(library.options[args.flag].values,library.flags[args.flag]) and library.flags[args.flag] or library.options[args.flag].values[1])
                            end

                            button.MouseButton1Click:Connect(function()
                            if not library.colorpicking then
                                frame.Visible = not frame.Visible
                            end
                            end)
                            button.MouseEnter:Connect(function()
                                library:Tween(main, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                            end)
                            
                            button.MouseLeave:Connect(function()
                              library:Tween(main, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                            end) 

                            table.insert(library.toInvis,frame)
                            library.flags[args.flag] = args.multiselect and {} or ""
                            library.options[args.flag] = {type = "list",changeState = updateValue,values = args.values,refresh = refresh,skipflag = args.skipflag,oldargs = args}
                            refresh(args.values)
                            updateValue(args.value or not args.multiselect and args.values[1] or "abcdefghijklmnopqrstuwvxyz")
                        end
                        function group:addConfigbox(args)
                            if not args.flag or not args.values then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 138)
                            library.multiZindex -= 1

                            local list2 = Instance.new("Frame")
                            local frame = Instance.new("Frame")
                            local main = Instance.new("ScrollingFrame")
                            local holder = Instance.new("ScrollingFrame")
                            local UIListLayout = Instance.new("UIListLayout")
                            local dwn = Instance.new("ImageLabel")
                            local up = Instance.new("ImageLabel")

                            list2.Name = "list2"
                            list2.Parent = grouper
                            list2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            list2.BackgroundTransparency = 1.000
                            list2.BorderSizePixel = 0
                            list2.Position = UDim2.new(0, 0, 0.108108111, 0)
                            list2.Size = UDim2.new(1, 0, 0, 138)

                            frame.Name = "frame"
                            frame.Parent = list2
                            frame.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            frame.BorderSizePixel = 2
                            frame.Position = UDim2.new(0.02, -1, 0.0439999998, 0)
                            frame.Size = UDim2.new(0, 205, 0, 128)

                            main.Name = "main"
                            main.Parent = frame
                            main.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                            main.BorderColor3 = Color3.fromRGB(14, 14, 14)
                            main.Size = UDim2.new(1, 0, 1, 0)
                            main.ScrollBarThickness = 1

                            holder.Name = "holder"
                            holder.Parent = main
                            holder.Active = true
                            holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            holder.BackgroundTransparency = 1.000
                            holder.BorderSizePixel = 0
                            holder.Position = UDim2.new(0, 0, 0.00571428565, 0)
                            holder.Size = UDim2.new(1, 0, 1, 0)
                            holder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                            holder.CanvasSize = UDim2.new(0, 0, 0, 0)
                            holder.ScrollBarThickness = 1
                            holder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                            holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
                            holder.ScrollingEnabled = true
                            holder.ScrollBarImageTransparency = 0

                            UIListLayout.Parent = holder

                            dwn.Name = "dwn"
                            dwn.Parent = frame
                            dwn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                            dwn.BackgroundTransparency = 1.000
                            dwn.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            dwn.BorderSizePixel = 0
                            dwn.Position = UDim2.new(0.930000007, 4, 1, -9)
                            dwn.Size = UDim2.new(0, 7, 0, 6)
                            dwn.ZIndex = 3
                            dwn.Image = "rbxassetid://8548723563"
                            dwn.Visible = false

                            up.Name = "up"
                            up.Parent = frame
                            up.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                            up.BackgroundTransparency = 1.000
                            up.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            up.BorderSizePixel = 0
                            up.Position = UDim2.new(0, 3, 0, 3)
                            up.Size = UDim2.new(0, 7, 0, 6)
                            up.ZIndex = 3
                            up.Image = "rbxassetid://8548757311"
                            up.Visible = false

                            local function updateValue(value)
                                if value == nil then return end
                                if not table.find(library.options[args.flag].values,value) then value = library.options[args.flag].values[1] end
                                library.flags[args.flag] = value
                                for i,v in next, holder:GetChildren() do
                                    if v.ClassName ~= "Frame" then continue end
                                    if v.text.Text == library.flags[args.flag] then
                                    v.text.TextColor3 = library.Colors.libColor
                                    else
                                    v.text.TextColor3 = Color3.fromRGB(255,255,255)
                                    end
                                end
                                if library.flags[args.flag] then
                                    if args.callback then
                                    args.callback(library.flags[args.flag])
                                    end
                                end
                                holder.Visible = true
                            end
                            holder:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                            up.Visible = (holder.CanvasPosition.Y > 1)
                            dwn.Visible = (holder.CanvasPosition.Y + 1 < (holder.AbsoluteCanvasSize.Y - holder.AbsoluteSize.Y))
                            end)
                            function refresh(tbl)
                                for i,v in next, holder:GetChildren() do
                                    if v.ClassName == "Frame" then
                                    v:Destroy()
                                    end
                                end
                                for i,v in pairs(tbl) do
                                    local item = Instance.new("Frame")
                                    local button = Instance.new("TextButton")
                                    local text = Instance.new("TextLabel")

                                    item.Name = v
                                    item.Parent = holder
                                    item.Active = true
                                    item.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                    item.BackgroundTransparency = 1.000
                                    item.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                    item.BorderSizePixel = 0
                                    item.Size = UDim2.new(1, 0, 0, 18)

                                    button.Parent = item
                                    button.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                                    button.BackgroundTransparency = 1
                                    button.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                    button.BorderSizePixel = 0
                                    button.Size = UDim2.new(1, 0, 1, 0)
                                    button.Text = ""
                                    button.TextTransparency = 1.000

                                    text.Name = 'text'
                                    text.Parent = item
                                    text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    text.BackgroundTransparency = 1.000
                                    text.Size = UDim2.new(1, 0, 0, 18)
                                    text.FontFace = Fonts.ProggyTiny
                                    text.Text = v
                                    text.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    text.TextSize = 9
                                    text.TextStrokeTransparency = 0.000

                                    button.MouseButton1Click:Connect(function()
                                    updateValue(v)
                                    end)
                                end

                                holder.Visible = true
                                library.options[args.flag].values = tbl
                                updateValue(table.find(library.options[args.flag].values,library.flags[args.flag]) and library.flags[args.flag] or library.options[args.flag].values[1])
                            end

                            library.flags[args.flag] = ""
                            library.options[args.flag] = {type = "cfg",changeState = updateValue,values = args.values,refresh = refresh,skipflag = args.skipflag,oldargs = args}
                            refresh(args.values)
                            updateValue(args.value or not args.multiselect and args.values[1] or "abcdefghijklmnopqrstuwvxyz")
                        end
                        function group:addColorpicker(args)
                            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 20)
                            library.multiZindex -= 1
                            jigCount -= 1
                            topStuff -= 1

                            local colorpicker = Instance.new("Frame")
                            local back = Instance.new("Frame")
                            local mid = Instance.new("Frame")
                            local front = Instance.new("Frame")
                            local text = Instance.new("TextLabel")
                            local colorpicker_2 = Instance.new("Frame")
                            local button = Instance.new("TextButton")
                            local colorFrame = Instance.new("Frame")
                            local colorFrame_2 = Instance.new("Frame")
                            local hueframe = Instance.new("Frame")
                            local main = Instance.new("Frame")
                            local hue = Instance.new("ImageLabel")
                            local pickerframe = Instance.new("Frame")
                            local main_2 = Instance.new("Frame")
                            local picker = Instance.new("ImageLabel")
                            local clr = Instance.new("Frame")
                            local copy = Instance.new("TextButton")
                            local CurrentColorFrame = Instance.new("Frame")
                            local CurrentColorFrame_Text = Instance.new("TextLabel")

                            colorpicker.Name = "colorpicker"
                            colorpicker.Parent = grouper
                            colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            colorpicker.BackgroundTransparency = 1.000
                            colorpicker.BorderSizePixel = 0
                            colorpicker.Size = UDim2.new(1, 0, 0, 20)
                            colorpicker.ZIndex = topStuff

                            text.Name = "text"
                            text.Parent = colorpicker
                            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0.02, -1, 0, 10)
                            text.FontFace = Fonts.ProggyTiny
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            text.TextSize = 9
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left

                            button.Name = "button"
                            button.Parent = colorpicker
                            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button.BackgroundTransparency = 1.000
                            button.BorderSizePixel = 0
                            button.Size = UDim2.new(1, 0, 1, 0)
                            button.FontFace = Fonts.ProggyTiny
                            button.Text = ""
                            button.TextColor3 = Color3.fromRGB(0, 0, 0)
                            button.TextSize = 9

                            colorpicker_2.Name = "colorpicker"
                            colorpicker_2.Parent = colorpicker
                            colorpicker_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            colorpicker_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            colorpicker_2.BorderSizePixel = 3
                            colorpicker_2.Position = UDim2.new(0.860000014, 4, 0.272000015, 0)
                            colorpicker_2.Size = UDim2.new(0, 20, 0, 10)

                            mid.Name = "mid"
                            mid.Parent = colorpicker_2
                            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
                            mid.BorderColor3 = Color3.fromRGB(25,25,25)
                            mid.BorderSizePixel = 2
                            mid.Size = UDim2.new(1, 0, 1, 0)

                            front.Name = "front"
                            front.Parent = mid
                            front.BackgroundColor3 = library.Colors.libColor
                            front.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            front.Size = UDim2.new(1, 0, 1, 0)
                            front.Name = "dontchange"

                            local ColorPickerGradient2 = Instance.new("UIGradient", front)
                            ColorPickerGradient2.Name = "dontchange"
                            ColorPickerGradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)), ColorSequenceKeypoint.new(0.320, Color3.fromRGB(100, 100, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
                            ColorPickerGradient2.Rotation = 270

                            button.Name = "button"
                            button.Parent = colorpicker
                            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button.BackgroundTransparency = 1.000
                            button.Size = UDim2.new(0, 202, 0, 22)
                            button.FontFace = Fonts.ProggyTiny
                            button.Text = ""
                            button.ZIndex = args.ontop and topStuff or jigCount
                            button.TextColor3 = Color3.fromRGB(0, 0, 0)
                            button.TextSize = 9

                            colorFrame.Name = "colorFrame"
                            colorFrame.Parent = colorpicker
                            colorFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            colorFrame.BorderSizePixel = 2
                            colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)
                            colorFrame.Size = UDim2.new(0, 187, 0, 178)

                            colorFrame_2.Name = "colorFrame"
                            colorFrame_2.Parent = colorFrame
                            colorFrame_2.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
                            colorFrame_2.Size = UDim2.new(1, 0, 1, 0)

                            hueframe.Name = "hueframe"
                            hueframe.Parent = colorFrame_2
                            hueframe.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                            hueframe.BorderSizePixel = 2
                            hueframe.Position = UDim2.new(-0.0830000022, 18, -0.0559999987, 13)
                            hueframe.Size = UDim2.new(0.25, 110, 0.25, 110)

                            main.Name = "main"
                            main.Parent = hueframe
                            main.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            main.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            main.Size = UDim2.new(1, 0, 1, 0)
                            main.ZIndex = 6

                            picker.Name = "picker"
                            picker.Parent = main
                            picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
                            picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            picker.BorderSizePixel = 0
                            picker.Size = UDim2.new(1, 0, 1, 0)
                            picker.ZIndex = 104
                            picker.Image = "rbxassetid://2615689005"

                            pickerframe.Name = "pickerframe"
                            pickerframe.Parent = colorFrame
                            pickerframe.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                            pickerframe.BorderSizePixel = 2
                            pickerframe.Position = UDim2.new(0.801000025, 14, -0.0559999987, 13)
                            pickerframe.Size = UDim2.new(0, 20, 0.25, 110)

                            CurrentColorFrame.Name = "CurrentColorFrame"
                            CurrentColorFrame.Parent = colorFrame
                            CurrentColorFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            CurrentColorFrame.BorderColor3 = Color3.fromRGB(15,15,15)
                            CurrentColorFrame.BorderSizePixel = 2
                            CurrentColorFrame.Position = UDim2.new(0.98, 0, 0.915, 0)
                            CurrentColorFrame.Size = UDim2.new(-0.965, 0, 0, 12)

                            CurrentColorFrame_Text.Name = "CurrentColorFrame_Text"
                            CurrentColorFrame_Text.Parent = CurrentColorFrame
                            CurrentColorFrame_Text.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            CurrentColorFrame_Text.BackgroundTransparency = 1.000
                            CurrentColorFrame_Text.BorderSizePixel = 0
                            CurrentColorFrame_Text.Size = UDim2.new(1, 0, 1, 0)
                            CurrentColorFrame_Text.FontFace = Fonts.ProggyTiny
                            CurrentColorFrame_Text.Text = args.text or args.flag
                            CurrentColorFrame_Text.TextColor3 = library.Colors.libColor
                            CurrentColorFrame_Text.TextSize = 9
                            CurrentColorFrame_Text.TextStrokeTransparency = 0.000

                            main_2.Name = "main"
                            main_2.Parent = pickerframe
                            main_2.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            main_2.Size = UDim2.new(0, 20, 1, 0)
                            main_2.ZIndex = 6

                            hue.Name = "hue"
                            hue.Parent = main_2
                            hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
                            hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            hue.BorderSizePixel = 0
                            hue.Size = UDim2.new(0, 20, 1, 0)
                            hue.ZIndex = 104
                            hue.Image = "rbxassetid://2615692420"

                            clr.Name = "clr"
                            clr.Parent = colorFrame
                            clr.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            clr.BackgroundTransparency = 1.000
                            clr.BorderColor3 = Color3.fromRGB(30, 30, 30)
                            clr.BorderSizePixel = 2
                            clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
                            clr.Size = UDim2.new(0, 0, 0, 14)
                            clr.ZIndex = 5

                            copy.MouseButton1Click:Connect(function()
                            colorFrame.Visible = false
                            end)

                            button.MouseButton1Click:Connect(function()
                            colorFrame.Visible = not colorFrame.Visible
                            mid.BorderColor3 = Color3.fromRGB(25,25,25)
                            end)

                            button.MouseEnter:Connect(function()
                                library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                            end)
                            
                            button.MouseLeave:Connect(function()
                                library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                            end) 

                            local function updateValue(value,fakevalue)
                                if typeof(value) == "table" then value = fakevalue end
                                library.flags[args.flag] = value
                                front.BackgroundColor3 = value

                                local r, g, b = value.r * 255, value.g * 255, value.b * 255
                                CurrentColorFrame_Text.TextColor3 = value
                                CurrentColorFrame_Text.Text = "RGB(" .. math.floor(r) .. ", " .. math.floor(g) .. ", " .. math.floor(b) .. ")"

                                if args.callback then
                                    args.callback(value)
                                end
                            end

                            local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
                            local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
                            local heartbeat = RunService.Heartbeat
                            local pickerX,pickerY,hueY = 0,0,0
                            local oldpercentX,oldpercentY = 0,0

                            hue.MouseEnter:Connect(function()
                            local input = hue.InputBegan:connect(function(key)
                            if key.UserInputType == Enum.UserInputType.MouseButton1 then
                                while heartbeat:wait() and InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    library.colorpicking = true
                                    local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                                    local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                                    local startC = colors[math.floor(num)]
                                    local endC = colors[math.ceil(num)]
                                    local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                                    picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                                    updateValue(color)
                                end
                                library.colorpicking = false
                            end
                            end)
                            local leave
                            leave = hue.MouseLeave:connect(function()
                            input:disconnect()
                            leave:disconnect()
                            end)
                            end)

                            picker.MouseEnter:Connect(function()
                            local input = picker.InputBegan:connect(function(key)
                            if key.UserInputType == Enum.UserInputType.MouseButton1 then
                                while heartbeat:wait() and InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    library.colorpicking = true
                                    local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                                    local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                                    local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                                    updateValue(color)
                                    oldpercentX,oldpercentY = xPercent,yPercent
                                end
                                library.colorpicking = false
                            end
                            end)
                            local leave
                            leave = picker.MouseLeave:connect(function()
                            input:disconnect()
                            leave:disconnect()
                            end)
                            end)

                            hue.MouseMoved:connect(function(_, y)
                            hueY = y
                            end)

                            picker.MouseMoved:connect(function(x, y)
                            pickerX,pickerY = x,y
                            end)

                            table.insert(library.toInvis,colorFrame)
                            library.flags[args.flag] = Color3.new(1,1,1)
                            library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
                            updateValue(args.color or Color3.new(1,1,1))
                        end
                        function group:addKeybind(args)
                            if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on toggle:keybind") end
                            groupbox.Size += UDim2.new(0, 0, 0, 20)
                            local next = false
                            local keybind = Instance.new("Frame")
                            local text = Instance.new("TextLabel")
                            local button = Instance.new("TextButton")

                            keybind.Parent = grouper
                            keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            keybind.BackgroundTransparency = 1.000
                            keybind.BorderSizePixel = 0
                            keybind.Size = UDim2.new(1, 0, 0, 20)

                            text.Parent = keybind
                            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0.02, -1, 0, 10)
                            text.FontFace = Fonts.ProggyTiny
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            text.TextSize = 9
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left

                            button.Parent = keybind
                            button.BackgroundColor3 = Color3.fromRGB(187, 131, 255)
                            button.BackgroundTransparency = 1.000
                            button.BorderSizePixel = 0
                            button.Position = UDim2.new(7.09711117e-08, 0, 0, 0)
                            button.Size = UDim2.new(0.02, 0, 1, 0)
                            button.FontFace = Fonts.ProggyTiny
                            button.Text = "--"
                            button.TextColor3 = Color3.fromRGB(155, 155, 155)
                            button.TextSize = 9
                            button.TextStrokeTransparency = 0.000
                            button.TextXAlignment = Enum.TextXAlignment.Right

                            function updateValue(val)
                                if library.colorpicking then return end
                                library.flags[args.flag] = val
                                button.Text = keynames[val] or "["..val.Name.."]"
                            end
                            InputService.InputBegan:Connect(function(key)
                            local key = key.KeyCode == Enum.KeyCode.Unknown and key.UserInputType or key.KeyCode
                            if next then
                                if not table.find(library.blacklisted,key) then
                                    next = false
                                    library.flags[args.flag] = key
                                    button.Text = keynames[key] or "["..key.Name.."]"
                                    button.TextColor3 = Color3.fromRGB(155, 155, 155)
                                end
                            end
                            if not next and key == library.flags[args.flag] and args.callback then
                                    args.callback(key)
                                end
                            end)

                            button.MouseButton1Click:Connect(function()
                            if library.colorpicking then return end
                                library.flags[args.flag] = Enum.KeyCode.Unknown
                                button.Text = "..."
                                button.TextColor3 = Color3.new(0.2,0.2,0.2)
                                next = true
                            end)

                            library.flags[args.flag] = Enum.KeyCode.Unknown
                            library.options[args.flag] = {type = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
                            updateValue(args.key or Enum.KeyCode.Unknown)
                        end
                            return group, groupbox
                        end
                            return tab
                        end

                        --// Configs
                        function contains(list, x)
                        for _, v in pairs(list) do
                            if v == x then return true end
                            end return false end
                            function library:createConfig()
                                makefolder("Fatality.gg")
                                local name = library.flags["config_name"]
                                if contains(library.options["config_box"].values, name) then return library:Notify(name..".cfg already exists!", 5) end
                                if name == "" then return library:Notify("You need to put a name in!", 5) end
                                local jig = {}
                                for i,v in next, library.flags do
                                    if library.options[i].skipflag then continue end
                                    if typeof(v) == "Color3" then jig[i] = {v.R,v.G,v.B}
                                elseif typeof(v) == "EnumItem" then jig[i] = {string.split(tostring(v),".")[2],string.split(tostring(v),".")[3]}
                                else jig[i] = v
                                end
                            end
                            writefile("Fatality.gg/"..name..".cfg",game:GetService("HttpService"):JSONEncode(jig))
                            library:Notify("Succesfully created config "..name..".cfg!", 5)
                            library:refreshConfigs()
                        end

                        function library:saveConfig()
                            pcall(function()
                                makefolder("Fatality.gg")
                                local name = library.flags["config_box"]
                                if not name then
                                    return
                                end
                                
                                local jig = {}
                                for i, v in pairs(library.flags) do
                                    if library.options[i].skipflag then
                                        continue
                                    end
                                    if typeof(v) == "Color3" then
                                        jig[i] = {v.R, v.G, v.B}
                                    elseif typeof(v) == "EnumItem" then
                                        jig[i] = {string.split(tostring(v), ".")[2], string.split(tostring(v), ".")[3]}
                                    else
                                        jig[i] = v
                                    end
                                end
                                writefile(name, game:GetService("HttpService"):JSONEncode(jig))
                                library:Notify("Successfully updated config " .. name .. ".cfg!", 5)
                                library:refreshConfigs()
                            end)
                        end                                               

                        function library:loadConfig()
                            local name = library.flags["config_box"]
                                if not isfile(name) then
                                    library:Notify("Config file not found!")
                                    return end
                                    local config = game:GetService("HttpService"):JSONDecode(readfile(name))
                                    for i,v in next, library.options do
                                    spawn(function()pcall(function()
                                    if config[i] then
                                        if v.type == "colorpicker" then v.changeState(Color3.new(config[i][1],config[i][2],config[i][3]))
                                    elseif v.type == "keybind" then v.changeState(Enum[config[i][1]][config[i][2]])
                                    else
                                        if config[i] ~= library.flags[i] then v.changeState(config[i]) end
                                    end
                                    else
                                    if v.type == "toggle" then v.changeState(false) v.riskcfg(v.risky)
                                    elseif v.type == "slider" then v.changeState(v.args.value or 0) v.riskcfg(v.risky)
                                    elseif v.type == "textbox" or v.type == "list" or v.type == "cfg" then v.changeState(v.args.value or v.args.text or "")
                                    elseif v.type == "colorpicker" then v.changeState(v.args.color or Color3.new(1,1,1))
                                    elseif v.type == "list" then v.changeState("")
                                    elseif v.type == "keybind" then v.changeState(v.args.key or Enum.KeyCode.Unknown)
                                    end
                                end
                            end)
                        end)
                    end
                    library:Notify("Succesfully loaded config "..name..".cfg!", 5)
                end

                function library:deleteConfig()
                if isfile(library.flags["config_box"]) then delfile(library.flags["config_box"])
                    library:refreshConfigs()
                    end
                end

                function library:refreshConfigs()
                    local tbl = {}
                    for i,v in next, listfiles("Fatality.gg") do table.insert(tbl,v) end
                    library.options["config_box"].refresh(tbl)
                end      
            end)()                         
            return library
end)();
--
local Tabs = {
main = Library:addTab("main", ""),
visuals = Library:addTab("visuals", ""),
misc = Library:addTab("misc", ""), 
world = Library:addTab("world", ""), 
settings = Library:addTab("settings", "")
}
    --
    local RunService = game:GetService("RunService")
    --
    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)
    FOVCircle.Radius = 80
    FOVCircle.Color = Color3.fromRGB(45, 116, 202)
    FOVCircle.Visible = false
    --
    local Line = Drawing.new("Line")
    Line.Color = Color3.fromRGB(255, 255, 255)
    Line.From = Vector2.new(game.Workspace.CurrentCamera.ViewportSize.X / 2, game.Workspace.CurrentCamera.ViewportSize.Y / 2)
    Line.Thickness = 1
    Line.Visible = true
    Line.ZIndex = 1
    --
    local Decode = base64.decode
    --
    local workspace = game.Workspace
    local playerListCache = {}
    local lastUpdated = 0
    local snaplineTarget = nil
    getgenv().SilentEnabled = false
    --
    local modules = {
        ["PlayerClient"] = {},
        ["Character"] = {},
        ["BowClient"] = {},
        ["Camera"] = {},
        ["RangedWeaponClient"] = {},
        ["GetEquippedItem"] = {},
        ["FPS"] = {},
    }
    --
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and islclosure(v) then
            local info = debug.getinfo(v)
            local name = string.match(info.short_src, "%.([%w_]+)$")
    
            if name and modules[name] and info.name ~= nil then
                modules[name][info.name] = info.func
            end
        end
    end
    --
    local playerListCache = {}
    local snaplineTarget = nil
    --
    local PlayerList = debug.getupvalue(modules.PlayerClient.updatePlayers, 1)
    --
    if not PlayerList then
        error("PlayerList function not found.")
    end
    --
    local TargetNpcs = false
    --
    local function IsSleeping(model)
        if model and model:FindFirstChild("AnimationController") and model.AnimationController:FindFirstChild("Animator") then
            for _, v in pairs(model.AnimationController.Animator:GetPlayingAnimationTracks()) do
                if v.Animation.AnimationId == "rbxassetid://13280887764" then
                    return true
                end
            end
        end
        return false
    end
    --
    local function GetPlayer()
        local closest, playerTable = nil, nil
        local closestMagnitude = math.huge
        local localPos = workspace.Const.Ignore.LocalCharacter.Middle:GetPivot().Position
        for _, model in ipairs(workspace:GetChildren()) do
            if model:IsA("Model") and model:FindFirstChild("Head") then
                local isPlayer, data = false, nil
                for _, v in pairs(debug.getupvalue(modules.PlayerClient.updatePlayers, 1) or {}) do
                    if v.type == "Player" and v.model == model and not v.sleeping then
                        isPlayer = true
                        data = v
                        break
                    end
                end
                --
                local isNpc = not model.Head:FindFirstChild("Teamtag") or 
                not model.Head.Teamtag:FindFirstChild("tag") or 
                model.Head.Teamtag.tag.Text == "Shylou2644"
                --
                if IsSleeping(model) then
                    continue
                end
                if not TargetNpcs and isNpc then
                    continue
                end
                if TargetNpcs and not isNpc then
                    isPlayer = true
                end
                --
                local PartPos, OnScreen = Camera:WorldToViewportPoint(model:GetPivot().Position)
                local Magnitude = (Vector2.new(PartPos.X, PartPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                local TargetDistance = (localPos - model:GetPivot().Position).Magnitude
                if Magnitude < FOVCircle.Radius and TargetDistance <= 9999 and Magnitude < closestMagnitude and OnScreen then
                    closestMagnitude = Magnitude
                    closest = model
                    playerTable = isPlayer and data or nil
                end
            end
        end
        return closest, playerTable
    end
    --
    local function updateTarget()
        local target = snaplineTarget
        if target then
            getgenv().Target = target
        end
    end
    --
    getgenv().PlayersVelocity = nil
    --
    local function updateSnapline()
        local Target, playerData = GetPlayer()
        if Target and Target:FindFirstChild("Head") then
            local headPos, onScreen = game.Workspace.CurrentCamera:WorldToViewportPoint(Target.Head.Position)
            Line.Visible = onScreen
            if onScreen then
                Line.To = Vector2.new(headPos.X, headPos.Y)
                snaplineTarget = Target
                getgenv().PlayersVelocity = playerData and playerData.velocityVector or Vector3.new(0, 0, 0)
            else
                snaplineTarget = nil
                getgenv().PlayersVelocity = nil
            end
        else
            Line.Visible = false
            snaplineTarget = nil
            getgenv().PlayersVelocity = nil
        end
    end
    --
    local CharacterList = debug.getupvalues(modules.Character.getGroundCastResult)
    --
    local function GetProjectileInfo()
        local equippedItem = CharacterList[2].GetEquippedItem()
        if equippedItem == nil then
            return 0, 0
        else
            local projectileSpeed = equippedItem.ProjectileSpeed
            local projectileDrop = equippedItem.ProjectileDrop
            if projectileSpeed == nil or projectileDrop == nil then
                return 0, 0
            else
                return projectileSpeed, projectileDrop
            end
        end
    end
    --
    local function GetProjectileData()
        local Item = CharacterList[2].GetEquippedItem()
        if Item and Item.ProjectileSpeed and Item.ProjectileDrop then
            return Item.ProjectileSpeed, Item.ProjectileDrop
        end
        return nil, nil
    end
    --
    getgenv().BestPrediction = function(TargetPosition, Velocity, ProjectileSpeed, ProjectileDrop, Continuous)
        local PSpeed, PDrop = ProjectileSpeed, ProjectileDrop
        if not PSpeed or not PDrop then
            PSpeed, PDrop = GetProjectileData()
            if not PSpeed or not PDrop then
                return Vector3.new(0, 0, 0), nil
            end
        end
        local function PredictOnce()
            local Dist = (TargetPosition - Camera.CFrame.Position).Magnitude
            if Dist > 0 then
                local TimeToHit = Dist / PSpeed
                local PredictedPosition = TargetPosition
                if Velocity then
                    PredictedPosition = TargetPosition + (Velocity * TimeToHit)
                end
                local DropCorrection = -PDrop ^ (TimeToHit * PDrop) + 1.4
                PredictedPosition = PredictedPosition - Vector3.new(0, DropCorrection, 0)
                return PredictedPosition, TimeToHit
            end
            return Vector3.new(0, 0, 0), nil
        end
        if Continuous then
            while true do
                local PredictedPosition, TimeToHit = PredictOnce()
                if PredictedPosition then
                    return PredictedPosition, TimeToHit
                end
                wait(0.5)
            end
        else
            return PredictOnce()
        end
    end
    --
    local saim; saim = hookfunction(unpack, newcclosure(function(...) 
        local args = {...}
        local stack = debug.getstack(1, 1)
        if typeof(stack[1][9]) == "CFrame" and getgenv().SilentEnabled and getgenv().Target and getgenv().Target.Head then
            local targetHead = getgenv().Target.Head
            --
            if not targetHead then
                return saim(...)
            end
            --
            local Camera = game.workspace.CurrentCamera
            local cameraPosition = Camera.CFrame.Position
            local predictedPos = getgenv().BestPrediction(targetHead.Position, getgenv().PlayersVelocity or Vector3.new(0, 0, 0))
            if predictedPos then
                stack[1][9] = CFrame.lookAt(cameraPosition, predictedPos)
            end
        else
            return saim(...)
        end
        return saim(...)
    end))
    --
    local novas = {jumpshoot = false}
    --
    local oldhook; oldhook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Raycast" and self == workspace and novas.jumpshoot then
            local args = {...}
            local origin, params = args[1], args[3]
            if params.CollisionGroup == "Default" then
                local result = oldhook(self, ...)
                if not result then
                    return {
                        Instance = workspace.Terrain, 
                        Position = Vector3.new(origin.X, origin.Y - 3, origin.Z),
                        Normal = Vector3.new(0, 1, 0), 
                        Material = Enum.Material.Grass  
                    }
                end
                return result
            end
        end
        return oldhook(self, ...)
    end))
    --
    local HealthList = {};
    local Cache = {};
    local playerlist = debug.getupvalue(modules.PlayerClient.updatePlayers, 1);
    local Time = tick()
    do -- Main Loop
        RunService.Heartbeat:Connect(function(DeltaTime)
            task.spawn(function()
                local CurrentTime = tick()
                if CurrentTime - Time >= 5 then
                    Time = CurrentTime
                    for i, v in pairs(playerlist) do
                        if v.type == "Player" and v.model:FindFirstChild("HumanoidRootPart") and HealthList[v.id] then
                            HealthList[v.id] = HealthList[v.id] + 1
                            HealthList[v.id] = math.clamp(HealthList[v.id], 0, 100)
                        end
                    end
                end
            end)
        end)
    end
    --
    do -- Health Prediction
        local roundToOneDecimal = function(value)
            return math.floor(value * 10 + 0.5) / 10
        end
        --
        function char:PredictHP(damage, protection, hitPart, health)
            if damage and protection and hitPart and health then
                local damageMultiplier = 1
                --
                if hitPart == "Torso" then
                    damageMultiplier = 1 - protection
                elseif hitPart == "Head" then
                    damageMultiplier = 1.752 * (1 - protection)
                end
                --
                local reducedDamage = damage * damageMultiplier
                local newHealth = health - reducedDamage
                --
                reducedDamage = roundToOneDecimal(reducedDamage)
                newHealth = roundToOneDecimal(newHealth)
                --
                if newHealth then
                    return newHealth
                end
            else
                warn("Cannot Find Health.")
            end
            return 0
        end
        --
        function char:GetArmor(playertable, hitbox)
            if playertable then
                if playertable.model:FindFirstChild("HumanoidRootPart") and #playertable.model.Armor:GetChildren() ~= 0 then
                    for i,v in pairs(playertable.model.Armor:GetChildren()) do
                        if hitbox == "Head" then
                            if v.Name:find("Helmet") then
                                return v.Name
                            end
                        else
                            if v.Name:find("Chestplate") then
                                return v.Name
                            end
                        end
                    end
                end
            end
            --
            return nil
        end
        --
        function char:GetProtection(PlayerTable, hitbox)
            local Name = char:GetArmor(PlayerTable, hitbox)
            if Name ~= nil and Nova.modules.Classes[Name] then
                local Table = Nova.modules.Classes[Name]
                for i,v in pairs(Table) do
                    if i:find("Protection") then
                        return v
                    end
                end
            end
            --
            return 0
        end
        --
        function char:GetWeaponDamage()
            if CharacterList[2].GetEquippedItem() == nil then
                return 0
            else
                if Nova.modules.Classes[CharacterList[2].GetEquippedItem().type].Damage == nil or Nova.modules.Classes[CharacterList[2].GetEquippedItem().type].Damage == nil then
                    return 0
                else
                    return Nova.modules.Classes[CharacterList[2].GetEquippedItem().type].Damage, Nova.modules.Classes[CharacterList[2].GetEquippedItem().type].Damage
                end
            end
        end
    end 
    --
    getgenv().HitData = {}
    --
    local Mods; Mods = hookmetamethod(game, "__namecall", newcclosure(function(...)
        local Method = getnamecallmethod()
        local args = {...}
        local self = args[1]
        if Method == "FireServer" then
            task.spawn(function()
                if args[2] == 10 and type(args[6]) == "number" then
                    if Cache[args[6]] then
                        if char:GetWeaponDamage() then
                            local HitPart = (hitboxoverrider and args[7] == "Head") and "Head" or args[7]
                            local DamageDone = char:GetWeaponDamage()
                            local Health = char:PredictHP(DamageDone, char:GetProtection(Cache[args[6]], HitPart), HitPart, 100)
                            if HealthList[args[6]] then
                                Health = char:PredictHP(DamageDone, char:GetProtection(Cache[args[6]], HitPart), HitPart, HealthList[args[6]])
                            end
                            if HealthList[args[6]] then
                                HealthList[args[6]] = Health
                            end
                            getgenv().HitData[args[6]] = {
                                Damage = DamageDone,
                                Health = Health,
                                Position = args[9]
                            }
                        end
                    end
                end
            end)
        end
        return Mods(...)
    end))
    --
    local ForceHead = false
    local booms; booms = hookmetamethod(game, "__namecall", newcclosure(function(...)
        local Method = getnamecallmethod()
        local args   = {...}
        local self   = args[1]
        if Method == "FireServer" then
            if (args[2] == 10 and args[3] == "Hit" and (args[7] == "Torso" or args[7] == "Head")) then
                if ForceHead then
                    args[7] = "Head"
                    args[8] = Vector3.zero
                end    
                return booms(unpack(args))
            end
        end
        return booms(...)
    end))
    --
    local Special3 = false
    local firese = Instance.new('RemoteEvent').FireServer
    local Mods2
    Mods2 = hookmetamethod(game, "__namecall", newcclosure(function(...)
        local Method = getnamecallmethod()
        local args = {...}
        local self = args[1]
        if Method == "FireServer" and Special3 then
            task.spawn(function()
                firese(self, 2, true)
            end)
        end
        return Mods2(...)
    end))
    --
    local FovToggle = false
    local default_fov = 70
    local zoom = 120
    local zoom_enabled = false
    local zoom_amount = 30
    --
    local DesiredColor = Color3.fromRGB(255, 255, 255)
    local ambientenabled = false
    local color = ambientenabled and DesiredColor or lighting.Ambient
    --
    local fovFunc = {
        FieldOfView = Camera.FieldOfView
    }
    --
    local ambientFunc = {
        TimeOfDay = lighting.TimeOfDay,
        Ambient = lighting.Ambient,
        GlobalShadows = lighting.GlobalShadows,
        ColorShift_Top = lighting.ColorShift_Top,
        ColorShift_Bottom = lighting.ColorShift_Bottom,
        FogEnd = lighting.FogEnd,
        FogStart = lighting.FogStart,
        FogColor = lighting.FogColor
    }
    --
    local SpoofedMeta
    SpoofedMeta = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if checkcaller() then
            return SpoofedMeta(self, key)
        end
        if self == Camera and FovToggle and fovFunc[key] then
            return fovFunc[key]
        end
        if self == lighting and ambientFunc[key] then
            return ambientFunc[key]
        end
        return SpoofedMeta(self, key)
    end))
    --
    local SpoofedMetaNew
    SpoofedMetaNew = hookmetamethod(game, "__newindex", newcclosure(function(self, key, value)
        if checkcaller() then
            return SpoofedMetaNew(self, key, value)
        end
        if self == Camera and FovToggle then
            fovFunc[key] = value
            if key == "FieldOfView" then
                return SpoofedMetaNew(self, key, default_fov)
            end
        elseif self == lighting then
            ambientFunc[key] = value
            if key == "Ambient" then
                color = ambientenabled and DesiredColor or value
                return SpoofedMetaNew(self, key, color)
            end
        end
        return SpoofedMetaNew(self, key, value)
    end))
    --
    local WorldVisuals = Tabs.world:createGroup('left', 'World')
    --
    WorldVisuals:addToggle({text = "Ambient",default = false,flag = "Ambient",callback = function(state)
        ambientenabled = state
    end}) 
    --
    WorldVisuals:addColorpicker({text = "Ambient Color", ontop = false, flag = "DesiredColor", color = Color3.fromRGB(255, 255, 255), callback = function(Value)
        DesiredColor = Value
    end})
    --
    WorldVisuals:addToggle({text = "No Grass",default = false,flag = "Grass",callback = function(bool)
       sethiddenproperty(workspace.Terrain, "Decoration", not bool)
    end}) 
    --
    local FeildOfView = Tabs.visuals:createGroup('right', 'FeildOfView')
    --
    FeildOfView:addToggle({text = "Fov Toggle",default = false,flag = "FovToggle",callback = function(state)
        FovToggle = state
    end}) 

    FeildOfView:addSlider({text = "FeildOfView", min = 1, max = 120, suffix = "%", float = 1, default = 70, flag = "view",callback = function(Value)
        default_fov = Value
    end})
    --
    local function onRenderStepped()
        updateSnapline()
        updateTarget()
    end
    --
    RunService.RenderStepped:Connect(onRenderStepped)
    --
    local Silent = Tabs.main:createGroup('left', 'Silent-Aim')
    --
    Silent:addToggle({text = "Silent Aim",default = false,flag = "Silent Aim",callback = function(state)
        getgenv().SilentEnabled = state
    end})
    Silent:addToggle({text = "Target Npcs",default = false,flag = "TargetNpcs",callback = function(state)
        TargetNpcs = state
    end})
    -- Fov Circle --
    Silent:addToggle({text = "Fov Circle",default = false,flag = "Fov Circle",callback = function(Value)
        FOVCircle.Visible = Value
    end}):addColorpicker({text = "Fov Color", ontop = false, flag = "FOVCircleColor", color = Color3.fromRGB(61, 255, 200), callback = function(Value)
        FOVCircle.Color = Value
    end}) 
    Silent:addSlider({text = "Fov Circle:", min = 0, max = 1000, suffix = "%", float = 1, default = 50, flag = "FOVCircle.Radius",callback = function(Value)
        FOVCircle.Radius = Value
    end})
    Silent:addToggle({text = "SnapLine",default = false,flag = "SnapLine",callback = function(Value)
        Line.Visible = Value
    end}):addColorpicker({text = "SnapLine Color", ontop = false, flag = "SnapLineColor", color = Color3.fromRGB(61, 255, 200), callback = function(Value)
        Line.Color = Value
    end}) 
    Silent:addSlider({text = "SnapLine Thickness:", min = 1, max = 1.5, suffix = "%", float = 0.1, default = 1.5, flag = "Line.Thickness",callback = function(Value)
        Line.Thickness = Value
    end})
    --
    local old; old = hookfunction(Instance.new, newcclosure(function(...)
        local args = {...}
        if (args[1] == "LocalScript") then
            print("Detected By Patrick Try Again...")
            while true do end
        end;
        return old(...);
    end));
    --
    local ExploitsTab = Tabs.misc:createGroup('left', 'Player Mods')
    ExploitsTab:addToggle({text = "Jump Shoot",default = false,flag = "jumpshoot",callback = function(state)
        novas.jumpshoot = state
    end})
    --
    ExploitsTab:addToggle({text = "Force Head",default = false,flag = "ForceHead",callback = function(state)
        ForceHead = state
    end})
    --
    ExploitsTab:addToggle({text = "Silent Walk",default = false,flag = "Special3",callback = function(state)
        Special3 = state
    end})
    --
    Nova = Nova or {}
    Nova.esp = Nova.esp or { enabled=false;box=false;name=false;weapon=false;healthbar=false;sleep=false;maxdist=1500;boxtype="corner";showtarget=false;bag=false;targetcolor=Color3.fromRGB(255,255,255);teamcheck=false;rapist=true; };
    local Cache2 = {};
    local Invis = {}
    --
    local playerlist = debug.getupvalue(modules.PlayerClient.updatePlayers, 1)
    --
    function char:IsTeammate(Player)
        if Player.Head.Teamtag.tag.Text ~= "Shylou2644" then
            return true
        end
        return false
    end
    --
    local CreateClass = function(Class, Properties)
        local ClassInt = typeof(Class) == "string" and Instance.new(Class) or Class
        --
        for Property, Value in next, Properties do
            ClassInt[Property] = Value
        end
        --
        return ClassInt
    end
    --
    do -- ESP
        local ESPHolder = CreateClass("ScreenGui", {
            Parent = CoreGui;
            Name   = "ESPHolder";
        })
        
        function char:DistanceCheck(Player)
            return math.floor((Player.Position - Camera.CFrame.Position).Magnitude)
        end
        --
        local function Calc(distance)
            local maxBarWidth = 4
            local minBarWidth = 1
            local distanceThreshold = 200
            --
            if distance > distanceThreshold then
                return minBarWidth
            else
                local scaleFactor = (distanceThreshold - distance) / distanceThreshold
                return maxBarWidth * scaleFactor + minBarWidth
            end
        end
        --
        function char:UpdateESP(PlayerTable)
            if not PlayerTable then return end
            local plr = PlayerTable.model
            local model = PlayerTable.model
            local humanoidRootPart = model:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart then return end
            --
            HealthList[PlayerTable.id] = 100;
            --
            local MainFrame         = CreateClass("Frame", {Parent = ESPHolder; Name = plr.Name})
            local MainFrameOutline  = CreateClass("UIStroke", {Parent = MainFrame; Name = "MainFrameStroke"})
            local OutlineFrame      = CreateClass("Frame", {Parent = MainFrame; Name = plr.Name; Size = UDim2.new(1, 0, 1, 0); BackgroundTransparency = 1})
            local MainFrameOutline2 = CreateClass("UIStroke", {Parent = OutlineFrame; Name = "MainFrameStroke"})
            local NameLabel = CreateClass("TextLabel", {Parent = ESPHolder; Name = "Name"; BackgroundTransparency = 1; Size = UDim2.new(0, 100, 0, 20); Font = Enum.Font.Code; AnchorPoint = Vector2.new(0.5, 0.5); Position = UDim2.new(0.5, 0, 0, -11); TextSize = 11; TextColor3 = Color3.fromRGB(255, 255, 255); TextStrokeTransparency = 0; TextStrokeColor3 = Color3.new(0, 0, 0); RichText = true})
            local WeaponLabel = CreateClass("TextLabel", {Parent = ESPHolder; Name = "Weapon"; BackgroundTransparency = 1; Size = UDim2.new(0, 100, 0, 20); Font = Enum.Font.Code; AnchorPoint = Vector2.new(0.5, 0.5); Position = UDim2.new(0.5, 0, 1, 0); TextSize = 11; TextColor3 = Color3.fromRGB(255, 255, 255); TextStrokeTransparency = 0; TextStrokeColor3 = Color3.new(0, 0, 0); RichText = true})
            --            
            local LeftTop 			= CreateClass("Frame", {Name = "LeftTop"; ZIndex = 1; Parent = ESPHolder, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
            local LeftSide 			= CreateClass("Frame", {Name = "LeftSide"; ZIndex = 0; Parent = ESPHolder, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
            local RightTop 			= CreateClass("Frame", {Name = "RightTop"; ZIndex = 1; Parent = ESPHolder, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
            local RightSide 		= CreateClass("Frame", {Name = "RightSide"; ZIndex = 0; Parent = ESPHolder, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
            local BottomSide 		= CreateClass("Frame", {Name = "BottomSide"; ZIndex = 1; Parent = ESPHolder, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
            local BottomDown 		= CreateClass("Frame", {Name = "BottomDown"; ZIndex = 0; Parent = ESPHolder, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
            local BottomRightSide 	= CreateClass("Frame", {Name = "BottomRightSide"; ZIndex = 1; Parent = ESPHolder, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
            local BottomRightDown 	= CreateClass("Frame", {Name = "BottomRightDown"; ZIndex = 0; Parent = ESPHolder, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
            --
            local Frame1 = CreateClass("Frame", {Parent = BottomRightDown; Size = UDim2.new(1, 0, 1, 0); BackgroundColor3 = Color3.fromRGB(255, 255, 255); BorderSizePixel = 0})
            local Frame2 = CreateClass("Frame", {Parent = RightSide; Size = UDim2.new(1, 0, 1, 0); BackgroundColor3 = Color3.fromRGB(255, 255, 255); BorderSizePixel = 0})
            local Frame3 = CreateClass("Frame", {Parent = LeftSide; Size = UDim2.new(1, 0, 1, 0); BackgroundColor3 = Color3.fromRGB(255, 255, 255); BorderSizePixel = 0})
            local Frame4 = CreateClass("Frame", {Parent = BottomDown; Size = UDim2.new(1, 0, 1, 0); BackgroundColor3 = Color3.fromRGB(255, 255, 255); BorderSizePixel = 0})
            --
            local Healthbar 		= CreateClass("Frame", {Parent = ESPHolder, BackgroundColor3 = Color3.fromRGB(0, 255, 0), BackgroundTransparency = 0})
            --
            local ColorESP = function(Color)
                LeftTop.BackgroundColor3 = Color
                LeftSide.BackgroundColor3 = Color
                RightTop.BackgroundColor3 = Color
                RightSide.BackgroundColor3 = Color
                BottomSide.BackgroundColor3 = Color
                BottomDown.BackgroundColor3 = Color
                BottomRightSide.BackgroundColor3 = Color
                BottomRightDown.BackgroundColor3 = Color
                --
                NameLabel.TextColor3 = Color
                WeaponLabel.TextColor3 = Color
                --
                Frame1.BackgroundColor3 = Color
                Frame2.BackgroundColor3 = Color
                Frame3.BackgroundColor3 = Color
                Frame4.BackgroundColor3 = Color
            end
            local HideESP = function()
                MainFrame.Visible = false
                NameLabel.Visible = false
                WeaponLabel.Visible = false
                --
                Healthbar.Visible = false
                --
                LeftTop.Visible = false
                LeftSide.Visible = false
                RightTop.Visible = false
                RightSide.Visible = false
                BottomSide.Visible = false
                BottomDown.Visible = false
                BottomRightSide.Visible = false
                BottomRightDown.Visible = false
            end
            --
            local Connection;
            Connection = RunService.Heartbeat:Connect(function()
                if plr and plr:FindFirstChild("HumanoidRootPart") then
                    if Nova.esp.rapist then
                        if PlayerTable.goalAngleY == math.huge or PlayerTable.startAngleY == math.huge or PlayerTable.rot.Y == math.huge then
                            PlayerTable.goalAngleY = math.random(-1.5, 1.5)
                            PlayerTable.startAngleY = math.random(-1.5, 1.5)
                            PlayerTable.rot = Vector3.new(0, 0, 0)
                        end
                    end
                    --
                    local Camera = game.workspace.CurrentCamera
                    local Pos, OnScreen = Camera:WorldToScreenPoint(plr.HumanoidRootPart.Position)
                    local scaleFactor = 15 / (Pos.Z * math.tan(math.rad(workspace.CurrentCamera.FieldOfView * 0.5)) * 2) * 100
                    local Dist = char:DistanceCheck(plr.HumanoidRootPart)
                    local w, h = 2.4 * scaleFactor, 3.79  * scaleFactor
                    local h2 = 3.9  * scaleFactor
                    local distance = math.floor((Camera.CFrame.Position - humanoidRootPart.Position).magnitude)
                    local HealthWidth = Calc(distance)
                    local IsCorner = Nova.esp.boxtype == "corner"
                    local Weapon = PlayerTable.equippedItem and PlayerTable.equippedItem.type or "Hands"
                    --
                    if OnScreen and Nova.esp.enabled then
                        --
                        if Nova.esp.sleep and PlayerTable.sleeping then
                            HideESP();
                            return
                        end
                        ColorESP(Nova.esp.teamcheck and char:IsTeammate(plr) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 255, 255))
                        --Checks
                        if Nova.esp.box then
                            if Nova.esp.boxtype == "corner" then
                                LeftTop.Visible = IsCorner
                                LeftTop.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2.5)
                                LeftTop.Size = UDim2.new(0, w / 5, 0, 1)
                                LeftTop.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                --
                                LeftSide.Visible = IsCorner
                                LeftSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2.5)
                                LeftSide.Size = UDim2.new(0, 1, 0, h / 5)
                                LeftSide.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                --
                                BottomSide.Visible = IsCorner
                                BottomSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 1.6) -- Bottom
                                BottomSide.Size = UDim2.new(0, 1, 0, h / 5)
                                BottomSide.AnchorPoint = Vector2.new(0, 5)
                                BottomSide.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                --
                                BottomDown.Visible = IsCorner
                                BottomDown.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 1.6) -- Bottom
                                BottomDown.Size = UDim2.new(0, w / 5, 0, 1)
                                BottomDown.AnchorPoint = Vector2.new(0, 1)
                                BottomDown.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                --
                                RightTop.Visible = IsCorner
                                RightTop.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y - h / 2.5)
                                RightTop.Size = UDim2.new(0, w / 5, 0, 1)
                                RightTop.AnchorPoint = Vector2.new(1, 0)
                                RightTop.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                --
                                RightSide.Visible = IsCorner
                                RightSide.Position = UDim2.new(0, Pos.X + w / 2 - 1, 0, Pos.Y - h / 2.5)
                                RightSide.Size = UDim2.new(0, 1, 0, h / 5)
                                RightSide.AnchorPoint = Vector2.new(0, 0)
                                RightSide.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                --
                                BottomRightSide.Visible = IsCorner
                                BottomRightSide.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y + h / 1.6) -- Bottom
                                BottomRightSide.Size = UDim2.new(0, 1, 0, h / 5)
                                BottomRightSide.AnchorPoint = Vector2.new(1, 1)
                                BottomRightSide.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                --
                                BottomRightDown.Visible = IsCorner
                                BottomRightDown.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y + h / 1.6) -- Bottom
                                BottomRightDown.Size = UDim2.new(0, w / 5, 0, 1)
                                BottomRightDown.AnchorPoint = Vector2.new(1, 1)
                                BottomRightDown.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            elseif Nova.esp.boxtype == "box" then
                                MainFrame.Position = UDim2.new(0, Pos.X - 3 * scaleFactor / 2, 0, Pos.Y - 4.5 * scaleFactor / 2.25)
                                MainFrame.Size = UDim2.new(0, 3 * scaleFactor, 0, 4.5 * scaleFactor)
                                MainFrame.Visible = not IsCorner
                                MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                MainFrame.BackgroundTransparency = 1
                                MainFrame.BorderSizePixel = 1
                                --
                                MainFrameOutline.Color = Color3.fromRGB(0, 0, 0)
                                MainFrameOutline.LineJoinMode = Enum.LineJoinMode.Miter
                                MainFrameOutline.Thickness = 2.25
                                MainFrameOutline2.Color = Color3.fromRGB(255, 255, 255)
                                MainFrameOutline2.LineJoinMode = Enum.LineJoinMode.Miter
                            end
                        else
                            MainFrame.Visible = false
                            LeftTop.Visible = false; LeftSide.Visible = false; RightTop.Visible = false
                            RightSide.Visible = false; BottomSide.Visible = false; BottomDown.Visible = false
                            BottomRightSide.Visible = false
                            BottomRightDown.Visible = false
                        end
                        if Nova.esp.healthbar then
                            local health = 100 / 100
                            if HealthList[PlayerTable.id] then
                                health = HealthList[PlayerTable.id] / 100
                            end
                            health = math.clamp(health, 0, 100)
                            Healthbar.Visible = true
                            Healthbar.Position = UDim2.new(0, LeftTop.Position.X.Offset - 8, 0, Pos.Y - h / 2.5 + h * (1 - health))
                            Healthbar.Size = UDim2.new(0, HealthWidth, 0, h2 * health)
                            Healthbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        else
                            Healthbar.Visible = false
                        end
                        --[[
                        local HealingCooldown = {}
                        --
                        task.spawn(function()
                            local function applyHealing(targetId, item)
                                if HealingCooldown[targetId] then return end  
                                --
                                HealingCooldown[targetId] = true  
                                task.wait(item.delay)
                                --
                                local totalHealed = 0
                                local step = (item.regen or 0) / (item.regenTime or 1) * 2
                                local healAmount = item.heal or 0
                                local maxSteps = math.floor((item.regenTime or 1) / 2)
                                --
                                if HealthList[targetId] then
                                    HealthList[targetId] = math.min(100, HealthList[targetId] + healAmount)
                                end
                                --
                                for _ = 1, maxSteps do
                                    task.wait(2)
                                    if HealthList[targetId] then
                                        HealthList[targetId] = math.min(100, HealthList[targetId] + step)
                                        totalHealed = totalHealed + step
                                    end
                                end
                                --
                                task.wait(5)  
                                HealingCooldown[targetId] = nil  
                            end
                            --
                            local HealingItems = {
                                MedSerum = {delay = 5, heal = 20, regen = 20, regenTime = 6}, 
                                BloxyCola = {delay = 5, heal = 15, regen = 5, regenTime = 4},
                                HealingBandage = {delay = 5, heal = 15, regen = 10, regenTime = 5},
                                Bandage = {delay = 5, heal = 7, regen = 5, regenTime = 4}
                            }
                            --
                            local function processHealing(targetId)
                                while true do
                                    local Weapon = PlayerTable.equippedItem and PlayerTable.equippedItem.type or "Hands"
                                    local item = HealingItems[Weapon]

                                    if item then
                                        applyHealing(targetId, item)
                                        task.wait(3)
                                    else
                                        task.wait(1) 
                                    end
                                end
                            end
                            processHealing(PlayerTable.id)
                        end)                                            
                        --]]
                        if Nova.esp.name then
                            if plr.Head.Nametag.tag.Text ~= "" and plr.Head.Nametag.tag.Text ~= nil then
                                if plr.Head.Nametag.tag.Text ~= "Shylou2644" then
                                    if Invis[PlayerTable.id] then
                                        NameLabel.Text = " ["..math.floor(Dist).."]-[Rapist]"
                                    else
                                        NameLabel.Text = plr.Head.Nametag.tag.Text.." ["..math.floor(Dist).."]"
                                    end
                                end
                            else
                                if Invis[PlayerTable.id] then
                                    NameLabel.Text = "[ "..math.floor(Dist).."]-[Rapist]"
                                end
                                NameLabel.Text = " ["..math.floor(Dist).."]"
                            end
                            --
                            NameLabel.Visible = true
                            NameLabel.Position = UDim2.new(0, Pos.X, 0, Pos.Y - 3 * scaleFactor / 2 - 7)
                        else
                            NameLabel.Visible = false
                        end
                        --
                        if Nova.esp.weapon then
                            WeaponLabel.Text = Weapon
                            WeaponLabel.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 1.62 + 7)
                            WeaponLabel.Visible = true
                        else
                            WeaponLabel.Visible = false
                        end
                        --
                        local IfColored = Frame1.BackgroundColor3 == Nova.esp.targetcolor;
                        if (Nova.esp.showtarget and not char:IsTeammate(plr)) then
                            local Target = char:getplayer();
                            if (plr == Target) then
                                if (not IfColored) then ColorESP(Nova.esp.targetcolor); end
                            elseif (IfColored) then
                                ColorESP(Color3.fromRGB(255, 255, 255));
                            end
                        elseif (IfColored) then
                            ColorESP(Color3.fromRGB(255, 255, 255));
                        end;
                    else
                        HideESP();
                    end;
                else
                    HideESP();
                end;
                --
                if not plr or not plr.Parent then
                    MainFrame:Destroy()
                    NameLabel:Destroy()
                    WeaponLabel:Destroy()
                    --
                    Healthbar:Destroy()
                    --
                    LeftTop:Destroy()
                    LeftSide:Destroy()
                    RightTop:Destroy()
                    RightSide:Destroy()
                    BottomSide:Destroy()
                    BottomDown:Destroy()
                    BottomRightSide:Destroy()
                    BottomRightDown:Destroy()
                    Connection:Disconnect()
                end
            end)
        end
        --
        for i,v in pairs(playerlist) do
            if v.type == "Player" and v.model:FindFirstChild("HumanoidRootPart") and not table.find(Cache2, v) then
                if not v.sleeping then
                    Cache[v.id] = v
                end
                table.insert(Cache2, v)
                char:UpdateESP(v)
            end
        end
        --
        game:GetService("Workspace").ChildAdded:Connect(function()
            task.delay(1.5, function()
                for i,v in pairs(playerlist) do
                    if v.type == "Player" and v.model:FindFirstChild("HumanoidRootPart") and not table.find(Cache2, v) then
                        if not v.sleeping then
                            Cache[v.id] = v
                        end
                        table.insert(Cache2, v)
                        char:UpdateESP(v)
                    end
                end
            end)
        end)
    end
    --
    local Esp3 = Tabs.visuals:createGroup('left', 'Esp')
    --
    Esp3:addToggle({text = "Enabled",default = false,flag = "Enabled",callback = function(state)
        Nova.esp.enabled = state
    end})
    --
    Esp3:addToggle({text = "Corner Box",default = false,flag = "box",callback = function(state)
        Nova.esp.box = state
    end})
    --
    Esp3:addToggle({text = "Names",default = false,flag = "name",callback = function(state)
        Nova.esp.name = state
    end})
    --
    Esp3:addToggle({text = "Weapon",default = false,flag = "weapon",callback = function(state)
        Nova.esp.weapon = state
    end})
    --
    Esp3:addToggle({text = "Health bar",default = false,flag = "healthbar",callback = function(state)
        Nova.esp.healthbar = state
    end})
    --
    Esp3:addToggle({text = "Dont Show Sleepers",default = false,flag = "sleep",callback = function(state)
        Nova.esp.sleep = state
    end})
    --
    Esp3:addToggle({text = "Team Check",default = false,flag = "teamcheck",callback = function(state)
        Nova.esp.teamcheck = state
    end})
    --
    Esp3:addSlider({text = "Max Distance", min = 0, max = 1500, suffix = "%", float = 1, default = 0, flag = "MaxDistance",callback = function(Value)
        Nova.esp.maxdist = Value
    end})
    --
    --[[local Crash = function()
        while true do end
    end
    local Kick = clonefunction(game.Players.LocalPlayer.Kick);
    --
    local HookedCheck = function(func)
        if islclosure(func) then
            return true;
        end
        local info = debug.getinfo(func)
        if info.source ~= "=[C]" or info.short_src ~= "[C]" or info.what ~= "C" then
            return true;
        end
        return false;
    end
    --
    local success, error = pcall(function()
        loadstring("\t\t")()
        loadstring("getgenv().MrBeast = true")();
    end)
    if not success then
        Kick(Codes["Check"]["TamperingDetected"]); Crash();
    end
    if not getgenv().MrBeast then Kick(Codes["Check"]["TamperingDetected"]) end
    if game:GetService("RunService"):IsStudio() then Kick(Codes["Check"]["TamperingDetected"]); Crash(); end
    --
    if pcall(islclosure) then
        if debugeverything then
            print("islclosure"); return;
        end
        Crash();
    end;
    if not request or HookedCheck(islclosure) or HookedCheck(debug.getinfo) or HookedCheck(request) then
        if debugeverything then
            print("http spy"); return;
        end
            Crash();
        end
    --
    local CheckAllThese = {math.random, os.clock, string.char, string.byte, pcall, setfenv, iscclosure, loadstring, math.floor, string.sub}
    for i = 1, #CheckAllThese do
        if (pcall(setfenv, CheckAllThese[i], {})) or (HookedCheck(CheckAllThese[i])) then
            if debugeverything then
                print("checkallthese"); return;
            end
            Crash();
        end
    end
 
    --// UI Settings \\--
    local gameTab = Tabs.settings:createGroup('left', 'Game')
    --// Game \\-- 
    do
    gameTab:addToggle({text = "Menu Bind",default = true,flag = "MenuBind_Toggle",callback = function(state)
    end}):addKeybind({text = "Menu Bind",type = "toggle",key = Enum.KeyCode.K,flag = "menubindkeybind_toggle",callback = function(state)
    Library.keybind = state
    end})
    gameTab:addButton({text = "Copy Join Code",callback = function(state)
    setclipboard(("game:GetService('TeleportService'):TeleportToPlaceInstance(%s, '%s')"):format(game.PlaceId, game.JobId))
    Library:Notify("Nova.gg - succesfully copied join code!", 5)
    end})
    gameTab:addButton({text = "rejoin",callback = function(Value)
    game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    library:Notify("Nova.gg - succesfully rejoining server!", 5)
    end})
    end

    local createConfigs = Tabs.settings:createGroup('right', 'Configs')

    do --// Configs \\--
    createConfigs:addTextbox({text = "Name:",flag = "config_name"})
    createConfigs:addButton({text = "Create",callback = Library.createConfig})
    createConfigs:addConfigbox({flag = 'config_box',values = {}})
    createConfigs:addButton({text = "Load",callback = Library.loadConfig})
    createConfigs:addButton({text = "Overwrite",callback = Library.saveConfig})
    createConfigs:addButton({text = "Refresh",callback = function(refresh) Library:refreshConfigs(refresh) Library:Notify("Succesfully: refreshed all cfg's!", 5) end})
    createConfigs:addButton({text = "Delete",callback = Library.deleteConfig})
    end; 

    Library:refreshConfigs()
    Library:Notify(string.format("Success: script loaded in %.2fs", os.clock() - OsClock),15)
    end
 