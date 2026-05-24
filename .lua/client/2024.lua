-- Decompiled with Synapse X v3.0 | https://github.com/synllc

repst = game.ReplicatedStorage;
local bool1 = false;
local bool2 = false;
accuracy_sd = 0.001;
local u1 = 0;
spread2 = 0;
numShots = 0;
recoilx = 0;
recoily = 0;
recoilx2 = 0;
recoily2 = 0;
recoilx3 = 0;
recoily3 = 0;
maxyvel = 0;
curspd = 0;
rotx = 0;
rotz = 0;
mypattern = nil;
mypattern2 = nil;
ftick = tick() - 100;
docam = tick();
lastlanded = tick();
invcheck = tick();
firespread = 0;
local m_Spring = require(script.Spring);
local m_Mathlib = require(repst.Modules.Mathlib);
local m_Sound = require(repst.Modules.Sound);
lastspawned = tick();
local u2 = m_Spring.new((Vector3.new()));
u2.s = 20;
u2.d = 0.5;
local u3 = m_Spring.new((Vector3.new()));
u3.s = 40;
u3.d = 1;
local u4 = m_Spring.new((Vector3.new()));
u4.s = 40;
u4.d = 1;
tickspent = 0;
runServicetick = 0;
gun = "none";
fgun = "none";
rstick = 1;
_gui = game:GetService("GuiService");
_tween = game:GetService("TweenService");
istenfoot = _gui:IsTenFootInterface();
dontshowme = 0;
script.Parent:WaitForChild("Menew").Enabled = true;
script.Parent.Menew:WaitForChild("Load").Visible = true;
game:GetService("RunService"):BindToRenderStep("Spinner", Enum.RenderPriority.Camera.Value - 1, function() -- Line: 54
	script.Parent.Menew.Load.Spinner.Rotation = script.Parent.Menew.Load.Spinner.Rotation + 2;
end);
local poggers = game.ReplicatedStorage.Events:WaitForChild("poggers");
local HttpService = game:GetService("HttpService");
if istenfoot then
	script.Parent.GUI.Spectate.Controls.Text = "(LB/RB) Cycle Players";
end
local u5 = {};
local u6 = {};
DeCringe = require(game.ReplicatedStorage.DeCringe);
mice = require(game.ReplicatedStorage.Modules.NewMouse);
globalVariable = true;
if globalVariable == "whatever" then
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	local __ = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
end
game.Players.LocalPlayer:WaitForChild("SkinFolder");
DeCringe.clearallchildren(game.Workspace.CurrentCamera);
door = nil;
game.ReplicatedStorage.Events.Deafen.OnClientEvent:connect(function(p1, p2) -- Line: 87
	script.Parent.Deafen.Full.Value = p1;
	script.Parent.Deafen.Duration.Value = p2;
	script.Parent.Deafen.Disabled = true;
	script.Parent.Deafen.Disabled = false;
end);
game.ReplicatedStorage.Events.Flash.OnClientEvent:connect(function(p3, p4) -- Line: 94
	script.Parent.Deafen.Full.Value = p3;
	script.Parent.Deafen.Duration.Value = p4;
	script.Parent.Deafen.Disabled = true;
	script.Parent.Deafen.Disabled = false;
	script.Parent.Blind.Full.Value = p3;
	script.Parent.Blind.Duration.Value = p4;
	script.Parent.Blind.Disabled = true;
	script.Parent.Blind.Disabled = false;
end);
local RunService = game:GetService("RunService");
pulling = false;
adsoffset = CFrame.new();
jumpat = 0;
game.ReplicatedStorage:WaitForChild("Weapons");
createpp = false;
firevariant = false;
firevariant2 = false;
crouchcooldown = 0;
surfaceguis = {};
Ping = require(game.ReplicatedStorage.Modules.ping);
local t_LocalPlayer = game.Players.LocalPlayer;
player = t_LocalPlayer;
game.ReplicatedStorage.Events.SoundSt.OnClientEvent:connect(function() -- Line: 123
	--[[
		Upvalues:
			[1] = t_LocalPlayer
			[2] = m_Sound
	--]]
	if t_LocalPlayer.Status.Team.Value == "T" then
		m_Sound.playsound(script.Parent.startt);
		return;
	end
	m_Sound.playsound(script.Parent.startct);
end);
FramesPerSecond = 0;
PreviousTime = tick();
game.Workspace:WaitForChild("Status"):WaitForChild("Preparation").Changed:connect(function() -- Line: 134
	if game.Workspace.Status.Preparation.Value == true then
		if #surfaceguis > 0 then
			for index43 = 1, #surfaceguis do
				if surfaceguis[index43]:IsDescendantOf(game.Workspace) then
					surfaceguis[index43]:Destroy();
				end
			end
		end
		DeCringe.clearallchildren(game.Workspace.Debris);
	end
end);
game.Workspace:WaitForChild("Status"):WaitForChild("Preparation").Changed:connect(function() -- Line: 148
	if game.Workspace.Status.Preparation.Value == false then
		local Children = game.Workspace.Debris:GetChildren();
		for index26 = 1, #Children do
			if Children[index26] and Children[index26]:FindFirstChild("Humanoid2") then
				Children[index26]:Destroy();
			end
		end
	end
end);
menugui = script.Parent.Menew;
spawn(function() -- Line: 159
	game:GetService("RunService"):UnbindFromRenderStep("Spinner");
	menugui.MainFrame.Visible = true;
	menugui.Load:TweenPosition(UDim2.new(1, 0, 0, 0));
end);
spawn(function() -- Line: 166
	--[[
		Upvalues:
			[1] = poggers
			[2] = HttpService
	--]]
	while wait(1) do
		poggers.Name = HttpService:GenerateGUID();
	end
end);
function getskinfolder(p5, p6) -- Line: 172
	if p5 and p5:FindFirstChild("SkinFolder") and p5.SkinFolder:FindFirstChild(p5.Status.Team.Value .. "Folder") then
		if p6 then
			return p5.SkinFolder[p5.Status.Team.Value .. "Folder"]:FindFirstChild(p6) and p5.SkinFolder[p5.Status.Team.Value .. "Folder"][p6].Value or nil;
		end
		return p5.SkinFolder[p5.Status.Team.Value .. "Folder"];
	end
	return nil;
end
game.ReplicatedStorage.Events:WaitForChild("GetPing");
local function OnClientInvoke() -- Line: 186
end
game.ReplicatedStorage.Events.GetPing.OnClientInvoke = OnClientInvoke;
game.ReplicatedStorage:WaitForChild("Warmup").Changed:connect(function() -- Line: 190
	if game.ReplicatedStorage.Warmup.Value == true then
		if #surfaceguis > 0 then
			for index44 = 1, #surfaceguis do
				if surfaceguis[index44]:IsDescendantOf(game.Workspace) then
					surfaceguis[index44]:Destroy();
				end
			end
		end
		DeCringe.clearallchildren(game.Workspace.Debris);
	end
end);
local function OnClientInvoke() -- Line: 203
	return #workspace:WaitForChild("Map"):WaitForChild("Geometry"):GetDescendants() + #workspace:WaitForChild("Map"):WaitForChild("Clips"):GetDescendants();
end
game.ReplicatedStorage.Functions.Visual.OnClientInvoke = OnClientInvoke;
function getAttachment0(p7, p8) -- Line: 208
	for __, child1 in next, p8:GetChildren() do
		local FindFirstChild_ret = child1:FindFirstChild(p7);
		if not FindFirstChild_ret then continue end
		return FindFirstChild_ret;
	end
end
local u7 = false;
game.ReplicatedStorage.Events.CreateRagdoll.OnClientEvent:connect(function(p9, p10, p11, p12, p13, p14, p15, p16, p17, p18) -- Line: 219
	--[[
		Upvalues:
			[1] = m_Sound
	--]]
	spawn(function() -- Line: 220
		--[[
			Upvalues:
				[1] = p11
				[2] = p10
				[3] = p13
				[4] = p15
				[5] = p16
				[6] = p17
				[7] = p14
				[8] = m_Sound
				[9] = p9
				[10] = p18
				[11] = p12
		--]]
		if visualizeModule.returnquality() < 6 then
			local Children6 = p11:GetChildren();
			for index50 = 1, #Children6 do
				if Children6[index50]:IsA("BasePart") and Children6[index50].Name ~= "Head" or Children6[index50]:IsA("Accoutrement") then
					Children6[index50]:Destroy();
				end
			end
			return;
		end
		if not p10 or not p10:FindFirstChild("Ragdoll") then return end
		if p11 and game.Workspace:WaitForChild("Debris"):FindFirstChild(p11.Name) then
			game.Workspace.Debris[p11.Name]:Destroy();
		end
		p13 = p10.Ragdoll:clone();
		p13.Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Dead, false);
		if p15 and p15:FindFirstChild("creator") then
			p15.creator:clone().Parent = p13:WaitForChild("Humanoid2");
		end
		if p13 and p13:FindFirstChild("UpperTorso") and p16 and p16:FindFirstChild("UpperTorso") then
			p13.UpperTorso.Velocity = p16.UpperTorso.Velocity;
		end
		if p11 and p11:FindFirstChild("UpperTorso") then
			p13:MoveTo(p11.UpperTorso.CFrame.p);
			local Children4 = p13:GetChildren();
			for index51 = 1, #Children4 do
				if Children4[index51]:IsA("Accessory") and Children4[index51]:FindFirstChild("Handle") then
					Children4[index51].Handle.Anchored = false;
					Children4[index51].Handle.CollisionGroupId = 4;
					Children4[index51].Handle.CanCollide = false;
					Children4[index51].Handle.Velocity = Vector3.new();
					if Children4[index51]:FindFirstChild("Handle") and Children4[index51].Handle:FindFirstChild("AccessoryWeld") then
						local Attachment = Children4[index51].Handle:FindFirstChildOfClass("Attachment");
						if Attachment then
							local Attachment0 = getAttachment0(Attachment.Name, p13);
							if Attachment0 then
								Children4[index51].Handle.AccessoryWeld.Part1 = Attachment0.Parent;
							end
						else
							Children4[index51].Handle.AccessoryWeld.Part1 = p13.Head;
						end
					else
						Children4[index51].Handle.CFrame = p13.Head.CFrame;
					end
				end
				if Children4[index51]:IsA("BasePart") then
					Children4[index51].Velocity = Vector3.new();
					Children4[index51].Anchored = false;
					Children4[index51].RotVelocity = Vector3.new();
					Children4[index51].CollisionGroupId = 4;
					if p11 and p11:FindFirstChild(Children4[index51].Name) then
						Children4[index51].CFrame = p11[Children4[index51].Name].CFrame;
					end
				end
				if Children4[index51]:IsA("Accessory") and Children4[index51]:FindFirstChild("Handle") then
					Children4[index51].Handle.Anchored = false;
				end
			end
			if p13 and p13:FindFirstChild("Hitboxes") then
				local Children5 = p13.Hitboxes:GetChildren();
				for index63 = 1, #Children5 do
					if Children5[index63]:IsA("BasePart") then
						Children5[index63].CollisionGroupId = 3;
					end
				end
				if p13.Hitboxes:FindFirstChild("LFoot") and p13:FindFirstChild("LeftLowerLeg") then
					p13.Hitboxes.LFoot.CFrame = p13.LeftLowerLeg.CFrame;
				end
				if p13.Hitboxes:FindFirstChild("RFoot") and p13:FindFirstChild("RightLowerLeg") then
					p13.Hitboxes.RFoot.CFrame = p13.RightLowerLeg.CFrame;
				end
				if p13.Hitboxes:FindFirstChild("LHand") and p13:FindFirstChild("LeftHand") then
					p13.Hitboxes.LHand.CFrame = p13.LeftHand.CFrame;
				end
				if p13.Hitboxes:FindFirstChild("RHand") and p13:FindFirstChild("RightHand") then
					p13.Hitboxes.RHand.CFrame = p13.RightHand.CFrame;
				end
				if p13.Hitboxes:FindFirstChild("TorsoBox") and p13:FindFirstChild("UpperTorso") then
					p13.Hitboxes.TorsoBox.CFrame = p13.UpperTorso.CFrame;
				end
				if p13.Hitboxes:FindFirstChild("Neck") and p13:FindFirstChild("Head") then
					p13.Hitboxes.Neck.CFrame = p13.Head.CFrame;
				end
			end
		end
		p13:WaitForChild("Humanoid2").Sit = true;
		p13.Name = p16.Name;
		p13.Parent = game.Workspace:WaitForChild("Debris");
		p16 = p13;
		if p13 and p13:FindFirstChild("UpperTorso") and p17 == true then
			local BodyVelocity = Instance.new("BodyVelocity");
			BodyVelocity.Parent = p13.UpperTorso;
			BodyVelocity.Velocity = p14;
			BodyVelocity.P = 2000;
			BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
			delay(0.05, function() -- Line: 330
				--[[
					Upvalues:
						[1] = BodyVelocity
				--]]
				BodyVelocity:Destroy();
			end);
		end
		if game.ReplicatedStorage.Warmup.Value == true then
			delay(5, function() -- Line: 336
				--[[
					Upvalues:
						[1] = p16
				--]]
				p16:Destroy();
			end);
		end
		if p16:FindFirstChild("UpperTorso") then
			delay(5, function() -- Line: 341
				--[[
					Upvalues:
						[1] = p16
				--]]
				repeat
					wait(1);
				until not p16 or not p16:FindFirstChild("UpperTorso") or p16 and p16:FindFirstChild("UpperTorso") and p16.UpperTorso.Velocity.magnitude <= 0.1;
				local Children3 = p16:GetChildren();
				for index64 = 1, #Children3 do
					if Children3[index64]:IsA("BasePart") then
						Children3[index64].Anchored = true;
					end
				end
			end);
			if p11 and game.Players:GetPlayerFromCharacter(p11) and game.Players:GetPlayerFromCharacter(p11):FindFirstChild("Status") and game.Players:GetPlayerFromCharacter(p11).Status.Team.Value == "T" and game.ReplicatedStorage.gametype.Value == "juggernaut" then
				m_Sound.playsound(game.ReplicatedStorage.Sounds.death, p13.Head);
			elseif p13 and p13:FindFirstChild("Head") and p17 == false and p9 == false and p18 ~= nil then
				m_Sound.playsound(game.ReplicatedStorage.Sounds["Death" .. math.random(1, 5)], p13.Head);
			end
			if p16 and p16:FindFirstChild("Head") and p10 and p10.Name == game.Players.LocalPlayer.Name then
				p12.Part.Value = p16.Head;
			end
		end
		local Children2 = p11:GetChildren();
		for index41 = 1, #Children2 do
			if Children2[index41]:IsA("BasePart") and Children2[index41].Name ~= "Head" or Children2[index41]:IsA("Accoutrement") then
				Children2[index41]:Destroy();
			end
		end
	end);
end);
local bool3 = false;
fieldofview = 80;
sp = script.Parent:WaitForChild("GUI"):WaitForChild("Inventory");
weapons = {
	sp.Item1,
	sp.Item2,
	sp.Item3,
	sp.Item4,
	sp.Item5,
	sp.Item6,
	sp.Item7,
	sp.Item8
};
positions = {
	weapons[1].Position,
	weapons[2].Position,
	weapons[3].Position,
	weapons[4].Position,
	weapons[5].Position,
	weapons[6].Position,
	weapons[7].Position,
	weapons[8].Position
};
scrolling = false;
running = false;
climbing = false;
jumping = false;
jumptick = tick();
crouchJump = false;
landing = false;
walking = false;
visualizeModule = require(game:GetService("ReplicatedStorage").VisualizeModule);
bulletpertrail = 0;
mgn = 0;
actualfadg = 0;
script.Parent.Music.MusicKit.Value = "ValveCT";
game.Workspace.Status.Preparation.Changed:connect(function(property) -- Line: 396
	if property == true then
		if math.random(1, 2) == 1 then
			script.Parent.Music.MusicKit.Value = "ValveCT";
			return;
		end
		script.Parent.Music.MusicKit.Value = "ValveT";
	end
end);
script.Parent:WaitForChild("GUI"):WaitForChild("Defusal").Changed:connect(function() -- Line: 406
	--[[
		Upvalues:
			[1] = bool3
	--]]
	wait();
	if script.Parent.GUI.Defusal.Visible == true and bool3 == false then
		bool3 = true;
		delay(10, function() -- Line: 411
			--[[
				Upvalues:
					[1] = bool3
			--]]
			bool3 = false;
		end);
	end
end);
function splatterBlood(p19, p20, p21, p22, p23) -- Line: 418
	if p21 > 0 then
		for index27 = 1, math.max(1, (math.floor(p21 * 0.03))) do
			local t_lookVector = CFrame.new(p22, p23).lookVector;
			local Ray_new_ret = Ray.new(p19, t_lookVector.unit * 6);
			local FindPartOnRayWithIgnoreList_ret1, FindPartOnRayWithIgnoreList_ret2, __ = workspace:FindPartOnRayWithIgnoreList(Ray_new_ret, {
				workspace.CurrentCamera,
				p20.Parent,
				game.Workspace.Debris,
				game.Workspace.Ray_Ignore,
				game.Workspace.Map.Clips,
				game.Workspace.Map.SpawnPoints
			});
			if FindPartOnRayWithIgnoreList_ret1 and FindPartOnRayWithIgnoreList_ret1.Transparency == 0 and FindPartOnRayWithIgnoreList_ret1.CanCollide and FindPartOnRayWithIgnoreList_ret2 and not FindPartOnRayWithIgnoreList_ret1:IsA("Terrain") then
				createbullethole(FindPartOnRayWithIgnoreList_ret1, FindPartOnRayWithIgnoreList_ret2, true);
			else
				local Ray_new_ret2 = Ray.new(p19, Vector3.new(t_lookVector.X, t_lookVector.Y - 6, t_lookVector.Z).unit * 6);
				local FindPartOnRayWithIgnoreList_ret1_2, FindPartOnRayWithIgnoreList_ret2_2, __ = workspace:FindPartOnRayWithIgnoreList(Ray_new_ret2, {
					workspace.CurrentCamera,
					p20.Parent,
					game.Workspace.Debris,
					game.Workspace.Ray_Ignore,
					game.Workspace.Map.Clips,
					game.Workspace.Map.SpawnPoints
				});
				if FindPartOnRayWithIgnoreList_ret1_2 and FindPartOnRayWithIgnoreList_ret1_2.Transparency == 0 and FindPartOnRayWithIgnoreList_ret1_2.CanCollide and FindPartOnRayWithIgnoreList_ret2_2 and not FindPartOnRayWithIgnoreList_ret1_2:IsA("Terrain") then
					createbullethole(FindPartOnRayWithIgnoreList_ret1_2, FindPartOnRayWithIgnoreList_ret2_2, true);
				end
			end
		end
	end
end
script.Parent:WaitForChild("GUI");
script.Parent.GUI:WaitForChild("TopRight");
script.Parent.GUI.TopRight:WaitForChild("1");
script.Parent.GUI.TopRight:WaitForChild("2");
script.Parent.GUI.TopRight:WaitForChild("3");
script.Parent.GUI.TopRight:WaitForChild("4");
script.Parent.GUI.TopRight:WaitForChild("5");
script.Parent.GUI.TopRight:WaitForChild("6");
script.Parent.GUI.TopRight:WaitForChild("7");
script.Parent.GUI.TopRight:WaitForChild("8");
script.Parent.GUI.TopRight:WaitForChild("9");
script.Parent.GUI.TopRight:WaitForChild("10");
function GamepadVibrate(p24, p25, p26) -- Line: 451
	if p24 == "Large" then
		game:GetService("HapticService"):SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Large, p25);
		wait(p26);
		game:GetService("HapticService"):SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Large, 0);
		return;
	end
	if p24 == "Small" then
		game:GetService("HapticService"):SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Large, p25);
		wait(p26);
		game:GetService("HapticService"):SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 0);
	end
end
local t_GUI = script.Parent.GUI;
function FixKillFeed() -- Line: 464
	--[[
		Upvalues:
			[1] = t_GUI
	--]]
	local v4 = 11;
	for index4 = 10, 1, -1 do
		if t_GUI:WaitForChild("TopRight"):FindFirstChild(tostring(index4)) and t_GUI:WaitForChild("TopRight")[tostring(index4)]:FindFirstChild("Pic") and t_GUI:WaitForChild("TopRight")[tostring(index4)]:FindFirstChild("Victim") and t_GUI:WaitForChild("TopRight")[tostring(index4)]:FindFirstChild("Killer") and game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Active").Value and game.Workspace.DistributedTime.Value - game.Workspace.KillFeed[tostring(index4)].time.Value < 10 then
			t_GUI:WaitForChild("TopRight")[tostring(index4)].Killer.Text = game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Killer").Value;
			t_GUI:WaitForChild("TopRight")[tostring(index4)].Killer.TextColor3 = game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Killer"):findFirstChild("TeamColor").Value;
			t_GUI:WaitForChild("TopRight")[tostring(index4)].Victim.Text = game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Victim").Value;
			t_GUI:WaitForChild("TopRight")[tostring(index4)].Victim.TextColor3 = game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Victim"):findFirstChild("TeamColor").Value;
			t_GUI:WaitForChild("TopRight")[tostring(index4)].Pic.Image = game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Weapon").Value;
			if game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Assist").Value == game.Players.LocalPlayer.Name or t_GUI:WaitForChild("TopRight")[tostring(index4)].Victim.Text == game.Players.LocalPlayer.Name or t_GUI:WaitForChild("TopRight")[tostring(index4)].Killer.Text == game.Players.LocalPlayer.Name then
				t_GUI:WaitForChild("TopRight")[tostring(index4)].Outline.Visible = true;
			else
				t_GUI:WaitForChild("TopRight")[tostring(index4)].Outline.Visible = false;
			end
			if game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Assist").Value ~= "" then
				t_GUI:WaitForChild("TopRight")[tostring(index4)].Killer.Text = t_GUI:WaitForChild("TopRight")[tostring(index4)].Killer.Text .. " + " .. game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Assist").Value;
			end
			t_GUI:WaitForChild("TopRight")[tostring(index4)].Pic.Headshot.Visible = false;
			t_GUI:WaitForChild("TopRight")[tostring(index4)].Pic.Wallbang.Visible = false;
			t_GUI:WaitForChild("TopRight")[tostring(index4)].BackgroundColor3 = Color3.new(227 / 255, 227 / 255, 227 / 255);
			local v96 = 0;
			if game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Weapon").Wallbang.Value == "true" then
				t_GUI:WaitForChild("TopRight")[tostring(index4)].Pic.Wallbang.Visible = true;
				t_GUI:WaitForChild("TopRight")[tostring(index4)].Pic.Wallbang.Headshot.Visible = false;
				v96 = v96 + 55;
				if game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Weapon").Headshot.Value == "true" then
					v96 = v96 + 55;
					t_GUI:WaitForChild("TopRight")[tostring(index4)].Pic.Wallbang.Headshot.Visible = true;
				end
			elseif game.Workspace.KillFeed[tostring(index4)]:findFirstChild("Weapon").Headshot.Value == "true" then
				v96 = v96 + 55;
				t_GUI:WaitForChild("TopRight")[tostring(index4)].Pic.Headshot.Visible = true;
			end
			local t_Killer = t_GUI:WaitForChild("TopRight")[tostring(index4)].Killer;
			local t_Victim = t_GUI:WaitForChild("TopRight")[tostring(index4)].Victim;
			local t_Pic = t_GUI:WaitForChild("TopRight")[tostring(index4)].Pic;
			t_Killer.Size = UDim2.new(0, 2, 1, 0);
			t_Victim.Size = UDim2.new(0, t_Victim.TextBounds.X + 2, 1, 0);
			t_Victim.Position = UDim2.new(1, -(t_Victim.TextBounds.X + 2), 0, 0);
			t_Pic.Position = UDim2.new(1, t_Victim.Position.X.Offset - (t_Pic.Size.X.Offset + v96), 0, 0);
			t_Killer.Size = UDim2.new(0, t_Killer.TextBounds.X + 2, 1, 0);
			t_Killer.Position = UDim2.new(1, t_Pic.Position.X.Offset - t_Killer.Size.X.Offset * 1, 0, 0);
			t_GUI:WaitForChild("TopRight")[tostring(index4)].Size = UDim2.new(0, t_Killer.Size.X.Offset + t_Victim.Size.X.Offset + t_Pic.Size.X.Offset + (v96 + 3), 0, 25);
			t_GUI:WaitForChild("TopRight")[tostring(index4)].Position = UDim2.new(1, -t_GUI:WaitForChild("TopRight")[tostring(index4)].Size.X.Offset, 0, t_GUI:WaitForChild("TopRight")[tostring(index4)].Position.Y.Offset);
			t_GUI:WaitForChild("TopRight")[tostring(index4)].Visible = true;
			v4 = v4 - 1;
		else
			t_GUI:WaitForChild("TopRight")[tostring(index4)].Visible = false;
		end
	end
	t_GUI.TopRight.Position = UDim2.new(1, -275, 0, 10 - v4 * 27);
end
lastpriority = nil;
priority = nil;
dochange = "W";
dochange2 = "W";
special = false;
special2 = false;
dink = tick();
timer = 3;
alreadynot = false;
function notify(p27, p28) -- Line: 531
	--[[
		Upvalues:
			[1] = RunService
	--]]
	timer = p28;
	dink = tick();
	player.PlayerGui.GUI.Notify.TextLabel.Text = p27;
	player.PlayerGui.GUI.Notify.Visible = true;
	spawn(function() -- Line: 536
		--[[
			Upvalues:
				[1] = RunService
		--]]
		if alreadynot == false then
			alreadynot = true;
			repeat
				RunService.Stepped:wait();
			until tick() - dink >= timer;
			player.PlayerGui.GUI.Notify.Visible = false;
			alreadynot = false;
		end
	end);
end
game:GetService("UserInputService").InputBegan:connect(function(input) -- Line: 546
	if game:GetService("UserInputService"):GetFocusedTextBox() then return end
	if script.Parent:FindFirstChild("GUI") and (script.Parent.GUI.Main.GlobalChat.ActiveOne.Value == true or script.Parent.GUI.Main.TeamChat.ActiveOne.Value == true) then return end
	if input.KeyCode == Enum.KeyCode.G and player.Character.Rage.Value >= 100 then
		game.ReplicatedStorage.Events.Rage:FireServer();
		player.Character.Rage.Value = 0;
	end
end);
game.ReplicatedStorage.Events.NewMapAdded.OnClientEvent:Connect(function() -- Line: 559
	game.Workspace:WaitForChild("Map");
	if game.Workspace.Map:FindFirstChild("Detail") then
		wait(5);
		game.Workspace.Map.Detail:Destroy();
	end
end);
game.ReplicatedStorage.Smoked.OnClientEvent:Connect(function(p29) -- Line: 567
	local visualizeModule_returnquality_ret = visualizeModule.returnquality();
	if visualizeModule_returnquality_ret == 1 then
		p29.ParticleEmitter.Rate = 310;
		return;
	end
	if visualizeModule_returnquality_ret == 2 then
		p29.ParticleEmitter.Rate = 260;
		return;
	end
	if visualizeModule_returnquality_ret == 3 then
		p29.ParticleEmitter.Rate = 220;
		return;
	end
	if visualizeModule_returnquality_ret == 4 then
		p29.ParticleEmitter.Rate = 170;
		return;
	end
	if visualizeModule_returnquality_ret == 5 then
		p29.ParticleEmitter.Rate = 135;
	end
end);
local table1 = {
	"rbxassetid://185237853",
	"rbxassetid://185237879",
	"rbxassetid://185237894",
	"rbxassetid://185237865"
};
local table2 = {
	"rbxassetid://185238181",
	"rbxassetid://185238204",
	"rbxassetid://185238210",
	"rbxassetid://185238224"
};
local table3 = {
	"rbxassetid://185238332",
	"rbxassetid://185238308",
	"rbxassetid://185238298",
	"rbxassetid://185238288"
};
local table4 = {
	"rbxassetid://329635132",
	"rbxassetid://329635085",
	"rbxassetid://329635053",
	"rbxassetid://329635066",
	"rbxassetid://164892599",
	"rbxassetid://311936669",
	"rbxassetid://311936590",
	"rbxassetid://311936412",
	"rbxassetid://311936317",
	"rbxassetid://311936503",
	"rbxassetid://311936791"
};
function ReturnNormal(p30, p31) -- Line: 591
	local table5 = {
		{
			"Back",
			p31.CFrame * CFrame.new(0, 0, p31.Size.z)
		},
		{
			"Bottom",
			p31.CFrame * CFrame.new(0, -p31.Size.y, 0)
		},
		{
			"Front",
			p31.CFrame * CFrame.new(0, 0, -p31.Size.z)
		},
		{
			"Left",
			p31.CFrame * CFrame.new(-p31.Size.x, 0, 0)
		},
		{
			"Right",
			p31.CFrame * CFrame.new(p31.Size.x, 0, 0)
		},
		{
			"Top",
			p31.CFrame * CFrame.new(0, p31.Size.y, 0)
		}
	};
	local v5 = math.huge;
	local v6 = nil;
	for __, val2 in pairs(table5) do
		local t_magnitude = (p30 - val2[2].p).magnitude;
		if t_magnitude >= v5 then continue end
		v5 = t_magnitude;
		v6 = val2;
	end
	return v6[1];
end
local u8 = 4;
function SecondaryTex(p32, p33, p34, p35, p36, p37, p38, p39, p40, p41) -- Line: 615
	--[[
		Upvalues:
			[1] = u8
	--]]
	local v7 = p36.Size.X;
	local t_Y = p36.Size.Y;
	local str1 = nil;
	local num1 = nil;
	local __ = -v7 + p36.CFrame:toObjectSpace(CFrame.new(p37)).p.Z / v7;
	if p35 == 1 then
		if p33 == "Front" then
			str1 = "Right";
			num1 = 0;
		elseif p33 == "Right" then
			str1 = "Back";
			num1 = 2;
		elseif p33 == "Left" then
			str1 = "Front";
			num1 = 5;
		elseif p33 == "Back" then
			str1 = "Left";
			num1 = 3;
		end
	elseif p33 == "Front" then
		str1 = "Left";
		num1 = 3;
	elseif p33 == "Right" then
		str1 = "Front";
		num1 = 5;
	elseif p33 == "Left" then
		str1 = "Back";
		num1 = 2;
	elseif p33 == "Back" then
		str1 = "Right";
		num1 = 0;
	end
	if str1 == "Right" or str1 == "Left" then
		v7 = p36.Size.Z;
		t_Y = p36.Size.Y;
		local __ = -v7 + p36.CFrame:toObjectSpace(CFrame.new(p37)).p.X / v7;
	end
	local v8 = nil;
	local v9 = nil;
	if str1 == nil then return end
	for __, child3_0 in pairs(p36:GetChildren()) do
		if not child3_0:IsA("SurfaceGui") or child3_0.Face ~= Enum.NormalId[str1] or not v8 or not v8:FindFirstChild("Framey") then continue end
		v8 = child3_0;
		v9 = child3_0.Framey;
	end
	if v8 == nil then
		local SurfaceGui = Instance.new("SurfaceGui");
		SurfaceGui.ZOffset = 1;
		SurfaceGui.LightInfluence = 1;
		SurfaceGui.CanvasSize = Vector2.new(v7 * 10, t_Y * 10);
		SurfaceGui.Face = num1;
		SurfaceGui.Parent = workspace.Debris;
		SurfaceGui.Adornee = p36;
		v9 = Instance.new("Frame");
		v9.Name = "Framey";
		v9.Size = UDim2.new(1, 0, 1, 0);
		v9.ClipsDescendants = true;
		v9.BackgroundTransparency = 1;
		v9.Parent = SurfaceGui;
		table.insert(surfaceguis, SurfaceGui);
	end
	local ImageLabel = Instance.new("ImageLabel", v9);
	ImageLabel.Image = p32;
	ImageLabel.Size = UDim2.new(0, u8, 0, u8);
	ImageLabel.BackgroundTransparency = 1;
	if p40 and p40 == true then
		ImageLabel.ImageColor3 = Color3.new(0.5, 0.5, 0.5);
	end
	if p35 == 0 then
		ImageLabel.Position = UDim2.new(0, p35 - (p38 - p39), p34.Y.Scale, p34.Y.Offset);
	else
		ImageLabel.Position = UDim2.new(1, p39, p34.Y.Scale, p34.Y.Offset);
	end
	if p41 == false then
		delay(6, function() -- Line: 690
			--[[
				Upvalues:
					[1] = ImageLabel
			--]]
			ImageLabel:Destroy();
		end);
	end
end
function createbullethole(p42, p43, p44) -- Line: 695
	--[[
		Upvalues:
			[1] = u8
			[2] = table4
			[3] = table3
			[4] = table2
			[5] = table1
	--]]
	local bool4 = false;
	local bool5 = false;
	if p42 then
		local v63;
		if p44 or p42 and p42.Parent and p42.Parent:FindFirstChild("Humanoid2") or p42 and p42.Parent and p42.Parent:FindFirstChild("Humanoid") then
			u8 = 12;
			if p44 then
				u8 = math.random(12, 30);
			end
			v63 = istenfoot and "rbxassetid://rbxassetid://286657419" or table4[math.random(1, #table4)];
			bool4 = true;
			if p42 and p42.Parent and p42.Parent:FindFirstChild("Humanoid") then
				bool5 = true;
			end
		else
			u8 = 4;
			if p42.Material == Enum.Material.Metal or p42.Material == Enum.Material.CorrodedMetal or p42.Material == Enum.Material.DiamondPlate then
				v63 = table3[math.random(1, 4)];
			elseif p42.Material == Enum.Material.Wood or p42.Material == Enum.Material.WoodPlanks then
				v63 = table2[math.random(1, 4)];
			else
				v63 = table1[math.random(1, 4)];
			end
		end
		if p42 and game.Players.LocalPlayer.Character and p42:IsDescendantOf(game.Players.LocalPlayer.Character) then return end
		local v59 = p42.Size.X;
		local v60 = p42.Size.Y;
		local ReturnNormal_ret = ReturnNormal(p43, p42);
		if ReturnNormal_ret == nil then return end
		if ReturnNormal_ret == "Top" or ReturnNormal_ret == "Bottom" then
			v59 = p42.Size.Z;
			v60 = p42.Size.X;
		elseif ReturnNormal_ret == "Right" or ReturnNormal_ret == "Left" then
			v59 = p42.Size.Z;
			v60 = p42.Size.Y;
		end
		local v61 = nil;
		local v62 = nil;
		for __, child7 in pairs(p42:GetChildren()) do
			if not child7:IsA("SurfaceGui") or child7.Face ~= Enum.NormalId[ReturnNormal_ret] or not v61 or not v61:FindFirstChild("Framey") then continue end
			v61 = child7;
			v62 = child7.Framey;
		end
		if v61 == nil then
			v61 = Instance.new("SurfaceGui");
			v61.Name = "Bullet";
			v61.ZOffset = 1;
			v61.LightInfluence = 1;
			v61.CanvasSize = Vector2.new(v59 * 10, v60 * 10);
			v61.Face = ReturnNormal_ret;
			v61.Parent = workspace.Debris;
			game:GetService("Debris"):AddItem(v61, 15);
			v61.Adornee = p42;
			v62 = Instance.new("Frame");
			v62.Name = "Framey";
			v62.Size = UDim2.new(1, 0, 1, 0);
			v62.ClipsDescendants = true;
			v62.BackgroundTransparency = 1;
			v62.Parent = v61;
			table.insert(surfaceguis, v61);
		end
		local ImageLabel2 = Instance.new("ImageLabel", v62);
		ImageLabel2.Image = v63;
		ImageLabel2.Size = UDim2.new(0, u8, 0, u8);
		ImageLabel2.BackgroundTransparency = 1;
		if bool4 == true then
			ImageLabel2.ImageColor3 = Color3.new(0.5, 0.5, 0.5);
		end
		local v64 = -p42.CFrame:toObjectSpace(CFrame.new(p43)).p;
		if ReturnNormal_ret == "Front" then
			ImageLabel2.Position = UDim2.new(v64.X / v59 + 0.5, -u8 / 2, v64.Y / v60 + 0.5, -u8 / 2);
		elseif ReturnNormal_ret == "Back" then
			ImageLabel2.Position = UDim2.new(-v64.X / v59 + 0.5, -u8 / 2, v64.Y / v60 + 0.5, -u8 / 2);
		elseif ReturnNormal_ret == "Right" then
			ImageLabel2.Position = UDim2.new(v64.Z / v59 + 0.5, -u8 / 2, v64.Y / v60 + 0.5, -u8 / 2);
		elseif ReturnNormal_ret == "Left" then
			ImageLabel2.Position = UDim2.new(-v64.Z / v59 + 0.5, -u8 / 2, v64.Y / v60 + 0.5, -u8 / 2);
		elseif ReturnNormal_ret == "Top" then
			ImageLabel2.Position = UDim2.new(v64.Z / v59 + 0.5, -u8 / 2, -v64.X / v60 + 0.5, -u8 / 2);
		elseif ReturnNormal_ret == "Bottom" then
			ImageLabel2.Position = UDim2.new(v64.Z / v59 + 0.5, -u8 / 2, v64.X / v60 + 0.5, -u8 / 2);
		end
		if ImageLabel2.AbsolutePosition.X > v61.AbsoluteSize.X - u8 then
			SecondaryTex(v63, ReturnNormal_ret, ImageLabel2.Position, 0, p42, p43, v61.AbsoluteSize.X, ImageLabel2.AbsolutePosition.X, bool4, bool5);
		elseif ImageLabel2.AbsolutePosition.X < u8 / 2 then
			SecondaryTex(v63, ReturnNormal_ret, ImageLabel2.Position, 1, p42, p43, v61.AbsoluteSize.X, ImageLabel2.AbsolutePosition.X, bool4, bool5);
		end
		if bool5 == false then
			delay(6, function() -- Line: 800
				--[[
					Upvalues:
						[1] = ImageLabel2
				--]]
				ImageLabel2:Destroy();
			end);
		end
	end
end
local t_CurrentCamera = game.Workspace.CurrentCamera;
function createparticle(p45, p46, p47, p48, p49, p50, p51, p52) -- Line: 806
	--[[
		Upvalues:
			[1] = t_CurrentCamera
			[2] = m_Sound
	--]]
	local v10 = istenfoot and 10 or visualizeModule.returnquality();
	local v11 = p47;
	local v12 = false;
	if v11 == nil and p46 and p46:IsA("BasePart") then
		v11 = p46.Position;
	end
	if v11 then
		local WorldToScreenPoint_ret1 = nil;
		WorldToScreenPoint_ret1, v12 = game.Workspace.CurrentCamera:WorldToScreenPoint(v11);
		_ = WorldToScreenPoint_ret1;
	end
	if not p46 or not p46.Parent then return end
	if p45 == "bullethole" and p46 and p46.Parent and p46.Parent.Name ~= "Interactive" or p45 == "Blood" then
		createbullethole(p46, p47);
	end
	if p45 and v11 and p48 and p46 and t_CurrentCamera and t_CurrentCamera:FindFirstChild("Debris") then
		if p45 == "Blood" then
			p49 = getref(p49);
		end
		if p45 == "Blood" and p49 and p49:FindFirstChild("DMG") then
			if p46 and p46.Parent and p46.Parent:FindFirstChild("Humanoid") then
				if p52 then
					splatterBlood(v11, p46.Parent.Humanoid, p49.DMG.Value * 4, p51, p47);
				else
					splatterBlood(v11, p46.Parent.Humanoid, p49.DMG.Value, p51, p47);
				end
			end
			if p46 and p46.Parent and p46.Parent:FindFirstChild("Humanoid2") then
				if p52 then
					splatterBlood(v11, p46.Parent.Humanoid2, p49.DMG.Value * 4, p51, p47);
				else
					splatterBlood(v11, p46.Parent.Humanoid2, p49.DMG.Value, p51, p47);
				end
			end
			local v97 = p46;
			local v98 = istenfoot and "XBBlood" or "Blood";
			local v99 = game.ReplicatedStorage.Sounds["Bullet" .. math.random(1, 4)];
			if game.Players:GetPlayerFromCharacter(p46.Parent) and game.Players:GetPlayerFromCharacter(p46.Parent):FindFirstChild("Kevlar") and p46.Name ~= "RightUpperLeg" and p46.Name ~= "RightLowerLeg" and p46.Name ~= "RightFoot" and p46.Name ~= "LeftUpperLeg" and p46.Name ~= "LeftLowerLeg" and p46.Name ~= "LeftFoot" then
				v99 = game.ReplicatedStorage.Sounds["Kevlar" .. math.random(1, 5)];
			end
			if p46 and p46.Name == "Head" or p46 and p46.Name == "HeadHB" or p46 and p46.Name == "FakeHead" then
				if game.Players:GetPlayerFromCharacter(p46.Parent) and game.Players:GetPlayerFromCharacter(p46.Parent):FindFirstChild("Helmet") then
					v99 = game.ReplicatedStorage.Sounds["Helmet" .. math.random(1, 4)];
					v98 = "LowDink";
				else
					v99 = game.ReplicatedStorage.Sounds["Headshot" .. math.random(1, 4)];
				end
			end
			if p49 and p49:FindFirstChild("Melee") and p49:FindFirstChild("Model") then
				if p50 and p50 == true then
					v99 = p49.Model.Stab;
				else
					v99 = p49.Model["Hit" .. math.random(1, 4)];
				end
			end
			if v10 > 1 and v12 then
				local Clone_ret2 = (v10 <= 5 and game.ReplicatedStorage.Particles.LowQuality[v98] or game.ReplicatedStorage.Particles[v98]):Clone();
				Clone_ret2.CFrame = CFrame.new(v11, v11 + p48);
				Clone_ret2.Parent = t_CurrentCamera.Debris;
				local Children10 = Clone_ret2:GetChildren();
				for index53 = 1, #Children10 do
					if Children10[index53].className == "ParticleEmitter" then
						Children10[index53].Enabled = false;
						Children10[index53]:Emit(Children10[index53].Rate * 0.1);
					end
				end
				delay(0.1, function() -- Line: 890
					--[[
						Upvalues:
							[1] = Clone_ret2
					--]]
					wait(2.35);
					Clone_ret2:Destroy();
				end);
				v97 = Clone_ret2;
			end
			if v97 and game.SoundService.Sounds.Flashbang.Enabled == false then
				m_Sound.playsound(v99, v97);
			end
		else
			local v100 = game.ReplicatedStorage.Sounds["Concrete" .. math.random(1, 4)];
			local v101 = p46;
			if v12 and v10 > 1 then
				local str2 = "Concrete";
				if p46.Material == Enum.Material.Grass or p46.Material == Enum.Material.Fabric then
					str2 = "Grass";
					v100 = game.ReplicatedStorage.Sounds["Grass" .. math.random(1, 4)];
				elseif p46.Material == Enum.Material.CorrodedMetal or p46.Material == Enum.Material.DiamondPlate or p46.Material == Enum.Material.Metal then
					str2 = "Metal";
					v100 = game.ReplicatedStorage.Sounds["Metal" .. math.random(1, 4)];
				elseif p46.Material == Enum.Material.Brick then
					str2 = "Dirt";
				elseif p46.Material == Enum.Material.WoodPlanks or p46.Material == Enum.Material.Wood then
					str2 = "Wood";
					v100 = game.ReplicatedStorage.Sounds["Wood" .. math.random(1, 5)];
				elseif p46.Material == Enum.Material.Sand then
					str2 = "Sand";
					v100 = game.ReplicatedStorage.Sounds["Sand" .. math.random(1, 4)];
				end
				local __ = game.ReplicatedStorage.Particles[str2];
				local Clone_ret = game.ReplicatedStorage.Particles[str2]:Clone();
				if Clone_ret:FindFirstChild("Dirt2") and Clone_ret:FindFirstChild("Smoke") then
					Clone_ret.Dirt2.Color = ColorSequence.new(p46.BrickColor.Color);
					Clone_ret.Smoke.Color = ColorSequence.new(p46.BrickColor.Color);
				end
				Clone_ret.CFrame = CFrame.new(v11, v11 + p48);
				Clone_ret.Parent = t_CurrentCamera.Debris;
				local Children9 = Clone_ret:GetChildren();
				for index54 = 1, #Children9 do
					if Children9[index54].className == "ParticleEmitter" then
						Children9[index54].Enabled = false;
						Children9[index54]:Emit(Children9[index54].Rate * 0.1);
					end
				end
				delay(0.1, function() -- Line: 940
					--[[
						Upvalues:
							[1] = Clone_ret
					--]]
					wait(2.35);
					Clone_ret:Destroy();
				end);
				v101 = Clone_ret;
			end
			if game.SoundService.Sounds.Flashbang.Enabled == false then
				m_Sound.playsound(v100, v101, math.random(80, 120) / 100, 0.4);
			end
		end
	end
	if p45 == "muzzle" and p46 then
		if p46 and p46.Parent and p46.Parent:FindFirstChild("Shoot") and p46.Parent.Parent and p46.Parent.Parent:FindFirstChild("Head") then
			if p46.Parent:FindFirstChild("Silencer2") and p46.Parent.Silencer2.Transparency == 0 then
				if game.SoundService.Sounds.Flashbang.Enabled == false then
					m_Sound.playsound(p46.Parent.SShoot, p46.Parent.Parent.Head);
				end
			elseif game.SoundService.Sounds.Flashbang.Enabled == false then
				m_Sound.playsound(p46.Parent.Shoot, p46.Parent.Parent.Head);
			end
		end
		if v12 and v10 > 1 then
			if p46 and p46.Parent and (p46.Parent:FindFirstChild("Silencer2") and p46.Parent.Silencer2.Transparency == 0 or p46.Parent:FindFirstChild("Suppressed")) then
				local Children8 = game.ReplicatedStorage.Particles.FlashS:GetChildren();
				for index55 = 1, #Children8 do
					if Children8[index55].className == "ParticleEmitter" then
						local clone_ret3 = Children8[index55]:clone();
						clone_ret3.Enabled = false;
						clone_ret3.Parent = p46;
						clone_ret3:Emit(clone_ret3.Rate * 0.05);
						delay(0.05, function() -- Line: 974
							--[[
								Upvalues:
									[1] = clone_ret3
							--]]
							clone_ret3.Enabled = false;
							wait(2.35);
							clone_ret3:Destroy();
						end);
					end
				end
			else
				local Children7 = game.ReplicatedStorage.Particles.Flash:GetChildren();
				for index56 = 1, #Children7 do
					if Children7[index56].className == "ParticleEmitter" then
						local clone_ret2 = Children7[index56]:clone();
						clone_ret2.Enabled = false;
						clone_ret2.Parent = p46;
						clone_ret2:Emit(clone_ret2.Rate * 0.05);
						delay(0.05, function() -- Line: 989
							--[[
								Upvalues:
									[1] = clone_ret2
							--]]
							clone_ret2.Enabled = false;
							wait(2.35);
							clone_ret2:Destroy();
						end);
					end
				end
				local clone_ret = game.ReplicatedStorage.Particles.Light:clone();
				clone_ret.Parent = p46;
				clone_ret.Enabled = true;
				delay(0.03, function() -- Line: 999
					--[[
						Upvalues:
							[1] = clone_ret
					--]]
					clone_ret:Destroy();
				end);
			end
		end
	end
end
function createtrail(p53, p54, p55) -- Line: 1007
	visualizeModule.createtrail(p53, p54, p55);
end
game.ReplicatedStorage.Events.Trail.OnClientEvent:connect(function(p56, p57, p58) -- Line: 1010
	table.insert(p58, game.Workspace.CurrentCamera);
	visualizeModule.createtrail(p56, p57, p58);
end);
damagemodifier = 0;
local table_insert = table.insert;
mfloor = math.floor;
mmax = math.max;
mmin = math.min;
mrandom = math.random;
mrad = math.rad;
Cnew = Color3.new;
local u9 = nil;
local bool6 = false;
local bool7 = true;
local bool8 = false;
local GUI = script.Parent:WaitForChild("GUI");
local AmmoGUI = GUI:WaitForChild("AmmoGUI");
local Vitals = GUI:WaitForChild("Vitals");
local Crosshairs_ = GUI:WaitForChild("Crosshairs");
local Scope = Crosshairs_:WaitForChild("Scope");
local SuitZoom = script.Parent:WaitForChild("GUI"):WaitForChild("SuitZoom");
local UserInputService_ = game:GetService("UserInputService");
local t_SelectionSphere = script.Parent.SelectionSphere;
local u10 = nil;
currentTargetHealth = nil;
repeat
	RunService.Heartbeat:wait();
until game.Players.LocalPlayer and game.Workspace.CurrentCamera;
spawn(function() -- Line: 1042
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", false);
end);
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
game.StarterGui:SetCore("TopbarEnabled", false);
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
local BrickColor_new = BrickColor.new;
local g_Cnew = Cnew;
function PlayLocalSound(p59) -- Line: 1055
	--[[
		Upvalues:
			[1] = m_Sound
	--]]
	if game.SoundService.Sounds.Flashbang.Enabled == false then
		m_Sound.playsound(p59, script.Parent.LocalSounds);
	end
end
function getref(p60) -- Line: 1061
	if p60 and typeof(p60) == "Instance" and p60:FindFirstChild("CopyFrom") then
		return p60.CopyFrom.Value;
	end
	return p60;
end
function gen_time(p61) -- Line: 1068
	local table6 = {};
	local table7 = {};
	table6[1] = mfloor(p61 / 3600);
	table6[2] = mfloor((p61 - table6[1] * 3600) / 60);
	table6[3] = p61 - table6[1] * 3600 - table6[2] * 60;
	for index5 = 1, 3 do
		table7[index5] = "";
		if table6[index5] < 10 and index5 == 3 then
			table7[index5] = "0";
		end
		table7[index5] = table7[index5] .. table6[index5];
	end
	if table6[1] <= 0 then
		return table7[2] .. ":" .. table7[3];
	end
	return table7[1] .. ":" .. table7[2] .. ":" .. table7[3];
end
local u11 = false;
local LoadAnimation_ret = nil;
local LoadAnimation_ret2 = nil;
shiftwalkanim = nil;
local bool9 = false;
local LoadAnimation_ret3 = nil;
aidle = nil;
local LoadAnimation_ret4 = nil;
local LoadAnimation_ret5 = nil;
local LoadAnimation_ret6 = nil;
local LoadAnimation_ret7 = nil;
local bool10 = false;
UserInputService_.MouseIconEnabled = false;
local t_Character = nil;
local UpperTorso = nil;
local Humanoid = nil;
local u12 = false;
local u13 = "";
local u14 = "";
local u15 = "";
local u16 = "";
local u17 = "";
local u18 = "";
local u19 = "";
local u20 = "";
local str3 = "";
local u21 = "";
local str4 = "";
local u22 = "";
local str5 = "";
local u23 = 3;
local u24 = 2;
local m_NewMouse = require(game.ReplicatedStorage.Modules.NewMouse);
function grenadeallowed(p62) -- Line: 1122
	--[[
		Upvalues:
			[1] = u17
			[2] = u18
			[3] = u19
			[4] = u20
	--]]
	local v13 = 0;
	local v14 = 0;
	local bool11 = false;
	local bool12 = false;
	local bool13 = false;
	local bool14 = false;
	if u17 == "Flashbang" then
		v13 = v13 + 1;
		v14 = v14 + 1;
	end
	if u18 == "Flashbang" then
		v13 = v13 + 1;
		v14 = v14 + 1;
	end
	if u19 == "Flashbang" then
		v13 = v13 + 1;
		v14 = v14 + 1;
	end
	if u20 == "Flashbang" then
		v13 = v13 + 1;
		v14 = v14 + 1;
	end
	local str6 = "HE Grenade";
	if u17 == str6 or u18 == str6 or u19 == str6 or u20 == str6 then
		bool12 = true;
		v14 = v14 + 1;
	end
	local str7 = "Decoy Grenade";
	if u17 == str7 or u18 == str7 or u19 == str7 or u20 == str7 then
		bool11 = true;
		v14 = v14 + 1;
	end
	local str8 = "Smoke Grenade";
	if u17 == str8 or u18 == str8 or u19 == str8 or u20 == str8 then
		bool13 = true;
		v14 = v14 + 1;
	end
	local str9 = "Incendiary Grenade";
	if u17 == str9 or u18 == str9 or u19 == str9 or u20 == str9 then
		bool14 = true;
		v14 = v14 + 1;
	end
	local str10 = "Molotov";
	if u17 == str10 or u18 == str10 or u19 == str10 or u20 == str10 then
		bool14 = true;
		v14 = v14 + 1;
	end
	local bool15 = true;
	if v14 >= 4 and game.ReplicatedStorage.gametype.Value == "competitive" or v14 >= 3 and game.ReplicatedStorage.gametype.Value ~= "competitive" then
		bool15 = false;
	end
	if bool15 and p62 == "HE Grenade" and bool12 == true then
		bool15 = false;
	end
	if bool15 and p62 == "Flashbang" and v13 >= 2 then
		bool15 = false;
	end
	if bool15 and (p62 == "Molotov" or p62 == "Incendiary Grenade") and bool14 == true then
		bool15 = false;
	end
	if bool15 and p62 == "Smoke Grenade" and bool13 == true then
		bool15 = false;
	end
	if bool15 and p62 == "Decoy Grenade" and bool11 == true then
		bool15 = false;
	end
	return bool15;
end
local t_CurrentCamera2 = game.Workspace.CurrentCamera;
script.Blur:clone().Parent = t_CurrentCamera2;
script.ColorCorrection:clone().Parent = t_CurrentCamera2;
local Status = t_LocalPlayer:WaitForChild("Status");
local Alive = Status:WaitForChild("Alive");
if t_CurrentCamera2:FindFirstChild("Debris") then
	t_CurrentCamera2.Debris:Destroy();
end
local Debris = Instance.new("Folder");
Debris.Parent = t_CurrentCamera2;
Debris.Name = "Debris";
if t_CurrentCamera2:FindFirstChild("GUI") then
	t_CurrentCamera2.GUI:Destroy();
end
doublezoom = false;
local GUI2 = Instance.new("Folder");
GUI2.Parent = t_CurrentCamera2;
GUI2.Name = "GUI";
function updateads() -- Line: 1172
	--[[
		Upvalues:
			[1] = u11
			[2] = t_Character
			[3] = m_Sound
			[4] = t_LocalPlayer
			[5] = RunService
			[6] = t_CurrentCamera2
	--]]
	game.ReplicatedStorage.Events.AdjustADS:FireServer(u11, doublezoom);
	if u11 == true then
		if t_Character:FindFirstChild("AIMING") == nil then
			local AIMING = Instance.new("IntValue");
			AIMING.Parent = t_Character;
			AIMING.Name = "AIMING";
			m_Sound.playsound(t_LocalPlayer.PlayerGui["In" .. math.random(1, 6)]);
		end
		if doublezoom == true then
			spawn(function() -- Line: 1183
				--[[
					Upvalues:
						[1] = RunService
						[2] = u11
						[3] = t_CurrentCamera2
				--]]
				if gun ~= "none" and gun and gun.Name == "AWP" then
					repeat
						RunService.Heartbeat:wait();
						if u11 == false then return end
						t_CurrentCamera2.FieldOfView = mmax(fieldofview / 70 * 7.8, t_CurrentCamera2.FieldOfView - t_CurrentCamera2.FieldOfView / 3);
					until mfloor(t_CurrentCamera2.FieldOfView) <= fieldofview / 70 * 7.8;
				else
					repeat
						RunService.Heartbeat:wait();
						if u11 == false then return end
						t_CurrentCamera2.FieldOfView = mmax(fieldofview / 70 * 11.7, t_CurrentCamera2.FieldOfView - t_CurrentCamera2.FieldOfView / 3);
					until mfloor(t_CurrentCamera2.FieldOfView) <= fieldofview / 70 * 11.7;
				end
			end);
		else
			spawn(function() -- Line: 1191
				--[[
					Upvalues:
						[1] = RunService
						[2] = u11
						[3] = t_CurrentCamera2
				--]]
				while true do
					RunService.Heartbeat:wait();
					if u11 == false then return end
					t_CurrentCamera2.FieldOfView = mmax(fieldofview / 70 * 31.2, t_CurrentCamera2.FieldOfView - t_CurrentCamera2.FieldOfView / 3);
					if mfloor(t_CurrentCamera2.FieldOfView) > fieldofview / 70 * 31.2 then continue end
					return;
				end
			end);
		end
		if gun ~= "none" and gun and gun:FindFirstChild("Scoped") and gun:FindFirstChild("RifleThing") == nil then
			script.Parent.GUI.Crosshairs.Crosshair.Visible = false;
			script.Parent.GUI.Crosshairs.Scope.Visible = true;
			script.Parent.GUI.Crosshairs.Frame1.Visible = true;
			script.Parent.GUI.Crosshairs.Frame2.Visible = true;
			script.Parent.GUI.Crosshairs.Frame3.Visible = true;
			script.Parent.GUI.Crosshairs.Frame4.Visible = true;
		end
	elseif u11 == false then
		doublezoom = false;
		spawn(function() -- Line: 1206
			--[[
				Upvalues:
					[1] = RunService
					[2] = u11
					[3] = t_CurrentCamera2
			--]]
			while true do
				RunService.Heartbeat:wait();
				if u11 == true then return end
				t_CurrentCamera2.FieldOfView = mmin(fieldofview, t_CurrentCamera2.FieldOfView + t_CurrentCamera2.FieldOfView / 3);
				if fieldofview > t_CurrentCamera2.FieldOfView then continue end
				return;
			end
		end);
		if t_Character and t_Character:FindFirstChild("AIMING") then
			t_Character.AIMING:Destroy();
			m_Sound.playsound(t_LocalPlayer.PlayerGui.Sounds["Out" .. math.random(1, 5)]);
		end
		script.Parent.GUI.Crosshairs.Crosshair.Visible = true;
		script.Parent.GUI.Crosshairs.Scope.Visible = false;
		script.Parent.GUI.Crosshairs.Frame1.Visible = false;
		script.Parent.GUI.Crosshairs.Frame2.Visible = false;
		script.Parent.GUI.Crosshairs.Frame3.Visible = false;
		script.Parent.GUI.Crosshairs.Frame4.Visible = false;
	end
end
local LoadAnimation_ret8 = nil;
local LoadAnimation_ret9 = nil;
local LoadAnimation_ret10 = nil;
local LoadAnimation_ret11 = nil;
local LoadAnimation_ret12 = nil;
local LoadAnimation_ret13 = nil;
local LoadAnimation_ret14 = nil;
local LoadAnimation_ret15 = nil;
local LoadAnimation_ret16 = nil;
local LoadAnimation_ret17 = nil;
local LoadAnimation_ret18 = nil;
local LoadAnimation_ret19 = nil;
local LoadAnimation_ret20 = nil;
local LoadAnimation_ret21 = nil;
local LoadAnimation_ret22 = nil;
local LoadAnimation_ret23 = nil;
local LoadAnimation_ret24 = nil;
local LoadAnimation_ret25 = nil;
local LoadAnimation_ret26 = nil;
local bool16 = false;
local bool17 = false;
local u25 = 0;
local u26 = 0;
local u27 = 0;
local u28 = 0;
local u29 = 0;
local u30 = 0;
local u31 = 0;
local u32 = 0;
function autoreload() -- Line: 1225
	--[[
		Upvalues:
			[1] = str5
			[2] = u25
			[3] = u26
	--]]
	if str5 == "primary" and u25 <= 0 then
		reloadwep();
	end
	if str5 == "secondary" and u26 <= 0 then
		reloadwep();
	end
end
function countammo() -- Line: 1229
	--[[
		Upvalues:
			[1] = Humanoid
			[2] = str5
			[3] = t_LocalPlayer
			[4] = AmmoGUI
			[5] = u26
			[6] = u25
			[7] = u29
			[8] = u31
	--]]
	if Humanoid then
		if str5 == "primary" or str5 == "secondary" or str5 == "melee" and t_LocalPlayer.Status.Team.Value == "T" and game.ReplicatedStorage.gametype.Value == "juggernaut" then
			if (gun == "none" or not gun or gun:FindFirstChild("Equipment") ~= nil or gun:FindFirstChild("Equipment2") ~= nil or gun:FindFirstChild("Melee") ~= nil) and (str5 ~= "melee" or t_LocalPlayer.Status.Team.Value ~= "T" or game.ReplicatedStorage.gametype.Value ~= "juggernaut") then
				AmmoGUI.Visible = false;
				return;
			end
			AmmoGUI.Visible = true;
			if str5 == "secondary" and u26 <= math.floor(gun.Ammo.Value * 0.2) + 1 or str5 == "primary" and u25 <= math.floor(gun.Ammo.Value * 0.2) + 1 then
				AmmoGUI.AmmoClip.TextColor3 = Color3.new(212 / 255, 0, 0);
			else
				AmmoGUI.AmmoClip.TextColor3 = script.HackyColorReplication.Value;
			end
			if str5 == "primary" then
				AmmoGUI.AmmoClip.Text = u25;
				AmmoGUI.AmmoReserve.Text = u29;
			elseif str5 == "secondary" then
				AmmoGUI.AmmoClip.Text = u26;
				AmmoGUI.AmmoReserve.Text = u31;
			end
			if str5 == "melee" and t_LocalPlayer.Status.Team.Value == "T" and game.ReplicatedStorage.gametype.Value == "juggernaut" then
				AmmoGUI.AmmoClip.Text = "";
				AmmoGUI.AmmoReserve.Text = "";
				AmmoGUI.Slash.Visible = false;
				return;
			end
			AmmoGUI.Slash.Visible = true;
			return;
		end
		AmmoGUI.Visible = false;
	end
end
local u33 = 0;
function autoequip() -- Line: 1264
	--[[
		Upvalues:
			[1] = u14
			[2] = u16
			[3] = u22
			[4] = u24
			[5] = u23
	--]]
	for index6 = 1, 8 do
		weapons[index6].Weapon.ImageTransparency = 0.8;
		weapons[index6].bk.Visible = false;
	end
	local num2 = nil;
	if u14 ~= "" then
		weapons[1].Weapon.ImageTransparency = 0;
		num2 = 1;
	elseif u16 ~= "" then
		weapons[2].Weapon.ImageTransparency = 0;
		num2 = 2;
	elseif u22 ~= "" then
		weapons[3].Weapon.ImageTransparency = 0;
		num2 = 3;
	end
	if num2 then
		if u24 ~= num2 then
			u23 = u24;
		end
		u24 = num2;
	end
end
local str11 = "";
function updatesilencer() -- Line: 1288
	--[[
		Upvalues:
			[1] = t_CurrentCamera2
			[2] = str5
	--]]
	if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Silencer2") then
		if str5 == "secondary" and special2 == true or str5 == "primary" and special == true then
			if t_CurrentCamera2 and t_CurrentCamera2.Arms:FindFirstChild("Silencer2") then
				t_CurrentCamera2.Arms.Silencer2.Transparency = 1;
			end
			game.ReplicatedStorage.Events.RemoveSilencer:FireServer(gun.Model.Shoot.Value);
			return;
		end
		if t_CurrentCamera2 and t_CurrentCamera2.Arms:FindFirstChild("Silencer2") then
			t_CurrentCamera2.Arms.Silencer2.Transparency = 0;
		end
		game.ReplicatedStorage.Events.ApplySilencer:FireServer(gun.Model.Shoot.Value);
	end
end
primaryowner = nil;
secondaryowner = nil;
function silenced() -- Line: 1306
	--[[
		Upvalues:
			[1] = t_CurrentCamera2
	--]]
	if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Silencer2") then
		if t_CurrentCamera2.Arms.Silencer2.Transparency == 1 then
			return false;
		end
		return true;
	end
	return nil;
end
function loadammo() -- Line: 1316
	--[[
		Upvalues:
			[1] = str5
			[2] = u29
			[3] = u25
			[4] = u31
			[5] = u26
			[6] = u30
			[7] = u27
			[8] = u32
			[9] = u28
	--]]
	local v15 = 0;
	if str5 == "primary" then
		v15 = u29;
		if u25 > 0 then
			v15 = v15 + u25;
		end
	elseif str5 == "secondary" then
		v15 = u31;
		if u26 > 0 then
			v15 = v15 + u26;
		end
	elseif str5 == "equipment" then
		v15 = u30;
		if u27 > 0 then
			v15 = v15 + u27;
		end
	elseif str5 == "equipment2" then
		v15 = u32;
		if u28 > 0 then
			v15 = v15 + u28;
		end
	end
	if str5 == "primary" then
		local mmin_ret4 = mmin(gun.Ammo.Value, v15);
		u29 = v15 - mmin_ret4;
		u25 = mmin_ret4;
	end
	if str5 == "secondary" then
		local mmin_ret3 = mmin(gun.Ammo.Value, v15);
		u31 = v15 - mmin_ret3;
		u26 = mmin_ret3;
	end
	if str5 == "equipment" then
		local mmin_ret2 = mmin(gun.Ammo.Value, v15);
		u30 = v15 - mmin_ret2;
		u27 = mmin_ret2;
	end
	if str5 == "equipment2" then
		local mmin_ret = mmin(gun.Ammo.Value, v15);
		u32 = v15 - mmin_ret;
		u28 = mmin_ret;
	end
	countammo();
end
function isgrenade() -- Line: 1353
	--[[
		Upvalues:
			[1] = str5
	--]]
	if str5 == "grenade" or str5 == "grenade2" or str5 == "grenade3" or str5 == "grenade4" then
		return true;
	end
	return false;
end
function changeto(p63) -- Line: 1360
	--[[
		Upvalues:
			[1] = u24
			[2] = u23
	--]]
	if u24 ~= p63 then
		u23 = u24;
	end
	u24 = p63;
end
function usethatgun(p64) -- Line: 1364
	--[[
		Upvalues:
			[1] = bool16
			[2] = bool17
			[3] = u1
			[4] = t_LocalPlayer
			[5] = m_Sound
			[6] = str5
			[7] = LoadAnimation_ret3
			[8] = LoadAnimation_ret4
			[9] = LoadAnimation_ret7
			[10] = LoadAnimation_ret23
			[11] = LoadAnimation_ret24
			[12] = LoadAnimation_ret8
			[13] = LoadAnimation_ret5
			[14] = u17
			[15] = u18
			[16] = u19
			[17] = u20
			[18] = str3
			[19] = u14
			[20] = u16
			[21] = u22
			[22] = u21
			[23] = str4
			[24] = bool7
			[25] = Humanoid
			[26] = RunService
			[27] = t_Character
			[28] = t_CurrentCamera2
			[29] = u11
			[30] = bool9
			[31] = u33
			[32] = HttpService
			[33] = LoadAnimation_ret6
			[34] = u5
			[35] = u6
			[36] = LoadAnimation_ret9
			[37] = LoadAnimation_ret10
			[38] = LoadAnimation_ret11
			[39] = LoadAnimation_ret16
			[40] = LoadAnimation_ret12
			[41] = LoadAnimation_ret13
			[42] = LoadAnimation_ret14
			[43] = LoadAnimation_ret15
			[44] = LoadAnimation_ret17
			[45] = LoadAnimation_ret18
			[46] = str11
			[47] = LoadAnimation_ret25
			[48] = LoadAnimation_ret26
			[49] = LoadAnimation_ret19
			[50] = LoadAnimation_ret21
			[51] = LoadAnimation_ret22
			[52] = LoadAnimation_ret20
			[53] = bool10
			[54] = bool1
			[55] = bool2
	--]]
	bool16 = false;
	bool17 = false;
	fgun = getref(gun);
	u1 = 0;
	numShots = 0;
	pulling = false;
	local Children11 = t_LocalPlayer.PlayerGui.Drawing:GetChildren();
	for index7 = 1, #Children11 do
		if Children11[index7]:IsA("Sound") then
			Children11[index7]:Destroy();
		end
	end
	m_Sound.playsound(t_LocalPlayer.PlayerGui.Drawing["Cloth" .. math.random(1, 4)]);
	if str5 == "secondary" then
		m_Sound.playsound(t_LocalPlayer.PlayerGui.Drawing["Pap" .. math.random(1, 5)]);
	elseif str5 == "melee" then
		m_Sound.playsound(t_LocalPlayer.PlayerGui.Drawing["Mel" .. math.random(1, 6)]);
	elseif isgrenade() == true then
		m_Sound.playsound(t_LocalPlayer.PlayerGui.Drawing["Gren" .. math.random(1, 5)]);
	elseif gun and gun ~= "none" then
		if gun and gun:FindFirstChild("snipo") then
			m_Sound.playsound(t_LocalPlayer.PlayerGui.Drawing.Sniper);
		elseif gun and gun:FindFirstChild("SMGThing") then
			m_Sound.playsound(t_LocalPlayer.PlayerGui.Drawing["SMG" .. math.random(1, 2)]);
		elseif gun and gun:FindFirstChild("Bullets") and gun.Bullets.Value > 1 then
			m_Sound.playsound(t_LocalPlayer.PlayerGui.Drawing.Shotgun);
		else
			m_Sound.playsound(t_LocalPlayer.PlayerGui.Drawing["Wap" .. math.random(1, 5)]);
		end
	end
	firevariant = false;
	firevariant2 = false;
	if LoadAnimation_ret3 then
		LoadAnimation_ret3:Stop();
	end
	if LoadAnimation_ret4 then
		LoadAnimation_ret4:Stop();
	end
	if LoadAnimation_ret7 then
		LoadAnimation_ret7:Stop();
	end
	if LoadAnimation_ret23 then
		LoadAnimation_ret23:Stop();
	end
	if LoadAnimation_ret24 then
		LoadAnimation_ret24:Stop();
	end
	if LoadAnimation_ret8 then
		LoadAnimation_ret8:Stop();
	end
	if LoadAnimation_ret5 then
		LoadAnimation_ret5:Stop();
	end
	if LoadAnimation_ret4 then
		LoadAnimation_ret4:Stop();
	end
	if u17 == "" and str5 == "grenade" then return end
	if u18 == "" and str5 == "grenade2" then return end
	if u19 == "" and str5 == "grenade3" then return end
	if u20 == "" and str5 == "grenade4" then return end
	if str3 == "" and str5 == "equipment" then return end
	if u14 == "" and str5 == "primary" then return end
	if u16 == "" and str5 == "secondary" then return end
	if u22 == "" and str5 == "melee" then return end
	if u21 == "" and str5 == "equipment2" then return end
	if str4 == "" and str5 == "equipment3" then return end
	if not t_LocalPlayer or not t_LocalPlayer.Character or not t_LocalPlayer.Character:FindFirstChild("UpperTorso") or not t_LocalPlayer.Character:FindFirstChild("Humanoid") then return end
	if bool7 == false then return end
	if Humanoid and Humanoid.Health == 0 then return end
	if RunService:IsStudio() and game.Workspace.ThirdPerson.Value == true then
		t_LocalPlayer.CameraMaxZoomDistance = 10;
	else
		t_LocalPlayer.CameraMaxZoomDistance = 0.5;
	end
	t_LocalPlayer.CameraMinZoomDistance = 0.5;
	DISABLED = true;
	if t_Character and t_Character:FindFirstChild("Gun") then
		t_Character.Gun:Destroy();
	end
	if t_CurrentCamera2:FindFirstChild("Arms") then
		t_CurrentCamera2.Arms:Destroy();
	end
	local m_GetAndMap = require(game.ReplicatedStorage.Modules.GetAndMap);
	local function mapSkin(p143, p144, p145) -- Line: 1437
		--[[
			Upvalues:
				[1] = m_GetAndMap
		--]]
		m_GetAndMap.MapSkin(p143, p144, p145);
	end
	if t_Character and t_Character:FindFirstChild("AIMING") then
		t_Character.AIMING:Destroy();
	end
	repst.Events.ApplyGun:FireServer(gun, p64);
	if gun == "none" then
		countammo();
		DISABLED = false;
		return;
	end
	u11 = false;
	updateads();
	if bool9 == false then
		adsmodifier = 0;
		local bool18 = false;
		if gun ~= "none" and gun and gun.Name == u22 then
			bool18 = true;
		end
		mode = "semi";
		if bool18 == false then
			reloadtime = gun.ReloadTime.Value;
		end
		u33 = fgun.Penetration.Value * 0.01;
		mypattern = gun:FindFirstChild("Pattern") and HttpService:JSONDecode(gun.Pattern.Value) or nil;
		mypattern2 = gun:FindFirstChild("UnsilencedPattern") and HttpService:JSONDecode(gun.UnsilencedPattern.Value) or gun:FindFirstChild("ScopedPattern") and HttpService:JSONDecode(gun.ScopedPattern.Value) or nil;
		if fgun and fgun:FindFirstChild("Auto") and fgun.Auto.Value == true then
			mode = "automatic";
		end
		if gun and gun:FindFirstChild("AimIdle") then
			aidle = Humanoid.Animator:LoadAnimation(gun.AimIdle);
		end
		LoadAnimation_ret3 = Humanoid.Animator:LoadAnimation(gun.Idle);
		if gun and gun:FindFirstChild("Fire2") then
			LoadAnimation_ret5 = Humanoid.Animator:LoadAnimation(gun.Fire2);
		end
		if gun and gun:FindFirstChild("Stab") then
			LoadAnimation_ret6 = Humanoid.Animator:LoadAnimation(gun.Stab);
		end
		LoadAnimation_ret4 = Humanoid.Animator:LoadAnimation(gun.Fire);
		LoadAnimation_ret7 = Humanoid.Animator:LoadAnimation(gun.Reload);
		LoadAnimation_ret8 = Humanoid.Animator:LoadAnimation(gun.Equip);
		LoadAnimation_ret3:Play();
		local gun_Name = gun.Name;
		LoadAnimation_ret8:Play();
		if repst.Viewmodels:FindFirstChild("v_" .. gun_Name) then
			local clone_ret4 = repst.Viewmodels["v_" .. gun_Name]:clone();
			clone_ret4.Name = gun_Name;
			if repst.Weapons:FindFirstChild(gun.Name) then
				if repst.Weapons:FindFirstChild(gun.Name):FindFirstChild("Primary") then
					p64 = primaryowner;
				elseif repst.Weapons:FindFirstChild(gun.Name):FindFirstChild("Secondary") then
					p64 = secondaryowner;
				end
			end
			if p64 == nil then
				p64 = player;
			end
			local t_Value = p64.Status.Team.Value;
			if clone_ret4:FindFirstChild("LEGACY") then
				local Children12 = clone_ret4.LEGACY:GetChildren();
				for index57 = 1, #Children12 do
					Children12[index57].Parent = clone_ret4;
				end
				clone_ret4.LEGACY:Destroy();
			end
			if p64 ~= nil then
				local skinfolder = getskinfolder(p64);
				local v137 = skinfolder and skinfolder:FindFirstChild(gun.Name);
				for index58 = 1, #CurrentKnives do
					if CurrentKnives[index58] == gun.Name then
						v137 = skinfolder and skinfolder:FindFirstChild("Knife");
					end
				end
				if v137 ~= nil then
					local t_Value2 = v137.Value;
					if t_Value2 ~= "Stock" then
						local t_Value3 = nil;
						local StatTrak = v137:FindFirstChild("StatTrak");
						if StatTrak then
							t_Value3 = StatTrak.Count.Value;
						end
						m_GetAndMap.MapSkin(clone_ret4, t_Value2, t_Value3);
					end
				end
			end
			clone_ret4.Name = "Arms";
			clone_ret4.PrimaryPart.Transparency = 1;
			local v102 = "CSSArms";
			local t_Value4 = game.Workspace.Map.Tee.Value;
			if t_LocalPlayer and t_LocalPlayer.Status.Team.Value == "CT" then
				t_Value4 = game.Workspace.Map.CeeT.Value;
			end
			if repst.Viewmodels:FindFirstChild(t_Value4 .. "Arms") then
				v102 = t_Value4 .. "Arms";
			end
			local clone_ret5 = repst.Viewmodels[v102]:clone();
			local v103 = nil;
			local split_ret = nil;
			if t_Value == "CT" then
				if u5.GloveOver then
					split_ret = split(u5.Glove[1], "_");
					v103 = repst.Gloves[split_ret[1]][split_ret[2]];
				end
			elseif t_Value == "T" and u6.GloveOver then
				split_ret = split(u6.Glove[1], "_");
				v103 = repst.Gloves[split_ret[1]][split_ret[2]];
			end
			if v103 ~= nil then
				local v138 = nil;
				if clone_ret5["Left Arm"]:FindFirstChild("Glove") then
					v138 = clone_ret5["Left Arm"];
					v138:FindFirstChild("Glove"):Destroy();
				end
				local Clone_ret3 = repst.Gloves.Models[split_ret[1]].LGlove:Clone();
				Clone_ret3.Parent = v138;
				Clone_ret3.Welded.Part0 = v138;
				Clone_ret3.Mesh.TextureId = repst.Gloves[split_ret[1]][split_ret[2]].Textures.TextureId;
				if clone_ret5["Right Arm"]:FindFirstChild("Glove") then
					v138 = clone_ret5["Right Arm"];
					v138:FindFirstChild("Glove"):Destroy();
				end
				local Clone_ret4 = repst.Gloves.Models[split_ret[1]].RGlove:Clone();
				Clone_ret4.Parent = v138;
				Clone_ret4.Welded.Part0 = v138;
				Clone_ret4.Mesh.TextureId = repst.Gloves[split_ret[1]][split_ret[2]].Textures.TextureId;
			end
			local Motor6D = Instance.new("Motor6D");
			Motor6D.Parent = clone_ret5["Right Arm"];
			clone_ret5.Parent = clone_ret4;
			Motor6D.Part0 = clone_ret4["Right Arm"];
			Motor6D.Part1 = clone_ret5["Right Arm"];
			Motor6D.C0 = CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966);
			if clone_ret4:FindFirstChild("Left Arm") then
				local Motor6D2 = Instance.new("Motor6D");
				Motor6D2.Parent = clone_ret5["Left Arm"];
				Motor6D2.Part0 = clone_ret4["Left Arm"];
				Motor6D2.Part1 = clone_ret5["Left Arm"];
				clone_ret4["Left Arm"].Transparency = 1;
				Motor6D2.C0 = CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966);
			else
				clone_ret5["Left Arm"]:Destroy();
			end
			clone_ret4["Right Arm"].Transparency = 1;
			clone_ret4.Parent = t_CurrentCamera2;
			adsoffset = CFrame.new(0, 0, 10);
			if clone_ret4 and clone_ret4:FindFirstChild("AIM") then
				clone_ret4.PrimaryPart.Anchored = true;
				clone_ret4:SetPrimaryPartCFrame(t_CurrentCamera2.CFrame);
				local toObjectSpace_ret = clone_ret4:WaitForChild("AIM").CFrame:toObjectSpace(t_CurrentCamera2.CFrame);
				local toEulerAnglesXYZ_ret1, toEulerAnglesXYZ_ret2, toEulerAnglesXYZ_ret3 = toObjectSpace_ret:toEulerAnglesXYZ();
				adsoffset = CFrame.new(0, 0, 0.5) * CFrame.new(toObjectSpace_ret.X, toObjectSpace_ret.Y, toObjectSpace_ret.Z) * CFrame.Angles(toEulerAnglesXYZ_ret1, toEulerAnglesXYZ_ret2, toEulerAnglesXYZ_ret3);
			end
			if clone_ret4:FindFirstChild("inspect") then
				LoadAnimation_ret9 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("inspect"));
				LoadAnimation_ret9.KeyframeReached:connect(function(p151) -- Line: 1594
					--[[
						Upvalues:
							[1] = t_Character
					--]]
					p151 = string.lower(p151);
					if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild(p151) then
						PlayLocalSound(gun.Model[p151]);
					end
				end);
			else
				LoadAnimation_ret9 = nil;
			end
			if clone_ret4:FindFirstChild("inspectempty") then
				LoadAnimation_ret10 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("inspectempty"));
				LoadAnimation_ret10.KeyframeReached:connect(function(p152) -- Line: 1605
					--[[
						Upvalues:
							[1] = t_Character
					--]]
					p152 = string.lower(p152);
					if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild(p152) then
						PlayLocalSound(gun.Model[p152]);
					end
				end);
			else
				LoadAnimation_ret10 = nil;
			end
			LoadAnimation_ret11 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("idle"));
			if clone_ret4 and clone_ret4:FindFirstChild("stab") then
				LoadAnimation_ret16 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("stab"));
			end
			LoadAnimation_ret12 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("fire"));
			if clone_ret4:FindFirstChild("pull") then
				LoadAnimation_ret13 = clone_ret4.Guy:LoadAnimation(clone_ret4.pull);
				LoadAnimation_ret14 = clone_ret4.Guy:LoadAnimation(clone_ret4.fastfire);
			end
			if clone_ret4:FindFirstChild("aimfire") then
				LoadAnimation_ret15 = clone_ret4.Guy:LoadAnimation(clone_ret4.aimfire);
			else
				LoadAnimation_ret15 = nil;
			end
			LoadAnimation_ret17 = nil;
			LoadAnimation_ret18 = nil;
			if clone_ret4:FindFirstChild("fire2") then
				firevariant2 = true;
				LoadAnimation_ret17 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("fire2"));
				LoadAnimation_ret17.KeyframeReached:connect(function(p153) -- Line: 1627
					--[[
						Upvalues:
							[1] = t_Character
							[2] = m_Sound
					--]]
					p153 = string.lower(p153);
					if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild(p153) then
						m_Sound.rplaysound(t_Character.Gun[p153]);
					end
				end);
			end
			if clone_ret4:FindFirstChild("fire3") then
				firevariant = true;
				LoadAnimation_ret18 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("fire3"));
				LoadAnimation_ret18.KeyframeReached:connect(function(p154) -- Line: 1637
					--[[
						Upvalues:
							[1] = t_Character
							[2] = m_Sound
					--]]
					p154 = string.lower(p154);
					if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild(p154) then
						m_Sound.rplaysound(t_Character.Gun[p154]);
					end
				end);
			end
			LoadAnimation_ret12.KeyframeReached:connect(function(p149) -- Line: 1644
				--[[
					Upvalues:
						[1] = t_Character
						[2] = m_Sound
						[3] = t_CurrentCamera2
						[4] = str11
						[5] = u21
						[6] = u11
				--]]
				p149 = string.lower(p149);
				if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild(p149) then
					m_Sound.rplaysound(t_Character.Gun[p149]);
				end
				if p149 == "press1" then
					if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("HUD") then
						t_CurrentCamera2.Arms.HUD.SurfaceGui.TextLabel.Text = "******7";
					end
				elseif p149 == "press2" then
					if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("HUD") then
						t_CurrentCamera2.Arms.HUD.SurfaceGui.TextLabel.Text = "*****73";
					end
				elseif p149 == "press3" then
					if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("HUD") then
						t_CurrentCamera2.Arms.HUD.SurfaceGui.TextLabel.Text = "****735";
					end
				elseif p149 == "press4" then
					if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("HUD") then
						t_CurrentCamera2.Arms.HUD.SurfaceGui.TextLabel.Text = "***7355";
					end
				elseif p149 == "press5" then
					if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("HUD") then
						t_CurrentCamera2.Arms.HUD.SurfaceGui.TextLabel.Text = "**73556";
					end
				elseif p149 == "press6" then
					if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("HUD") then
						t_CurrentCamera2.Arms.HUD.SurfaceGui.TextLabel.Text = "*735560";
					end
				elseif p149 == "press7" then
					if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("HUD") then
						t_CurrentCamera2.Arms.HUD.SurfaceGui.TextLabel.Text = "7355608";
					end
				else
					if p149 == "yum" then
						m_Sound.playsound(t_CurrentCamera2.Arms.yum);
						return;
					end
					if p149 == "beep" then
						m_Sound.playsound(t_CurrentCamera2.Arms.beep);
						return;
					end
					if p149 == "plantupboy" and game.Workspace.Status.EnablePlanting.Value == true then
						game.ReplicatedStorage.Events.PlantC4:FireServer(str11);
						u21 = "";
						autoequip();
						updateInventory();
						u11 = false;
						updateads();
					end
				end
			end);
			if clone_ret4:FindFirstChild("sapply") then
				LoadAnimation_ret25 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("sapply"));
				LoadAnimation_ret26 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("sremove"));
				LoadAnimation_ret25.KeyframeReached:connect(function(p155) -- Line: 1696
					--[[
						Upvalues:
							[1] = t_Character
							[2] = m_Sound
							[3] = t_CurrentCamera2
					--]]
					p155 = string.lower(p155);
					if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild(p155) then
						m_Sound.rplaysound(t_Character.Gun[p155]);
					end
					if p155 == "transparency0" and t_CurrentCamera2 and t_CurrentCamera2.Arms:FindFirstChild("Silencer2") then
						t_CurrentCamera2.Arms.Silencer2.Transparency = 0;
					end
					if p155 == "transparency1" and t_CurrentCamera2 and t_CurrentCamera2.Arms:FindFirstChild("Silencer2") then
						t_CurrentCamera2.Arms.Silencer2.Transparency = 1;
					end
				end);
				LoadAnimation_ret26.KeyframeReached:connect(function(p156) -- Line: 1713
					--[[
						Upvalues:
							[1] = t_Character
							[2] = m_Sound
							[3] = t_CurrentCamera2
					--]]
					p156 = string.lower(p156);
					pcall(function() -- Line: 1715
						--[[
							Upvalues:
								[1] = t_Character
								[2] = p156
								[3] = m_Sound
								[4] = t_CurrentCamera2
						--]]
						if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild(p156) then
							m_Sound.rplaysound(t_Character.Gun[p156]);
						end
						if p156 == "transparency0" and t_CurrentCamera2 and t_CurrentCamera2.Arms:FindFirstChild("Silencer2") then
							t_CurrentCamera2.Arms.Silencer2.Transparency = 0;
						end
						if p156 == "transparency1" and t_CurrentCamera2 and t_CurrentCamera2.Arms:FindFirstChild("Silencer2") then
							t_CurrentCamera2.Arms.Silencer2.Transparency = 1;
						end
					end);
				end);
			end
			LoadAnimation_ret19 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("equip"));
			LoadAnimation_ret19.KeyframeReached:connect(function(p150) -- Line: 1735
				p150 = string.lower(p150);
				if gun ~= "none" and gun and gun:FindFirstChild("Model") and gun.Model:FindFirstChild(p150) then
					PlayLocalSound(gun.Model[p150]);
				end
			end);
			if gun ~= "none" and gun and gun:FindFirstChild("Model") and gun.Model:FindFirstChild("Equip") then
				PlayLocalSound(gun.Model.Equip);
			end
			if not gun:FindFirstChild("Melee") then
				if gun:FindFirstChild("PumpAction") then
					LoadAnimation_ret21 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("1reload"));
					LoadAnimation_ret22 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("2reload"));
					LoadAnimation_ret23 = Humanoid.Animator:LoadAnimation(gun["1Reload"]);
					LoadAnimation_ret24 = Humanoid.Animator:LoadAnimation(gun["2Reload"]);
					LoadAnimation_ret22.KeyframeReached:connect(function(p159) -- Line: 1751
						--[[
							Upvalues:
								[1] = t_Character
								[2] = m_Sound
						--]]
						p159 = string.lower(p159);
						if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild(p159) then
							m_Sound.rplaysound(t_Character.Gun[p159]);
						end
					end);
				end
				LoadAnimation_ret20 = clone_ret4:WaitForChild("Guy"):LoadAnimation(clone_ret4:WaitForChild("reload"));
				LoadAnimation_ret7.KeyframeReached:connect(function(p157) -- Line: 1759
					--[[
						Upvalues:
							[1] = t_Character
					--]]
					p157 = string.lower(p157);
					if p157 == "magdrop" and t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Mag") then
						game.ReplicatedStorage.Events.DropMag:FireServer(t_Character.Gun.Mag, nil);
					end
				end);
				LoadAnimation_ret20.KeyframeReached:connect(function(p158) -- Line: 1765
					--[[
						Upvalues:
							[1] = RunService
							[2] = t_CurrentCamera2
							[3] = t_Character
							[4] = m_Sound
					--]]
					p158 = string.lower(p158);
					if RunService:IsStudio() then
						print(p158);
					end
					if p158 == "lighterfire" then
						t_CurrentCamera2.Arms.LighterF.Fire.Enabled = true;
					end
					if p158 == "bottlefire" then
						t_CurrentCamera2.Arms["Rag 3"].Fire.Enabled = true;
					end
					if p158 == "lighterclose" then
						t_CurrentCamera2.Arms.LighterF.Fire.Enabled = false;
					end
					if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild(p158 .. "1") then
						m_Sound.rplaysound(t_Character.Gun[p158 .. math.random(1, 5)]).Parent = script.Parent.LocalSounds;
					end
					if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild(p158) then
						m_Sound.rplaysound(t_Character.Gun[p158]).Parent = script.Parent.LocalSounds;
					end
					if p158 == "ammorefilled" or p158 == "ammofilled" or p158 == "lidclose" then
						loadammo();
					end
				end);
			end
			if LoadAnimation_ret11 and str5 ~= "grenade" and str5 ~= "grenade2" and str5 ~= "grenade3" and str5 ~= "grenade4" then
				LoadAnimation_ret11:Play();
				LoadAnimation_ret3:Play();
			else
				LoadAnimation_ret3:Stop();
				LoadAnimation_ret11:Stop();
			end
			dontshowme = 6;
			if LoadAnimation_ret19 then
				LoadAnimation_ret19:Play();
			end
		end
		DISABLED = true;
		countammo();
		local g_gun = gun;
		updatesilencer();
		local tick_ret = tick();
		repeat
			if LoadAnimation_ret19 and gun:FindFirstChild("Melee") == nil then
				LoadAnimation_ret19:AdjustSpeed(LoadAnimation_ret19.Length / fgun.EquipTime.Value);
			end
			RunService.Stepped:wait();
			if gun ~= g_gun then return end
		until tick() - tick_ret >= fgun.EquipTime.Value;
		bool10 = false;
		DISABLED = false;
		autoreload();
		if bool1 == true or bool2 == true then
			holdnade();
		end
	end
end
function getexact(p65) -- Line: 1801
	if gun.Name == "Negev" and p65 >= 16 then
		return {
			fAngle = 90,
			fMagnitude = 1
		};
	end
	local v16 = mypattern;
	if mypattern2 and (adsmodifier >= 0.5 or silenced() == false) then
		v16 = mypattern2;
	end
	if p65 == 0 then
		return {
			fAngle = 90,
			fMagnitude = 0
		};
	end
	if gun.Ammo.Value + 1 <= p65 then
		return v16[gun.Ammo.Value + 1];
	end
	return v16[p65];
end
function getpat(p66) -- Line: 1815
	local v17 = p66 - math.floor(p66);
	if v17 <= 0 then
		return getexact(p66);
	end
	local math_floor_ret = math.floor(p66);
	local v18 = math_floor_ret + 1;
	local table8 = {
		fAngle = getexact(math_floor_ret).fAngle + (getexact(v18).fAngle - getexact(math_floor_ret).fAngle) * v17,
		fMagnitude = getexact(math_floor_ret).fMagnitude + (getexact(v18).fMagnitude - getexact(math_floor_ret).fMagnitude) * v17
	};
	return table8;
end
lastHealth = 100;
damagedone = 100;
function changehpgui() -- Line: 1829
	--[[
		Upvalues:
			[1] = Humanoid
			[2] = Vitals
			[3] = GUI
	--]]
	if not Humanoid or Humanoid.Health <= 0 then
		GUI:WaitForChild("Vitals").Visible = false;
		Vitals.Visible = false;
		return;
	end
	local u44 = math.floor(Humanoid.Health) / math.floor(Humanoid.MaxHealth);
	if u44 < 0.02 and u44 > 0 then
		u44 = 0.01;
	end
	Vitals.Health.Text = math.floor(Humanoid.Health);
	if Humanoid.Health < 1 and Humanoid.Health > 0 then
		Vitals.Health.Text = 1;
	end
	Vitals.HealthB.Fill:TweenSize(UDim2.new(u44, 0, 1, 0), "InOut", "Quad", 0.25, true);
	spawn(function() -- Line: 1838
		--[[
			Upvalues:
				[1] = u44
				[2] = Vitals
		--]]
		if u44 ~= 1 then
			Vitals.HealthB.BorderColor3 = Color3.new(0.8, 0, 0);
			wait(0.15);
			if u44 > 0.3 then
				Vitals.HealthB.BorderColor3 = Color3.new(126 / 255, 126 / 255, 126 / 255);
			end
		end
		wait(0.15);
		Vitals.HealthB.FillDMG:TweenSize(UDim2.new(u44, 0, 1, 0), "InOut", "Quad", 0.25, true);
	end);
	if u44 <= 0.3 then
		Vitals.HealthB.Fill.BackgroundColor3 = Color3.new(225 / 255, 0, 0);
		Vitals.Health.TextColor3 = Color3.new(225 / 255, 0, 0);
	else
		Vitals.HealthB.Fill.BackgroundColor3 = script.HackyColorReplication.Value;
		Vitals.Health.TextColor3 = script.HackyColorReplication.Value;
		Vitals.HealthB.BorderColor3 = Color3.new(126 / 255, 126 / 255, 126 / 255);
	end
	GUI:WaitForChild("Vitals").Visible = true;
	Vitals.Visible = true;
end
function changearmorgui() -- Line: 1865
	--[[
		Upvalues:
			[1] = t_LocalPlayer
			[2] = Vitals
	--]]
	if not t_LocalPlayer or not t_LocalPlayer:FindFirstChild("Kevlar") then
		Vitals.Armor.Text = tostring(0);
		Vitals.ArmorB.Fill:TweenSize(UDim2.new(0, 0, 1, 0), "InOut", "Quad", 0.25, true);
		spawn(function() -- Line: 1897
			--[[
				Upvalues:
					[1] = Vitals
			--]]
			Vitals.ArmorB.BorderColor3 = Color3.new(0.8, 0, 0);
			wait(0.15);
			wait(0.15);
			Vitals.ArmorB.FillDMG:TweenSize(UDim2.new(0, 0, 1, 0), "InOut", "Quad", 0.25, true);
		end);
		Vitals.ArmorB.Fill.BackgroundColor3 = Color3.new(225 / 255, 0, 0);
		Vitals.Armor.TextColor3 = Color3.new(225 / 255, 0, 0);
		return;
	end
	local u45 = math.floor(t_LocalPlayer.Kevlar.Value) / 100;
	if u45 < 0.02 and u45 > 0 then
		u45 = 0.01;
	end
	Vitals.Armor.Text = tostring(u45 * 100);
	if t_LocalPlayer.Kevlar.Value < 1 and t_LocalPlayer.Kevlar.Value > 0 then
		Vitals.Armor.Text = 1;
	end
	Vitals.ArmorB.Fill:TweenSize(UDim2.new(u45, 0, 1, 0), "InOut", "Quad", 0.25, true);
	spawn(function() -- Line: 1873
		--[[
			Upvalues:
				[1] = u45
				[2] = Vitals
		--]]
		if u45 ~= 1 then
			Vitals.ArmorB.BorderColor3 = Color3.new(0.8, 0, 0);
			wait(0.15);
			if u45 > 0.3 then
				Vitals.ArmorB.BorderColor3 = Color3.new(126 / 255, 126 / 255, 126 / 255);
			end
		end
		wait(0.15);
		Vitals.ArmorB.FillDMG:TweenSize(UDim2.new(u45, 0, 1, 0), "InOut", "Quad", 0.25, true);
	end);
	if u45 <= 0.3 then
		Vitals.ArmorB.Fill.BackgroundColor3 = Color3.new(225 / 255, 0, 0);
		Vitals.Armor.TextColor3 = Color3.new(225 / 255, 0, 0);
	else
		Vitals.ArmorB.Fill.BackgroundColor3 = script.HackyColorReplication.Value;
		Vitals.Armor.TextColor3 = script.HackyColorReplication.Value;
		Vitals.ArmorB.BorderColor3 = Color3.new(126 / 255, 126 / 255, 126 / 255);
	end
end
t_LocalPlayer.ChildAdded:connect(function(child) -- Line: 1919
	--[[
		Upvalues:
			[1] = m_Sound
	--]]
	wait();
	if child.Name == "Kevlar" then
		changearmorgui();
		m_Sound.playsound(script.Parent["Kevlar" .. math.random(1, 2)]);
		child.Changed:connect(function() -- Line: 1924
			wait();
			changearmorgui();
		end);
	end
end);
t_LocalPlayer.ChildRemoved:connect(function(child2) -- Line: 1929
	wait();
	if child2.Name == "Kevlar" then
		changearmorgui();
	end
end);
bf = Instance.new("BodyForce");
Ping:Loop();
function resetguns() -- Line: 1937
	--[[
		Upvalues:
			[1] = u14
			[2] = u17
			[3] = u18
			[4] = u19
			[5] = u20
			[6] = u16
	--]]
	u14 = "";
	u17 = "";
	u18 = "";
	u19 = "";
	u20 = "";
	u16 = "";
end
game.ReplicatedStorage.Warmup.Changed:connect(function(property2) -- Line: 1938
	--[[
		Upvalues:
			[1] = u16
			[2] = u26
			[3] = u31
			[4] = str5
			[5] = u22
	--]]
	delay(0.1, function() -- Line: 1939
		--[[
			Upvalues:
				[1] = property2
				[2] = u16
				[3] = u26
				[4] = u31
				[5] = str5
				[6] = u22
		--]]
		if property2 == true then
			ToggleTeamSelection(true);
			resetguns();
			return;
		end
		resetguns();
		special2 = false;
		special = false;
		if player.Status.Team.Value == "CT" then
			u16 = CTPrimaryPistol;
			secondaryowner = game.Players.LocalPlayer;
			u26 = game.ReplicatedStorage.Weapons[u16].Ammo.Value;
			u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
		elseif player.Status.Team.Value == "T" then
			u16 = "Glock";
			secondaryowner = game.Players.LocalPlayer;
			u26 = game.ReplicatedStorage.Weapons[u16].Ammo.Value;
			u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
		end
		if u16 ~= "" then
			str5 = "secondary";
			gun = game.ReplicatedStorage.Weapons[u16];
		elseif u22 ~= "" then
			str5 = "melee";
			gun = game.ReplicatedStorage.Weapons[u22];
		end
		changeto(2);
		updateInventory();
		usethatgun();
	end);
end);
game.ReplicatedStorage.Events.resetweapons.OnClientEvent:connect(function() -- Line: 1973
	--[[
		Upvalues:
			[1] = u16
			[2] = u26
			[3] = u31
			[4] = u22
	--]]
	resetguns();
	special2 = false;
	special = false;
	if player.Status.Team.Value == "CT" then
		u16 = CTPrimaryPistol;
		secondaryowner = game.Players.LocalPlayer;
		u26 = game.ReplicatedStorage.Weapons[u16].Ammo.Value;
		u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
		return;
	end
	if player.Status.Team.Value == "T" then
		if game.ReplicatedStorage.gametype.Value ~= "juggernaut" then
			u16 = "Glock";
			secondaryowner = game.Players.LocalPlayer;
			u26 = game.ReplicatedStorage.Weapons[u16].Ammo.Value;
			u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
			return;
		end
		u16 = "";
		u22 = "Bearded Axe";
	end
end);
function putatspawn() -- Line: 1995
	--[[
		Upvalues:
			[1] = t_LocalPlayer
	--]]
	if script.Parent:FindFirstChild("GUI") and (t_LocalPlayer.Status.Team.Value == "T" or t_LocalPlayer.Status.Team.Value == "CT") then
		lastspawned = tick();
		if player and player.Character and player.Character.PrimaryPart then
			player.Character.PrimaryPart.Velocity = Vector3.new(0, 0, 0);
		end
		local v65 = game.ReplicatedStorage.gametype.Value == "deathmatch" and "AllSpawns" or t_LocalPlayer.Status.Team.Value .. "Spawns";
		local Children13 = game.Workspace:WaitForChild("Map"):WaitForChild(v65):GetChildren();
		repeat
			wait();
		until t_LocalPlayer and t_LocalPlayer.Character and t_LocalPlayer.Character.PrimaryPart;
		if game.Workspace:FindFirstChild("Map") and t_LocalPlayer and t_LocalPlayer.Character and #Children13 > 0 then
			t_LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Children13[math.random(1, #Children13)].CFrame.p + Vector3.new(0, 4.5, 0)));
		end
	end
end
function setcharacter() -- Line: 2010
	--[[
		Upvalues:
			[1] = m_Sound
			[2] = u7
			[3] = t_CurrentCamera2
			[4] = bool7
			[5] = u23
			[6] = u24
			[7] = str5
			[8] = u22
			[9] = str3
			[10] = u21
			[11] = str4
			[12] = u25
			[13] = u26
			[14] = u27
			[15] = u29
			[16] = u31
			[17] = u30
			[18] = u32
			[19] = u28
			[20] = u11
			[21] = bool6
			[22] = bool8
			[23] = u9
			[24] = RunService
			[25] = t_LocalPlayer
			[26] = AmmoGUI
			[27] = Vitals
			[28] = t_Character
			[29] = u16
			[30] = u14
			[31] = UpperTorso
			[32] = Humanoid
			[33] = LoadAnimation_ret
			[34] = LoadAnimation_ret2
			[35] = u12
			[36] = bool9
			[37] = SuitZoom
			[38] = u17
			[39] = u18
			[40] = u19
			[41] = u20
			[42] = u5
			[43] = u6
	--]]
	script.Parent.Animate.Disabled = true;
	script.Parent.FlinchandIndication.Disabled = true;
	wait();
	script.Parent.Animate.Disabled = false;
	script.Parent.FlinchandIndication.Disabled = false;
	game.Players.LocalPlayer.PlayerGui:WaitForChild("Deafen").Disabled = true;
	game.Players.LocalPlayer.PlayerGui:WaitForChild("Blind").Disabled = true;
	script.Parent.Blnd.Blind.BackgroundTransparency = 1;
	game.SoundService.Sounds.Flashbang.Enabled = false;
	game.SoundService.Sounds.Volume = 1;
	game.SoundService.Sounds.Distortion.Enabled = false;
	putatspawn();
	climbing = false;
	m_Sound.stopsound("Ringing", game.Players.LocalPlayer.PlayerGui.Sounds);
	game.Players.LocalPlayer.PlayerGui:WaitForChild("Deafen").Disabled = true;
	game.Players.LocalPlayer.PlayerGui:WaitForChild("Blind").Disabled = true;
	u7 = false;
	selectedteam = Colors[Team.Value];
	if Team.Value ~= "CT" then
		selectedteam = Colors.T;
	end
	Back();
	Back();
	if t_CurrentCamera2:FindFirstChild("Arms") then
		t_CurrentCamera2.Arms:Destroy();
	end
	if t_CurrentCamera2:FindFirstChild("Arms2") then
		t_CurrentCamera2.Arms2:Destroy();
	end
	game.ReplicatedStorage.Events.blap.OnClientEvent:connect(function() -- Line: 2040
		--[[
			Upvalues:
				[1] = t_CurrentCamera2
		--]]
		if t_CurrentCamera2:FindFirstChild("Arms2") then
			t_CurrentCamera2.Arms2:Destroy();
		end
	end);
	bool7 = false;
	walking = false;
	u23 = 3;
	u24 = 2;
	str5 = "none";
	u22 = "";
	str3 = "";
	u21 = "";
	str4 = "";
	u25 = 0;
	u26 = 0;
	u27 = 0;
	u29 = 0;
	u31 = 0;
	u30 = 0;
	u32 = 0;
	u28 = 0;
	gun = "none";
	fgun = getref(gun);
	updateInventory();
	if u11 == true then
		u11 = false;
		updateads();
	end
	bool6 = false;
	bool8 = false;
	u9 = nil;
	lastHealth = 100;
	damagedone = 100;
	repeat
		RunService.Stepped:wait();
	until t_LocalPlayer;
	if t_LocalPlayer.Status.Alive.Value == false then
		game.ReplicatedStorage.Events.SetCNil:FireServer();
		t_CurrentCamera2.CameraSubject = nil;
		t_CurrentCamera2.CameraType = "Fixed";
		t_LocalPlayer.CameraMaxZoomDistance = 10;
		t_LocalPlayer.CameraMinZoomDistance = 10;
		if script.Parent:FindFirstChild("GUI") then
			t_LocalPlayer.PlayerGui.GUI.Spectate.Visible = true;
		end
		str5 = "none";
		AmmoGUI.Visible = false;
		Vitals.Visible = false;
		gun = "none";
		fgun = getref(gun);
		updateInventory();
		bool7 = true;
		return;
	end
	repeat
		RunService.Stepped:wait();
	until t_LocalPlayer.Character;
	t_Character = t_LocalPlayer.Character;
	t_Character:WaitForChild("RightFoot").Touched:connect(function(hit) -- Line: 2104
		--[[
			Upvalues:
				[1] = t_LocalPlayer
				[2] = u16
				[3] = u14
		--]]
		if hit and hit.Parent and hit.Parent == game.Workspace.Debris and game.ReplicatedStorage.Weapons:FindFirstChild(hit.Name) and (game.ReplicatedStorage.Weapons:FindFirstChild(hit.Name):FindFirstChild("Equipment2") and t_LocalPlayer.Status.Team.Value == "T" or game.ReplicatedStorage.Weapons:FindFirstChild(hit.Name):FindFirstChild("Grenade") and grenadeallowed(hit.Name) == true or game.ReplicatedStorage.Weapons:FindFirstChild(hit.Name):FindFirstChild("Secondary") and u16 == "" or game.ReplicatedStorage.Weapons:FindFirstChild(hit.Name):FindFirstChild("Primary") and u14 == "") then
			pickup(hit);
		end
	end);
	UpperTorso = t_Character:WaitForChild("UpperTorso");
	Humanoid = t_Character:WaitForChild("Humanoid");
	Humanoid:WaitForChild("Animator");
	LoadAnimation_ret = Humanoid.Animator:LoadAnimation(script.Idle);
	LoadAnimation_ret2 = Humanoid.Animator:LoadAnimation(script.Crouching.WWalk);
	shiftwalkanim = Humanoid.Animator:LoadAnimation(script.Walking.WWalk);
	t_Character:WaitForChild("RightUpperArm");
	t_Character:WaitForChild("LeftUpperArm");
	t_CurrentCamera2.CameraSubject = Humanoid;
	t_CurrentCamera2.CameraType = "Custom";
	if RunService:IsStudio() and game.Workspace.ThirdPerson.Value == true then
		t_LocalPlayer.CameraMaxZoomDistance = 10;
	else
		t_LocalPlayer.CameraMaxZoomDistance = 0.5;
	end
	t_LocalPlayer.CameraMinZoomDistance = 0.5;
	t_LocalPlayer.PlayerGui.GUI.Spectate.Visible = false;
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false);
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false);
	local t_Vitals = script.Parent.GUI.Vitals;
	Humanoid.HealthChanged:connect(function(p146) -- Line: 2135
		--[[
			Upvalues:
				[1] = RunService
		--]]
		RunService.Heartbeat:wait();
		damagedone = lastHealth - p146;
		local __ = damagedone > 0;
		lastHealth = p146;
		changehpgui();
	end);
	if Humanoid then
		changearmorgui();
		changehpgui();
	end
	bf.Force = Vector3.new(0, 0, 0);
	local bool19 = true;
	local bool20 = false;
	t_Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 2157
		--[[
			Upvalues:
				[1] = t_Character
		--]]
		local t_MoveDirection = t_Character.Humanoid.MoveDirection;
		local t_CFrame = t_Character.PrimaryPart.CFrame;
		local v94 = "";
		local Dot_ret = t_CFrame.lookVector:Dot(t_MoveDirection);
		if Dot_ret >= 0.05 then
			v94 = "W";
		elseif Dot_ret <= -0.05 then
			v94 = "S";
		end
		local Dot_ret2 = t_CFrame.rightVector:Dot(t_MoveDirection);
		if Dot_ret2 >= 0.05 then
			v94 = v94 .. "D";
		elseif Dot_ret2 <= -0.05 then
			v94 = v94 .. "A";
		end
		if v94 ~= lastpriority then
			dochange = v94;
			dochange2 = v94;
			lastpriority = v94;
		end
	end);
	t_Character.Humanoid.FreeFalling:connect(function(p147) -- Line: 2183
		--[[
			Upvalues:
				[1] = bool19
				[2] = Humanoid
				[3] = t_Character
				[4] = UpperTorso
				[5] = bool20
		--]]
		if p147 and bool19 then
			local v131 = -math.huge;
			local v132 = math.huge;
			bool19 = false;
			while Humanoid:GetState() == Enum.HumanoidStateType.Freefall and t_Character and t_Character:FindFirstChild("UpperTorso") and game.Workspace.Status.Preparation.Value == false do
				if v131 < t_Character.UpperTorso.Position.Y then
					v131 = t_Character.UpperTorso.Position.Y;
				end
				if t_Character.UpperTorso.Position.Y < v132 then
					v132 = t_Character.UpperTorso.Position.Y;
				end
				local WorldToCell_ret = game.Workspace.Terrain:WorldToCell(UpperTorso.Position);
				local GetWaterCell_ret1, __, __ = game.Workspace.Terrain:GetWaterCell(WorldToCell_ret.x, WorldToCell_ret.y, WorldToCell_ret.z);
				if GetWaterCell_ret1 or Humanoid:GetState() == Enum.HumanoidStateType.Swimming or climbing then
					v131 = -math.huge;
					v132 = math.huge;
				end
				task.wait(1 / 60);
			end
			local v133 = v131 - v132;
			require(script.lol).punchcam(v133 / 8);
			local v134 = v133 - 13.5;
			if t_Character and t_Character:FindFirstChild("UpperTorso") and tick() - lastspawned >= 1 then
				local Ray_new_ret3 = Ray.new(t_Character.UpperTorso.Position, (Vector3.new(0, -5, 0)));
				local FindPartOnRayWithIgnoreList_ret = game.Workspace:FindPartOnRayWithIgnoreList(Ray_new_ret3, {
					t_Character,
					game.Workspace:WaitForChild("Debris"),
					game.Workspace:WaitForChild("Ray_Ignore"),
					game.Workspace.Map:WaitForChild("Clips"),
					game.Workspace.Map:WaitForChild("SpawnPoints")
				}, true, false);
				if FindPartOnRayWithIgnoreList_ret and v134 > 0 and not bool20 and Humanoid:GetState() ~= Enum.HumanoidStateType.Swimming and climbing == false then
					local math_ceil_ret = math.ceil((v134 / 26.1875) ^ 0.85 * 101);
					game.ReplicatedStorage.Events.FallDamage:FireServer(math_ceil_ret);
					bool20 = true;
				end
				delay(0.1, function() -- Line: 2223
					--[[
						Upvalues:
							[1] = bool20
					--]]
					bool20 = false;
				end);
			end
			bool19 = true;
		end
	end);
	u12 = false;
	bool9 = false;
	local table9 = {"Jumping"};
	local table10 = {
		"Running",
		"Climbing"
	};
	Humanoid.Died:connect(function() -- Line: 2236
		--[[
			Upvalues:
				[1] = bool9
				[2] = SuitZoom
				[3] = u14
				[4] = t_CurrentCamera2
				[5] = u25
				[6] = u29
				[7] = u16
				[8] = u26
				[9] = u31
				[10] = u17
				[11] = u18
				[12] = u19
				[13] = u20
				[14] = u21
				[15] = u28
				[16] = u32
				[17] = str5
				[18] = Humanoid
				[19] = t_LocalPlayer
				[20] = AmmoGUI
				[21] = t_Vitals
				[22] = bool6
				[23] = u9
				[24] = u11
				[25] = RunService
		--]]
		climbing = false;
		if bool9 == false then
			SuitZoom.Visible = false;
			Back();
			Back();
			if game.ReplicatedStorage.gametype.Value ~= "deathmatch" then
				local bool21 = false;
				if game.Workspace.Status.Preparation.Value == false and game.ReplicatedStorage.Warmup.Value == false then
					if u14 ~= "" then
						bool21 = true;
						game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u14], t_CurrentCamera2.CFrame, u25, u29, special, primaryowner, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
					end
					if u16 ~= "" and bool21 == false then
						game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u16], t_CurrentCamera2.CFrame, u26, u31, special2, secondaryowner, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
					end
					local bool22 = false;
					if u17 ~= "" then
						game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u17], t_CurrentCamera2.CFrame, 0, 0, nil, nil, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
						bool22 = true;
					end
					if u18 ~= "" and bool22 == false then
						game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u18], t_CurrentCamera2.CFrame, 0, 0, nil, nil, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
						bool22 = true;
					end
					if u19 ~= "" and bool22 == false then
						game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u19], t_CurrentCamera2.CFrame, 0, 0, nil, nil, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
						bool22 = true;
					end
					if u20 ~= "" and bool22 == false then
						game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u20], t_CurrentCamera2.CFrame, 0, 0, nil, nil, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
					end
					if u21 ~= "" and game.ReplicatedStorage.Weapons:FindFirstChild(u21) and game.ReplicatedStorage.Weapons:FindFirstChild(u21):FindFirstChild("NotDroppable") == nil then
						game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u21], t_CurrentCamera2.CFrame, u28, u32, nil, nil, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
					end
				end
			end
			if game.ReplicatedStorage.gametype.Value ~= "deathmatch" then
				resetguns();
				u21 = "";
			end
			str5 = "none";
			gun = "none";
			fgun = getref(gun);
			usethatgun();
			local t_Name = nil;
			if Humanoid and Humanoid:FindFirstChild("creator") and Humanoid.creator.Value and Humanoid.creator.Value:FindFirstChild("Status") then
				t_Name = Humanoid.creator.Value.Name;
			end
			local t_Value5 = nil;
			if t_Name and Humanoid.creator:FindFirstChild("NameTag") then
				t_Value5 = Humanoid.creator.NameTag.Value;
			end
			if t_Name and t_Value5 and game.Players:FindFirstChild(t_Name) and game.ReplicatedStorage.gametype.Value ~= "competitive" then
				delay(1, function() -- Line: 2297
					--[[
						Upvalues:
							[1] = t_Value5
							[2] = t_Name
							[3] = t_LocalPlayer
					--]]
					player.PlayerGui.GUI.KillCam.Animate.Disabled = true;
					player.PlayerGui.GUI.KillCam.Animate.Disabled = false;
					player.PlayerGui.GUI.KillCam.KilledBy.Weapon.Text = "%unknownweapon%";
					if t_Value5 then
						player.PlayerGui.GUI.KillCam.KilledBy.Weapon.Text = GetName.getName(t_Value5);
					end
					player.PlayerGui.GUI.KillCam.KillerName.Text = t_Name .. " [+0]";
					if game.Players:FindFirstChild(t_Name).Character and game.Players:FindFirstChild(t_Name).Character:FindFirstChild("Humanoid") then
						player.PlayerGui.GUI.KillCam.KillerName.Text = t_Name .. " [+" .. math.ceil(game.Players:FindFirstChild(t_Name).Character.Humanoid.Health) .. "]";
					end
					player.PlayerGui.GUI.KillCam.KillCam.Player.Image = "http://www.roblox.com/thumbs/avatar.ashx?x=352&y=352&format=png&username=" .. t_Name;
					player.PlayerGui.GUI.KillCam.DMGgiven.main.Text = "Damage given: 0 in 0 hits to " .. t_Name;
					if player:FindFirstChild("DamageLogs") and player.DamageLogs:FindFirstChild(t_Name) then
						local t_Value7 = t_LocalPlayer.DamageLogs[t_Name].Hits.Value;
						local v161 = t_Value7 == 1 and t_Value7 .. " hit" or t_Value7 .. " hits";
						player.PlayerGui.GUI.KillCam.DMGgiven.main.Text = "Damage given: " .. math.floor(t_LocalPlayer.DamageLogs[t_Name].DMG.Value) .. " in " .. v161 .. " to " .. t_Name;
					end
					player.PlayerGui.GUI.KillCam.DMGtaken.main.Text = "Damage taken: 0 in 0 hits from " .. t_Name;
					if game.Players:FindFirstChild(t_Name) and game.Players[t_Name]:FindFirstChild("DamageLogs") and game.Players[t_Name].DamageLogs:FindFirstChild(t_LocalPlayer.Name) then
						local t_Value6 = game.Players[t_Name].DamageLogs[t_LocalPlayer.Name].Hits.Value;
						local v162 = t_Value6 == 1 and t_Value6 .. " hit" or t_Value6 .. " hits";
						player.PlayerGui.GUI.KillCam.DMGtaken.main.Text = "Damage taken: " .. math.floor(game.Players[t_Name].DamageLogs[t_LocalPlayer.Name].DMG.Value) .. " in " .. v162 .. " from " .. t_Name;
					end
				end);
			end
			AmmoGUI.Visible = false;
			t_Vitals.Visible = false;
			bool6 = false;
			if u9 then
				u9.CanCollide = true;
			end
			if u11 == true then
				u11 = false;
				updateads();
			end
			DISABLED = true;
			bool9 = true;
			if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") then
				t_CurrentCamera2.Arms:Destroy();
			end
			if t_CurrentCamera2:FindFirstChild("Arms2") then
				t_CurrentCamera2.Arms2:Destroy();
			end
			local tick_ret2 = tick();
			local num3 = 5;
			t_LocalPlayer.CameraMaxZoomDistance = 10;
			t_LocalPlayer.CameraMinZoomDistance = 10;
			if game.ReplicatedStorage.gametype.Value == "competitive" then
				num3 = 1;
			end
			repeat
				RunService.Stepped:wait();
				if Humanoid and Humanoid.Health > 0 then
					player.PlayerGui.GUI.KillCam.Visible = false;
					player.PlayerGui.GUI.KillCam.Animate.Disabled = true;
					return;
				end
			until tick() - tick_ret2 >= num3;
			if game.ReplicatedStorage.gametype.Value ~= "competitive" then
				player.PlayerGui.GUI.KillCam.Visible = false;
				player.PlayerGui.GUI.KillCam.Animate.Disabled = true;
			end
			if t_LocalPlayer.Status.Alive.Value == false then
				game.ReplicatedStorage.Events.SetCNil:FireServer();
				t_LocalPlayer.PlayerGui.GUI.Spectate.Visible = true;
				t_CurrentCamera2.CameraSubject = nil;
				t_CurrentCamera2.CameraType = "Fixed";
				if game.ReplicatedStorage.gametype.Value == "competitive" then
					wait(4);
					player.PlayerGui.GUI.KillCam.Visible = false;
					player.PlayerGui.GUI.KillCam.Animate.Disabled = true;
				end
			end
		end
	end);
	Humanoid.JumpPower = 20;
	for index8 = 1, #table10 do
		Humanoid[table10[index8]]:connect(function(p148) -- Line: 2390
			--[[
				Upvalues:
					[1] = u12
			--]]
			u12 = p148 > 1;
		end);
	end
	for index9 = 1, #table9 do
		Humanoid[table9[index9]]:connect(function(__) -- Line: 2395
			--[[
				Upvalues:
					[1] = u12
			--]]
			u12 = false;
		end);
	end
	script.Parent:WaitForChild("GUI"):WaitForChild("Inventory").Visible = false;
	if u16 == "" then
		special2 = false;
		if player.Status.Team.Value == "CT" then
			u16 = CTPrimaryPistol;
			secondaryowner = game.Players.LocalPlayer;
			u26 = game.ReplicatedStorage.Weapons[u16].Ammo.Value;
			u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
		elseif player.Status.Team.Value == "T" then
			u16 = "Glock";
			secondaryowner = game.Players.LocalPlayer;
			u26 = game.ReplicatedStorage.Weapons[u16].Ammo.Value;
			u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
		end
		str5 = "secondary";
	end
	bool7 = true;
	str3 = "";
	u21 = "";
	str4 = "";
	if t_LocalPlayer.Status.Team.Value == "CT" then
		if u5.KnifeOver then
			u22 = split(u5.Knife[1], "_")[1];
		else
			u22 = "CT Knife";
		end
	elseif t_LocalPlayer.Status.Team.Value == "T" then
		if u6.KnifeOver then
			u22 = split(u6.Knife[1], "_")[1];
		else
			u22 = "T Knife";
		end
	end
	if game.ReplicatedStorage.gametype.Value == "juggernaut" and t_LocalPlayer.Status.Team.Value == "T" then
		u16 = "";
		u22 = "Bearded Axe";
	end
	t_LocalPlayer.CameraMaxZoomDistance = 0.5;
	if u16 ~= "" then
		str5 = "secondary";
		gun = game.ReplicatedStorage.Weapons[u16];
	else
		str5 = "melee";
		gun = game.ReplicatedStorage.Weapons[u22];
	end
	u25 = 0;
	u29 = 0;
	if u14 ~= "" then
		str5 = "primary";
		gun = game.ReplicatedStorage.Weapons[u14];
		u25 = game.ReplicatedStorage.Weapons[u14].Ammo.Value;
		u29 = game.ReplicatedStorage.Weapons[u14].StoredAmmo.Value;
	end
	if u16 ~= "" then
		u26 = game.ReplicatedStorage.Weapons[u16].Ammo.Value;
	end
	u27 = 0;
	if player and player:FindFirstChild("HasC4") and game.Workspace.Map.Gamemode.Value == "defusal" and repst.gametype.Value ~= "deathmatch" then
		u21 = "C4";
		str5 = "equipment2";
		gun = game.ReplicatedStorage.Weapons[u21];
		player.HasC4:Destroy();
	end
	fgun = getref(gun);
	if u16 ~= "" then
		u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
	end
	u30 = 0;
	u32 = 0;
	updateInventory();
	spawn(function() -- Line: 2477
		--[[
			Upvalues:
				[1] = t_LocalPlayer
		--]]
		for index42 = 1, 5 do
			local Players = game.Players:GetPlayers();
			for index52 = 1, #Players do
				if Players[index52] and Players[index52].Character and Players[index52].Character:FindFirstChild("Humanoid") and Players[index52].Name ~= t_LocalPlayer.Name then
					local Children14 = Players[index52].Character:GetChildren();
					for index66 = 1, #Children14 do
						if Children14[index66]:IsA("BasePart") then
							Children14[index66].LocalTransparencyModifier = 0;
						end
					end
				end
			end
			wait(1);
		end
	end);
	usethatgun(secondaryowner);
end
function RAND(p67, p68, p69) -- Line: 2497
	local v19 = 1 / (p69 or 1);
	return mrandom(p67 * v19, p68 * v19) / v19;
end
game.ReplicatedStorage.Events.RemoteEvent.OnClientEvent:connect(function(p70) -- Line: 2502
	if p70 and p70[1] == "createparticle" then
		createparticle(p70[2], p70[3], p70[4], p70[5], p70[6], p70[7], p70[8], p70[9], p70[10]);
	end
end);
function hitobject(p71, p72, p73, __, __) -- Line: 2508
	--[[
		Upvalues:
			[1] = t_Character
	--]]
	if (not p71 or not p71.Parent or not p71.Parent:FindFirstChild("Humanoid2")) and (not p71 or not p71.Parent or not p71.Parent:FindFirstChild("Humanoid")) and t_Character and t_Character:FindFirstChild("Head") and p71 and p72 then
		game.ReplicatedStorage.Events.RemoteEvent:FireServer({
			"createparticle",
			"bullethole",
			p71,
			p72
		});
		if createpp == false then
			createpp = true;
			createparticle("Smoke", p71, p72, p73);
		end
		createparticle("bullethole", p71, p72);
	end
end
game.ReplicatedStorage.Events.HatObject.OnClientEvent:connect(function(p74, p75, p76, p77, p78, p79, p80) -- Line: 2522
	--[[
		Upvalues:
			[1] = t_CurrentCamera2
			[2] = str5
			[3] = m_Sound
			[4] = t_LocalPlayer
	--]]
	if p80 == nil then
		p80 = t_CurrentCamera2.CFrame.p;
	end
	if p74 and p75 then
		local bool23 = false;
		if p74.Name == "Head" or p74.Name == "HeadHB" or p74.Name == "FakeHead" then
			bool23 = true;
		end
		if player.Name == p79 and bool23 == true and str5 ~= "melee" then
			if game.Players:GetPlayerFromCharacter(p74.Parent) and game.Players:GetPlayerFromCharacter(p74.Parent):FindFirstChild("Helmet") then
				m_Sound.playsound(t_LocalPlayer.PlayerGui["HHeadshot" .. math.random(1, 4)]);
			else
				m_Sound.playsound(t_LocalPlayer.PlayerGui["Headshot" .. math.random(1, 4)]);
			end
		end
		createpp = false;
		if createpp == false then
			createpp = true;
			createparticle("Blood", p74, p75, p76, p77, p78, p80, bool23);
		end
	end
end);
t_LocalPlayer.ChildAdded:connect(function(child3) -- Line: 2549
	--[[
		Upvalues:
			[1] = RunService
			[2] = m_Sound
			[3] = t_LocalPlayer
	--]]
	RunService.Stepped:wait();
	if child3.Name == "Whizz" then
		if child3:FindFirstChild("sub") then
			m_Sound.playsound(t_LocalPlayer.PlayerGui.Sounds["Supersonic" .. math.random(1, 11)]);
			return;
		end
		m_Sound.playsound(t_LocalPlayer.PlayerGui.Sounds["Subsonic" .. math.random(1, 27)]);
	end
end);
function clmp(p81) -- Line: 2560
	local num4 = 0.5;
	if adsmodifier > 0.5 then
		num4 = 0.05;
		p81 = p81 * 0.05;
	end
	return math.clamp(p81, -num4, num4);
end
function swayBind(__, p82, p83) -- Line: 2569
	if p82 == Enum.UserInputState.Change then
		local v66 = p83.Delta;
		if p83.KeyCode == Enum.KeyCode.Thumbstick2 then
			local math_atan2_ret = math.atan2(p83.Position.y, p83.Position.x);
			v66 = CFrame.fromAxisAngle(Vector3.new(0, 0, 1), math_atan2_ret) * Vector3.new(p83.Position.magnitude * 25, 0, 0);
		end
		rotx = v66.x * 0.08;
		rotz = v66.y * 0.08;
	end
	return Enum.ContextActionResult.Pass;
end
game:GetService("ContextActionService"):BindAction("sway", swayBind, false, Enum.UserInputType.MouseMovement, Enum.KeyCode.Thumbstick2);
function isburst() -- Line: 2584
	--[[
		Upvalues:
			[1] = str5
	--]]
	if gun ~= "none" and gun and gun.Model:FindFirstChild("Switch") and (str5 == "secondary" and special2 == true or str5 == "primary" and special == true) then
		return true;
	end
	return false;
end
function getrec() -- Line: 2590
	--[[
		Upvalues:
			[1] = t_CurrentCamera2
	--]]
	return gun.Spread.Recoil.Value * 5 * t_CurrentCamera2.FieldOfView / 70;
end
function updtcam() -- Line: 2593
	--[[
		Upvalues:
			[1] = u4
	--]]
	u4.t = Vector3.new(recoilx, recoily, 0) + Vector3.new(recoilx2, recoily2, 0) + Vector3.new(recoilx3, recoily3, 0);
end
function shuffle(p84) -- Line: 2596
	for index10 = #p84, 1, -1 do
		local math_random_ret = math.random(index10);
		local v67 = p84[index10];
		p84[index10] = p84[math_random_ret];
		p84[math_random_ret] = v67;
	end
	return p84;
end
function firebullet(p85) -- Line: 2606
	--[[
		Upvalues:
			[1] = t_Character
			[2] = m_Sound
			[3] = str5
			[4] = str11
			[5] = LoadAnimation_ret12
			[6] = bool1
			[7] = bool3
			[8] = LoadAnimation_ret4
			[9] = bool2
			[10] = u28
			[11] = u27
			[12] = u25
			[13] = u26
			[14] = LoadAnimation_ret5
			[15] = LoadAnimation_ret9
			[16] = LoadAnimation_ret10
			[17] = LoadAnimation_ret20
			[18] = LoadAnimation_ret21
			[19] = LoadAnimation_ret22
			[20] = LoadAnimation_ret19
			[21] = LoadAnimation_ret17
			[22] = LoadAnimation_ret18
			[23] = LoadAnimation_ret16
			[24] = bool10
			[25] = LoadAnimation_ret6
			[26] = u7
			[27] = LoadAnimation_ret15
			[28] = LoadAnimation_ret14
			[29] = t_CurrentCamera2
			[30] = t_CurrentCamera
			[31] = t_LocalPlayer
			[32] = RunService
			[33] = u1
			[34] = u4
			[35] = table_insert
			[36] = u33
			[37] = u11
	--]]
	local num5 = 1;
	if t_Character and t_Character:FindFirstChild("HumanoidRootPart") and t_Character.HumanoidRootPart:FindFirstChild("swing1") and math.random(1, 100) <= 20 then
		m_Sound.rplaysound(t_Character.HumanoidRootPart["swing" .. math.random(1, 3)]);
	end
	local coroutine_wrap_ret2 = coroutine.wrap(function() -- Line: 2609
		--[[
			Upvalues:
				[1] = str5
				[2] = str11
				[3] = LoadAnimation_ret12
				[4] = bool1
				[5] = m_Sound
				[6] = bool3
				[7] = LoadAnimation_ret4
				[8] = bool2
				[9] = u28
				[10] = u27
				[11] = u25
				[12] = u26
				[13] = LoadAnimation_ret5
				[14] = LoadAnimation_ret9
				[15] = LoadAnimation_ret10
				[16] = LoadAnimation_ret20
				[17] = LoadAnimation_ret21
				[18] = LoadAnimation_ret22
				[19] = LoadAnimation_ret19
				[20] = LoadAnimation_ret17
				[21] = LoadAnimation_ret18
				[22] = LoadAnimation_ret16
				[23] = bool10
				[24] = num5
				[25] = LoadAnimation_ret6
				[26] = u7
				[27] = LoadAnimation_ret15
				[28] = p85
				[29] = LoadAnimation_ret14
				[30] = t_Character
				[31] = t_CurrentCamera2
				[32] = t_CurrentCamera
				[33] = t_LocalPlayer
				[34] = RunService
				[35] = u1
				[36] = u4
				[37] = table_insert
				[38] = u33
				[39] = u11
		--]]
		if gun == "none" then return end
		if str5 == "equipment2" then
			str11 = "";
			if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and jumping == false then
				local Ray_new_ret5 = Ray.new(player.Character.HumanoidRootPart.Position, (Vector3.new(0, -6, 0)));
				local FindPartOnRayWithWhitelist_ret1, __ = game.Workspace:FindPartOnRayWithWhitelist(Ray_new_ret5, {game.Workspace.Map.SpawnPoints});
				if FindPartOnRayWithWhitelist_ret1 and FindPartOnRayWithWhitelist_ret1.Name == "C4Plant" then
					str11 = "B";
				end
				if FindPartOnRayWithWhitelist_ret1 and FindPartOnRayWithWhitelist_ret1.Name == "C4Plant2" then
					str11 = "A";
				end
			end
			if LoadAnimation_ret12 and LoadAnimation_ret12.IsPlaying == false and str11 ~= "" then
				bool1 = false;
				if player.Character and player.Character:FindFirstChild("Gun") and player.Character.Gun:FindFirstChild("Planting") then
					m_Sound.rplaysound(player.Character.Gun.Planting, nil, nil, nil, nil, true);
					local v157 = m_Sound.playsound(player.Character.Gun.PlantingLocal);
					v157.Parent = script.Parent.LocalSounds;
				end
				if bool3 == false then
					bool3 = true;
					chatMessage("1. I'm planting the bomb.", game.ReplicatedStorage.Voices:FindFirstChild("T").plant);
					delay(10, function() -- Line: 2634
						--[[
							Upvalues:
								[1] = bool3
						--]]
						bool3 = false;
					end);
				end
				game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Fire");
				LoadAnimation_ret12:Play();
				LoadAnimation_ret4:Play();
			end
		end
		local u50 = fgun:FindFirstChild("Range") and fgun.Range.Value or nil;
		local u51 = fgun:FindFirstChild("FireRate") and fgun.FireRate.Value or nil;
		if fgun:FindFirstChild("Melee") then
			u50 = 64;
			if bool2 == true then
				u51 = 1;
				u50 = 48;
			end
		end
		if DISABLED == false and u28 > 0 and str5 == "equipment2" or u27 > 0 and str5 == "equipment" or u25 > 0 and str5 == "primary" or u26 > 0 and str5 == "secondary" or gun ~= "none" and gun and gun ~= "none" and gun:FindFirstChild("Melee") then
			local g_gun2 = gun;
			createpp = false;
			DISABLED = true;
			if LoadAnimation_ret4 then
				LoadAnimation_ret4:Stop();
			end
			if LoadAnimation_ret5 then
				LoadAnimation_ret5:Stop();
			end
			if LoadAnimation_ret9 then
				LoadAnimation_ret9:Stop();
			end
			if LoadAnimation_ret10 then
				LoadAnimation_ret10:Stop();
			end
			if LoadAnimation_ret20 then
				LoadAnimation_ret20:Stop();
			end
			if LoadAnimation_ret21 then
				LoadAnimation_ret21:Stop();
			end
			if LoadAnimation_ret22 then
				LoadAnimation_ret22:Stop();
			end
			if LoadAnimation_ret19 then
				LoadAnimation_ret19:Stop();
			end
			if LoadAnimation_ret12 then
				LoadAnimation_ret12:Stop();
			end
			if LoadAnimation_ret17 then
				LoadAnimation_ret17:Stop();
			end
			if LoadAnimation_ret18 then
				LoadAnimation_ret18:Stop();
			end
			if LoadAnimation_ret16 then
				LoadAnimation_ret16:Stop();
			end
			bool10 = false;
			if u28 > 0 and str5 == "equipment2" or u27 > 0 and str5 == "equipment" or u25 > 0 and str5 == "primary" or u26 > 0 and str5 == "secondary" or gun ~= "none" and gun and gun ~= "none" and gun:FindFirstChild("Melee") then
				if isburst() then
					num5 = 3;
				end
				for index65 = 1, num5 do
					if u28 > 0 and str5 == "equipment2" or u27 > 0 and str5 == "equipment" or u25 > 0 and str5 == "primary" or u26 > 0 and str5 == "secondary" or gun ~= "none" and gun and gun:FindFirstChild("Melee") then
						if gun ~= "none" and gun and gun.className and gun.className == "Folder" and gun:FindFirstChild("Melee") then
							if bool2 == true then
								game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Stab");
								if LoadAnimation_ret16 then
									LoadAnimation_ret16:Play();
								end
								if LoadAnimation_ret6 then
									LoadAnimation_ret6:Play();
								end
							else
								local math_random_ret2 = math.random(1, 2);
								if math_random_ret2 == 1 then
									game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Fire");
									if LoadAnimation_ret12 then
										LoadAnimation_ret12:Play();
									end
									LoadAnimation_ret4:Play();
								elseif math_random_ret2 == 2 then
									game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Fire2");
									if LoadAnimation_ret17 then
										LoadAnimation_ret17:Play();
									end
									if LoadAnimation_ret5 then
										LoadAnimation_ret5:Play();
									end
								end
							end
						elseif gun and gun.Name == "DualBerettas" and u7 == true and LoadAnimation_ret17 then
							if LoadAnimation_ret17 then
								LoadAnimation_ret17:Play();
							end
							game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Fire2");
							LoadAnimation_ret5:Play();
						else
							local v165 = firevariant2 == true and math.random(1, 2) or firevariant == true and math.random(1, 3) or 1;
							if gun and gun.Name == "DualBerettas" then
								v165 = 1;
							end
							if gun.Name == "AUG" or gun.Name == "SG" then
								if LoadAnimation_ret15 then
									LoadAnimation_ret15:Play();
								end
							elseif p85 == true then
								LoadAnimation_ret14:Play();
								if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("pull") then
									local v180 = m_Sound.rplaysound(t_Character.Gun.pull);
									v180.Parent = script.Parent.LocalSounds;
								end
							else
								if LoadAnimation_ret12 and v165 == 1 then
									LoadAnimation_ret12:Play();
								end
								if LoadAnimation_ret17 and v165 == 2 then
									LoadAnimation_ret17:Play();
								end
								if LoadAnimation_ret18 and v165 == 3 then
									LoadAnimation_ret18:Play();
								end
							end
							game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Fire");
							LoadAnimation_ret4:Play();
						end
						if str5 == "secondary" and u26 <= math.floor(gun.Ammo.Value * 0.2) + 1 or str5 == "primary" and u25 <= math.floor(gun.Ammo.Value * 0.2) + 1 then
							m_Sound.playsound(script.Parent.Sounds.Lowammo);
						end
						if (t_CurrentCamera2.Focus.p - t_CurrentCamera2.CFrame.p).magnitude <= 1 and t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Flash") and t_CurrentCamera.CameraType == Enum.CameraType.Custom then
							if t_CurrentCamera2 and t_CurrentCamera2.Arms and t_CurrentCamera2.Arms:FindFirstChild("Flash") then
								if t_CurrentCamera2 and (t_CurrentCamera2.Arms:FindFirstChild("Silencer2") and t_CurrentCamera2.Arms.Silencer2.Transparency == 0 or t_CurrentCamera2.Arms:FindFirstChild("Suppressed")) then
									createparticle("muzzle", t_CurrentCamera2.Arms.FlashS);
								elseif gun and gun.Name == "DualBerettas" and u7 == true then
									createparticle("muzzle", t_CurrentCamera2.Arms["2Flash"]);
								else
									createparticle("muzzle", t_CurrentCamera2.Arms.Flash);
								end
							end
							if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Shoot") and t_Character:FindFirstChild("Head") then
								local v166 = 1;
								if gun:FindFirstChild("Secondary") or gun:FindFirstChild("Primary") and fgun:FindFirstChild("Auto") and fgun.Auto.Value then
									v166 = math.random() * 0.2 + 0.9;
								end
								if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Silencer2") and t_CurrentCamera2.Arms.Silencer2.Transparency == 0 then
									if game.SoundService.Sounds.Flashbang.Enabled == false then
										m_Sound.playsound(t_Character.Gun.SShoot, script.Parent, v166);
									end
								elseif game.SoundService.Sounds.Flashbang.Enabled == false then
									m_Sound.playsound(t_Character.Gun.Shoot, script.Parent, v166);
								end
							end
						end
						if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Gun") and game.Players.LocalPlayer.Character.Gun:FindFirstChild("Flash") then
							if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Silencer2") and t_CurrentCamera2.Arms.Silencer2.Transparency == 0 then
								game.ReplicatedStorage.Events.RemoteEvent:FireServer({
									"createparticle",
									"muzzle",
									game.Players.LocalPlayer.Character.Gun.FlashS,
									nil
								});
							elseif gun and gun.Name == "DualBerettas" and u7 == true and t_LocalPlayer and t_LocalPlayer.Character and t_LocalPlayer.Character:FindFirstChild("Gun2") then
								game.ReplicatedStorage.Events.RemoteEvent:FireServer({
									"createparticle",
									"muzzle",
									game.Players.LocalPlayer.Character.Gun2.Flash,
									nil
								});
							else
								game.ReplicatedStorage.Events.RemoteEvent:FireServer({
									"createparticle",
									"muzzle",
									game.Players.LocalPlayer.Character.Gun.Flash,
									nil
								});
							end
						else
							local v163 = t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Shoot" .. math.random(1, 2));
							if v163 then
								m_Sound.rplaysound(v163);
							end
						end
						local u54 = false;
						if gun and gun.Name == "DualBerettas" then
							u54 = u7;
							u7 = not u7;
						end
						if gun ~= "none" and gun and gun:FindFirstChild("Melee") == nil then
							local v164 = mode == "automatic" and 1.5 or 1.1;
							ftick = tick() + math.min(0.275, gun.FireRate.Value * v164);
							if str5 ~= "melee" then
								numShots = numShots + 1;
							end
							if str5 == "primary" then
								u25 = u25 - 1;
							elseif str5 == "secondary" then
								u26 = u26 - 1;
							elseif str5 == "equipment" then
								u27 = u27 - 1;
							elseif str5 == "equipment2" then
								u28 = u28 - 1;
							end
						end
						if gun ~= "none" and gun and gun:FindFirstChild("Melee") == nil then
							countammo();
						end
						if gun ~= "none" then
							if str5 == "melee" then
								local tick_ret6 = tick();
								repeat
									RunService.Stepped:wait();
									if gun ~= g_gun2 then return end
								until tick() - tick_ret6 >= 0.1;
							end
							local u55 = 1;
							local table11 = {};
							if gun:FindFirstChild("Bullets") then
								u55 = fgun.Bullets.Value;
								if u55 > 1 then
									local v167 = math.random() * 3 + 1;
									for index67 = 1, u55 - 1 do
										table.insert(table11, math.pi * (v167 + 0.1 - math.random() * 0.2) / 2 + math.pi * 2 * (index67 - 2) / (u55 - 1));
									end
									shuffle(table11);
								end
							end
							local coroutine_wrap_ret = coroutine.wrap(function() -- Line: 2806
								--[[
									Upvalues:
										[1] = u55
										[2] = u1
										[3] = p85
										[4] = table11
										[5] = u4
										[6] = t_CurrentCamera2
										[7] = t_Character
										[8] = t_LocalPlayer
										[9] = table_insert
										[10] = u50
										[11] = str5
										[12] = RunService
										[13] = u51
										[14] = g_gun2
										[15] = u54
										[16] = u33
								--]]
								if not fgun:FindFirstChild("Spread") or not fgun:FindFirstChild("FireRate") then return end
								for index68 = 1, u55 do
									local v168 = math.max(0, u1 + spread2);
									local math_rad_ret = nil;
									local t_fMagnitude = nil;
									local v169 = nil;
									local t_fMagnitude2 = nil;
									if mypattern then
										math_rad_ret = math.rad(getpat(numShots).fAngle);
										t_fMagnitude = getpat(numShots).fMagnitude;
										v169 = math.rad(getpat(numShots + 1).fAngle);
										t_fMagnitude2 = getpat(numShots + 1).fMagnitude;
										u1 = u1 + gun.Spread.Fire.Value / u55;
										if mode ~= "automatic" then
											v169 = (v169 - 1.5707963267948966) * (1 - math.random() * 2) + 1.5707963267948966;
										end
									end
									if p85 then
										v168 = v168 + 25;
									end
									local v170 = v168 * accuracy_sd;
									local v171 = fgun:FindFirstChild("snipo") == nil and 0.25 or 1;
									local v172 = math.random() * math.pi * 2;
									local v173 = v170 * math.random() ^ v171;
									if u55 > 1 then
										if index68 == 1 then
											v172 = 0;
											v173 = 0;
										else
											v172 = table11[index68 - 1];
											v173 = v170 * (index68 - 1) / u55;
										end
									end
									local v174 = v173 * math.cos(v172);
									local v175 = v173 * math.sin(v172);
									local CFrame_Angles_ret = CFrame.Angles(v175, v174, 0);
									if math_rad_ret then
										local v181 = firespread * accuracy_sd;
										local v182 = getrec() * accuracy_sd;
										local v183 = 1;
										local num6 = 1;
										local num7 = 1;
										if mode ~= "automatic" then
											v183 = v183 * (getpat(3).fMagnitude / t_fMagnitude2);
											num6 = 0;
											num7 = 0.55;
										end
										local v184 = -math.cos(math_rad_ret) * t_fMagnitude * v181;
										local v185 = math.sin(math_rad_ret) * t_fMagnitude * v181;
										local v186 = -math.cos(v169) * t_fMagnitude2 * v182;
										local v187 = math.sin(v169) * t_fMagnitude2 * v182;
										local v188 = 1 - adsmodifier;
										if index68 == 1 then
											recoilx = v186 * v183 * 0.45;
											recoily = v187 * v183 * 0.45;
											docam = tick();
										end
										local v189 = v184 * num7;
										local v190 = v185 * num7;
										local t_p2 = u4.p;
										local v191 = v188 * 0.001;
										if index68 == 1 then
											recoilx2 = recoilx2 + recoilx / 0.45 * v191;
											recoily2 = recoily2 + recoily / 0.45 * v191;
										end
										if u55 == 1 then
											CFrame_Angles_ret = CFrame.Angles(v175 + v190 - t_p2.Y * num6, v174 + v189 - t_p2.X * num6, 0);
										end
										updtcam();
										u4.p = u4.t;
									end
									local t_CFrame2 = t_CurrentCamera2.CFrame;
									local table12 = {
										game.Workspace.Debris,
										t_Character,
										game.Workspace.Ray_Ignore,
										t_CurrentCamera2,
										game.Workspace.Map:WaitForChild("Clips"),
										game.Workspace.Map:WaitForChild("SpawnPoints")
									};
									local Players2 = game.Players:GetPlayers();
									for index69 = 1, #Players2 do
										if Players2[index69].Name ~= t_LocalPlayer.Name and Players2[index69].Character and Players2[index69].Character:FindFirstChild("UpperTorso") then
											if game.ReplicatedStorage.gametype.Value ~= "competitive" and game.ReplicatedStorage.gametype.Value ~= "deathmatch" and Players2[index69].Status.Team.Value == t_LocalPlayer.Status.Team.Value then
												table_insert(table12, Players2[index69].Character);
											else
												if Players2[index69] and Players2[index69].Character:FindFirstChild("HumanoidRootPart") then
													table_insert(table12, Players2[index69].Character.HumanoidRootPart);
												end
												if Players2[index69] and Players2[index69].Character:FindFirstChild("Gun") then
													table_insert(table12, Players2[index69].Character.Gun);
												end
												if Players2[index69] and Players2[index69].Character:FindFirstChild("Head") then
													table_insert(table12, Players2[index69].Character.Head);
												end
												if Players2[index69] and Players2[index69].Character:FindFirstChild("BackC4") then
													table_insert(table12, Players2[index69].Character.BackC4);
												end
												for index71 = 1, 15 do
													if Players2[index69] and Players2[index69].Character:FindFirstChild("Hat" .. index71) then
														table_insert(table12, Players2[index69].Character["Hat" .. index71]);
													end
												end
											end
										end
									end
									local __ = Vector3.new();
									local v176 = t_CurrentCamera2.CFrame.p + t_CurrentCamera2.CFrame.lookVector * 999;
									local u56 = (CFrame.new(t_CFrame2.p, v176) * CFrame_Angles_ret).lookVector.unit * u50 * 0.0625;
									local Ray_new_ret4 = Ray.new(t_CurrentCamera2.CFrame.p, u56);
									local v177, v178 = workspace:FindPartOnRayWithIgnoreList(Ray_new_ret4, table12, false, true);
									if str5 == "melee" and v177 == nil then
										local t_Arms = t_CurrentCamera2.Arms;
										local t_UpperTorso = nil;
										local tick_ret5 = tick();
										local clone_ret6 = game.ReplicatedStorage.MeleeKid:clone();
										clone_ret6.Size = clone_ret6.Size * Vector3.new(1, 1, 0) + Vector3.new(0, 0, u50 * 0.0625);
										clone_ret6.CFrame = t_CurrentCamera2.CFrame * CFrame.new(0, 0, -clone_ret6.Size.Z / 2);
										clone_ret6.Parent = t_CurrentCamera2;
										local Connect_ret = clone_ret6.Touched:Connect(function() -- Line: 2900
										end);
										repeat
											clone_ret6.CFrame = t_CurrentCamera2.CFrame * CFrame.new(0, 0, -clone_ret6.Size.Z / 2);
											if t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms ~= t_Arms then break end
											local t_CFrame4 = t_CurrentCamera2.CFrame;
											local __ = t_CFrame4.p + t_CFrame4.lookVector * 999;
											local TouchingParts = clone_ret6:GetTouchingParts();
											local v192 = 10000;
											if t_Character and t_Character.PrimaryPart and #TouchingParts > 0 then
												for index72 = 1, #TouchingParts do
													local v199 = TouchingParts[index72];
													if v199 and v199.Transparency == 0 and v199.Parent:FindFirstChild("Humanoid") and v199.Parent:IsA("Model") and v199.Parent:FindFirstChild("UpperTorso") and game.Players:GetPlayerFromCharacter(v199.Parent) and v199.Parent.Name ~= player.Name and (game.Players:GetPlayerFromCharacter(v199.Parent).Status.Team.Value ~= player.Status.Team.Value or game.ReplicatedStorage.gametype.Value == "competitive" or game.ReplicatedStorage.gametype.Value == "deathmatch") then
														local v200 = v199.Position - t_Character.PrimaryPart.Position;
														local v201 = v200.X ^ 2 + v200.Y ^ 2 + v200.Z ^ 2;
														if v201 < v192 and math.acos((t_CurrentCamera2.CFrame.lookVector:Dot(v200.unit))) <= 1.5707963267948966 then
															v192 = v201;
															t_UpperTorso = v199.Parent.UpperTorso;
														end
													end
												end
											end
											if v177 == nil then
												local v193 = t_CurrentCamera2.CFrame.p + t_CurrentCamera2.CFrame.lookVector * 999;
												u56 = CFrame.new(t_CurrentCamera2.CFrame.p, v193).lookVector.unit * u50 * 0.0625;
												Ray_new_ret4 = Ray.new(t_CurrentCamera2.CFrame.p, u56);
												v177, v178 = workspace:FindPartOnRayWithIgnoreList(Ray_new_ret4, table12, false, true);
												if v177 then break end
											end
											if t_UpperTorso then
												local t_Position = t_UpperTorso.Position;
												Ray_new_ret4 = Ray.new(t_CFrame4.p, CFrame.new(t_CFrame4.p, t_Position).lookVector * 1000);
												v177, v178 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret4, {
													t_UpperTorso,
													game.Workspace.Map.Geometry
												});
												if v177 == t_UpperTorso then break end
											end
											RunService.Stepped:wait();
										until tick() - tick_ret5 >= math.min(0.25, u51);
										if Connect_ret then
											Connect_ret:disconnect();
										end
										if clone_ret6 then
											clone_ret6:Destroy();
										end
									end
									if not fgun then return end
									local __ = fgun.DMG.Value;
									local v179 = fgun.BulletPerTrail.Value;
									if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Silencer2") and t_CurrentCamera2.Arms.Silencer2.Transparency == 1 then
										v179 = 1;
									end
									bulletpertrail = bulletpertrail + 1;
									if gun == g_gun2 and str5 ~= "melee" and v179 <= bulletpertrail and v179 > 0 then
										bulletpertrail = 0;
										local __ = fgun.Range.Value;
										if v178 then
											local __ = (v178 - t_CurrentCamera2.CFrame.p).magnitude;
										end
										local t_CFrame3 = t_CurrentCamera2.CFrame;
										if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Flash") then
											t_CFrame3 = t_CurrentCamera2.Arms.Flash.CFrame;
										end
										if u54 and t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("2Flash") then
											t_CFrame3 = t_CurrentCamera2.Arms["2Flash"].CFrame;
										end
										game.ReplicatedStorage.Events.Trail:FireServer(t_CFrame3, v178, {game.Workspace.Map.Geometry});
										createtrail(t_CFrame3, v178, {game.Workspace.Map.Geometry});
									end
									local u57 = 0;
									local u58 = 0;
									local FindPartOnRayWithIgnoreList_ret1_3 = nil;
									local FindPartOnRayWithIgnoreList_ret2_3 = nil;
									local FindPartOnRayWithIgnoreList_ret3 = nil;
									local u59 = 1;
									damagemodifier = 1;
									pcall(function() -- Line: 2988
										--[[
											Upvalues:
												[1] = FindPartOnRayWithIgnoreList_ret1_3
												[2] = FindPartOnRayWithIgnoreList_ret2_3
												[3] = FindPartOnRayWithIgnoreList_ret3
												[4] = Ray_new_ret4
												[5] = table12
												[6] = u59
												[7] = u56
												[8] = u58
												[9] = u33
												[10] = u57
												[11] = u50
												[12] = g_gun2
												[13] = t_Character
												[14] = t_CurrentCamera2
										--]]
										while true do
											FindPartOnRayWithIgnoreList_ret1_3, FindPartOnRayWithIgnoreList_ret2_3, FindPartOnRayWithIgnoreList_ret3 = workspace:FindPartOnRayWithIgnoreList(Ray_new_ret4, table12, false, true);
											if FindPartOnRayWithIgnoreList_ret1_3 and FindPartOnRayWithIgnoreList_ret1_3.Parent then
												u59 = 1;
												if FindPartOnRayWithIgnoreList_ret1_3.Material == Enum.Material.DiamondPlate then
													u59 = 3;
												end
												if FindPartOnRayWithIgnoreList_ret1_3.Material == Enum.Material.CorrodedMetal or FindPartOnRayWithIgnoreList_ret1_3.Material == Enum.Material.Metal or FindPartOnRayWithIgnoreList_ret1_3.Material == Enum.Material.Concrete or FindPartOnRayWithIgnoreList_ret1_3.Material == Enum.Material.Brick then
													u59 = 2;
												end
												if FindPartOnRayWithIgnoreList_ret1_3.Name == "Grate" or FindPartOnRayWithIgnoreList_ret1_3.Material == Enum.Material.Wood or FindPartOnRayWithIgnoreList_ret1_3.Material == Enum.Material.WoodPlanks or FindPartOnRayWithIgnoreList_ret1_3 and FindPartOnRayWithIgnoreList_ret1_3.Parent and FindPartOnRayWithIgnoreList_ret1_3.Parent:FindFirstChild("Humanoid") then
													u59 = 0.1;
												end
												if FindPartOnRayWithIgnoreList_ret1_3.Transparency == 1 or FindPartOnRayWithIgnoreList_ret1_3.CanCollide == false or FindPartOnRayWithIgnoreList_ret1_3.Name == "Glass" or FindPartOnRayWithIgnoreList_ret1_3.Name == "Cardboard" or FindPartOnRayWithIgnoreList_ret1_3:IsDescendantOf(game.Workspace.Ray_Ignore) or FindPartOnRayWithIgnoreList_ret1_3:IsDescendantOf(game.Workspace.Debris) or FindPartOnRayWithIgnoreList_ret1_3 and FindPartOnRayWithIgnoreList_ret1_3.Parent and FindPartOnRayWithIgnoreList_ret1_3.Parent.Name == "Hitboxes" then
													u59 = 0;
												end
												if FindPartOnRayWithIgnoreList_ret1_3.Name == "nowallbang" then
													u59 = 100;
												end
												if FindPartOnRayWithIgnoreList_ret1_3:FindFirstChild("PartModifier") then
													u59 = FindPartOnRayWithIgnoreList_ret1_3.PartModifier.Value;
												end
												local __, FindPartOnRayWithWhitelist_ret2 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(FindPartOnRayWithIgnoreList_ret2_3 + u56 * 1, u56 * -2), {FindPartOnRayWithIgnoreList_ret1_3}, true);
												u58 = math.min(u33, u58 + (FindPartOnRayWithWhitelist_ret2 - FindPartOnRayWithIgnoreList_ret2_3).magnitude * u59);
												local v198 = u57 >= 1;
												if (not FindPartOnRayWithIgnoreList_ret1_3 or not FindPartOnRayWithIgnoreList_ret1_3.Parent or FindPartOnRayWithIgnoreList_ret1_3.Parent.Name ~= "Hitboxes") and (not FindPartOnRayWithIgnoreList_ret1_3 or FindPartOnRayWithIgnoreList_ret1_3.Parent.className ~= "Accessory") and (not FindPartOnRayWithIgnoreList_ret1_3 or FindPartOnRayWithIgnoreList_ret1_3.Parent.className ~= "Hat") and (FindPartOnRayWithIgnoreList_ret1_3.Name ~= "HumanoidRootPart" or FindPartOnRayWithIgnoreList_ret1_3.Parent.Name == "Door") and (FindPartOnRayWithIgnoreList_ret1_3.Name ~= "Head" or FindPartOnRayWithIgnoreList_ret1_3.Parent:FindFirstChild("Hostage") ~= nil) and (FindPartOnRayWithIgnoreList_ret1_3.Transparency < 1 or FindPartOnRayWithIgnoreList_ret1_3.Name == "HeadHB") then
													if FindPartOnRayWithIgnoreList_ret1_3 and FindPartOnRayWithIgnoreList_ret1_3.Parent:FindFirstChild("Humanoid") == nil then
														if u50 == 48 then
															hitobject(FindPartOnRayWithIgnoreList_ret1_3, FindPartOnRayWithIgnoreList_ret2_3, FindPartOnRayWithIgnoreList_ret3, gun, true);
														else
															hitobject(FindPartOnRayWithIgnoreList_ret1_3, FindPartOnRayWithIgnoreList_ret2_3, FindPartOnRayWithIgnoreList_ret3, gun, false);
														end
													end
													local t_X = FindPartOnRayWithIgnoreList_ret2_3.X;
													local t_Y2 = FindPartOnRayWithIgnoreList_ret2_3.Y;
													local t_Z = FindPartOnRayWithIgnoreList_ret2_3.Z;
													if type(t_X) ~= "number" or type(t_Y2) ~= "number" or type(t_Z) ~= "number" then return end
													local vec3 = Vector3.new(((t_X - 74312) * 4 + 1325) * 13, (t_Y2 + 3183421) * 4 - 4201432, (t_Z * 41 - 581357) * 2);
													game.ReplicatedStorage.Events.HitPart:FireServer(
														FindPartOnRayWithIgnoreList_ret1_3 -- // hitbox, 
														vec3 -- // "encrypted vector", 
														g_gun2.Name -- // "gun" name, 
														u50, 
														t_Character:WaitForChild("Gun"), 
														nil, 
														damagemodifier -- // understandable, 
														u50 == 48 -- // is melee, 
														v198 -- // wallbang, 
														t_CurrentCamera2.CFrame.p -- // sex camera cframe, 
														game.Workspace.DistributedTime.Value -- // deek check, 
														FindPartOnRayWithIgnoreList_ret3 -- // normal hit, 
														true, 
														nil, 
														nil, 
														nil);
												end
												if u59 > 0 then
													u57 = u57 + 1;
												end
												damagemodifier = 1 - u58 / u33;
												if u33 > u58 and (not FindPartOnRayWithIgnoreList_ret1_3 or not FindPartOnRayWithIgnoreList_ret1_3.Parent or FindPartOnRayWithIgnoreList_ret1_3.Parent.Name ~= "Hitboxes") and (not FindPartOnRayWithIgnoreList_ret1_3 or FindPartOnRayWithIgnoreList_ret1_3.Parent.className ~= "Accessory") and (not FindPartOnRayWithIgnoreList_ret1_3 or FindPartOnRayWithIgnoreList_ret1_3.Parent.className ~= "Hat") and (FindPartOnRayWithIgnoreList_ret1_3.Name ~= "HumanoidRootPart" or FindPartOnRayWithIgnoreList_ret1_3.Parent.Name == "Door") and FindPartOnRayWithIgnoreList_ret1_3 and FindPartOnRayWithIgnoreList_ret1_3.Parent:FindFirstChild("Humanoid") == nil then
													if u50 == 48 then
														hitobject(FindPartOnRayWithIgnoreList_ret1_3, FindPartOnRayWithWhitelist_ret2, -FindPartOnRayWithIgnoreList_ret3, gun, true);
													else
														hitobject(FindPartOnRayWithIgnoreList_ret1_3, FindPartOnRayWithWhitelist_ret2, -FindPartOnRayWithIgnoreList_ret3, gun, false);
													end
												end
												if FindPartOnRayWithIgnoreList_ret1_3 and FindPartOnRayWithIgnoreList_ret1_3.Parent and FindPartOnRayWithIgnoreList_ret1_3.Parent.Name == "Hitboxes" or FindPartOnRayWithIgnoreList_ret1_3 and FindPartOnRayWithIgnoreList_ret1_3.Parent and FindPartOnRayWithIgnoreList_ret1_3.Parent.Parent and FindPartOnRayWithIgnoreList_ret1_3.Parent.Parent:FindFirstChild("Humanoid2") or FindPartOnRayWithIgnoreList_ret1_3 and FindPartOnRayWithIgnoreList_ret1_3.Parent and FindPartOnRayWithIgnoreList_ret1_3.Parent:FindFirstChild("Humanoid2") or FindPartOnRayWithIgnoreList_ret1_3 and FindPartOnRayWithIgnoreList_ret1_3.Parent and FindPartOnRayWithIgnoreList_ret1_3.Parent:FindFirstChild("Humanoid") and (FindPartOnRayWithIgnoreList_ret1_3.Transparency < 1 or FindPartOnRayWithIgnoreList_ret1_3.Name == "HeadHB") and FindPartOnRayWithIgnoreList_ret1_3.Parent:IsA("Model") then
													table.insert(table12, FindPartOnRayWithIgnoreList_ret1_3.Parent);
												else
													table.insert(table12, FindPartOnRayWithIgnoreList_ret1_3);
												end
											end
											if FindPartOnRayWithIgnoreList_ret1_3 ~= nil and u33 > u58 and u57 < 4 and damagemodifier > 0 then continue end
											return;
										end
									end);
									if gun == g_gun2 and str5 ~= "melee" then
										local Players3 = game.Players:GetPlayers();
										for index70 = 1, #Players3 do
											if Players3[index70] and Players3[index70].Name ~= player.Name and Players3[index70].Character and Players3[index70].Character:FindFirstChild("Head") and player.Status.Team.Value ~= Players3[index70].Status.Team.Value and (FindPartOnRayWithIgnoreList_ret1_3 and not FindPartOnRayWithIgnoreList_ret1_3:IsDescendantOf(Players3[index70].Character) or FindPartOnRayWithIgnoreList_ret1_3 == nil) then
												local t_Head = Players3[index70].Character.Head;
												local t_p = t_CurrentCamera2.CFrame.p;
												local v194 = FindPartOnRayWithIgnoreList_ret2_3 - t_p;
												local v195 = t_Head.Position - t_p;
												local v196 = math.pow(v194.X, 2) + math.pow(v194.Y, 2) + math.pow(v194.Z, 2);
												local v197 = t_p + v194 * (v195:Dot(v194) / v196);
												local t_magnitude2 = (FindPartOnRayWithIgnoreList_ret2_3 - t_p).magnitude;
												local t_magnitude3 = (v197 - t_p).magnitude;
												local t_magnitude4 = (v197 - t_Head.Position).magnitude;
												local FindPartOnRayWithIgnoreList_ret1_4, __ = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v197, (v197 - t_Head.Position).unit * -8), table12);
												local bool25 = false;
												local Dot_ret3 = (t_CurrentCamera2.CFrame.p - Players3[index70].Character.Head.Position).unit:Dot(CFrame.new(t_CurrentCamera2.CFrame.p, FindPartOnRayWithIgnoreList_ret2_3).lookVector.unit);
												local bool26 = false;
												if t_magnitude4 <= 4 and FindPartOnRayWithIgnoreList_ret1_4 and FindPartOnRayWithIgnoreList_ret1_4:IsDescendantOf(Players3[index70].Character) and t_magnitude3 <= t_magnitude2 then
													bool26 = true;
												end
												if bool26 == true and Dot_ret3 <= 0.5000000000000001 then
													bool25 = true;
												end
												if bool26 == true and bool25 == true then
													game.ReplicatedStorage.Events.Whizz:FireServer(Players3[index70], gun, nil, nil, nil, nil);
												end
											end
										end
									end
								end
							end);
							coroutine_wrap_ret();
						end
						if num5 == 3 then
							local tick_ret7 = tick();
							repeat
								task.wait(1 / 60);
								if gun ~= g_gun2 then return end
							until tick() - tick_ret7 >= gun.Burst.Value;
						end
					end
				end
			else
				if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Empty") then
					m_Sound.rplaysound(t_Character.Gun.Empty);
				end
				bool1 = false;
			end
			local bool24 = false;
			local g_doublezoom = doublezoom;
			if fgun ~= "none" and fgun and fgun.className and fgun.className == "Folder" and fgun:FindFirstChild("Auto") and fgun.Auto.Value == false and u11 == true then
				u11 = false;
				updateads();
				bool24 = true;
			end
			if num5 == 3 then
				local tick_ret4 = tick();
				repeat
					task.wait(1 / 60);
					if gun ~= g_gun2 then return end
				until tick() - tick_ret4 >= gun.Cooldown.Value;
			else
				if p85 == true then
					u51 = 0.4;
				end
				local tick_ret3 = tick();
				repeat
					task.wait(1 / 60);
					if gun ~= g_gun2 then return end
				until tick() - tick_ret3 >= u51;
			end
			if bool24 == true then
				if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Zoom") then
					m_Sound.rplaysound(t_Character.Gun.Zoom);
				end
				u11 = true;
				doublezoom = g_doublezoom;
				updateads();
			end
			if gun == g_gun2 then
				DISABLED = false;
				autoreload();
			end
		end
	end);
	coroutine_wrap_ret2();
end
t_LocalPlayer.CharacterRemoving:connect(function() -- Line: 3103
	--[[
		Upvalues:
			[1] = u9
	--]]
	if u9 then
		u9.CanCollide = true;
	end
end);
function holdnade() -- Line: 3105
	--[[
		Upvalues:
			[1] = t_LocalPlayer
			[2] = bool16
			[3] = bool17
			[4] = t_Character
			[5] = m_Sound
			[6] = LoadAnimation_ret7
			[7] = LoadAnimation_ret20
			[8] = LoadAnimation_ret11
			[9] = LoadAnimation_ret3
	--]]
	if script.Parent:FindFirstChild("GUI") and game.Workspace.Status.Preparation.Value == false and t_LocalPlayer.PlayerGui.GUI.Defusal.Visible == false and DISABLED == false and isgrenade() == true and bool16 == false and bool17 == false then
		if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Pin") then
			m_Sound.rplaysound(t_Character.Gun.Pin);
		end
		if LoadAnimation_ret7 then
			LoadAnimation_ret7:Play();
		end
		if LoadAnimation_ret20 then
			LoadAnimation_ret20:Play();
			game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Reload");
		end
		if LoadAnimation_ret11 then
			LoadAnimation_ret11:Play();
			LoadAnimation_ret3:Play();
			bool16 = true;
		end
	end
end
function Button2Down() -- Line: 3119
	--[[
		Upvalues:
			[1] = UserInputService_
			[2] = bool2
			[3] = bool9
			[4] = str5
			[5] = bool10
			[6] = t_Character
			[7] = m_Sound
			[8] = u11
	--]]
	if UserInputService_.MouseIconEnabled == true then return end
	bool2 = true;
	holdnade();
	if bool9 == false and str5 ~= "none" and str5 ~= "equipment3" and gun ~= "none" and gun and gun:FindFirstChild("Scoped") and bool10 == false and DISABLED == false then
		if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Zoom") then
			m_Sound.rplaysound(t_Character.Gun.Zoom);
		end
		if gun ~= "none" and gun and gun:FindFirstChild("Scoped") and gun:FindFirstChild("RifleThing") == nil and u11 == true and doublezoom == false then
			doublezoom = true;
		else
			u11 = not u11;
			if u11 == false then
				doublezoom = false;
			end
		end
		updateads();
	end
end
function thrownade(p86) -- Line: 3130
	--[[
		Upvalues:
			[1] = str5
			[2] = u17
			[3] = u18
			[4] = u19
			[5] = u20
			[6] = bool16
			[7] = bool17
			[8] = bool2
			[9] = bool1
			[10] = t_Character
			[11] = m_Sound
			[12] = LoadAnimation_ret20
			[13] = LoadAnimation_ret7
			[14] = LoadAnimation_ret4
			[15] = LoadAnimation_ret12
			[16] = t_CurrentCamera2
			[17] = t_CurrentCamera
			[18] = t_LocalPlayer
			[19] = u13
			[20] = u16
			[21] = RunService
	--]]
	if (str5 == "grenade" and u17 ~= "" or str5 == "grenade2" and u18 ~= "" or str5 == "grenade3" and u19 ~= "" or str5 == "grenade4" and u20 ~= "") and bool16 == true and bool17 == false and bool2 == false and bool1 == false and DISABLED == false then
		bool17 = true;
		if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Throw") then
			m_Sound.rplaysound(t_Character.Gun.Throw);
		end
		if LoadAnimation_ret20 then
			LoadAnimation_ret20:Stop();
		end
		if LoadAnimation_ret7 then
			LoadAnimation_ret7:Stop();
		end
		if LoadAnimation_ret4 then
			game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Fire");
			LoadAnimation_ret4:Play();
		end
		if LoadAnimation_ret12 then
			LoadAnimation_ret12:Play();
			if t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Handle") then
				t_CurrentCamera2.Arms.Handle.Transparency = 1;
			end
			if t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Pin") then
				t_CurrentCamera2.Arms.Pin.Transparency = 1;
			end
			if t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Slide") then
				t_CurrentCamera2.Arms.Slide.Transparency = 1;
			end
		end
		local v68 = p86 and 0.3 or 1;
		local g_gun3 = gun;
		local tick_ret8 = tick();
		local v69 = u17;
		if str5 == "grenade" then
			u17 = "";
		elseif str5 == "grenade2" then
			v69 = u18;
			u18 = "";
		elseif str5 == "grenade3" then
			v69 = u19;
			u19 = "";
		elseif str5 == "grenade4" then
			v69 = u20;
			u20 = "";
		end
		local t_LookVector = t_CurrentCamera.CFrame.LookVector;
		local math_deg_ret = math.deg((math.atan(t_LookVector.Y / (t_LookVector.X ^ 2 + t_LookVector.Z ^ 2) ^ 0.5)));
		chatMessage("1. Grenade!", game.ReplicatedStorage.Voices:FindFirstChild(t_LocalPlayer.Status.Team.Value).grenade);
		game.ReplicatedStorage.Events.ThrowGrenade:FireServer(v69, t_LocalPlayer.Character.PrimaryPart.Velocity, t_CurrentCamera.CFrame, v68, math_deg_ret, u13, u16);
		updateInventory();
		local t_Arms2 = t_CurrentCamera2.Arms;
		repeat
			RunService.Stepped:wait();
			if t_CurrentCamera2:FindFirstChild("Arms") ~= t_Arms2 or gun ~= g_gun3 then return end
		until tick() - tick_ret8 >= LoadAnimation_ret12.Length - 0.05;
		autoequip();
	end
end
function Button2Up() -- Line: 3162
	--[[
		Upvalues:
			[1] = UserInputService_
			[2] = bool2
	--]]
	if UserInputService_.MouseIconEnabled == true then return end
	bool2 = false;
	thrownade(true);
end
m_NewMouse.Button2Down:connect(function() -- Line: 3167
	Button2Down();
end);
m_NewMouse.Button2Up:connect(function() -- Line: 3168
	Button2Up();
end);
reloadtime = 0;
function reloadwep() -- Line: 3170
	--[[
		Upvalues:
			[1] = bool10
			[2] = Humanoid
			[3] = str5
			[4] = u28
			[5] = u32
			[6] = u27
			[7] = u30
			[8] = u25
			[9] = u29
			[10] = u26
			[11] = u31
			[12] = u11
			[13] = LoadAnimation_ret9
			[14] = LoadAnimation_ret10
			[15] = LoadAnimation_ret20
			[16] = LoadAnimation_ret21
			[17] = LoadAnimation_ret22
			[18] = LoadAnimation_ret19
			[19] = LoadAnimation_ret12
			[20] = LoadAnimation_ret23
			[21] = RunService
			[22] = LoadAnimation_ret7
			[23] = LoadAnimation_ret24
	--]]
	if DISABLED == false and bool10 == false then
		if Humanoid and Humanoid.Health == 0 then return end
		if str5 == "equipment2" and u28 < gun.Ammo.Value and u32 > 0 or str5 == "equipment3" and u27 < gun.Ammo.Value and u30 > 0 or str5 == "primary" and u25 < gun.Ammo.Value and u29 > 0 or str5 == "secondary" and u26 < gun.Ammo.Value and u31 > 0 then
			u11 = false;
			updateads();
			bool10 = true;
			if LoadAnimation_ret9 then
				LoadAnimation_ret9:Stop();
			end
			if LoadAnimation_ret10 then
				LoadAnimation_ret10:Stop();
			end
			if LoadAnimation_ret20 then
				LoadAnimation_ret20:Stop();
			end
			if LoadAnimation_ret21 then
				LoadAnimation_ret21:Stop();
			end
			if LoadAnimation_ret22 then
				LoadAnimation_ret22:Stop();
			end
			if LoadAnimation_ret19 then
				LoadAnimation_ret19:Stop();
			end
			if LoadAnimation_ret12 then
				LoadAnimation_ret12:Stop();
			end
			local g_gun4 = gun;
			if gun:FindFirstChild("PumpAction") then
				if LoadAnimation_ret21 then
					LoadAnimation_ret21:Play();
					if LoadAnimation_ret23 then
						LoadAnimation_ret23:Play();
					end
					game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Reload1");
				end
				local tick_ret13 = tick();
				repeat
					RunService.Stepped:wait();
					if gun:FindFirstChild("PumpAction") and DISABLED == true then return end
					if gun ~= g_gun4 then return end
				until tick() - tick_ret13 >= gun.SReload.Value;
			end
			countammo();
			if gun:FindFirstChild("PumpAction") then
				if str5 == "secondary" and u31 > 0 and u26 < gun.Ammo.Value or str5 == "primary" and u29 > 0 and u25 < gun.Ammo.Value then
					repeat
						if LoadAnimation_ret21 then
							LoadAnimation_ret21:Stop();
							if LoadAnimation_ret23 then
								LoadAnimation_ret23:Stop();
							end
						end
						LoadAnimation_ret7:Play();
						if LoadAnimation_ret20 then
							LoadAnimation_ret20:Play();
						end
						game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Reload");
						local tick_ret11 = tick();
						repeat
							RunService.Stepped:wait();
							if gun:FindFirstChild("PumpAction") and DISABLED == true then return end
							if gun ~= g_gun4 then return end
						until tick() - tick_ret11 >= reloadtime;
						if str5 == "primary" then
							u25 = mmin(u25 + 1, gun.Ammo.Value);
							u29 = u29 - 1;
						elseif str5 == "secondary" then
							u26 = mmin(u26 + 1, gun.Ammo.Value);
							u31 = u31 - 1;
						end
						countammo();
						local tick_ret12 = tick();
						repeat
							RunService.Stepped:wait();
							if gun:FindFirstChild("PumpAction") and DISABLED == true then return end
							if gun ~= g_gun4 then return end
						until tick() - tick_ret12 >= gun.AReload.Value;
					until u29 <= 0 and str5 == "primary" or u31 <= 0 and str5 == "secondary" or str5 == "secondary" and u26 >= gun.Ammo.Value or str5 == "primary" and u25 >= gun.Ammo.Value;
				end
			else
				LoadAnimation_ret7:Play();
				DISABLED = true;
				if LoadAnimation_ret20 then
					LoadAnimation_ret20:Play();
				end
				game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Reload");
				local tick_ret9 = tick();
				if gun:FindFirstChild("ClipRefill") then
					repeat
						if LoadAnimation_ret20 then
							LoadAnimation_ret20:AdjustSpeed(LoadAnimation_ret20.Length / reloadtime);
						end
						RunService.Stepped:wait();
						if gun ~= g_gun4 then return end
					until tick() - tick_ret9 >= gun.ClipRefill.Value;
					if tick() - tick_ret9 >= gun.ClipRefill.Value then
						loadammo();
					end
				end
				repeat
					if LoadAnimation_ret20 then
						LoadAnimation_ret20:AdjustSpeed(LoadAnimation_ret20.Length / reloadtime);
					end
					RunService.Stepped:wait();
					if gun ~= g_gun4 then return end
				until tick() - tick_ret9 >= reloadtime;
				DISABLED = false;
			end
			if gun:FindFirstChild("PumpAction") then
				game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Reload2");
				if LoadAnimation_ret22 then
					LoadAnimation_ret22:Play();
					if LoadAnimation_ret24 then
						LoadAnimation_ret24:Play();
					end
				end
				local tick_ret10 = tick();
				repeat
					RunService.Stepped:wait();
					if gun:FindFirstChild("PumpAction") and DISABLED == true then return end
					if gun ~= g_gun4 then return end
				until tick() - tick_ret10 >= gun.EReload.Value;
			else
				DISABLED = false;
			end
			bool10 = false;
		end
	end
end
dooropen = false;
local bool27 = false;
local u34 = 0;
t_CurrentCamera2.FieldOfView = fieldofview;
local u35 = CFrame.new();
function updatePosition() -- Line: 3260
	--[[
		Upvalues:
			[1] = t_LocalPlayer
	--]]
	for index11 = 1, 8 do
		weapons[index11].Position = positions[index11];
	end
	for index12 = 8, 2, -1 do
		if not sp:FindFirstChild("Item" .. index12).Visible and index12 < 5 and index12 > 7 then
			for index45 = 1, index12 - 1 do
				if index45 < 5 and index45 > 7 then
					sp:FindFirstChild("Item" .. index45).Position = sp:FindFirstChild("Item" .. index45).Position + UDim2.new(0, 0, 0.2, 0);
				end
				if index45 >= 5 and index45 <= 7 then
					sp:FindFirstChild("Item" .. index45).Position = sp.Item4.Position;
				end
			end
		end
	end
	if weapons[4].Visible then
		sp:FindFirstChild("Item" .. 8).Position = weapons[4].Position + UDim2.new(0, 0, 0.2, 0);
	else
		sp:FindFirstChild("Item" .. 8).Position = weapons[3].Position + UDim2.new(0, 0, 0.2, 0);
	end
	if not t_LocalPlayer.Character then
		sp.Visible = false;
	end
end
function clearAll() -- Line: 3280
	for __, val4 in ipairs(weapons) do
		val4:FindFirstChild("Weapon").ImageTransparency = 0.5;
		if val4:FindFirstChild("Weapon2") then
			val4.Weapon2.ImageTransparency = 0.5;
		end
		if val4:FindFirstChild("Weapon3") then
			val4.Weapon3.ImageTransparency = 0.5;
		end
		if val4:FindFirstChild("Weapon4") then
			val4.Weapon4.ImageTransparency = 0.5;
		end
		val4.bk.Visible = false;
	end
	updatePosition();
end
function getNext(p87) -- Line: 3297
	--[[
		Upvalues:
			[1] = u14
			[2] = u16
			[3] = u22
			[4] = str3
			[5] = u21
			[6] = u17
			[7] = u18
			[8] = u19
			[9] = u20
	--]]
	local v20 = p87;
	if u14 ~= "" or u16 ~= "" or u22 ~= "" or str3 ~= "" or u21 ~= "" or u17 ~= "" or u18 ~= "" or u19 ~= "" or u20 ~= "" then
		for index28 = 1, 8 do
			if v20 == 8 then
				v20 = 1;
			else
				v20 = v20 + 1;
			end
			if weapons[v20].Visible == true then break end
		end
	end
	return v20;
end
function getPrevious(p88) -- Line: 3308
	--[[
		Upvalues:
			[1] = u14
			[2] = u16
			[3] = u22
			[4] = str3
			[5] = u21
			[6] = u17
			[7] = u18
			[8] = u19
			[9] = u20
	--]]
	local v21 = p88;
	if u14 ~= "" or u16 ~= "" or u22 ~= "" or str3 ~= "" or u21 ~= "" or u17 ~= "" or u18 ~= "" or u19 ~= "" or u20 ~= "" then
		for index29 = 1, 8 do
			if v21 == 1 then
				v21 = 8;
			else
				v21 = v21 - 1;
			end
			if weapons[v21].Visible == true then break end
		end
	end
	return v21;
end
function getSelected() -- Line: 3319
	local num8 = 0;
	for index13 = 1, 8 do
		if weapons[index13]:FindFirstChild("Weapon").ImageTransparency == 0 then
			return index13;
		end
	end
	return num8;
end
function moveDown() -- Line: 3325
	if not scrolling then
		scrolling = true;
		local v70 = 1;
		for index30 = 1, 8 do
			if weapons[index30]:FindFirstChild("Weapon").ImageTransparency == 0 then
				v70 = getNext(index30);
				break;
			end
		end
		clearAll();
		weapons[v70]:FindFirstChild("Weapon").ImageTransparency = 0;
		weapons[v70].bk.Visible = true;
		updatePosition();
		scrolling = false;
	end
end
function moveUp() -- Line: 3338
	if not scrolling then
		scrolling = true;
		local v71 = 1;
		for index31 = 1, 8 do
			if weapons[v71]:FindFirstChild("Weapon").ImageTransparency == 0 then
				v71 = getPrevious(index31);
				break;
			end
		end
		clearAll();
		weapons[v71]:FindFirstChild("Weapon").ImageTransparency = 0;
		weapons[v71].bk.Visible = true;
		updatePosition();
		scrolling = false;
	end
end
function makeInvisible() -- Line: 3351
	sp.Visible = false;
end
function makeVisible() -- Line: 3353
	--[[
		Upvalues:
			[1] = t_LocalPlayer
	--]]
	if sp.Visible == false then
		sp.Visible = true;
		local Waiting2_2 = Instance.new("IntValue");
		Waiting2_2.Name = "Waiting2";
		Waiting2_2.Parent = t_LocalPlayer;
		delay(3, function() -- Line: 3359
			--[[
				Upvalues:
					[1] = Waiting2_2
			--]]
			Waiting2_2:Destroy();
		end);
		task.spawn(function() -- Line: 3360
			--[[
				Upvalues:
					[1] = t_LocalPlayer
			--]]
			repeat
				wait();
			until t_LocalPlayer:FindFirstChild("Waiting2") == nil;
			makeInvisible();
		end);
	elseif t_LocalPlayer:FindFirstChild("Waiting2") then
		t_LocalPlayer:FindFirstChild("Waiting2"):Destroy();
		local Waiting2 = Instance.new("IntValue");
		Waiting2.Parent = t_LocalPlayer;
		delay(3, function() -- Line: 3366
			--[[
				Upvalues:
					[1] = Waiting2
			--]]
			Waiting2:Destroy();
		end);
		Waiting2.Name = "Waiting2";
	end
	updatePosition();
	giveTool();
end
function giveTool() -- Line: 3374
	--[[
		Upvalues:
			[1] = bool7
			[2] = bool8
			[3] = u24
			[4] = u23
	--]]
	if bool7 == true and bool8 == false then
		local Selected_ = getSelected();
		if not Selected_ then return end
		if u24 ~= Selected_ then
			u23 = u24;
		end
		u24 = Selected_;
		if gun and gun ~= "none" and gun:IsA("Folder") then
			updatePosition();
		end
	end
end
m_NewMouse.WheelBackward:connect(function() -- Line: 3390
	--[[
		Upvalues:
			[1] = bool7
			[2] = Alive
	--]]
	if bool7 and Alive.Value then
		moveDown();
		makeVisible();
	end
end);
workspace.ChildAdded:Connect(function(child4) -- Line: 3392
	if child4.Name == "Map" then
		child4.DescendantAdded:connect(function(descendant) -- Line: 3394
			if descendant:IsA("BasePart") and descendant.Name ~= "BreakableMetal" and descendant.Name ~= "Breakable" and descendant.Name ~= "Glass" and descendant.Name ~= "Water" then
				descendant.Locked = true;
				descendant:GetPropertyChangedSignal("Locked"):connect(function() -- Line: 3397
					--[[
						Upvalues:
							[1] = descendant
					--]]
					local success = pcall(function() -- Line: 3398
						--[[
							Upvalues:
								[1] = descendant
						--]]
						return descendant.Locked;
					end);
					if success then
						descendant.Locked = true;
						return;
					end
					player:Kick("\nRobloxLocking " .. descendant.ClassName .. ": " .. descendant.Name);
				end);
				if descendant.CanCollide then
					descendant:GetPropertyChangedSignal("CanCollide"):connect(function() -- Line: 3402
						--[[
							Upvalues:
								[1] = descendant
						--]]
						if not descendant.CanCollide and descendant.Material ~= Enum.Material.Wood and descendant.Material ~= Enum.Material.WoodPlanks then
							descendant.CanCollide = true;
						end
					end);
				end
				if descendant.Anchored then
					descendant:GetPropertyChangedSignal("Anchored"):connect(function() -- Line: 3403
						--[[
							Upvalues:
								[1] = descendant
						--]]
						if not descendant.Anchored then
							descendant.Anchored = true;
						end
					end);
				end
			end
		end);
		child4.DescendantRemoving:Connect(function(descendant2) -- Line: 3406
			--[[
				Upvalues:
					[1] = child4
			--]]
			if descendant2:IsA("BasePart") and descendant2.CanCollide and descendant2.Anchored and not workspace.Status.RoundOver.Value and descendant2.Name ~= "BreakableMetal" and descendant2.Name ~= "Breakable" and descendant2.Name ~= "Glass" and descendant2.Name ~= "Water" and child4:FindFirstChild("Regen") and not descendant2:IsDescendantOf(child4.Regen) then
				local Clone_ret5 = descendant2:Clone();
				Clone_ret5.Parent = descendant2.Parent;
			end
		end);
	end
end);
local DestroyObject = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DestroyObject");
function pickup(p89) -- Line: 3416
	--[[
		Upvalues:
			[1] = t_LocalPlayer
			[2] = Humanoid
			[3] = t_SelectionSphere
			[4] = bool8
			[5] = RunService
			[6] = DestroyObject
			[7] = m_Sound
			[8] = u14
			[9] = t_CurrentCamera2
			[10] = u25
			[11] = u29
			[12] = u13
			[13] = u15
			[14] = str5
			[15] = u17
			[16] = u18
			[17] = u19
			[18] = u20
			[19] = u16
			[20] = u26
			[21] = u31
			[22] = u21
			[23] = u28
			[24] = u32
			[25] = u27
			[26] = u30
			[27] = u11
	--]]
	if game.ReplicatedStorage.gametype.Value == "juggernaut" and t_LocalPlayer.Status.Team.Value == "T" then return end
	if not Humanoid or Humanoid.Health <= 0 then return end
	local v22 = p89 == nil and t_SelectionSphere.Adornee or p89;
	if v22 and game.ReplicatedStorage.Weapons:FindFirstChild(v22.Name) and (game.ReplicatedStorage.Weapons:FindFirstChild(v22.Name):FindFirstChild("Grenade") == nil or game.ReplicatedStorage.Weapons:FindFirstChild(v22.Name):FindFirstChild("Grenade") and grenadeallowed(v22.Name) == true) and t_LocalPlayer:FindFirstChild("DROPPED") == nil and t_LocalPlayer.Status.Alive.Value == true and v22:FindFirstChild("PickedUp") == nil and bool8 == false then
		local t_Name2 = v22.Name;
		if game.ReplicatedStorage.Weapons:FindFirstChild(t_Name2) and v22 then
			local FindFirstChild_ret2 = game.ReplicatedStorage.Weapons:FindFirstChild(t_Name2);
			local v104 = v22;
			local t_Value8 = nil;
			local t_Value9 = nil;
			local v105 = false;
			local v106 = false;
			if FindFirstChild_ret2 and FindFirstChild_ret2:FindFirstChild("Primary") and v104:FindFirstChild("Special") then
				v105 = v104.Special.Value;
			end
			if FindFirstChild_ret2 and FindFirstChild_ret2:FindFirstChild("Secondary") and v104:FindFirstChild("Special") then
				v106 = v104.Special.Value;
			end
			if v104 and v104:FindFirstChild("Ammo") and v104:FindFirstChild("StoredAmmo") then
				t_Value8 = v104.Ammo.Value;
				t_Value9 = v104.StoredAmmo.Value;
			end
			game.ReplicatedStorage.Events.PickUp:FireServer(v104);
			if FindFirstChild_ret2:FindFirstChild("Secondary") then
				if v104:FindFirstChild("Owner") then
					secondaryowner = v22.Owner.Value;
				else
					secondaryowner = game.Players.LocalPlayer;
				end
			end
			local tick_ret14 = tick();
			bool8 = true;
			repeat
				if v104:FindFirstChild("PickedUp") and v104.PickedUp.Value ~= game.Players.LocalPlayer or v104 == nil or tick() - tick_ret14 >= 3 then
					bool8 = false;
					return;
				end
				RunService.Stepped:wait();
			until v104 and v104:FindFirstChild("PickedUp") and v104.PickedUp.Value == game.Players.LocalPlayer;
			if not Humanoid or Humanoid.Health <= 0 then return end
			DestroyObject:FireServer(v104);
			m_Sound.playsound(script.Parent.Pickup);
			if FindFirstChild_ret2:FindFirstChild("Primary") then
				if u14 ~= "" then
					game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u14], t_CurrentCamera2.CFrame, u25, u29, special, primaryowner, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
					repeat
						wait();
					until t_LocalPlayer:FindFirstChild("DROPPED");
					t_LocalPlayer.DROPPED:Destroy();
				end
				if v104:FindFirstChild("Owner") then
					primaryowner = v22.Owner.Value;
				else
					primaryowner = game.Players.LocalPlayer;
				end
				special = v105;
				if tostring(primaryowner) == game.Players.LocalPlayer.Name then
					u13 = FindFirstChild_ret2.Name;
					u14 = u13;
				else
					u13 = tostring(primaryowner) .. "'s " .. FindFirstChild_ret2.Name;
					u14 = string.find(u13, "'");
					u14 = string.sub(u13, u14 + 3);
					u15 = getskinfolder(primaryowner, FindFirstChild_ret2.Name);
					if u15 then
						u13 = u13 .. " | " .. u15;
					end
				end
				if str5 == "primary" then
					autoequip();
				end
				if not p89 then
					clearAll();
					weapons[1]:FindFirstChild("Weapon").ImageTransparency = 0;
				end
				if t_Value8 and t_Value9 then
					u25 = t_Value8;
					u29 = t_Value9;
				elseif u14 ~= "" then
					u25 = game.ReplicatedStorage.Weapons[u14].Ammo.Value;
					u29 = game.ReplicatedStorage.Weapons[u14].StoredAmmo.Value;
				end
				if str5 == "primary" then
					gun = game.ReplicatedStorage.Weapons[u14];
					coroutine.wrap(function() -- Line: 3482
						usethatgun();
					end)();
				end
			end
			if FindFirstChild_ret2:FindFirstChild("Grenade") then
				local bool28 = false;
				if u17 == "" and bool28 == false then
					bool28 = true;
					u17 = FindFirstChild_ret2.Name;
					if not p89 then
						clearAll();
						weapons[4]:FindFirstChild("Weapon").ImageTransparency = 0;
					end
					if str5 == "grenade" then
						gun = game.ReplicatedStorage.Weapons[u17];
						coroutine.wrap(function() -- Line: 3495
							usethatgun();
						end)();
					end
				end
				if u18 == "" and bool28 == false then
					bool28 = true;
					u18 = FindFirstChild_ret2.Name;
					if not p89 then
						clearAll();
						weapons[5]:FindFirstChild("Weapon").ImageTransparency = 0;
					end
					if str5 == "grenade2" then
						gun = game.ReplicatedStorage.Weapons[u18];
						coroutine.wrap(function() -- Line: 3505
							usethatgun();
						end)();
					end
				end
				if u19 == "" and bool28 == false then
					bool28 = true;
					u19 = FindFirstChild_ret2.Name;
					if not p89 then
						clearAll();
						weapons[6]:FindFirstChild("Weapon").ImageTransparency = 0;
					end
					if str5 == "grenade3" then
						gun = game.ReplicatedStorage.Weapons[u19];
						coroutine.wrap(function() -- Line: 3515
							usethatgun();
						end)();
					end
				end
				if u20 == "" and bool28 == false and game.ReplicatedStorage.gametype.Value == "competitive" then
					u20 = FindFirstChild_ret2.Name;
					if not p89 then
						clearAll();
						weapons[7]:FindFirstChild("Weapon").ImageTransparency = 0;
					end
					if str5 == "grenade4" then
						gun = game.ReplicatedStorage.Weapons[u20];
						coroutine.wrap(function() -- Line: 3525
							usethatgun();
						end)();
					end
				end
			end
			if FindFirstChild_ret2:FindFirstChild("Secondary") then
				if u16 ~= "" then
					game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u16], t_CurrentCamera2.CFrame, u26, u31, special2, secondaryowner, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
					repeat
						wait();
					until t_LocalPlayer:FindFirstChild("DROPPED");
					t_LocalPlayer.DROPPED:Destroy();
				end
				special2 = v106;
				u16 = FindFirstChild_ret2.Name;
				if not p89 then
					clearAll();
					weapons[2]:FindFirstChild("Weapon").ImageTransparency = 0;
				end
				if t_Value8 and t_Value9 then
					u26 = t_Value8;
					u31 = t_Value9;
				elseif u16 ~= "" then
					u26 = game.ReplicatedStorage.Weapons[u16].Ammo.Value;
					u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
				end
				if str5 == "secondary" then
					gun = game.ReplicatedStorage.Weapons[u16];
					coroutine.wrap(function() -- Line: 3554
						usethatgun();
					end)();
				end
			end
			if FindFirstChild_ret2:FindFirstChild("Equipment2") then
				if u21 ~= "" then
					game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u21], t_CurrentCamera2.CFrame, u28, u32, nil, nil, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
					repeat
						wait();
					until t_LocalPlayer:FindFirstChild("DROPPED");
					t_LocalPlayer.DROPPED:Destroy();
				end
				u21 = FindFirstChild_ret2.Name;
				if t_Value8 and t_Value9 then
					u28 = t_Value8;
					u32 = t_Value9;
				elseif u21 ~= "" then
					u27 = game.ReplicatedStorage.Weapons[u21].Ammo.Value;
					u30 = game.ReplicatedStorage.Weapons[u21].StoredAmmo.Value;
				end
				if str5 == "equipment2" then
					gun = game.ReplicatedStorage.Weapons[u21];
					coroutine.wrap(function() -- Line: 3573
						usethatgun();
					end)();
				end
			end
			bool8 = false;
			u11 = false;
			updateInventory();
			updateads();
		end
	end
end
m_NewMouse.WheelForward:connect(function() -- Line: 3586
	--[[
		Upvalues:
			[1] = bool7
			[2] = Alive
	--]]
	if bool7 and Alive.Value then
		moveUp();
		makeVisible();
	end
end);
function DropWep() -- Line: 3588
	--[[
		Upvalues:
			[1] = Humanoid
			[2] = bool8
			[3] = str5
			[4] = u13
			[5] = u14
			[6] = t_CurrentCamera2
			[7] = u25
			[8] = u29
			[9] = t_LocalPlayer
			[10] = u16
			[11] = u26
			[12] = u31
			[13] = u21
			[14] = u28
			[15] = u32
			[16] = u11
	--]]
	if Humanoid and Humanoid.Health > 0 then
		bool8 = true;
		local bool29 = false;
		if str5 == "primary" then
			bool29 = true;
			u13 = "";
			if u14 ~= "" then
				game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u14], t_CurrentCamera2.CFrame, u25, u29, special, primaryowner, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
				u14 = "";
			end
			autoequip();
			repeat
				wait();
			until t_LocalPlayer:FindFirstChild("DROPPED");
			t_LocalPlayer.DROPPED:Destroy();
		end
		if str5 == "secondary" and bool29 == false then
			bool29 = true;
			if u16 ~= "" then
				game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u16], t_CurrentCamera2.CFrame, u26, u31, special2, secondaryowner, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
				u16 = "";
			end
			autoequip();
			repeat
				wait();
			until t_LocalPlayer:FindFirstChild("DROPPED");
			t_LocalPlayer.DROPPED:Destroy();
		end
		if str5 == "equipment2" and bool29 == false then
			if u21 ~= "" then
				game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u21], t_CurrentCamera2.CFrame, u28, u32, nil, nil, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
				u21 = "";
			end
			autoequip();
			repeat
				wait();
			until t_LocalPlayer:FindFirstChild("DROPPED");
			t_LocalPlayer.DROPPED:Destroy();
		end
		bool8 = false;
		updateInventory();
		u11 = false;
		updateads();
	end
end
Buymenuframe = GUI:WaitForChild("Buymenu");
UserInputService_.InputBegan:connect(function(input2) -- Line: 3633
	--[[
		Upvalues:
			[1] = UserInputService_
			[2] = bool7
			[3] = t_LocalPlayer
			[4] = SuitZoom
	--]]
	if UserInputService_:GetFocusedTextBox() then return end
	if script.Parent:FindFirstChild("GUI") and (script.Parent.GUI.Main.GlobalChat.ActiveOne.Value == true or script.Parent.GUI.Main.TeamChat.ActiveOne.Value == true) then return end
	if Buymenuframe.Visible == false and bool7 then
		if t_LocalPlayer.Character and not SuitZoom.Visible then
			if input2.KeyCode == Enum.KeyCode.One then
				if weapons[1].Visible then
					clearAll();
					weapons[1]:FindFirstChild("Weapon").ImageTransparency = 0;
					weapons[1].bk.Visible = true;
				end
				makeVisible();
			elseif input2.KeyCode == Enum.KeyCode.Two then
				if weapons[2].Visible then
					clearAll();
					weapons[2]:FindFirstChild("Weapon").ImageTransparency = 0;
					weapons[2].bk.Visible = true;
				end
				makeVisible();
			elseif input2.KeyCode == Enum.KeyCode.Three then
				if weapons[3].Visible then
					clearAll();
					weapons[3]:FindFirstChild("Weapon").ImageTransparency = 0;
					weapons[3].bk.Visible = true;
				end
				makeVisible();
			elseif input2.KeyCode == Enum.KeyCode.Four then
				local bool30 = false;
				if weapons[5].Visible and weapons[4]:FindFirstChild("Weapon").ImageTransparency == 0 and bool30 == false then
					clearAll();
					weapons[5]:FindFirstChild("Weapon").ImageTransparency = 0;
					weapons[5].bk.Visible = true;
					bool30 = true;
				end
				if weapons[6].Visible and weapons[5]:FindFirstChild("Weapon").ImageTransparency == 0 and bool30 == false then
					clearAll();
					weapons[6]:FindFirstChild("Weapon").ImageTransparency = 0;
					weapons[6].bk.Visible = true;
					bool30 = true;
				end
				if weapons[7].Visible and weapons[6]:FindFirstChild("Weapon").ImageTransparency == 0 and bool30 == false then
					clearAll();
					weapons[7]:FindFirstChild("Weapon").ImageTransparency = 0;
					weapons[7].bk.Visible = true;
					bool30 = true;
				end
				if bool30 == false and weapons[4].Visible then
					clearAll();
					weapons[4]:FindFirstChild("Weapon").ImageTransparency = 0;
					weapons[4].bk.Visible = true;
				end
				makeVisible();
			elseif input2.KeyCode == Enum.KeyCode.Five then
				if weapons[8].Visible then
					clearAll();
					weapons[8]:FindFirstChild("Weapon").ImageTransparency = 0;
					weapons[8].bk.Visible = true;
				end
				makeVisible();
			end
			if input2.KeyCode == Enum.KeyCode.ButtonY then
				if weapons[1].Visible and weapons[1]:FindFirstChild("Weapon").ImageTransparency ~= 0 then
					clearAll();
					weapons[1]:FindFirstChild("Weapon").ImageTransparency = 0;
					weapons[1].bk.Visible = true;
				elseif weapons[2].Visible and weapons[2]:FindFirstChild("Weapon").ImageTransparency ~= 0 then
					clearAll();
					weapons[2]:FindFirstChild("Weapon").ImageTransparency = 0;
					weapons[2].bk.Visible = true;
				else
					clearAll();
					weapons[1]:FindFirstChild("Weapon").ImageTransparency = 0;
					weapons[1].bk.Visible = true;
				end
				makeVisible();
			end
		end
		updatePosition();
	end
end);
local m_GetIcon = require(game.ReplicatedStorage.GetIcon);
function updateInventory() -- Line: 3721
	--[[
		Upvalues:
			[1] = t_LocalPlayer
			[2] = u17
			[3] = u18
			[4] = str5
			[5] = u19
			[6] = u20
			[7] = u14
			[8] = u13
			[9] = m_GetIcon
			[10] = u15
			[11] = u16
			[12] = u22
			[13] = u21
	--]]
	if t_LocalPlayer.Character then
		if u17 == "" and u18 ~= "" then
			u17 = u18;
			u18 = "";
			if str5 == "grenade2" then
				str5 = "grenade";
				changeto(4);
				coroutine.wrap(function() -- Line: 3729
					usethatgun();
				end)();
			end
		end
		if u18 == "" and u19 ~= "" then
			u18 = u19;
			u19 = "";
			if str5 == "grenade3" then
				str5 = "grenade2";
				changeto(5);
				coroutine.wrap(function() -- Line: 3738
					usethatgun();
				end)();
			end
		end
		if u19 == "" and u20 ~= "" then
			u19 = u20;
			u20 = "";
			if str5 == "grenade4" then
				str5 = "grenade3";
				changeto(6);
				coroutine.wrap(function() -- Line: 3747
					usethatgun();
				end)();
			end
		end
		weapons[1].Visible = false;
		weapons[2].Visible = false;
		weapons[3].Visible = false;
		weapons[4].Visible = false;
		weapons[5].Visible = false;
		weapons[6].Visible = false;
		weapons[7].Visible = false;
		weapons[8].Visible = false;
		if u14 ~= "" then
			weapons[1]:FindFirstChild("ToolName").Text = GetName.getName(u13);
			weapons[1].Weapon.Image = m_GetIcon.getWeaponOfKiller(u14);
			local v107 = Color3.fromRGB(255, 255, 212);
			local skinfolder2 = getskinfolder(primaryowner, u14);
			if skinfolder2 and u15 then
				for __, child21 in pairs(script.Rarities:GetChildren()) do
					if string.find(child21.Name, u15) and string.find(u13, "'") and not string.find(u15, "Stock") then
						v107 = script.Colors[child21.Value].Value;
						continue;
					end
					if string.find(u13, "'") or not skinfolder2 or not string.find(child21.Name, skinfolder2) or skinfolder2 == "Stock" or not string.find(child21.Name, u14) then continue end
					v107 = script.Colors[child21.Value].Value;
					weapons[1].ToolName.Text = GetName.getName(u13) .. " | " .. skinfolder2;
				end
			end
			weapons[1].ToolName.TextColor3 = v107;
			weapons[1].Weapon.ImageColor3 = script.HackyColorReplication.Value;
			weapons[1].Visible = true;
		end
		if u16 ~= "" then
			weapons[2]:FindFirstChild("ToolName").Text = GetName.getName(u16);
			local t_Value10 = script.HackyColorReplication.Value;
			local skinfolder3 = getskinfolder(secondaryowner, u16);
			if skinfolder3 then
				for __, child22 in pairs(script.Rarities:GetChildren()) do
					if string.find(child22.Name, skinfolder3) and skinfolder3 ~= "Stock" and string.find(child22.Name, u16) then
						t_Value10 = script.Colors[child22.Value].Value;
						weapons[2].ToolName.Text = GetName.getName(u16) .. " | " .. skinfolder3;
						continue;
					end
					if not string.find(skinfolder3, "Honor") or not string.find(child22.Name, "Honor") then continue end
					t_Value10 = script.Colors.Pink.Value;
					weapons[2].ToolName.Text = GetName.getName(u16) .. " | " .. "Honor-bound";
				end
			end
			weapons[2].ToolName.TextColor3 = t_Value10;
			weapons[2].Weapon.ImageColor3 = script.HackyColorReplication.Value;
			weapons[2].Visible = true;
			weapons[2].Weapon.Image = m_GetIcon.getWeaponOfKiller(u16);
		end
		if u22 ~= "" then
			weapons[3]:FindFirstChild("ToolName").Text = GetName.getName(u22);
			if weapons[3].ToolName.Text ~= "T Knife" and weapons[3].ToolName.Text ~= "CT Knife" then
				weapons[3].ToolName.TextColor3 = script.Colors.Knife.Value;
				weapons[3].Weapon.ImageColor3 = script.Colors.Knife.Value;
			else
				weapons[3].Weapon.ImageColor3 = script.HackyColorReplication.Value;
			end
			weapons[3].Weapon.Image = m_GetIcon.getWeaponOfKiller(u22);
			weapons[3].Visible = true;
		end
		if u17 ~= "" then
			weapons[4]:FindFirstChild("ToolName").Text = u17;
			weapons[4].Weapon.Image = m_GetIcon.getWeaponOfKiller(u17);
			weapons[4].Visible = true;
		end
		if u18 ~= "" then
			weapons[5]:FindFirstChild("ToolName").Text = u18;
			weapons[5].Weapon.Image = m_GetIcon.getWeaponOfKiller(u18);
			weapons[5].Visible = true;
		end
		if u19 ~= "" then
			weapons[6]:FindFirstChild("ToolName").Text = u19;
			weapons[6].Weapon.Image = m_GetIcon.getWeaponOfKiller(u19);
			weapons[6].Visible = true;
		end
		if u20 ~= "" then
			weapons[7]:FindFirstChild("ToolName").Text = u20;
			weapons[7].Weapon.Image = m_GetIcon.getWeaponOfKiller(u20);
			weapons[7].Visible = true;
		end
		if u21 ~= "" then
			weapons[8]:FindFirstChild("ToolName").Text = u21;
			weapons[8].Weapon.Image = m_GetIcon.getWeaponOfKiller(u21);
			weapons[8].Visible = true;
		end
	else
		makeInvisible();
	end
	updatePosition();
end
function UnCrouch() -- Line: 3849
	--[[
		Upvalues:
			[1] = t_Character
			[2] = t_CurrentCamera2
			[3] = bool6
			[4] = RunService
			[5] = t_LocalPlayer
			[6] = LoadAnimation_ret
			[7] = LoadAnimation_ret2
	--]]
	local table13 = {
		t_Character,
		t_CurrentCamera2,
		workspace:WaitForChild("Ray_Ignore"),
		workspace:WaitForChild("Debris"),
		game.Workspace.Map:WaitForChild("Clips"),
		game.Workspace.Map:WaitForChild("SpawnPoints")
	};
	local __, __, __ = workspace:FindPartOnRayWithIgnoreList(Ray.new(t_CurrentCamera2.CFrame.p, (Vector3.new(0, 3, 0))), table13);
	bool6 = false;
	repeat
		RunService.Stepped:wait();
		local FindPartOnRayWithIgnoreList_ret1_5, __, __ = workspace:FindPartOnRayWithIgnoreList(Ray.new(t_CurrentCamera2.CFrame.p, (Vector3.new(0, 3, 0))), table13);
	until not t_LocalPlayer.Character or bool6 or not t_LocalPlayer.Character:FindFirstChild("Head") or not FindPartOnRayWithIgnoreList_ret1_5 and crouchJump == false;
	if bool6 then return end
	if t_Character and t_Character:FindFirstChild("Crouched") then
		t_Character.Crouched:Destroy();
	end
	if LoadAnimation_ret then
		LoadAnimation_ret:Stop(math.max(0.2, crouchcooldown / 4 * 0.5), nil, nil);
	end
	if LoadAnimation_ret2 then
		LoadAnimation_ret2:Stop(math.max(0.2, crouchcooldown / 4 * 0.5), nil, nil);
	end
end
function stopplant() -- Line: 3862
	--[[
		Upvalues:
			[1] = str5
			[2] = LoadAnimation_ret12
			[3] = t_CurrentCamera2
			[4] = m_Sound
			[5] = LoadAnimation_ret4
	--]]
	if str5 == "equipment2" and LoadAnimation_ret12 and LoadAnimation_ret12.IsPlaying == true then
		if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("HUD") then
			t_CurrentCamera2.Arms.HUD.SurfaceGui.TextLabel.Text = "*******";
		end
		m_Sound.stopsound("PlantingLocal", script.Parent.LocalSounds);
		game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("StopFire");
		LoadAnimation_ret12:Stop(0.4, nil, nil);
		LoadAnimation_ret4:Stop(0.4, nil, nil);
	end
end
UserInputService_.InputEnded:connect(function(input3) -- Line: 3873
	--[[
		Upvalues:
			[1] = UserInputService_
			[2] = bool1
			[3] = t_Character
			[4] = Humanoid
			[5] = t_LocalPlayer
			[6] = UpperTorso
	--]]
	if UserInputService_:GetFocusedTextBox() then return end
	if input3.KeyCode == Enum.KeyCode.E then
		bool1 = false;
		stopplant();
	end
	if input3.KeyCode == Enum.KeyCode.ButtonL2 then
		Button2Up();
	end
	if input3.KeyCode == Enum.KeyCode.ButtonL1 then
		walking = false;
	end
	if input3.KeyCode == Enum.KeyCode.Tab and game.ReplicatedStorage.Voten.Value == false then
		script.Parent.CBScoreboard.Gimmie:Fire(false);
	end
	if t_Character and Humanoid and Humanoid.Health > 0 then
		if (input3.KeyCode == Enum.KeyCode.LeftControl or input3.KeyCode == Enum.KeyCode.C) and t_Character and t_Character:FindFirstChild("Crouched") and t_LocalPlayer and t_LocalPlayer.Character and UpperTorso then
			UnCrouch();
		end
		if input3.KeyCode == Enum.KeyCode.LeftShift and t_Character and walking == true then
			walking = false;
			if shiftwalkanim then
				shiftwalkanim:Stop(0.4, nil, nil);
			end
		end
	end
end);
UserInputService_.InputBegan:connect(function(input4) -- Line: 3891
	--[[
		Upvalues:
			[1] = UserInputService_
			[2] = t_Character
			[3] = Humanoid
			[4] = bool6
			[5] = LoadAnimation_ret
	--]]
	if UserInputService_:GetFocusedTextBox() then return end
	if script.Parent:FindFirstChild("GUI") and (script.Parent.GUI.Main.GlobalChat.ActiveOne.Value == true or script.Parent.GUI.Main.TeamChat.ActiveOne.Value == true) then return end
	if input4.KeyCode == Enum.KeyCode.Tab and game.ReplicatedStorage.Voten.Value == false then
		script.Parent.CBScoreboard.Gimmie:Fire(true);
	end
	if t_Character and Humanoid and Humanoid.Health > 0 then
		if input4.KeyCode == Enum.KeyCode.LeftShift and t_Character and walking == false and bool6 == false then
			walking = true;
		end
		if t_Character:FindFirstChild("Charging") == nil and (input4.KeyCode == Enum.KeyCode.ButtonL3 or input4.KeyCode == Enum.KeyCode.LeftControl or input4.KeyCode == Enum.KeyCode.C) and t_Character and t_Character:FindFirstChild("Crouched") == nil then
			if istenfoot then
				script.Parent.GUI.Vitals.Crouch.Visible = true;
			end
			local Crouched = Instance.new("IntValue");
			Crouched.Parent = t_Character;
			Crouched.Name = "Crouched";
			crouchcooldown = math.min(8, crouchcooldown + 2);
			bool6 = true;
			if jumping == true and crouchJump == false then
				crouchJump = true;
				if LoadAnimation_ret then
					LoadAnimation_ret:Play();
				end
			elseif LoadAnimation_ret then
				LoadAnimation_ret:Play(math.max(0.3, crouchcooldown / 4 * 0.5), nil, nil);
			end
		elseif t_Character:FindFirstChild("Charging") == nil and input4.KeyCode == Enum.KeyCode.ButtonL3 then
			UnCrouch();
			script.Parent.GUI.Vitals.Crouch.Visible = false;
		end
	end
end);
game.ReplicatedStorage:WaitForChild("Events").PlayLocalSound.OnClientEvent:connect(function(p90) -- Line: 3923
	PlayLocalSound(p90);
end);
function ToggleTeamSelection(p91) -- Line: 3926
	--[[
		Upvalues:
			[1] = GUI
			[2] = m_Sound
			[3] = UserInputService_
	--]]
	if GUI.TeamSelection.Visible == true and p91 == false then
		GUI.TeamSelection.Visible = false;
		m_Sound.stopsound("TeamSelection", script.Parent.Music[script.Parent.Music.MusicKit.Value]);
		return;
	end
	m_Sound.stopsound("TeamSelection", script.Parent.Music[script.Parent.Music.MusicKit.Value]);
	GUI.TeamSelection.Visible = true;
	if UserInputService_:GetLastInputType() == Enum.UserInputType.Gamepad1 and GUI.Parent.Menew.Enabled == false then
		game:GetService("GuiService").SelectedObject = GUI.TeamSelection.Grn;
		GUI.TeamSelection.Grn.Selectable = true;
		GUI.TeamSelection.Rd.Selectable = true;
		GUI.TeamSelection.Spec.Selectable = true;
	end
	if workspace:FindFirstChild("Map") then
		if workspace.Map:FindFirstChild("Origin") then
			GUI.TeamSelection.PlayOn.Text = "Map: " .. workspace.Map.Origin.Value;
		else
			GUI.TeamSelection.PlayOn.Visible = false;
		end
		if workspace.Map:FindFirstChild("Gamemode") then
			for __, child12 in pairs(GUI.TeamSelection.Defuse:GetChildren()) do
				child12.Visible = false;
			end
			for __, child13 in pairs(GUI.TeamSelection.Rescue:GetChildren()) do
				child13.Visible = false;
			end
			if game.PlaceId == 301549746 then
				if workspace.Map.Gamemode.Value == "hostages" then
					GUI.TeamSelection.Gamemode.Text = "Gamemode: Hostage Rescue";
					GUI.TeamSelection.Blue.Role.Text = "Attacking Team";
					GUI.TeamSelection.Red.Role.Text = "Defending Team";
					for __, child23 in pairs(GUI.TeamSelection.Rescue:GetChildren()) do
						child23.Visible = true;
					end
				elseif workspace.Map.Gamemode.Value == "defusal" then
					GUI.TeamSelection.Gamemode.Text = "Gamemode: Bomb Defusal";
					for __, child24 in pairs(GUI.TeamSelection.Defuse:GetChildren()) do
						child24.Visible = true;
					end
				end
			end
		end
		GUI.TeamSelection.Spec.Visible = true;
		GUI.TeamSelection.Spectate.Visible = true;
		local __ = math.random(1, 2);
		spawn(function() -- Line: 3974
			--[[
				Upvalues:
					[1] = m_Sound
			--]]
			repeat
				wait();
			until script.Parent:FindFirstChild("Loading") == nil;
			m_Sound.stopsound("10", script.Parent.Music[script.Parent.Music.MusicKit.Value]);
			m_Sound.stopsound("TeamSelection", script.Parent.Music[script.Parent.Music.MusicKit.Value]);
		end);
	end
end
if t_LocalPlayer.Status.Team.Value == "Spectator" then
	ToggleTeamSelection(true);
end
function updateTS() -- Line: 3984
	--[[
		Upvalues:
			[1] = GUI
	--]]
	GUI.TeamSelection.Red.Number.Text = game.Workspace.Status.NumT.Value;
	GUI.TeamSelection.Blue.Number.Text = game.Workspace.Status.NumCT.Value;
	if game.Workspace.Status.NumT.Value > game.Workspace.Status.NumCT.Value then
		GUI.TeamSelection.Red.Alert.Visible = true;
		GUI.TeamSelection.Blue.Alert.Visible = false;
		return;
	end
	if game.Workspace.Status.NumCT.Value > game.Workspace.Status.NumT.Value then
		GUI.TeamSelection.Red.Alert.Visible = false;
		GUI.TeamSelection.Blue.Alert.Visible = true;
	end
end
updateTS();
game.Workspace.Status.NumT.Changed:connect(function() -- Line: 3996
	wait();
	updateTS();
end);
game.Workspace.Status.NumCT.Changed:connect(function() -- Line: 3997
	wait();
	updateTS();
end);
function JoinTeam(p92) -- Line: 3998
	--[[
		Upvalues:
			[1] = u14
			[2] = u17
			[3] = u18
			[4] = u19
			[5] = u20
			[6] = u16
			[7] = u26
			[8] = u31
	--]]
	game.ReplicatedStorage.Events.JoinTeam:FireServer(p92);
	ToggleTeamSelection(false);
	u14 = "";
	u17 = "";
	u18 = "";
	u19 = "";
	u20 = "";
	if p92 == "CT" then
		u16 = CTPrimaryPistol;
		secondaryowner = game.Players.LocalPlayer;
		if u16 == nil then
			u16 = "P2000";
		end
		u26 = game.ReplicatedStorage:WaitForChild("Weapons")[u16].Ammo.Value;
		u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
		return;
	end
	if p92 == "T" then
		u16 = "Glock";
		secondaryowner = game.Players.LocalPlayer;
		u26 = game.ReplicatedStorage:WaitForChild("Weapons")[u16].Ammo.Value;
		u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
	end
end
GUI.TeamSelection.Grn.MouseButton1Down:connect(function() -- Line: 4020
	--[[
		Upvalues:
			[1] = m_Sound
	--]]
	local v23 = game.Players.LocalPlayer.Status.Team.Value == "CT" and 1 or 0;
	if (game.ReplicatedStorage.gametype.Value == "juggernaut" or workspace.Status:FindFirstChild("NumCT").Value <= workspace.Status:FindFirstChild("NumT").Value - v23) and game.Workspace.Status.PlayerLimit.Value > game.Workspace.Status.NumCT.Value then
		m_Sound.playsound(script.Parent.Sounds.MenuClick);
		JoinTeam("CT");
	end
end);
GUI.TeamSelection.Rd.MouseButton1Down:connect(function() -- Line: 4031
	--[[
		Upvalues:
			[1] = m_Sound
	--]]
	local v24 = game.Players.LocalPlayer.Status.Team.Value == "T" and 1 or 0;
	if game.ReplicatedStorage.gametype.Value ~= "juggernaut" and workspace.Status:FindFirstChild("NumT").Value <= workspace.Status:FindFirstChild("NumCT").Value - v24 and game.Workspace.Status.PlayerLimit.Value > game.Workspace.Status.NumT.Value then
		m_Sound.playsound(script.Parent.Sounds.MenuClick);
		JoinTeam("T");
	end
end);
GUI.TeamSelection.Spec.MouseButton1Down:connect(function() -- Line: 4042
	--[[
		Upvalues:
			[1] = m_Sound
	--]]
	m_Sound.playsound(script.Parent.Sounds.MenuClick);
	JoinTeam("Spectator");
end);
local t_Menew = GUI.Parent.Menew;
UserInputService_.InputBegan:Connect(function(input5, gameProcessedEvent) -- Line: 4045
	--[[
		Upvalues:
			[1] = UserInputService_
			[2] = t_Character
			[3] = bool6
			[4] = t_Menew
			[5] = str5
			[6] = bool7
			[7] = Alive
	--]]
	if UserInputService_:GetFocusedTextBox() then return end
	if script.Parent:FindFirstChild("GUI") and (script.Parent.GUI.Main.GlobalChat.ActiveOne.Value == true or script.Parent.GUI.Main.TeamChat.ActiveOne.Value == true) then return end
	if input5.KeyCode == Enum.KeyCode.ButtonL2 then
		Button2Down();
	end
	if input5.KeyCode == Enum.KeyCode.M and script.Parent.GUI.MapVote.Visible == false then
		ToggleTeamSelection(false);
	end
	if input5.KeyCode == Enum.KeyCode.ButtonX then
		reloadwep();
	end
	if input5.KeyCode == Enum.KeyCode.ButtonL1 and t_Character and walking == false and bool6 == false then
		walking = true;
	end
	if input5.KeyCode == Enum.KeyCode.DPadDown then
		DropWep();
	end
	if input5.KeyCode == Enum.KeyCode.ButtonB and InvenFrame.Visible then
		if UserInputService_:GetLastInputType() == Enum.UserInputType.Gamepad1 then
			_gui.SelectedObject = t_Menew.MainFrame.Inventory;
		end
		InvenFrame.Visible = false;
	end
	if input5.KeyCode == Enum.KeyCode.ButtonR3 and str5 ~= "melee" then
		changeto(3);
	end
	if input5.KeyCode == Enum.KeyCode.DPadLeft then
		spawn(function() -- Line: 4086
			--[[
				Upvalues:
					[1] = UserInputService_
			--]]
			wait(0.18);
			if UserInputService_:IsKeyDown(Enum.KeyCode.DPadLeft) then
				changeto(4);
			end
		end);
		if bool7 and Alive.Value then
			moveDown();
			makeVisible();
		end
	end
	if input5.KeyCode == Enum.KeyCode.DPadRight and bool7 and Alive.Value then
		moveUp();
		makeVisible();
	end
end);
CHwideness = 7;
Crosshairs = GUI:WaitForChild("Crosshairs");
Crosshair = Crosshairs:WaitForChild("Crosshair");
CrosshairCustom = GUI:WaitForChild("CrosshairCustom");
vipmenu = GUI:WaitForChild("vipmenu");
Preview = CrosshairCustom:WaitForChild("Crosshair");
CrosshairData = game.ReplicatedStorage.Events.DataFunction:InvokeServer({"GetCrosshair"});
if not CrosshairData then
	CrosshairData = {
		0,
		255,
		0,
		true,
		true,
		0,
		0,
		7
	};
end
if CrosshairData[9] == nil then
	CrosshairData[9] = 0;
end
cdynamic = CrosshairData[4];
cdot = CrosshairData[5];
cdecalch = CrosshairData[9];
CHtransparency = CrosshairData[6] and math.clamp(CrosshairData[6], 0, 10);
CHthicc = CrosshairData[7] and math.clamp(CrosshairData[7], 0, 10);
CHwideness = CrosshairData[8] and math.clamp(CrosshairData[8], 0, 10);
DefaultColor = Color3.new(0, 1, 0);
currentR = math.clamp(CrosshairData[1], 0, 255);
currentG = math.clamp(CrosshairData[2], 0, 255);
currentB = math.clamp(CrosshairData[3], 0, 255);
if cdecalch == nil then
	cdecalch = 0;
end
if cdynamic == false then
	CrosshairCustom.dynamic.Text = "OFF";
else
	CrosshairCustom.dynamic.Text = "ON";
end
if cdot == false then
	CrosshairCustom.dot.Text = "OFF";
	CrosshairCustom.Crosshair.Dot.Visible = false;
	Crosshair.Dot.Visible = false;
else
	CrosshairCustom.dot.Text = "ON";
	CrosshairCustom.Crosshair.Dot.Visible = true;
	Crosshair.Dot.Visible = true;
end
function decalIdFromAssetId(p93) -- Line: 4146
	--[[
		Upvalues:
			[1] = RunService
	--]]
	local v25 = 0;
	local MarketplaceService = game:GetService("MarketplaceService");
	local ProductInfo = MarketplaceService:GetProductInfo(p93);
	local num9 = 0;
	local tick_ret15 = tick();
	while true do
		v25 = v25 + 1;
		local v72 = p93 - v25;
		local ProductInfo2 = MarketplaceService:GetProductInfo(v72);
		RunService.Stepped:wait();
		if ProductInfo.Name == ProductInfo2.Name then
			return v72;
		end
		if tick() - tick_ret15 < 2 and ProductInfo.Name ~= ProductInfo2.Name then continue end
		return num9;
	end
end
CrosshairCustom.decalid.Text = cdecalch;
CrosshairData = {
	currentR,
	currentG,
	currentB,
	cdynamic,
	cdot,
	CHtransparency,
	CHthicc,
	CHwideness,
	cdecalch
};
if CHwideness == nil then
	CHwideness = 7;
end
function updatecrosshair() -- Line: 4170
	CrosshairData = {
		currentR,
		currentG,
		currentB,
		cdynamic,
		cdot,
		CHtransparency,
		CHthicc,
		CHwideness,
		cdecalch
	};
	local v26 = CrosshairData[1];
	local v27 = CrosshairData[2];
	local v28 = CrosshairData[3];
	local __ = CrosshairData[4];
	local v29 = CrosshairData[5];
	local v30 = CrosshairData[6];
	local v31 = CrosshairData[7];
	local v32 = CrosshairData[8];
	local v33 = CrosshairData[9];
	Crosshair.BottomFrame.BackgroundColor3 = Color3.fromRGB(v26, v27, v28);
	Crosshair.LeftFrame.BackgroundColor3 = Color3.fromRGB(v26, v27, v28);
	Crosshair.RightFrame.BackgroundColor3 = Color3.fromRGB(v26, v27, v28);
	Crosshair.TopFrame.BackgroundColor3 = Color3.fromRGB(v26, v27, v28);
	Crosshair.Dot.BackgroundColor3 = Color3.fromRGB(v26, v27, v28);
	Crosshair.BottomFrame.BorderColor3 = Color3.fromRGB(v26, v27, v28);
	Crosshair.LeftFrame.BorderColor3 = Color3.fromRGB(v26, v27, v28);
	Crosshair.RightFrame.BorderColor3 = Color3.fromRGB(v26, v27, v28);
	Crosshair.TopFrame.BorderColor3 = Color3.fromRGB(v26, v27, v28);
	Crosshair.Dot.BorderColor3 = Color3.fromRGB(v26, v27, v28);
	Crosshair.BottomFrame.BackgroundTransparency = v30;
	Crosshair.LeftFrame.BackgroundTransparency = v30;
	Crosshair.RightFrame.BackgroundTransparency = v30;
	Crosshair.TopFrame.BackgroundTransparency = v30;
	Crosshair.Dot.BackgroundTransparency = v30;
	Crosshair.BottomFrame.BorderSizePixel = v31;
	Crosshair.LeftFrame.BorderSizePixel = v31;
	Crosshair.RightFrame.BorderSizePixel = v31;
	Crosshair.TopFrame.BorderSizePixel = v31;
	Crosshair.Dot.BorderSizePixel = v31;
	Crosshair.RightFrame.Visible = true;
	Crosshair.LeftFrame.Visible = true;
	Crosshair.TopFrame.Visible = true;
	Crosshair.BottomFrame.Visible = true;
	if v29 then
		Crosshair.Dot.Visible = true;
	else
		Crosshair.Dot.Visible = false;
	end
	Crosshair.Center1.Visible = false;
	Crosshair.Center1.ImageTransparency = v30;
	Crosshair.Center1.ImageColor3 = Color3.fromRGB(v26, v27, v28);
	if v33 > 0 then
		Crosshair.RightFrame.Visible = false;
		Crosshair.LeftFrame.Visible = false;
		Crosshair.TopFrame.Visible = false;
		Crosshair.BottomFrame.Visible = false;
		Crosshair.Dot.Visible = false;
		Crosshair.Center1.Visible = true;
		Crosshair.Center1.Image = "rbxassetid://" .. v33;
	end
	Crosshair.BottomFrame.Position = UDim2.new(0, -1, 0, -(Preview.LeftFrame.Size.X.Offset + v32));
	Crosshair.LeftFrame.Position = UDim2.new(0, -(Preview.LeftFrame.Size.X.Offset + v32), 0, -1);
	Crosshair.RightFrame.Position = UDim2.new(0, v32, 0, -1);
	Crosshair.TopFrame.Position = UDim2.new(0, -1, 0, v32);
end
local bool31 = false;
function updatecrosshairpreview() -- Line: 4229
	--[[
		Upvalues:
			[1] = bool31
	--]]
	CrosshairData = {
		currentR,
		currentG,
		currentB,
		cdynamic,
		cdot,
		CHtransparency,
		CHthicc,
		CHwideness,
		cdecalch
	};
	local v34 = CrosshairData[1];
	local v35 = CrosshairData[2];
	local v36 = CrosshairData[3];
	dynamic = CrosshairData[4];
	local v37 = CrosshairData[5];
	local v38 = CrosshairData[6];
	local v39 = CrosshairData[7];
	local v40 = CrosshairData[8];
	local v41 = CrosshairData[9];
	local g_Preview = Preview;
	if bool31 == false then
		bool31 = true;
		CrosshairCustom.red.Text = v34;
		CrosshairCustom.blue.Text = v36;
		CrosshairCustom.green.Text = v35;
		CrosshairCustom.trans.Text = v38;
		CrosshairCustom.thickness.Text = v39;
		CrosshairCustom.spread.Text = v40;
	end
	g_Preview.BottomFrame.BackgroundColor3 = Color3.fromRGB(v34, v35, v36);
	g_Preview.LeftFrame.BackgroundColor3 = Color3.fromRGB(v34, v35, v36);
	g_Preview.RightFrame.BackgroundColor3 = Color3.fromRGB(v34, v35, v36);
	g_Preview.TopFrame.BackgroundColor3 = Color3.fromRGB(v34, v35, v36);
	g_Preview.Dot.BackgroundColor3 = Color3.fromRGB(v34, v35, v36);
	g_Preview.BottomFrame.BorderColor3 = Color3.fromRGB(v34, v35, v36);
	g_Preview.LeftFrame.BorderColor3 = Color3.fromRGB(v34, v35, v36);
	g_Preview.RightFrame.BorderColor3 = Color3.fromRGB(v34, v35, v36);
	g_Preview.TopFrame.BorderColor3 = Color3.fromRGB(v34, v35, v36);
	g_Preview.Dot.BorderColor3 = Color3.fromRGB(v34, v35, v36);
	g_Preview.BottomFrame.BackgroundTransparency = v38;
	g_Preview.LeftFrame.BackgroundTransparency = v38;
	g_Preview.RightFrame.BackgroundTransparency = v38;
	g_Preview.TopFrame.BackgroundTransparency = v38;
	g_Preview.Dot.BackgroundTransparency = v38;
	g_Preview.BottomFrame.BorderSizePixel = v39;
	g_Preview.LeftFrame.BorderSizePixel = v39;
	g_Preview.RightFrame.BorderSizePixel = v39;
	g_Preview.TopFrame.BorderSizePixel = v39;
	g_Preview.Dot.BorderSizePixel = v39;
	g_Preview.RightFrame.Visible = true;
	g_Preview.LeftFrame.Visible = true;
	g_Preview.TopFrame.Visible = true;
	g_Preview.BottomFrame.Visible = true;
	g_Preview.Dot.Visible = v37 and true or false;
	g_Preview.Center1.Visible = false;
	g_Preview.Center1.ImageTransparency = v38;
	g_Preview.Center1.ImageColor3 = Color3.fromRGB(v34, v35, v36);
	if v41 > 0 then
		g_Preview.RightFrame.Visible = false;
		g_Preview.LeftFrame.Visible = false;
		g_Preview.TopFrame.Visible = false;
		g_Preview.BottomFrame.Visible = false;
		g_Preview.Dot.Visible = false;
		g_Preview.Center1.Visible = true;
		g_Preview.Center1.Image = "rbxassetid://" .. v41;
		local v73 = (v40 + g_Preview.RightFrame.Size.X.Offset + g_Preview.RightFrame.BorderSizePixel) * 2;
		g_Preview.Center1.Size = UDim2.new(0, v73, 0, v73);
		g_Preview.Center1.Position = UDim2.new(0, -v73 / 2, 0, -v73 / 2);
	end
	g_Preview.BottomFrame.Position = UDim2.new(0, -1, 0, -(Preview.LeftFrame.Size.X.Offset + v40));
	g_Preview.LeftFrame.Position = UDim2.new(0, -(Preview.LeftFrame.Size.X.Offset + v40), 0, -1);
	g_Preview.RightFrame.Position = UDim2.new(0, v40, 0, -1);
	g_Preview.TopFrame.Position = UDim2.new(0, -1, 0, v40);
end
updatecrosshair();
updatecrosshairpreview();
function onChangedR(p94) -- Line: 4302
	currentR = p94;
	updatecrosshairpreview();
	updatecrosshair();
end
CrosshairCustom.red.Changed:connect(function() -- Line: 4309
	local tonumber_ret = tonumber(CrosshairCustom.red.Text);
	if tonumber_ret == nil then return end
	local math_clamp_ret = math.clamp(tonumber_ret, 0, 255);
	CrosshairCustom.red.Text = math_clamp_ret;
	onChangedR(math_clamp_ret);
end);
function onChangedG(p95) -- Line: 4316
	currentG = p95;
	updatecrosshairpreview();
	updatecrosshair();
end
CrosshairCustom.green.Changed:connect(function() -- Line: 4322
	local tonumber_ret2 = tonumber(CrosshairCustom.green.Text);
	if tonumber_ret2 == nil then return end
	local math_clamp_ret2 = math.clamp(tonumber_ret2, 0, 255);
	CrosshairCustom.green.Text = math_clamp_ret2;
	onChangedG(math_clamp_ret2);
end);
function onChangedB(p96) -- Line: 4329
	currentB = p96;
	updatecrosshairpreview();
	updatecrosshair();
end
CrosshairCustom.blue.Changed:connect(function() -- Line: 4335
	local tonumber_ret3 = tonumber(CrosshairCustom.blue.Text);
	if tonumber_ret3 == nil then return end
	local math_clamp_ret3 = math.clamp(tonumber_ret3, 0, 255);
	CrosshairCustom.blue.Text = math_clamp_ret3;
	onChangedB(math_clamp_ret3);
end);
local function onChangedSpread(p97) -- Line: 4343
	CHwideness = p97;
	updatecrosshairpreview();
	updatecrosshair();
end
CrosshairCustom.spread.Changed:connect(function() -- Line: 4349
	local tonumber_ret4 = tonumber(CrosshairCustom.spread.Text);
	if tonumber_ret4 == nil then return end
	CHwideness = math.clamp(tonumber_ret4, 0, 10);
	updatecrosshairpreview();
	updatecrosshair();
end);
function onChangedthicc(p98) -- Line: 4356
	CHthicc = p98;
	updatecrosshairpreview();
	updatecrosshair();
end
CrosshairCustom.thickness.Changed:connect(function() -- Line: 4362
	local tonumber_ret5 = tonumber(CrosshairCustom.thickness.Text);
	if tonumber_ret5 == nil then return end
	local math_clamp_ret4 = math.clamp(tonumber_ret5, 0, 10);
	onChangedthicc(math_clamp_ret4);
end);
function onChangedtrans(p99) -- Line: 4369
	CHtransparency = p99 / 10;
	updatecrosshairpreview();
	updatecrosshair();
end
CrosshairCustom.trans.Changed:connect(function() -- Line: 4375
	local tonumber_ret6 = tonumber(CrosshairCustom.trans.Text);
	if tonumber_ret6 == nil then return end
	local math_clamp_ret5 = math.clamp(tonumber_ret6, 0, 10);
	onChangedtrans(math_clamp_ret5);
end);
CrosshairCustom.toggledynamic.MouseButton1Down:connect(function() -- Line: 4382
	if cdynamic then
		cdynamic = false;
		CrosshairCustom.dynamic.Text = "OFF";
	else
		cdynamic = true;
		CrosshairCustom.dynamic.Text = "ON";
	end
	updatecrosshairpreview();
	updatecrosshair();
end);
CrosshairCustom.toggledot.MouseButton1Down:connect(function() -- Line: 4393
	if cdot then
		cdot = false;
		CrosshairCustom.dot.Text = "OFF";
		CrosshairCustom.Crosshair.Dot.Visible = false;
		Crosshair.Dot.Visible = false;
	else
		cdot = true;
		CrosshairCustom.dot.Text = "ON";
		CrosshairCustom.Crosshair.Dot.Visible = true;
		Crosshair.Dot.Visible = true;
	end
	updatecrosshair();
	updatecrosshairpreview();
end);
CrosshairCustom.decalid.FocusLost:connect(function() -- Line: 4408
	cdecalch = 0;
	if tonumber(CrosshairCustom.decalid.Text) and tonumber(CrosshairCustom.decalid.Text) > 0 then
		cdecalch = decalIdFromAssetId(tonumber(CrosshairCustom.decalid.Text));
	end
	CrosshairCustom.decalid.Text = cdecalch;
	updatecrosshairpreview();
	updatecrosshair();
end);
game.ReplicatedStorage.Voten.Changed:Connect(function() -- Line: 4418
	wait();
	script.Parent.CBScoreboard.Gimmie:Fire(game.ReplicatedStorage.Voten.Value);
end);
if game.ReplicatedStorage.Voten.Value == true then
	script.Parent.CBScoreboard.Gimmie:Fire(true);
	if script.Parent.GUI.TeamSelection.Visible then
		ToggleTeamSelection();
	end
end
CircleI = Buymenuframe:WaitForChild("Circle");
CircleChildren = CircleI:GetChildren();
CurrentlyHighlighted = nil;
Base = Buymenuframe:WaitForChild("Base");
Outline = Base:WaitForChild("Outline");
AutoBuy = Outline:WaitForChild("AutoBuy");
BuyPrev = Outline:WaitForChild("BuyPrev");
Close = Outline:WaitForChild("Close");
List = Buymenuframe:WaitForChild("List");
GunStats = Buymenuframe:WaitForChild("GunStats");
GetIcon = require(game.ReplicatedStorage.GetIcon);
GetPrice = require(game.ReplicatedStorage.GetPrices);
GetName = require(game.ReplicatedStorage.GetTrueName);
Selected = {
	"http://www.roblox.com/asset/?id=904060545",
	"http://www.roblox.com/asset/?id=904060701",
	"http://www.roblox.com/asset/?id=903254694",
	"http://www.roblox.com/asset/?id=904060859",
	"http://www.roblox.com/asset/?id=904061070",
	"http://www.roblox.com/asset/?id=903255023"
};
Normal = {
	"rbxassetid://903202701",
	"rbxassetid://903203419",
	"rbxassetid://903254782",
	"rbxassetid://903203657",
	"rbxassetid://903203827",
	"rbxassetid://903254934"
};
ColorOBJs = {
	CircleI,
	AutoBuy,
	BuyPrev,
	Close
};
Colors = {
	T = {
		Color3.fromRGB(123, 110, 83),
		Color3.fromRGB(255, 205, 88)
	},
	CT = {
		Color3.fromRGB(112, 125, 134),
		Color3.fromRGB(255, 229, 192)
	}
};
Directories = {
	"Pistols",
	"Heavy",
	"SMGs",
	"Rifles",
	"Gear",
	"Grenades"
};
TDeag = "DesertEagle";
TTacticalPistol = "Tec9";
TTacticalSMG = "MP7";
CTDeag = "DesertEagle";
CTacticalSMG = "MP7";
CTPrimaryPistol = "P2000";
CTTacticalPistol = "FiveSeven";
CTPrimary = "M4A4";
function updateloadout() -- Line: 4474
	ButtonsT = {
		Pistols = {
			"Glock",
			"DualBerettas",
			"P250",
			TTacticalPistol,
			TDeag
		},
		Heavy = {
			"Nova",
			"XM",
			"SawedOff",
			"M249",
			"Negev"
		},
		SMGs = {
			"MAC10",
			TTacticalSMG,
			"UMP",
			"P90",
			"Bizon"
		},
		Rifles = {
			"Galil",
			"AK47",
			"Scout",
			"SG",
			"AWP",
			"G3SG1"
		},
		Gear = {
			"Kevlar Vest",
			"Kevlar + Helmet",
			"Zeus"
		},
		Grenades = {
			"Molotov",
			"Decoy Grenade",
			"Flashbang",
			"HE Grenade",
			"Smoke Grenade"
		}
	};
	ButtonsCT = {
		Pistols = {
			CTPrimaryPistol,
			"DualBerettas",
			"P250",
			CTTacticalPistol,
			CTDeag
		},
		Heavy = {
			"Nova",
			"XM",
			"MAG7",
			"M249",
			"Negev"
		},
		SMGs = {
			"MP9",
			CTacticalSMG,
			"UMP",
			"P90",
			"Bizon"
		},
		Rifles = {
			"Famas",
			CTPrimary,
			"Scout",
			"AUG",
			"AWP",
			"G3SG1"
		},
		Gear = {
			"Kevlar Vest",
			"Kevlar + Helmet",
			"Zeus",
			"Defuse Kit"
		},
		Grenades = {
			"Incendiary Grenade",
			"Decoy Grenade",
			"Flashbang",
			"HE Grenade",
			"Smoke Grenade"
		}
	};
end
updateloadout();
Directory = "Menu";
BuyMenuOpen = false;
Team = t_LocalPlayer.Status.Team;
selectedteam = Colors[Team.Value];
if Team.Value ~= "CT" then
	selectedteam = Colors.T;
end
cash = player.Cash;
game.Workspace.Status.BuyTime.Changed:connect(function(property3) -- Line: 4500
	if property3 <= 0 then
		BuyMenuOpen = false;
		Buymenuframe.Visible = false;
	end
end);
local bool32 = false;
function Click(p100) -- Line: 4509
	--[[
		Upvalues:
			[1] = t_LocalPlayer
			[2] = bool32
			[3] = u14
			[4] = u16
			[5] = u17
			[6] = m_Sound
			[7] = t_CurrentCamera2
			[8] = u26
			[9] = u31
			[10] = str5
			[11] = u25
			[12] = u29
			[13] = u13
			[14] = u18
			[15] = u19
			[16] = u20
	--]]
	if game.ReplicatedStorage.gametype.Value == "juggernaut" and t_LocalPlayer.Status.Team.Value == "T" then return end
	if Directory == "Menu" then
		Directory = Directories[p100];
		List.Visible = false;
		local v74 = Team.Value == "CT" and ButtonsCT[Directory] or ButtonsT[Directory];
		for index32 = 1, #CircleChildren do
			CircleChildren[index32].TextLabel.Visible = false;
			CircleChildren[index32].WeaponLabel.Visible = true;
			CircleChildren[index32].Icon.Visible = true;
			if v74[tonumber(CircleChildren[index32].Name)] then
				local v139 = v74[tonumber(CircleChildren[index32].Name)];
				local v140 = GetPrice.getprice(v139);
				local bool40 = false;
				local bool41 = false;
				if not player or not player:FindFirstChild("Kevlar") or player.Kevlar.Value < 100 then
					bool40 = true;
				end
				if not player or not player:FindFirstChild("Helmet") then
					bool41 = true;
				end
				local __ = v139 == "Defuse Kit";
				if v139 == "Kevlar + Helmet" then
					v140 = 0;
					if bool41 == true then
						v140 = v140 + 350;
					end
					if bool40 == true then
						v140 = v140 + 650;
					end
					if v140 == 0 then
						v140 = 1000;
					end
				end
				CircleChildren[index32].WeaponLabel.Text = "$" .. v140;
				if game.ReplicatedStorage.Weapons:FindFirstChild(v139) or v139 == "Kevlar Vest" or v139 == "Kevlar + Helmet" or v139 == "Defuse Kit" then
					if v140 <= player.Cash.Value then
						CircleChildren[index32].Icon.ImageColor3 = Color3.new(1, 1, 1);
						CircleChildren[index32].WeaponLabel.TextColor3 = Color3.new(1, 1, 1);
					else
						CircleChildren[index32].Icon.ImageColor3 = Color3.new(0.5, 0.5, 0.5);
						CircleChildren[index32].WeaponLabel.TextColor3 = Color3.fromRGB(180, 60, 90);
					end
				else
					CircleChildren[index32].Icon.ImageColor3 = Color3.new(0.25, 0.25, 0.25);
					CircleChildren[index32].WeaponLabel.TextColor3 = Color3.fromRGB(50, 50, 50);
				end
				CircleChildren[index32].Icon.Image = GetIcon.getWeaponOfKiller(v74[tonumber(CircleChildren[index32].Name)]);
				CircleChildren[index32].Icon.Visible = true;
			else
				CircleChildren[index32].WeaponLabel.Text = "";
				CircleChildren[index32].Icon.Visible = false;
			end
		end
	else
		if bool32 == true then return end
		local v75 = Team.Value == "CT" and ButtonsCT[Directory] or ButtonsT[Directory];
		local bool33 = false;
		local bool34 = false;
		if not player or not player:FindFirstChild("Kevlar") or player.Kevlar.Value < 100 then
			bool33 = true;
		end
		if not player or not player:FindFirstChild("Helmet") then
			bool34 = true;
		end
		local u48 = v75[p100];
		local u49 = GetPrice.getprice(u48);
		local __ = u48 == "Defuse Kit";
		if u48 == "Kevlar + Helmet" then
			u49 = 0;
			if bool33 == true then
				u49 = u49 + 650;
			end
			if bool34 == true then
				u49 = u49 + 350;
			end
		end
		if (u49 <= cash.Value or game.ReplicatedStorage.Warmup.Value == true or game.ReplicatedStorage.gametype.Value == "deathmatch" and Directory ~= "Grenades") and (Directory == "Grenades" and grenadeallowed(u48) == true or Directory ~= "Grenades") then
			local __ = game.ReplicatedStorage.Warmup.Value == true;
			local __ = cash.Value;
			local bool35 = false;
			local bool36 = false;
			pcall(function() -- Line: 4580
				--[[
					Upvalues:
						[1] = u48
						[2] = u14
						[3] = bool36
						[4] = u16
						[5] = bool35
						[6] = bool33
						[7] = bool34
						[8] = u17
						[9] = bool32
						[10] = p100
						[11] = u49
						[12] = m_Sound
						[13] = t_CurrentCamera2
						[14] = u26
						[15] = u31
						[16] = str5
						[17] = u25
						[18] = u29
						[19] = u13
						[20] = u18
						[21] = u19
						[22] = u20
				--]]
				if game.ReplicatedStorage.Weapons:FindFirstChild(u48) and game.ReplicatedStorage.Weapons:FindFirstChild(u48):FindFirstChild("Primary") and u14 ~= u48 then
					bool36 = true;
				end
				if game.ReplicatedStorage.Weapons:FindFirstChild(u48) and game.ReplicatedStorage.Weapons:FindFirstChild(u48):FindFirstChild("Secondary") and u16 ~= u48 then
					bool35 = true;
				end
				local bool37 = false;
				local bool38 = false;
				if u48 == "Defuse Kit" and player and player:FindFirstChild("DefuseKit") == nil or u48 == "Kevlar Vest" and bool33 == true or u48 == "Kevlar + Helmet" and (bool33 == true or bool34 == true) then
					bool37 = true;
				end
				if Directory == "Grenades" and game.ReplicatedStorage.Weapons:FindFirstChild(u48) and game.ReplicatedStorage.Weapons:FindFirstChild(u48):FindFirstChild("Grenade") and u17 ~= u48 then
					bool38 = true;
				end
				if bool36 == true or bool35 == true or bool37 == true or bool38 == true then
					bool32 = true;
					local t_TextColor3 = CircleI:FindFirstChild(tostring(p100)).WeaponLabel.TextColor3;
					CircleI:FindFirstChild(tostring(p100)).WeaponLabel.TextColor3 = Color3.fromRGB(50, 150, 50);
					if game.ReplicatedStorage.Warmup.Value == false and game.ReplicatedStorage.gametype.Value ~= "deathmatch" then
						local cash_Value = cash.Value;
						cash.Value = math.max(0, cash.Value - u49);
						m_Sound.playsound(script.Parent.Buy);
						if cash_Value == cash.Value and string.len(game.VIPServerId) < 1 then
							game.ReplicatedStorage.Moolah:InvokeServer();
						end
						game.ReplicatedStorage.Events.RemoteEvent:FireServer({
							"buyweapon",
							u48
						});
						local tick_ret16 = tick();
						repeat
							wait();
						until u48 ~= "Defuse Kit" and u48 ~= "Kevlar + Helmet" and u48 ~= "Kevlar Vest" or tick() - tick_ret16 >= 1 or u48 == "Defuse Kit" and player:FindFirstChild("DefuseKit") or u48 == "Kevlar + Helmet" and player:FindFirstChild("Helmet") or u48 == "Kevlar Vest" and player:FindFirstChild("Kevlar");
					end
					bool32 = false;
					CircleI:FindFirstChild(tostring(p100)).WeaponLabel.TextColor3 = t_TextColor3;
				end
				if bool35 == true then
					if u16 ~= "" then
						game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u16], t_CurrentCamera2.CFrame, u26, u31, special2, nil, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
					end
					special2 = false;
					u16 = u48;
					u26 = game.ReplicatedStorage.Weapons[u16].Ammo.Value;
					u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
					gun = game.ReplicatedStorage.Weapons[u16];
					str5 = "secondary";
					updateInventory();
					secondaryowner = game.Players.LocalPlayer;
					changeto(2);
					usethatgun(secondaryowner);
				end
				if bool36 == true then
					if u14 ~= "" then
						game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons[u14], t_CurrentCamera2.CFrame, u25, u29, special, primaryowner, game.Workspace.Status.Preparation.Value, game.Workspace.Status.RoundOver.Value, nil);
					end
					special = false;
					u13 = u48;
					u14 = u13;
					u25 = game.ReplicatedStorage.Weapons[u13].Ammo.Value;
					u29 = game.ReplicatedStorage.Weapons[u13].StoredAmmo.Value;
					gun = game.ReplicatedStorage.Weapons[u13];
					str5 = "primary";
					updateInventory();
					primaryowner = player;
					changeto(1);
					usethatgun(primaryowner);
				end
				if bool38 and game.ReplicatedStorage.gametype.Value ~= "deathmatch" then
					local bool39 = false;
					if u17 == "" and bool39 == false then
						bool39 = true;
						u17 = u48;
						gun = game.ReplicatedStorage.Weapons[u17];
						str5 = "grenade";
						updateInventory();
						changeto(4);
						usethatgun();
					end
					if u18 == "" and bool39 == false then
						bool39 = true;
						u18 = u48;
						gun = game.ReplicatedStorage.Weapons[u18];
						str5 = "grenade2";
						updateInventory();
						changeto(5);
						usethatgun();
					end
					if u19 == "" and bool39 == false then
						bool39 = true;
						u19 = u48;
						gun = game.ReplicatedStorage.Weapons[u19];
						str5 = "grenade3";
						updateInventory();
						changeto(6);
						usethatgun();
					end
					if u20 == "" and bool39 == false then
						u20 = u48;
						gun = game.ReplicatedStorage.Weapons[u20];
						str5 = "grenade4";
						updateInventory();
						changeto(7);
						usethatgun();
					end
				end
			end);
		end
	end
end
function Back() -- Line: 4677
	for index14 = 1, #ColorOBJs do
		ColorOBJs[index14].ImageColor3 = selectedteam[1];
	end
	if Directory == "Menu" then
		BuyMenuOpen = false;
		Buymenuframe.Visible = false;
		return;
	end
	Directory = "Menu";
	List.Visible = true;
	GunStats.Visible = false;
	local Children15 = List:GetChildren();
	for index15 = 1, #Children15 do
		if Children15[index15].Name ~= "TextLabel" then
			Children15[index15]:Destroy();
		end
	end
	for index16 = 1, #CircleChildren do
		CircleChildren[index16].TextLabel.Visible = true;
		CircleChildren[index16].WeaponLabel.Visible = false;
		CircleChildren[index16].Icon.Visible = false;
		CircleChildren[index16].Icon.ImageColor3 = Color3.new(1, 1, 1);
		if Directories[tonumber(CircleChildren[index16].Name)] then
			local v108 = Directories[tonumber(CircleChildren[index16].Name)];
			CircleChildren[index16].TextLabel.Text = v108;
		else
			CircleChildren[index16].TextLabel.Text = "";
		end
	end
end
function Mouseoverpreview(p101) -- Line: 4707
	if Directory == "Menu" then
		local v76 = Directories[p101];
		local v77 = Team.Value == "CT" and ButtonsCT[v76] or ButtonsT[v76];
		local Children20 = List:GetChildren();
		for index33 = 1, #Children20 do
			if Children20[index33].Name ~= "TextLabel" then
				Children20[index33]:Destroy();
			end
		end
		local v78 = 0.105;
		for index34 = 1, #v77 do
			local Clone_ret6 = script.GunLabelTemplate:Clone();
			Clone_ret6.TextLabel.Text = GetName.getName(v77[index34]);
			Clone_ret6.Pic.Image = GetIcon.getWeaponOfKiller(v77[index34]);
			Clone_ret6.Position = UDim2.new(0.04, 0, v78, 0);
			Clone_ret6.Visible = true;
			Clone_ret6.Parent = List;
			v78 = v78 + 0.1;
		end
	else
		GunStats.Visible = true;
		local v79 = (Team.Value == "CT" and ButtonsCT[Directory] or ButtonsT[Directory])[p101];
		local stats = GetPrice.getstats(v79);
		local Name = GetName.getName(v79);
		if v79 then
			GunStats.TextLabel.Text = "Statistics - " .. Name;
			GunStats.GunLabel.Pic.Image = stats[1];
			local v109 = stats[2];
			local v110 = stats[3];
			local v111 = stats[4];
			local v112 = stats[5];
			local Children16 = GunStats.FP:GetChildren();
			if v109 and v110 and v111 and v112 then
				for index59 = 1, #Children16 do
					if Children16[index59]:IsA("Frame") then
						if tonumber(Children16[index59].Name) <= v109 then
							Children16[index59].Visible = true;
						else
							Children16[index59].Visible = false;
						end
					end
				end
				local Children17 = GunStats.FR:GetChildren();
				for index60 = 1, #Children17 do
					if Children17[index60]:IsA("Frame") then
						if tonumber(Children17[index60].Name) <= v110 then
							Children17[index60].Visible = true;
						else
							Children17[index60].Visible = false;
						end
					end
				end
				local Children18 = GunStats.AC:GetChildren();
				for index61 = 1, #Children18 do
					if Children18[index61]:IsA("Frame") then
						if tonumber(Children18[index61].Name) <= v111 then
							Children18[index61].Visible = true;
						else
							Children18[index61].Visible = false;
						end
					end
				end
				local Children19 = GunStats.R:GetChildren();
				for index62 = 1, #Children19 do
					if Children19[index62]:IsA("Frame") then
						if tonumber(Children19[index62].Name) <= v112 then
							Children19[index62].Visible = true;
						else
							Children19[index62].Visible = false;
						end
					end
				end
				GunStats.Ammo.Label.Text = game.ReplicatedStorage.Weapons[v79].Ammo.Value .. "/" .. game.ReplicatedStorage.Weapons[v79].StoredAmmo.Value;
				GunStats.Special.Label.Text = stats[7];
				GunStats.Country.TextLabel.Text = stats[8];
			end
			local bool42 = true;
			if stats[9] then
				bool42 = false;
				GunStats.Desc.Desc.Text = stats[9];
			end
			GunStats.AC.Visible = bool42;
			GunStats.Ammo.Visible = bool42;
			GunStats.Country.Visible = bool42;
			GunStats.FP.Visible = bool42;
			GunStats.FR.Visible = bool42;
			GunStats.R.Visible = bool42;
			GunStats.Special.Visible = bool42;
			GunStats.Desc.Visible = not bool42;
		end
	end
end
for index1 = 1, #CircleChildren do
	table.insert(ColorOBJs, 1, CircleChildren[index1]);
	CircleChildren[index1].Hitbox.MouseEnter:connect(function() -- Line: 4818
		--[[
			Upvalues:
				[1] = index1
		--]]
		if UserInputService.GamepadEnabled == false then
			if CurrentlyHighlighted then
				CurrentlyHighlighted.ImageColor3 = selectedteam[1];
				CurrentlyHighlighted.Image = Normal[tonumber(CurrentlyHighlighted.Name)];
			end
			CurrentlyHighlighted = CircleChildren[index1];
			CurrentlyHighlighted.ImageColor3 = selectedteam[2];
			CurrentlyHighlighted.Image = Selected[tonumber(CurrentlyHighlighted.Name)];
			Mouseoverpreview(tonumber(CircleChildren[index1].Name));
		end
	end);
	CircleChildren[index1].Hitbox.MouseLeave:connect(function() -- Line: 4831
		--[[
			Upvalues:
				[1] = index1
		--]]
		if CircleChildren[index1] == CurrentlyHighlighted then
			CurrentlyHighlighted.ImageColor3 = selectedteam[1];
			CurrentlyHighlighted.Image = Normal[tonumber(CurrentlyHighlighted.Name)];
		end
	end);
	CircleChildren[index1].Hitbox.MouseButton1Down:connect(function() -- Line: 4837
		--[[
			Upvalues:
				[1] = m_Sound
				[2] = index1
		--]]
		m_Sound.playsound(script.Parent.Sounds.MenuClick);
		Click(tonumber(CircleChildren[index1].Name));
	end);
end
UserInputService = game:GetService("UserInputService");
local num10 = nil;
local u36 = nil;
local function GP_UpdateBuyMenu(p102) -- Line: 4846
	--[[
		Upvalues:
			[1] = u36
			[2] = m_Sound
	--]]
	if u36 ~= p102 then
		for __, child8 in pairs(Buymenuframe.Circle:GetChildren()) do
			if not child8:IsA("ImageLabel") then continue end
			child8.ImageColor3 = selectedteam[1];
		end
		m_Sound.playsound(script.Parent.Menu_Select);
	end
	p102.ImageColor3 = Color3.new(1, 1, 1);
	u36 = p102;
end
UserInputService.InputChanged:Connect(function(input6) -- Line: 4859
	--[[
		Upvalues:
			[1] = num10
			[2] = GP_UpdateBuyMenu
	--]]
	if input6.KeyCode == Enum.KeyCode.Thumbstick1 and BuyMenuOpen then
		if input6.Position.X <= -0.75 and math.abs(input6.Position.Y) <= 0.3 then
			num10 = 6;
			Mouseoverpreview(6);
			_gui.SelectedObject = Buymenuframe.Circle[num10].Hitbox;
			GP_UpdateBuyMenu(Buymenuframe.Circle[num10]);
			return;
		end
		if input6.Position.X >= 0.75 and math.abs(input6.Position.Y) <= 0.3 then
			num10 = 3;
			Mouseoverpreview(3);
			_gui.SelectedObject = Buymenuframe.Circle[num10].Hitbox;
			GP_UpdateBuyMenu(Buymenuframe.Circle[num10]);
			return;
		end
		if input6.Position.X >= -0.75 and input6.Position.X < 0 and input6.Position.Y > 0.5 then
			num10 = 1;
			Mouseoverpreview(1);
			_gui.SelectedObject = Buymenuframe.Circle[num10].Hitbox;
			GP_UpdateBuyMenu(Buymenuframe.Circle[num10]);
			return;
		end
		if input6.Position.X > 0 and input6.Position.X <= 0.75 and input6.Position.Y > 0.5 then
			num10 = 2;
			Mouseoverpreview(2);
			_gui.SelectedObject = Buymenuframe.Circle[num10].Hitbox;
			GP_UpdateBuyMenu(Buymenuframe.Circle[num10]);
			return;
		end
		if input6.Position.X >= -0.75 and input6.Position.X < 0 and input6.Position.Y < 0.5 then
			num10 = 5;
			Mouseoverpreview(5);
			_gui.SelectedObject = Buymenuframe.Circle[num10].Hitbox;
			GP_UpdateBuyMenu(Buymenuframe.Circle[num10]);
			return;
		end
		if input6.Position.X > 0 and input6.Position.X <= 0.75 and input6.Position.Y < 0.5 then
			num10 = 4;
			Mouseoverpreview(4);
			_gui.SelectedObject = Buymenuframe.Circle[num10].Hitbox;
			GP_UpdateBuyMenu(Buymenuframe.Circle[num10]);
			return;
		end
		if math.abs(input6.Position.X) < 0.1 and math.abs(input6.Position.Y) < 0.1 then
			_gui.SelectedObject = nil;
		end
	end
end);
local function onInputBegan(p103, __) -- Line: 4897
	--[[
		Upvalues:
			[1] = GUI
			[2] = t_LocalPlayer
	--]]
	if script.Parent:FindFirstChild("GUI") and (script.Parent.GUI.Main.GlobalChat.ActiveOne.Value == true or script.Parent.GUI.Main.TeamChat.ActiveOne.Value == true) then return end
	if game.Workspace.Status.BuyTime.Value > 0 and p103.KeyCode == Enum.KeyCode.B or p103.KeyCode == Enum.KeyCode.ButtonX or p103.KeyCode == Enum.KeyCode.ButtonB and player and player.Status.Alive.Value == true and player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
		if GUI.Cash.BuyZone.Visible then
			if BuyMenuOpen then
				Back();
				return;
			end
			Buymenuframe.Visible = true;
			BuyMenuOpen = true;
			return;
		end
		BuyMenuOpen = false;
		Buymenuframe.Visible = false;
		return;
	end
	if p103.KeyCode == Enum.KeyCode.Quote then
		if CrosshairCustom.Visible then
			CrosshairCustom.Visible = false;
			game.ReplicatedStorage.Events.DataEvent:FireServer({
				"SaveCrosshair",
				CrosshairData
			});
			return;
		end
		CrosshairCustom.Visible = true;
		return;
	end
	if p103.KeyCode == Enum.KeyCode.Nine then
		local Players4 = game.Players:GetPlayers();
		local t_Value11 = game.ReplicatedStorage.Target.Value;
		if game.Players.LocalPlayer.Name == t_Value11 then return end
		local v80 = 0.1;
		GUI.Votekick.Folder:ClearAllChildren();
		GUI.Votekick.Visible = not GUI.Votekick.Visible;
		if not GUI.Votekick.Visible or t_Value11 ~= "" then
			local num11 = 0.1;
			local Clone_ret7 = script.VoteKickTemplate:Clone();
			Clone_ret7.Parent = GUI.Votekick.Folder;
			Clone_ret7.Visible = true;
			Clone_ret7.Position = UDim2.new(0, 0, num11, 0);
			local __ = num11 + v80;
			Clone_ret7.Text = t_Value11;
			Clone_ret7.Size = UDim2.new(1, 0, v80, 0);
			local math_random_ret3 = math.random(1, 255);
			local math_random_ret4 = math.random(1, 255);
			local math_random_ret5 = math.random(1, 255);
			Clone_ret7.BackgroundColor3 = Color3.fromRGB(math_random_ret3, math_random_ret4, math_random_ret5);
			Clone_ret7.MouseButton1Down:connect(function() -- Line: 4974
				--[[
					Upvalues:
						[1] = t_Value11
						[2] = GUI
				--]]
				game.ReplicatedStorage.Events.Vote:FireServer(t_Value11);
				GUI.Votekick.Visible = false;
			end);
			return;
		end
		if #Players4 > 9 then
			v80 = 0.9 / (#Players4 - 1);
		end
		local v81 = 0.1;
		for index35 = 1, #Players4 do
			if Players4[index35] ~= t_LocalPlayer then
				local Clone_ret8 = script.VoteKickTemplate:Clone();
				Clone_ret8.Parent = GUI.Votekick.Folder;
				Clone_ret8.Visible = true;
				Clone_ret8.Position = UDim2.new(0, 0, v81, 0);
				v81 = v81 + v80;
				Clone_ret8.Text = Players4[index35].Name;
				Clone_ret8.Size = UDim2.new(1, 0, v80, 0);
				local math_random_ret6 = math.random(1, 255);
				local math_random_ret7 = math.random(1, 255);
				local math_random_ret8 = math.random(1, 255);
				Clone_ret8.BackgroundColor3 = Color3.fromRGB(math_random_ret6, math_random_ret7, math_random_ret8);
				Clone_ret8.MouseButton1Down:connect(function() -- Line: 4954
					--[[
						Upvalues:
							[1] = Clone_ret8
							[2] = GUI
					--]]
					game.ReplicatedStorage.Events.Vote:FireServer(Clone_ret8.Text);
					GUI.Votekick.Visible = false;
				end);
			end
		end
	elseif p103.KeyCode == Enum.KeyCode.N and InvenFrame.Visible == false and GUI.ShopMenu.Visible == false then
		menugui.Enabled = not menugui.Enabled;
		if player.Status.Alive.Value == true then
			menugui.MainFrame.Back.ImageTransparency = 1;
			menugui.MainFrame.Back.BackgroundTransparency = 0.5;
			menugui.MainFrame.Info.Text = "Press 'N' again to quickly close this menu.";
			menugui.MainFrame.Info.Visible = true;
			menugui.MainFrame.PlayNow.TextLabel.Text = "RESUME";
			menugui.MainFrame.SkinShop.Active = false;
			menugui.MainFrame.SkinShop.Warn.Visible = true;
			return;
		end
		menugui.MainFrame.Back.ImageTransparency = 0;
		menugui.MainFrame.Back.BackgroundTransparency = 0;
		menugui.MainFrame.PlayNow.TextLabel.Text = "PLAY NOW";
		menugui.MainFrame.SkinShop.Active = true;
		menugui.MainFrame.SkinShop.Warn.Visible = false;
	end
end
Close.MouseButton1Down:connect(function() -- Line: 5002
	--[[
		Upvalues:
			[1] = m_Sound
	--]]
	m_Sound.playsound(script.Parent.Sounds.MenuClick);
	Back();
end);
UserInputService.InputBegan:connect(onInputBegan);
for index2 = 1, #ColorOBJs do
	ColorOBJs[index2].ImageColor3 = selectedteam[1];
end
Back();
Back();
function isHeadInWater(p104) -- Line: 5014
	--[[
		Upvalues:
			[1] = t_Character
	--]]
	if p104 ~= nil and p104:FindFirstChild("Head") then
		local workspace_Terrain = workspace.Terrain;
		local WorldToCell_ret2 = workspace_Terrain:WorldToCell(t_Character.Head.Position);
		local GetWaterCell_ret1_2, __, __ = workspace_Terrain:GetWaterCell(WorldToCell_ret2.x, WorldToCell_ret2.y, WorldToCell_ret2.z);
		return GetWaterCell_ret1_2;
	end
end
local __ = Crosshairs_.Crosshair;
local u38 = 0;
local u39 = t_CurrentCamera2.CFrame.lookVector.Y;
local t_Y3 = t_CurrentCamera2.CFrame.lookVector.Y;
local u40 = 0.5;
local num12 = 0.9;
function fullycrouched() -- Line: 5031
	--[[
		Upvalues:
			[1] = bool6
			[2] = u40
			[3] = num12
	--]]
	if crouchcooldown < 2 and bool6 == true and u40 <= 0.05 - num12 then
		return true;
	end
	return false;
end
function changeviewheight(p105) -- Line: 5036
	--[[
		Upvalues:
			[1] = u40
	--]]
	if u40 < p105 then
		u40 = math.min(p105, u40 + rstick * 0.05 * (4 / math.max(1, crouchcooldown)));
		return;
	end
	if p105 < u40 then
		u40 = math.max(p105, u40 - rstick * 0.04 * (4 / math.max(1, crouchcooldown)));
	end
end
function changeburstmode() -- Line: 5044
	--[[
		Upvalues:
			[1] = str5
			[2] = LoadAnimation_ret9
			[3] = LoadAnimation_ret10
			[4] = LoadAnimation_ret25
			[5] = RunService
			[6] = LoadAnimation_ret26
			[7] = t_Character
			[8] = m_Sound
	--]]
	local g_gun5 = gun;
	if DISABLED == true then return end
	if str5 == "primary" and gun ~= "none" and gun and gun.Model:FindFirstChild("Silencer2") then
		if LoadAnimation_ret9 then
			LoadAnimation_ret9:Stop();
		end
		if LoadAnimation_ret10 then
			LoadAnimation_ret10:Stop();
		end
		if special == true then
			if LoadAnimation_ret25 then
				LoadAnimation_ret25:Play();
				game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Apply");
			end
			DISABLED = true;
			local tick_ret22 = tick();
			repeat
				RunService.Stepped:wait();
				if gun ~= g_gun5 then return end
			until tick() - tick_ret22 >= gun.ApplyTime.Value;
			DISABLED = false;
		else
			if LoadAnimation_ret26 then
				LoadAnimation_ret26:Play();
				game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Remove");
			end
			DISABLED = true;
			local tick_ret21 = tick();
			repeat
				RunService.Stepped:wait();
				if gun ~= g_gun5 then return end
			until tick() - tick_ret21 >= gun.RemoveTime.Value;
			DISABLED = false;
		end
		special = not special;
		updatesilencer();
	end
	if str5 == "secondary" and gun ~= "none" and gun and gun.Model:FindFirstChild("Silencer2") then
		if LoadAnimation_ret9 then
			LoadAnimation_ret9:Stop();
		end
		if LoadAnimation_ret10 then
			LoadAnimation_ret10:Stop();
		end
		if special2 == true then
			if LoadAnimation_ret25 then
				LoadAnimation_ret25:Play();
				game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Apply");
			end
			DISABLED = true;
			local tick_ret20 = tick();
			repeat
				RunService.Stepped:wait();
				if gun ~= g_gun5 then return end
			until tick() - tick_ret20 >= gun.ApplyTime.Value;
			DISABLED = false;
		else
			if LoadAnimation_ret26 then
				LoadAnimation_ret26:Play();
				game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Remove");
			end
			DISABLED = true;
			local tick_ret19 = tick();
			repeat
				RunService.Stepped:wait();
				if gun ~= g_gun5 then return end
			until tick() - tick_ret19 >= gun.RemoveTime.Value;
			DISABLED = false;
		end
		special2 = not special2;
		updatesilencer();
	end
	if str5 == "primary" and gun ~= "none" and gun and gun.Model:FindFirstChild("Switch") then
		special = not special;
		if special == true then
			notify("Switched to burst-fire mode", 0.8);
		elseif special == false then
			notify("Switched to automatic", 0.8);
		end
		DISABLED = true;
		if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Switch") then
			m_Sound.rplaysound(t_Character.Gun.Switch);
		end
		local tick_ret18 = tick();
		repeat
			RunService.Stepped:wait();
			if gun ~= g_gun5 then return end
		until tick() - tick_ret18 >= 0.5;
		DISABLED = false;
	end
	if str5 == "secondary" and gun ~= "none" and gun and gun.Model:FindFirstChild("Switch") then
		special2 = not special2;
		if special2 == true then
			notify("Switched to burst-fire mode", 0.8);
		elseif special2 == false then
			notify("Switched to automatic", 0.8);
		end
		DISABLED = true;
		if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Switch") then
			local v113 = m_Sound.rplaysound(t_Character.Gun.Switch);
			v113.Parent = script.Parent.LocalSounds;
		end
		local tick_ret17 = tick();
		repeat
			RunService.Stepped:wait();
			if gun ~= g_gun5 then return end
		until tick() - tick_ret17 >= 0.5;
		DISABLED = false;
	end
end
function speedupdate() -- Line: 5126
	--[[
		Upvalues:
			[1] = t_Character
			[2] = t_LocalPlayer
			[3] = u11
			[4] = Humanoid
			[5] = str5
			[6] = LoadAnimation_ret12
	--]]
	if fgun ~= "none" and fgun and fgun.Name and game.ReplicatedStorage.HUInfo:FindFirstChild(fgun.Name) then
		local v82 = 1;
		local bool43 = false;
		local Crouched2 = t_Character:FindFirstChild("Crouched");
		if fgun.Name == "AWP" then
			bool43 = true;
		end
		curspd = game.ReplicatedStorage.HUInfo[fgun.Name].WalkSpeed.Value;
		if game.Workspace.Ray_Ignore:FindFirstChild(game.Players.LocalPlayer.Name) and curspd > 200 then
			curspd = 200;
		end
		t_Character:SetAttribute("Speed", curspd);
		if pulling == true then
			t_Character:SetAttribute("Speed", 180);
		end
		if game.ReplicatedStorage.gametype.Value == "juggernaut" and t_LocalPlayer.Status.Team.Value == "T" then
			t_Character:SetAttribute("Speed", t_Character:GetAttribute("Speed") * 0.8);
			if t_Character:FindFirstChild("Charging") then
				t_Character:SetAttribute("Speed", 650);
			end
		end
		if u11 == true then
			curspd = game.ReplicatedStorage.HUInfo[fgun.Name].Scoped.Value;
			t_Character:SetAttribute("Speed", curspd);
		end
		if not Crouched2 and not walking or (walking or Crouched2) and bool43 then
			v82 = v82 * (t_Character:GetAttribute("Speed") / 250);
		end
		local bool44 = false;
		if landing == true and jumping == false and tick() - lastlanded >= 0.05 then
			t_Character:SetAttribute("Speed", t_Character:GetAttribute("Speed") * 0.7);
		end
		if climbing == true then
			t_Character:SetAttribute("Speed", t_Character:GetAttribute("Speed") * 0.9);
			bool44 = true;
		else
			if jumping ~= true or landing ~= false then
				bool44 = true;
			end
			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
				t_Character:SetAttribute("Speed", t_Character:GetAttribute("Speed") * 0.9);
			end
		end
		if bool44 then
			if Crouched2 then
				if not bool43 then
					v82 = v82 * 0.34;
				end
				t_Character:SetAttribute("Speed", t_Character:GetAttribute("Speed") * 0.34);
			elseif walking == true then
				if not bool43 then
					v82 = v82 * 0.52;
				end
				t_Character:SetAttribute("Speed", t_Character:GetAttribute("Speed") * 0.52);
			end
		end
		t_Character:SetAttribute("Accl", v82);
	else
		t_Character:SetAttribute("Speed", 0);
	end
	if t_Character:FindFirstChild("Charging") == nil then
		local v83 = 1;
		local Children21 = Humanoid:GetChildren();
		for index36 = 1, #Children21 do
			if Children21[index36].Name == "Tagged" then
				v83 = v83 * (1 - Children21[index36].Value / 4);
			end
		end
		local math_max_ret = math.max(0.45, v83);
		if t_LocalPlayer.Status.Team.Value == "T" and game.ReplicatedStorage.gametype.Value == "juggernaut" then
			math_max_ret = math.max(0.6, math_max_ret);
		end
		t_Character:SetAttribute("Speed", (math.clamp(t_Character:GetAttribute("Speed"), 0, 300)));
		t_Character:SetAttribute("Speed", t_Character:GetAttribute("Speed") * math_max_ret);
	end
	if game.Workspace.Status.Preparation.Value == true then
		t_Character:SetAttribute("Speed", 0);
	end
	if str5 == "equipment2" and LoadAnimation_ret12 and LoadAnimation_ret12.IsPlaying == true then
		t_Character:SetAttribute("Speed", 0);
	end
	if Buymenuframe.Visible or t_LocalPlayer.PlayerGui.GUI.Defusal.Visible == true then
		t_Character:SetAttribute("Speed", 0);
	end
end
local bool45 = nil;
local u41 = 0;
local Alive2 = player:WaitForChild("Status"):WaitForChild("Alive");
local CanTalk = player:WaitForChild("Status"):WaitForChild("CanTalk");
local bool46 = false;
function chatMessage(p106, p107) -- Line: 5188
	--[[
		Upvalues:
			[1] = bool46
			[2] = m_Sound
			[3] = t_LocalPlayer
			[4] = SuitZoom
	--]]
	if bool46 == true then return end
	if p106 ~= "" then
		game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(string.sub(p106, 4), false, not player:WaitForChild("Status"):WaitForChild("Alive").Value, true, true);
	end
	if p107 then
		local v84 = p107:GetChildren()[math.random(1, #p107:GetChildren())];
		bool46 = true;
		delay(math.max(1, m_Sound.getlength(v84) + 1), function() -- Line: 5196
			--[[
				Upvalues:
					[1] = bool46
			--]]
			bool46 = false;
		end);
		game.ReplicatedStorage.Events.SendVoice:FireServer(v84, nil, nil);
	else
		bool46 = true;
		delay(1, function() -- Line: 5200
			--[[
				Upvalues:
					[1] = bool46
			--]]
			bool46 = false;
		end);
	end
	if t_LocalPlayer:FindFirstChild("Dux") then
		t_LocalPlayer.Dux:Destroy();
	end
	if t_LocalPlayer:FindFirstChild("Waiting") then
		t_LocalPlayer.Waiting:Destroy();
	end
	SuitZoom.Visible = false;
end
game.ReplicatedStorage.Events.SendVoice.OnClientEvent:connect(function(p108, p109) -- Line: 5207
	--[[
		Upvalues:
			[1] = t_LocalPlayer
			[2] = m_Sound
	--]]
	if not p108 then return end
	local t_Name3 = p108.Name;
	local FindFirstChild_ret3 = t_LocalPlayer.PlayerGui.LocalSounds:FindFirstChild(t_Name3);
	if FindFirstChild_ret3 then
		FindFirstChild_ret3:Stop();
		FindFirstChild_ret3:Destroy();
	end
	local v42 = m_Sound.playsound(p109, t_LocalPlayer.PlayerGui.LocalSounds);
	v42.Name = t_Name3;
end);
script.Defuse.Event:connect(function() -- Line: 5216
	chatMessage("1. I'm defusing the bomb.", game.ReplicatedStorage.Voices:FindFirstChild("CT").defuse);
end);
InvenFrame = GUI:WaitForChild("Inventory&Loadout");
Inventory = InvenFrame:WaitForChild("Inventory");
Loadout = InvenFrame:WaitForChild("Loadout");
ShopMenu = GUI:WaitForChild("ShopMenu").TempMenu;
CaseFrame = ShopMenu:WaitForChild("CaseFrame");
InvenFrame.Changed:connect(function(property4) -- Line: 5223
	if currentpage == nil then return end
	if property4 == "Visible" and InvenFrame.Visible == true then
		GeneratePage(currentpage);
		InvenFrame.Visible = true;
	end
end);
switchb = InvenFrame.Switch;
InvenFrame.Switch.MouseButton1Down:connect(function() -- Line: 5236
	if currentteam == "CT" then
		currentteam = "T";
	else
		currentteam = "CT";
	end
	switchb.Image = switchb[currentteam].Value;
	GeneratePage("All");
end);
InvenFrame.Switch.MouseEnter:connect(function() -- Line: 5241
	switchb.Image = switchb[currentteam .. "_Switch"].Value;
end);
InvenFrame.Switch.MouseLeave:connect(function() -- Line: 5242
	switchb.Image = switchb[currentteam].Value;
end);
function table2string(p110) -- Line: 5243
	local v43 = "";
	for index17 = 1, #p110 do
		v43 = v43 .. tostring(p110[index17]);
	end
	return v43;
end
game.ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent:Connect(function(p111, p112, p113) -- Line: 5252
	--[[
		Upvalues:
			[1] = u5
			[2] = u6
	--]]
	CurrentInventory = p111;
	u5 = p112;
	u6 = p113;
	task.wait(2);
	if CurrentInventory and u5 and u6 then
		GeneratePage("All");
	end
end);
FundsObj = player.SkinFolder.Funds;
FundsObj.Changed:connect(function() -- Line: 5263
	ShopMenu.FundsMenu.Funds.Text = FundsObj.Value;
	ShopMenu.CasePreview.Funds.Text = FundsObj.Value;
end);
ShopMenu.FundsMenu.Funds.Text = FundsObj.Value;
ShopMenu.CasePreview.Funds.Text = FundsObj.Value;
CaseSelected = false;
CurrentCase = nil;
openingcase = false;
ImageLibrary = script.Images;
ShopMenu.CasePreview.buy.MouseButton1Down:connect(function() -- Line: 5273
	if openingcase == false then
		openingcase = true;
		game.ReplicatedStorage.Events.DataEvent:FireServer({
			"BuyCase",
			CurrentCase
		});
	end
end);
ShopMenu.CasePreview.back.MouseButton1Down:connect(function() -- Line: 5279
	if not Requesting then
		ShopMenu.CasePreview.Visible = false;
		CaseSelected = false;
	end
end);
function tableContains(p114, p115) -- Line: 5286
	for __, val5 in pairs(p114) do
		if val5 ~= p115 then continue end
		return true;
	end
	return false;
end
game.ReplicatedStorage.Remotes.RSL.OnClientEvent:connect(function(p116) -- Line: 5291
	local table14 = {
		"Calc",
		"Calc1",
		"List",
		"reset",
		"Initialize",
		"Folder",
		"Pastebin"
	};
	if tableContains(table14, p116[1]) then
		for index37 = 2, 10 do
			if p116[index37] then
				print(p116[index37]);
			end
		end
	end
end);
function RequestSkins(p117, p118) -- Line: 5296
	local ShopMenu_CasePreview = ShopMenu.CasePreview;
	ShopMenu_CasePreview.Visible = true;
	if not Requesting and not CaseSelected then
		CurrentCase = p117;
		Requesting = true;
		CaseSelected = true;
		local Children22 = ShopMenu_CasePreview.PotentialSkins:GetChildren();
		for index38 = 1, #Children22 do
			if Children22[index38].ClassName ~= "UIGridLayout" then
				Children22[index38]:Destroy();
			end
		end
		local t_Case = ShopMenu_CasePreview.Case;
		t_Case.Price.Value = p118[3];
		t_Case.Image = p118[2];
		t_Case.Title.Text = CurrentCase;
		ShopMenu_CasePreview.buy.Text = "Buy for :" .. t_Case.Price.Value .. "$";
		local InvokeServer_ret1, InvokeServer_ret2 = game.ReplicatedStorage.Events.DataFunction:InvokeServer({
			"RequestCaseContents",
			p117
		});
		repeat
			wait();
		until InvokeServer_ret1 and InvokeServer_ret2;
		local __ = CaseFrame:GetChildren();
		local __ = {};
		local v85 = 0.025;
		local v86 = 0;
		local __ = {};
		local bool47 = true;
		local v87 = 1;
		local bool48 = true;
		while bool47 do
			if v87 == 6 then
				bool47 = false;
			end
			for index46 = 1, #InvokeServer_ret1 do
				local bool49 = false;
				if v87 == 1 then
					if InvokeServer_ret2[index46] == "Blue" then
						bool49 = true;
					end
				elseif v87 == 2 then
					if InvokeServer_ret2[index46] == "Purple" then
						bool49 = true;
					end
				elseif v87 == 3 then
					if InvokeServer_ret2[index46] == "Pink" then
						bool49 = true;
					end
				elseif v87 == 4 then
					if InvokeServer_ret2[index46] == "Red" then
						bool49 = true;
					end
				elseif v87 == 5 and bool48 then
					bool48 = false;
					local split_ret3 = split(InvokeServer_ret1[index46], "_");
					local __ = split_ret3[1];
					local __ = split_ret3[2];
					local Clone_ret10 = script.WeaponTemplate:Clone();
					Clone_ret10.Size = UDim2.new(0.2, 0, 0.3, 0);
					Clone_ret10.Parent = ShopMenu_CasePreview.PotentialSkins;
					Clone_ret10.Visible = true;
					Clone_ret10.Wep.Image = "http://www.roblox.com/asset/?id=537592824";
					Clone_ret10.NameLabel.Text = "Rare Knife";
					if p117 == "Karambit Case" then
						Clone_ret10.Wep.Image = "http://www.roblox.com/asset/?id=686454796";
						Clone_ret10.NameLabel.Text = "Rare Karambit Knife";
					elseif p117 == "Imaginem Case" then
						Clone_ret10.NameLabel.Text = "Rare Imaginem Knife";
					elseif p117 == "SCR Case" then
						Clone_ret10.NameLabel.Text = "Rare SCR Knife";
					elseif p117 == "Holiday Case 2" then
						Clone_ret10.Visible = false;
					elseif p117 == "Remastered Case" then
						Clone_ret10.NameLabel.Text = "Rare Gloves";
					end
					Clone_ret10.NameLabel.TextColor3 = Color3.new(1, 1, 0);
					v85 = v85 + 0.25;
					if v85 > 0.8 then
						v85 = 0.025;
						v86 = v86 + 0.35;
					end
				end
				if bool49 then
					local split_ret2 = split(InvokeServer_ret1[index46], "_");
					local v146 = split_ret2[1];
					local v147 = split_ret2[2];
					local Clone_ret9 = script.WeaponTemplate:Clone();
					Clone_ret9.Size = UDim2.new(0.2, 0, 0.3, 0);
					Clone_ret9.Parent = ShopMenu_CasePreview.PotentialSkins;
					Clone_ret9.Visible = true;
					local t_Value12 = ImageLibrary:FindFirstChild(v146).DisplayName.Value;
					Clone_ret9.Wep.Image = ImageLibrary:FindFirstChild(v146):FindFirstChild(v147).Value;
					Clone_ret9.NameLabel.Text = t_Value12 .. " | " .. v147;
					Clone_ret9.NameLabel.TextColor3 = script.Colors:FindFirstChild(InvokeServer_ret2[index46]).Value;
					v85 = v85 + 0.25;
					if v85 > 0.8 then
						v85 = 0.025;
						v86 = v86 + 0.29;
					end
				end
			end
			v87 = v87 + 1;
		end
		wait(0.1);
		Requesting = false;
	end
end
function RequestCases() -- Line: 5402
	local InvokeServer_ret1_2, InvokeServer_ret2_2, InvokeServer_ret3 = game.ReplicatedStorage.Events.DataFunction:InvokeServer({"RequestCases"});
	repeat
		wait();
	until InvokeServer_ret1_2 and InvokeServer_ret2_2;
	local v44 = 0;
	local v45 = 0;
	for index18 = 1, #InvokeServer_ret1_2 do
		local Clone_ret11 = script.Case:Clone();
		Clone_ret11.Price.Value = InvokeServer_ret3[index18];
		Clone_ret11.Parent = ShopMenu.CaseFrame;
		Clone_ret11.Image = InvokeServer_ret2_2[index18];
		Clone_ret11.Name = InvokeServer_ret1_2[index18];
		Clone_ret11.Title.Text = InvokeServer_ret1_2[index18];
		Clone_ret11.Position = UDim2.new(v44, 0, v45, 0);
		Clone_ret11.Visible = true;
		v44 = v44 + 0.25;
		if v44 >= 1 then
			v44 = 0;
			v45 = v45 + 0.35;
		end
		wait(0.05);
		Clone_ret11.MouseButton1Down:connect(function() -- Line: 5423
			--[[
				Upvalues:
					[1] = Clone_ret11
					[2] = InvokeServer_ret1_2
					[3] = index18
					[4] = InvokeServer_ret2_2
					[5] = InvokeServer_ret3
			--]]
			RequestSkins(Clone_ret11.Name, {
				InvokeServer_ret1_2[index18],
				InvokeServer_ret2_2[index18],
				InvokeServer_ret3[index18]
			});
		end);
	end
end
RequestCases();
local u42 = 0;
SkinWon = ShopMenu:WaitForChild("SkinWon");
function generate(p119, p120, p121, p122) -- Line: 5431
	--[[
		Upvalues:
			[1] = u42
	--]]
	Requesting = false;
	local clone_ret7 = script:WaitForChild("Skin"):clone();
	clone_ret7.Parent = ShopMenu.Wheel.Wheel;
	clone_ret7.Position = UDim2.new(0, u42 * 220 + 990, 0, 0);
	u42 = u42 + 1;
	clone_ret7:WaitForChild("Serial").Value = u42;
	clone_ret7.Visible = false;
	if clone_ret7.Serial.Value == 87 then
		clone_ret7.Visible = true;
	else
		local Children23 = game.ReplicatedStorage.Cases:GetChildren();
		local v88 = nil;
		for index39 = 1, #Children23 do
			if Children23[index39].Name == p122 then
				v88 = Children23[index39];
			end
		end
		local table15 = {};
		local table16 = {};
		local table17 = {};
		local table18 = {};
		if v88 ~= nil then
			local Children24 = v88:GetChildren();
			for index47 = 1, #Children24 do
				if Children24[index47]:IsA("StringValue") then
					if Children24[index47].Value == "Blue" then
						table.insert(table15, 1, Children24[index47].Name);
					elseif Children24[index47].Value == "Purple" then
						table.insert(table16, 1, Children24[index47].Name);
					elseif Children24[index47].Value == "Pink" then
						table.insert(table17, 1, Children24[index47].Name);
					elseif Children24[index47].Value == "Red" then
						table.insert(table18, 1, Children24[index47].Name);
					end
				end
			end
		end
		local math_random_ret9 = math.random(1, 1192);
		local str12 = "";
		if math_random_ret9 >= 472 then
			str12 = "Blue";
		elseif math_random_ret9 >= 142 then
			str12 = "Purple";
		elseif math_random_ret9 >= 42 then
			str12 = "Pink";
		elseif math_random_ret9 >= 7 then
			str12 = "Red";
		elseif math_random_ret9 >= 0 then
			str12 = "Knife";
		end
		local v89 = "";
		if p122 == "Holiday Case 2" then
			str12 = "Blue";
		end
		if str12 == "Blue" then
			v89 = table15[math.random(1, #table15)];
		elseif str12 == "Purple" then
			v89 = table16[math.random(1, #table16)];
		elseif str12 == "Pink" then
			v89 = table17[math.random(1, #table17)];
		elseif str12 == "Red" then
			v89 = table18[math.random(1, #table18)];
		elseif str12 == "Knife" then
			local Children25 = game.ReplicatedStorage.Knives:GetChildren();
			if p122 == "Karambit Case" then
				Children25 = game.ReplicatedStorage.KarambitKnives:GetChildren();
			elseif p122 == "Imaginem Case" then
				Children25 = game.ReplicatedStorage.ImaginemKnives:GetChildren();
			elseif p122 == "Halloween Case" then
				Children25 = game.ReplicatedStorage.HallowsKnives:GetChildren();
			elseif p122 == "Halloween Case 2018" then
				Children25 = game.ReplicatedStorage.Halloween2018Knives:GetChildren();
			elseif p122 == "Remastered Case" then
				Children25 = game.ReplicatedStorage.GlovesSkins:GetChildren();
			elseif p122 == "SCR Case" then
				Children25 = game.ReplicatedStorage.SCRKnives:GetChildren();
			elseif p122 == "Easter Knife Case" then
				Children25 = game.ReplicatedStorage.EasterKnives:GetChildren();
			end
			v89 = Children25[math.random(1, #Children25)].Name;
		end
		p121 = str12;
		local split_ret4 = split(v89, "_");
		p119 = split_ret4[1];
		p120 = split_ret4[2];
	end
	clone_ret7.WeaponTemplate.Wep.Image = ImageLibrary:FindFirstChild(p119):FindFirstChild(p120).Value;
	clone_ret7.WeaponTemplate.NameLabel.Text = p119 .. " | " .. p120;
	if p121 == "Knife" then
		SkinWon.WeaponTemplate.NameLabel.Text = ImageLibrary:FindFirstChild(p119):FindFirstChild(p120).DisplayName.Value;
	end
	clone_ret7.WeaponTemplate.NameLabel.TextColor3 = script.Colors:FindFirstChild(p121).Value;
end
game.ReplicatedStorage.Events.DataEvent.OnClientEvent:connect(function(p123) -- Line: 5546
	--[[
		Upvalues:
			[1] = u42
			[2] = u5
			[3] = u6
			[4] = poggers
	--]]
	if p123[1] == "PurchaseCompleted" then
		ShopMenu.Back.Visible = false;
		Requesting = false;
		u42 = 0;
		wait(4);
		ShopMenu.Wheel.Visible = false;
		openingcase = false;
		ShopMenu.Back.Visible = true;
		return;
	end
	if p123[1] == "RefreshInventory" then
		local InvokeServer_ret1_3, u5, u6 = game.ReplicatedStorage.Events.DataFunction:InvokeServer({"GetInventory&Loadout"});
		CurrentInventory = InvokeServer_ret1_3;
		repeat
			wait();
		until CurrentInventory and u5 and u6;
		poggers:FireServer(CurrentInventory);
		GeneratePage("All");
	end
end);
Page = "All";
function split(p124, p125) -- Line: 5568
	local v46 = p125;
	if v46 == nil then
		v46 = " ";
	end
	local v47 = 1;
	local table19 = {};
	local v48 = "";
	for index19 = 1, string.len(p124) do
		if string.sub(p124, index19, index19) ~= v46 then
			v48 = v48 .. string.sub(p124, index19, index19);
		else
			table19[v47] = v48;
			v48 = "";
			v47 = v47 + 1;
		end
	end
	if v48 ~= "" then
		table19[v47] = v48;
	end
	return table19;
end
RClickframe = InvenFrame:WaitForChild("RClickFrame");
RClickframe.MouseLeave:connect(function() -- Line: 5591
	RClickframe.Visible = false;
end);
rclickcurrentitem = 0;
RClickframe.EquipT.MouseButton1Down:connect(function() -- Line: 5593
	equipitem(rclickcurrentitem, "T");
end);
RClickframe.EquipCT.MouseButton1Down:connect(function() -- Line: 5594
	equipitem(rclickcurrentitem, "CT");
end);
RClickframe.EquipBoth.MouseButton1Down:connect(function() -- Line: 5595
	equipitem(rclickcurrentitem, "Both");
end);
Mouse = game.Players.LocalPlayer:GetMouse();
currentpage = "";
currentteam = "CT";
CurrentKnives = {
	"Bayonet",
	"Huntsman Knife",
	"Falchion Knife",
	"Karambit",
	"Gut Knife",
	"Butterfly Knife",
	"M9 Bayonet",
	"Banana",
	"Flip Knife",
	"Sickle",
	"Bearded Axe",
	"Cleaver"
};
CurrentGloves = {
	"Sports Glove",
	"Strapped Glove",
	"Fingerless Glove",
	"Handwraps"
};
function equipitem(p126, p127) -- Line: 5603
	--[[
		Upvalues:
			[1] = u5
			[2] = u6
			[3] = poggers
	--]]
	local v49 = CurrentInventory[p126];
	local split_ret5 = split(v49[1], "_");
	local v50 = split_ret5[1];
	local __ = split_ret5[2];
	if tableContains(CurrentKnives, v50) then
		v50 = "Knife";
	end
	if tableContains(CurrentGloves, v50) then
		v50 = "Glove";
	end
	local table20 = nil;
	if (p127 == "CT" or p127 == "Both") and u5[v50] then
		if v50 == "M4A1" then
			u5.M4A1Over = true;
			CTPrimary = "M4A1";
			table20 = {
				"M4A1Over",
				true
			};
		elseif v50 == "M4A4" then
			u5.M4A1Over = false;
			CTPrimary = "M4A4";
			table20 = {
				"M4A1Over",
				false
			};
		end
		if v50 == "MP7-SD" then
			u5.MP7SDOver = true;
			CTacticalSMG = "MP7-SD";
			table20 = {
				"MP7SDOver",
				true
			};
		elseif v50 == "MP7" then
			u5.MP7SDOver = false;
			CTacticalSMG = "MP7";
			table20 = {
				"MP7SDOver",
				false
			};
		end
		if v50 == "USP" then
			u5.USPOver = true;
			CTPrimaryPistol = "USP";
			table20 = {
				"USPOver",
				true
			};
		elseif v50 == "P2000" then
			u5.USPOver = false;
			CTPrimaryPistol = "P2000";
			table20 = {
				"USPOver",
				false
			};
		end
		if v50 == "CZ" then
			u5.CZOver = true;
			CTTacticalPistol = "CZ";
			table20 = {
				"CZOver",
				true
			};
		elseif v50 == "FiveSeven" then
			u5.CZOver = false;
			CTTacticalPistol = "FiveSeven";
			table20 = {
				"CZOver",
				false
			};
		end
		if v50 == "R8" then
			u5.R8Over = true;
			CTDeag = "R8";
			table20 = {
				"R8Over",
				true
			};
		elseif v50 == "DesertEagle" then
			u5.R8Over = false;
			CTDeag = "DesertEagle";
			table20 = {
				"R8Over",
				false
			};
		end
		if v50 == "CTKnife" then
			u5.KnifeOver = false;
			table20 = {
				"KnifeOver",
				false
			};
		elseif v50 == "Knife" then
			u5.KnifeOver = true;
			table20 = {
				"KnifeOver",
				true
			};
		end
		if v50 == "CTGlove" then
			u5.GloveOver = false;
			table20 = {
				"GloveOver",
				false
			};
		elseif v50 == "Glove" then
			u5.GloveOver = true;
			table20 = {
				"GloveOver",
				true
			};
		end
		u5[v50] = v49;
	end
	if (p127 == "T" or p127 == "Both") and u6[v50] then
		if v50 == "CZ" then
			u6.CZOver = true;
			TTacticalPistol = "CZ";
			table20 = {
				"CZOver",
				true
			};
		elseif v50 == "Tec9" then
			u6.CZOver = false;
			TTacticalPistol = "Tec9";
			table20 = {
				"CZOver",
				false
			};
		end
		if v50 == "MP7-SD" then
			u6.MP7SDOver = true;
			TTacticalSMG = "MP7-SD";
			table20 = {
				"MP7SDOver",
				true
			};
		elseif v50 == "MP7" then
			u6.MP7SDOver = false;
			TTacticalSMG = "MP7";
			table20 = {
				"MP7SDOver",
				false
			};
		end
		if v50 == "R8" then
			u6.R8Over = true;
			TDeag = "R8";
			table20 = {
				"R8Over",
				true
			};
		elseif v50 == "DesertEagle" then
			u6.R8Over = false;
			TDeag = "DesertEagle";
			table20 = {
				"R8Over",
				false
			};
		end
		if v50 == "TKnife" then
			u6.KnifeOver = false;
			table20 = {
				"KnifeOver",
				false
			};
		elseif v50 == "Knife" then
			u6.KnifeOver = true;
			table20 = {
				"KnifeOver",
				true
			};
		end
		if v50 == "TGlove" then
			u6.GloveOver = false;
			table20 = {
				"GloveOver",
				false
			};
		elseif v50 == "Glove" then
			u6.GloveOver = true;
			table20 = {
				"GloveOver",
				true
			};
		end
		u6[v50] = v49;
	end
	poggers:FireServer(CurrentInventory);
	GeneratePage(currentpage);
	game.ReplicatedStorage.Events.DataEvent:FireServer({
		"EquipItem",
		p127,
		v50,
		v49,
		table20
	});
end
function GeneratePage(p128) -- Line: 5734
	--[[
		Upvalues:
			[1] = u5
			[2] = u6
	--]]
	currentpage = p128;
	RClickframe.Visible = false;
	local Children26 = Inventory:GetChildren();
	for index20 = 1, #Children26 do
		if Children26[index20]:IsA("ImageButton") then
			Children26[index20]:Destroy();
		end
	end
	local Children27 = Loadout:GetChildren();
	for index21 = 1, #Children27 do
		if Children27[index21]:IsA("ImageButton") then
			Children27[index21]:Destroy();
		end
	end
	local u46 = 0;
	spawn(function() -- Line: 5751
		game.ReplicatedStorage.Hugh:InvokeServer(CurrentInventory);
	end);
	for key6, val6 in pairs(CurrentInventory) do
		pcall(function() -- Line: 5754
			--[[
				Upvalues:
					[1] = val6
					[2] = p128
					[3] = key6
					[4] = u46
					[5] = u5
					[6] = u6
			--]]
			local u52 = split(val6[1], "_");
			local v135 = u52[1];
			local v136 = u52[2];
			local u53 = v135;
			if v135 ~= "TGlove" then
				local __ = v135 == "CTGlove";
			end
			if tableContains(CurrentKnives, v135) then
				u53 = "Knife";
			end
			if tableContains(CurrentGloves, v135) then
				u53 = "Glove";
			end
			if script.Images:FindFirstChild(v135) and script.Images[v135].Value == p128 or p128 == "All" then
				if Inventory:FindFirstChild(table2string(val6)) == nil then
					local Clone_ret14 = script.WeaponTemplate:Clone();
					Clone_ret14.Name = key6;
					Clone_ret14.Parent = Inventory;
					if val6[2] and val6[2] == "StatTrak" then
						Clone_ret14.NameLabel.TextColor3 = script.ColorLibrary:FindFirstChild(val6[2]).Value;
						if val6[2] and val6[2] == "StatTrak" then
							Clone_ret14.Kills.Visible = true;
							Clone_ret14.Kills.Text = "Kills : " .. val6[4];
						end
					end
					local v152 = script.Images:FindFirstChild(v135);
					if v152 then
						local DisplayName = v152:FindFirstChild("DisplayName");
						if DisplayName ~= nil then
							v152 = DisplayName.Value;
						else
							v152 = val6[1];
						end
					end
					if v135 and v136 and ImageLibrary:FindFirstChild(v135) and ImageLibrary[v135]:FindFirstChild(v136) and ImageLibrary[v135][v136]:FindFirstChild("Quality") then
						local v160 = ImageLibrary:FindFirstChild(v135):FindFirstChild(v136):FindFirstChild("Quality") == nil and (v136 == "Stock" and "Stock" or "Knife") or ImageLibrary:FindFirstChild(v135):FindFirstChild(v136).Quality.Value;
						Clone_ret14.Quality.BackgroundColor3 = script.Colors:FindFirstChild(v160).Value;
					end
					if v135 and v136 and script.Images:FindFirstChild(v135) and script.Images[v135]:FindFirstChild(v136) then
						Clone_ret14.Wep.Image = script.Images:FindFirstChild(v135):FindFirstChild(v136).Value;
					end
					if v152 and v136 then
						Clone_ret14.NameLabel.Text = v152 .. " | " .. v136;
					end
					u46 = u46 + 1;
					if u5[u53] ~= nil then
						Clone_ret14.CTCheck.Visible = true;
						if table2string(u5[u53]) == table2string(val6) then
							Clone_ret14.CTCheck.Text = "X";
						end
						if v135 == "M4A1" then
							if u5.M4A1Over == false then
								Clone_ret14.CTCheck.Text = "";
							end
						elseif v135 == "M4A4" and u5.M4A1Over == true then
							Clone_ret14.CTCheck.Text = "";
						end
						if v135 == "USP" then
							if u5.USPOver == false then
								Clone_ret14.CTCheck.Text = "";
							end
						elseif v135 == "P2000" and u5.USPOver == true then
							Clone_ret14.CTCheck.Text = "";
						end
						if v135 == "MP7-SD" then
							if u5.MP7SDOver == false then
								Clone_ret14.CTCheck.Text = "";
							end
						elseif v135 == "MP7" and u5.MP7SDOver == true then
							Clone_ret14.CTCheck.Text = "";
						end
						if v135 == "CZ" then
							if u5.CZOver == false then
								Clone_ret14.CTCheck.Text = "";
							end
						elseif v135 == "FiveSeven" and u5.CZOver == true then
							Clone_ret14.CTCheck.Text = "";
						end
						if v135 == "R8" then
							if u5.R8Over == false then
								Clone_ret14.CTCheck.Text = "";
							end
						elseif v135 == "DesertEagle" and u5.R8Over == true then
							Clone_ret14.CTCheck.Text = "";
						end
						if u53 == "CTKnife" then
							if u5.KnifeOver == true then
								Clone_ret14.CTCheck.Text = "";
							end
						elseif u53 == "Knife" and u5.KnifeOver == false then
							Clone_ret14.CTCheck.Text = "";
						end
						if u53 == "CTGlove" then
							if u5.GloveOver == true then
								Clone_ret14.CTCheck.Text = "";
							end
						elseif u53 == "Glove" and u5.GloveOver == false then
							Clone_ret14.CTCheck.Text = "";
						end
					end
					if u6[u53] ~= nil then
						Clone_ret14.TCheck.Visible = true;
						if table2string(u6[u53]) == table2string(val6) then
							Clone_ret14.TCheck.Text = "X";
						end
						if v135 == "CZ" then
							if u6.CZOver == false then
								Clone_ret14.TCheck.Text = "";
							end
						elseif v135 == "Tec9" and u6.CZOver == true then
							Clone_ret14.TCheck.Text = "";
						end
						if v135 == "R8" then
							if u6.R8Over == false then
								Clone_ret14.TCheck.Text = "";
							end
						elseif v135 == "DesertEagle" and u6.R8Over == true then
							Clone_ret14.TCheck.Text = "";
						end
						if v135 == "MP7" then
							if u6.MP7SDOver == true then
								Clone_ret14.TCheck.Text = "";
							end
						elseif v135 == "MP7-SD" and u6.MP7SDOver == false then
							Clone_ret14.TCheck.Text = "";
						end
						if u53 == "TKnife" then
							if u6.KnifeOver == true then
								Clone_ret14.TCheck.Text = "";
							end
						elseif u53 == "Knife" and u6.KnifeOver == false then
							Clone_ret14.TCheck.Text = "";
						end
						if u53 == "TGlove" then
							if u6.GloveOver == true then
								Clone_ret14.TCheck.Text = "";
							end
						elseif u53 == "Glove" and u6.GloveOver == false then
							Clone_ret14.TCheck.Text = "";
						end
					end
					Clone_ret14.Name = table2string(val6);
					if istenfoot then
						Clone_ret14.MouseButton1Down:Connect(function() -- Line: 5949
							--[[
								Upvalues:
									[1] = Clone_ret14
									[2] = u5
									[3] = u53
									[4] = u6
									[5] = key6
							--]]
							_gui.SelectedObject = Clone_ret14.Parent.Parent.topbuttons.Pistol;
							if u5[u53] and u6[u53] then
								equipitem(key6, "Both");
								return;
							end
							if u5[u53] then
								equipitem(key6, "CT");
								return;
							end
							if u6[u53] then
								equipitem(key6, "T");
							end
						end);
					else
						Clone_ret14.Wep.MouseButton1Down:Connect(function() -- Line: 5961
							--[[
								Upvalues:
									[1] = u5
									[2] = u53
									[3] = u6
									[4] = u52
									[5] = key6
							--]]
							RClickframe.Visible = true;
							if u5[u53] then
								RClickframe.EquipCT.Visible = true;
							else
								RClickframe.EquipCT.Visible = false;
							end
							if u6[u53] then
								RClickframe.EquipT.Visible = true;
							else
								RClickframe.EquipT.Visible = false;
							end
							if RClickframe.EquipT.Visible and RClickframe.EquipCT.Visible then
								RClickframe.EquipBoth.Visible = true;
							else
								RClickframe.EquipBoth.Visible = false;
							end
							RClickframe.Position = UDim2.new(0, Mouse.X - 10, 0, Mouse.Y - 10);
							u52 = key6;
							rclickcurrentitem = key6;
						end);
					end
				else
					local FindFirstChild_ret4 = Inventory:FindFirstChild(table2string(val6));
					FindFirstChild_ret4.amount.count.Value = FindFirstChild_ret4.amount.count.Value + 1;
					FindFirstChild_ret4.amount.Text = "x" .. FindFirstChild_ret4.amount.count.Value;
					FindFirstChild_ret4.amount.Visible = true;
				end
			end
		end);
	end
	if u5.M4A1Over == true then
		CTPrimary = "M4A1";
	else
		CTPrimary = "M4A4";
	end
	if u5.CZOver == true then
		CTTacticalPistol = "CZ";
	else
		CTTacticalPistol = "FiveSeven";
	end
	if u5.R8Over == true then
		CTDeag = "R8";
	else
		CTDeag = "DesertEagle";
	end
	if u5.MP7SDOver == true then
		CTacticalSMG = "MP7-SD";
	else
		CTacticalSMG = "MP7";
	end
	if u6.CZOver == true then
		TTacticalPistol = "CZ";
	else
		TTacticalPistol = "Tec9";
	end
	if u6.MP7SDOver == true then
		TTacticalSMG = "MP7-SD";
	else
		TTacticalSMG = "MP7";
	end
	if u6.R8Over == true then
		TDeag = "R8";
	else
		TDeag = "DesertEagle";
	end
	if u5.USPOver == true then
		CTPrimaryPistol = "USP";
	else
		CTPrimaryPistol = "P2000";
	end
	updateloadout();
	local u47 = 0;
	if currentteam == "CT" then
		for __, val9 in pairs(u5) do
			pcall(function() -- Line: 6038
				--[[
					Upvalues:
						[1] = val9
						[2] = p128
						[3] = u47
				--]]
				if val9 ~= true and val9 ~= false and val9 ~= "" then
					local split_ret7 = split(val9[1], "_");
					local v153 = split_ret7[1];
					local v154 = split_ret7[2];
					if script.Images:FindFirstChild(v153).Value == p128 or p128 == "All" then
						local Clone_ret13 = script.WeaponTemplate:Clone();
						Clone_ret13.Name = "fish";
						Clone_ret13.Parent = Loadout;
						Clone_ret13.NameLabel.Text = val9[1];
						if val9[2] ~= nil and val9[2] ~= "StatTrak" then
							Clone_ret13.NameLabel.TextColor3 = script.ColorLibrary:FindFirstChild(val9[2]).Value;
						end
						Clone_ret13.Wep.Image = script.Images:FindFirstChild(v153):FindFirstChild(v154).Value;
						u47 = u47 + 75;
					end
				end
			end);
		end
		Loadout.CanvasSize = UDim2.new(0, 0, 0, Loadout.UIGridLayout.AbsoluteContentSize.Y + 3);
	end
	if currentteam == "T" then
		for __, val10 in pairs(u6) do
			pcall(function() -- Line: 6061
				--[[
					Upvalues:
						[1] = val10
						[2] = p128
						[3] = u47
				--]]
				if val10 ~= true and val10 ~= false and val10 ~= "" then
					local split_ret6 = split(val10[1], "_");
					local v155 = split_ret6[1];
					local v156 = split_ret6[2];
					if script.Images:FindFirstChild(v155).Value == p128 or p128 == "All" then
						local Clone_ret12 = script.WeaponTemplate:Clone();
						Clone_ret12.Name = "fish";
						Clone_ret12.Parent = Loadout;
						Clone_ret12.NameLabel.Text = val10[1];
						if val10[2] ~= nil and val10[2] ~= "StatTrak" then
							Clone_ret12.NameLabel.TextColor3 = script.ColorLibrary:FindFirstChild(val10[2]).Value;
						end
						Clone_ret12.Wep.Image = script.Images:FindFirstChild(v155):FindFirstChild(v156).Value;
						u47 = u47 + 75;
					end
				end
			end);
		end
		Loadout.CanvasSize = UDim2.new(0, 0, 0, Loadout.UIGridLayout.AbsoluteContentSize.Y + 3);
	end
	wait(0.1);
	Inventory.CanvasSize = UDim2.new(0, 0, 0, Inventory.UIGridLayout.AbsoluteContentSize.Y + 3);
end
topbuttons = InvenFrame:WaitForChild("topbuttons");
topbuttonschild = topbuttons:GetChildren();
for index3 = 1, #topbuttonschild do
	topbuttonschild[index3].MouseButton1Down:connect(function() -- Line: 6090
		--[[
			Upvalues:
				[1] = index3
		--]]
		GeneratePage(topbuttonschild[index3].Name);
	end);
end
local u43 = SuitZoom:WaitForChild("Keys1");
function adjustVisibility() -- Line: 6099
	--[[
		Upvalues:
			[1] = SuitZoom
			[2] = t_LocalPlayer
			[3] = RunService
	--]]
	if not SuitZoom.Visible then
		SuitZoom.Visible = true;
		local Waiting = Instance.new("IntValue");
		Waiting.Name = "Waiting";
		delay(3, function() -- Line: 6112
			--[[
				Upvalues:
					[1] = Waiting
			--]]
			Waiting:Destroy();
		end);
		Waiting.Parent = t_LocalPlayer;
		spawn(function() -- Line: 6116
			--[[
				Upvalues:
					[1] = RunService
					[2] = t_LocalPlayer
					[3] = SuitZoom
			--]]
			repeat
				RunService.Heartbeat:wait();
			until game.Players.LocalPlayer:FindFirstChild("Waiting") == nil;
			if t_LocalPlayer:FindFirstChild("Dux") then
				t_LocalPlayer:FindFirstChild("Dux"):Destroy();
			end
			SuitZoom.Visible = false;
		end);
		return;
	end
	if t_LocalPlayer:FindFirstChild("Dux") then
		t_LocalPlayer:FindFirstChild("Dux"):Destroy();
	end
	if t_LocalPlayer:FindFirstChild("Waiting") then
		t_LocalPlayer.Waiting:Destroy();
	end
	SuitZoom.Visible = false;
end
UserInputService_.InputBegan:connect(function(input7) -- Line: 6127
	--[[
		Upvalues:
			[1] = UserInputService_
			[2] = str5
			[3] = bool1
			[4] = Alive2
			[5] = t_LocalPlayer
			[6] = CanTalk
			[7] = u43
			[8] = SuitZoom
			[9] = str3
			[10] = bool7
			[11] = bool8
			[12] = u23
			[13] = LoadAnimation_ret10
			[14] = LoadAnimation_ret9
			[15] = bool27
			[16] = m_Sound
			[17] = u25
			[18] = u26
			[19] = bool46
	--]]
	if UserInputService_:GetFocusedTextBox() then return end
	if script.Parent:FindFirstChild("GUI") and (script.Parent.GUI.Main.GlobalChat.ActiveOne.Value == true or script.Parent.GUI.Main.TeamChat.ActiveOne.Value == true) then return end
	if input7.KeyCode == Enum.KeyCode.E and str5 == "equipment2" then
		bool1 = true;
	end
	if Alive2.Value and t_LocalPlayer.Character and CanTalk.Value then
		if input7.KeyCode == Enum.KeyCode.Z then
			if script.Parent.GUI.SuitZoom.Keys1.Visible == true or script.Parent.GUI.SuitZoom.Visible == false then
				adjustVisibility();
			end
			script.Parent.GUI.SuitZoom.Keys1.Visible = true;
			script.Parent.GUI.SuitZoom.Keys2.Visible = false;
			script.Parent.GUI.SuitZoom.Keys3.Visible = false;
			u43 = SuitZoom:WaitForChild("Keys1");
		elseif input7.KeyCode == Enum.KeyCode.X then
			if script.Parent.GUI.SuitZoom.Keys2.Visible == true or script.Parent.GUI.SuitZoom.Visible == false then
				adjustVisibility();
			end
			script.Parent.GUI.SuitZoom.Keys1.Visible = false;
			script.Parent.GUI.SuitZoom.Keys2.Visible = true;
			script.Parent.GUI.SuitZoom.Keys3.Visible = false;
			u43 = SuitZoom:WaitForChild("Keys2");
		elseif input7.KeyCode == Enum.KeyCode.V then
			if script.Parent.GUI.SuitZoom.Keys3.Visible == true or script.Parent.GUI.SuitZoom.Visible == false then
				adjustVisibility();
			end
			script.Parent.GUI.SuitZoom.Keys1.Visible = false;
			script.Parent.GUI.SuitZoom.Keys2.Visible = false;
			script.Parent.GUI.SuitZoom.Keys3.Visible = true;
			u43 = SuitZoom:WaitForChild("Keys3");
		end
	end
	if (str5 ~= "equipment" or str5 == "equipment" and game.ReplicatedStorage.Weapons:FindFirstChild(str3) and game.ReplicatedStorage.Weapons:FindFirstChild(str3):FindFirstChild("NotDroppable") == nil) and input7.KeyCode == Enum.KeyCode.G and bool7 == true and bool8 == false and t_LocalPlayer:FindFirstChild("DROPPED") == nil and str5 ~= "melee" and game.ReplicatedStorage.Warmup.Value == false and game.ReplicatedStorage.gametype.Value ~= "deathmatch" then
		DropWep();
	end
	if bool8 == false and bool7 and input7.KeyCode == Enum.KeyCode.Q and u23 ~= nil and weapons[u23].Visible then
		clearAll();
		weapons[u23]:FindFirstChild("Weapon").ImageTransparency = 0;
		weapons[u23].bk.Visible = true;
		updatePosition();
		giveTool();
	end
	if input7.KeyCode == Enum.KeyCode.E and (not Alive2.Value or not bool8 and bool7 and not UserInputService_.MouseIconEnabled) then
		pickup();
		local g_door = door;
		if dooropen == false and g_door ~= nil and g_door.Parent ~= nil and t_LocalPlayer.Character and t_LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (t_LocalPlayer.Character.HumanoidRootPart.Position - g_door.Position).magnitude <= 10 and g_door.Parent:FindFirstChild("Event") then
			local Event = g_door.Parent:FindFirstChild("Event");
			Event:FireServer();
			dooropen = true;
			delay(0.5, function() -- Line: 6171
				dooropen = false;
			end);
		end
	end
	if input7.KeyCode == Enum.KeyCode.R then
		if LoadAnimation_ret10 and LoadAnimation_ret10.IsPlaying == true or LoadAnimation_ret9 and LoadAnimation_ret9.IsPlaying == true then
			bool27 = true;
		end
		reloadwep();
	elseif input7.KeyCode == Enum.KeyCode.F and LoadAnimation_ret9 and DISABLED == false and LoadAnimation_ret9 and (bool27 == true or bool27 == false and LoadAnimation_ret9.IsPlaying == false and (LoadAnimation_ret10 == nil or LoadAnimation_ret10 and LoadAnimation_ret10.IsPlaying == false)) then
		local num13 = 0;
		if LoadAnimation_ret9.IsPlaying == true then
			LoadAnimation_ret9:Stop(0.05, nil, nil);
			num13 = 0.05;
		end
		if LoadAnimation_ret10 and LoadAnimation_ret10.IsPlaying == true then
			LoadAnimation_ret10:Stop(0.05, nil, nil);
			num13 = 0.05;
		end
		bool27 = false;
		spawn(function() -- Line: 6189
			--[[
				Upvalues:
					[1] = num13
					[2] = m_Sound
					[3] = LoadAnimation_ret10
					[4] = str5
					[5] = u25
					[6] = u26
					[7] = LoadAnimation_ret9
			--]]
			wait(num13);
			if DISABLED == false then
				m_Sound.stopsound("Inspect1", script.Parent);
				m_Sound.stopsound("Inspect2", script.Parent);
				m_Sound.stopsound("Inspect3", script.Parent);
				m_Sound.playsound(script.Parent["Inspect" .. math.random(1, 3)]);
				if LoadAnimation_ret10 and (str5 == "primary" and u25 <= 0 or str5 == "secondary" and u26 <= 0) then
					LoadAnimation_ret10:Play(0.15, nil, nil);
					game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("EInspect");
				else
					LoadAnimation_ret9:Play(0.15, nil, nil);
				end
				game.ReplicatedStorage.Events.ReplicateAnimation:FireServer("Inspect");
			end
		end);
	end
	if SuitZoom.Visible and Alive2.Value and t_LocalPlayer.Character and CanTalk.Value and bool46 == false then
		local t_Value13 = t_LocalPlayer.Status.Team.Value;
		if game.ReplicatedStorage.Voices:FindFirstChild(t_Value13) then
			if input7.KeyCode == Enum.KeyCode.One then
				if u43.Name == "Keys3" then
					chatMessage(u43["1"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).spotted);
				elseif u43.Name == "Keys2" then
					chatMessage(u43["1"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).affirm);
				elseif u43.Name == "Keys1" then
					chatMessage(u43["1"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).go);
				end
			elseif input7.KeyCode == Enum.KeyCode.Two then
				if u43.Name == "Keys3" then
					chatMessage(u43["2"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).backup);
				elseif u43.Name == "Keys2" then
					chatMessage(u43["2"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).nega);
				elseif u43.Name == "Keys1" then
					chatMessage(u43["2"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).fallback);
				end
			elseif input7.KeyCode == Enum.KeyCode.Three then
				if u43.Name == "Keys3" then
					chatMessage(u43["3"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).takepoint);
				elseif u43.Name == "Keys2" then
					chatMessage("1. Cheer!", game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).brag);
				elseif u43.Name == "Keys1" then
					chatMessage(u43["3"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).regroup);
				end
			elseif input7.KeyCode == Enum.KeyCode.Four then
				if u43.Name == "Keys3" then
					chatMessage(u43["4"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).clear);
				elseif u43.Name == "Keys2" then
					chatMessage("1. Nice!", game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).brag);
				elseif u43.Name == "Keys1" then
					chatMessage(u43["4"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).hold);
				end
			elseif input7.KeyCode == Enum.KeyCode.Five then
				if u43.Name == "Keys3" then
					chatMessage(u43["5"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).inposition);
				elseif u43.Name == "Keys2" then
					chatMessage(u43["5"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).thanks);
				elseif u43.Name == "Keys1" then
					chatMessage(u43["5"].Text, game.ReplicatedStorage.Voices:FindFirstChild(t_Value13).followme);
				end
			elseif input7.KeyCode == Enum.KeyCode.Six then
				adjustVisibility();
			end
		end
	end
	if input7.UserInputType == Enum.UserInputType.MouseButton3 and Alive2.Value and t_LocalPlayer.Character and CanTalk.Value then
		adjustVisibility();
	end
end);
m_NewMouse.Button1Down:connect(function() -- Line: 6262
	--[[
		Upvalues:
			[1] = UserInputService_
			[2] = bool1
	--]]
	if UserInputService_.MouseIconEnabled == true then return end
	bool1 = true;
	holdnade();
end);
m_NewMouse.Button1Up:connect(function() -- Line: 6268
	--[[
		Upvalues:
			[1] = UserInputService_
			[2] = LoadAnimation_ret13
			[3] = t_Character
			[4] = m_Sound
			[5] = bool1
	--]]
	if UserInputService_.MouseIconEnabled == true then return end
	stopplant();
	if pulling == true then
		if LoadAnimation_ret13 then
			LoadAnimation_ret13:Stop(0.2);
		end
		pulling = false;
		if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("unpull") then
			m_Sound.rplaysound(t_Character.Gun.unpull);
		end
	end
	bool1 = false;
	thrownade();
end);
local TweenInfo_new_ret = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
game.Workspace.Status.Timer.Changed:connect(function() -- Line: 6282
	--[[
		Upvalues:
			[1] = RunService
			[2] = GUI
			[3] = TweenInfo_new_ret
	--]]
	RunService.Heartbeat:wait();
	GUI.UpperInfo.Timer.Visible = true;
	GUI.UpperInfo.Timer.Text = gen_time(game.Workspace.Status.Timer.Value);
	GUI.UpperInfo.Warmup.Visible = game.ReplicatedStorage.Warmup.Value;
	GUI.UpperInfo.Timer.TextColor3 = Color3.new(1, 1, 1);
	if game.Workspace.Status.Timer.Value <= 10 and workspace.Status.Preparation.Value == false then
		local Create_ret = _tween:Create(GUI.UpperInfo.Timer, TweenInfo_new_ret, {TextColor3 = Color3.fromRGB(234, 0, 0)});
		Create_ret:Play();
	elseif game.Workspace.Status.Timer.Value <= 20 and workspace.Status.Preparation.Value == false then
		GUI.UpperInfo.Timer.TextColor3 = Color3.fromRGB(255, 124, 48);
	end
	GUI.UpperInfo.TScore.Text = game.Workspace.Status.TWins.Value;
	GUI.UpperInfo.CTScore.Text = game.Workspace.Status.CTWins.Value;
end);
game.Workspace.Status.TWins.Changed:connect(function() -- Line: 6299
	--[[
		Upvalues:
			[1] = GUI
	--]]
	GUI.UpperInfo.TScore.Text = game.Workspace.Status.TWins.Value;
	GUI.UpperInfo.CTScore.Text = game.Workspace.Status.CTWins.Value;
end);
game.Workspace.Status.CTWins.Changed:connect(function() -- Line: 6303
	--[[
		Upvalues:
			[1] = GUI
	--]]
	GUI.UpperInfo.TScore.Text = game.Workspace.Status.TWins.Value;
	GUI.UpperInfo.CTScore.Text = game.Workspace.Status.CTWins.Value;
end);
script.Parent.GUI.TeamSelection.Blue.ImageLabel.MouseEnter:Connect(function() -- Line: 6308
	--[[
		Upvalues:
			[1] = m_Sound
	--]]
	script.Parent.GUI.TeamSelection.Blue.Select.Visible = true;
	m_Sound.playsound(script.Parent.Sounds.MenuHover);
end);
UpperInfo = GUI:WaitForChild("UpperInfo");
DynamicMiniscoreboard = true;
game.Workspace.Status.PlayerChanged.Changed:connect(function() -- Line: 6314
	local Players5 = game.Players:GetPlayers();
	local v51 = DynamicMiniscoreboard and (game.ReplicatedStorage.gametype.value == "casual" and 10 or 5) or 5;
	local v52 = 0;
	local v53 = 0;
	local v54 = nil;
	local v55 = nil;
	if v51 == 5 then
		v54 = UpperInfo.T;
		v55 = UpperInfo.CT;
	elseif v51 == 10 then
		v54 = UpperInfo.Tplus;
		v55 = UpperInfo.CTplus;
	end
	if v51 == 5 then
		UpperInfo.Tplus.Visible = false;
		UpperInfo.CTplus.Visible = false;
		UpperInfo.CT.Visible = true;
		UpperInfo.T.Visible = true;
	elseif v51 == 10 then
		UpperInfo.Tplus.Visible = true;
		UpperInfo.CTplus.Visible = true;
		UpperInfo.CT.Visible = false;
		UpperInfo.T.Visible = false;
	end
	for index22 = 1, v51 do
		local FindFirstChild_ret7 = v54:FindFirstChild(tostring(index22));
		local FindFirstChild_ret8 = v55:FindFirstChild(tostring(index22));
		FindFirstChild_ret7.Visible = false;
		FindFirstChild_ret8.Visible = false;
		FindFirstChild_ret8.Dead.Visible = false;
		FindFirstChild_ret7.Dead.Visible = false;
		FindFirstChild_ret8.Player.ImageColor3 = Color3.new(1, 1, 1);
		FindFirstChild_ret7.Player.ImageColor3 = Color3.new(1, 1, 1);
	end
	if game.ReplicatedStorage.gametype.Value == "deathmatch" then return end
	for index23 = 1, #Players5 do
		if Players5[index23]:FindFirstChild("Status") and (Players5[index23].Status.Team.Value == "T" or Players5[index23].Status.Team.Value == "CT") then
			if Players5[index23].Status.Team.Value == "T" then
				v52 = v52 + 1;
				local FindFirstChild_ret6 = v54:FindFirstChild(tostring(v52));
				if FindFirstChild_ret6 then
					if Players5[index23].Status.Alive.Value then
						FindFirstChild_ret6.Dead.Visible = false;
					else
						FindFirstChild_ret6.Dead.Visible = true;
						FindFirstChild_ret6.Player.ImageColor3 = Color3.fromRGB(149, 149, 149);
					end
					FindFirstChild_ret6.Visible = true;
					FindFirstChild_ret6.Player.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. Players5[index23].UserId .. "&width=420&height=420&format=png";
				end
			elseif Players5[index23].Status.Team.Value == "CT" then
				v53 = v53 + 1;
				local FindFirstChild_ret5 = v55:FindFirstChild(tostring(v53));
				if FindFirstChild_ret5 then
					if Players5[index23].Status.Alive.Value then
						FindFirstChild_ret5.Dead.Visible = false;
					else
						FindFirstChild_ret5.Dead.Visible = true;
					end
					FindFirstChild_ret5.Visible = true;
					FindFirstChild_ret5.Player.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. Players5[index23].UserId .. "&width=420&height=420&format=png";
				end
			end
		end
	end
end);
script.Parent.GUI.TeamSelection.Red.ImageLabel.MouseEnter:Connect(function() -- Line: 6398
	--[[
		Upvalues:
			[1] = m_Sound
	--]]
	script.Parent.GUI.TeamSelection.Red.Select.Visible = true;
	m_Sound.playsound(script.Parent.Sounds.MenuHover);
end);
script.Parent.GUI.TeamSelection.Blue.ImageLabel.MouseLeave:Connect(function() -- Line: 6403
	script.Parent.GUI.TeamSelection.Blue.Select.Visible = false;
end);
script.Parent.GUI.TeamSelection.Red.ImageLabel.MouseLeave:Connect(function() -- Line: 6404
	script.Parent.GUI.TeamSelection.Red.Select.Visible = false;
end);
function activatemusic(p129, p130) -- Line: 6408
	--[[
		Upvalues:
			[1] = m_Sound
			[2] = t_CurrentCamera2
			[3] = bool45
			[4] = RunService
	--]]
	script.Parent:WaitForChild("GUI");
	local t_Value14 = script.Parent.Music.MusicKit.Value;
	if script.Parent.GUI.TeamSelection.Visible == false then
		if p129 == "Finish" then
			for __, child14 in pairs(script.Parent.Music:FindFirstChild(t_Value14):GetChildren()) do
				if not child14:IsA("Sound") or child14.Name == "TeamSelection" then continue end
				child14:Destroy();
			end
			for __, child15 in pairs(script.Parent.Music:FindFirstChild(t_Value14).StartAction:GetChildren()) do
				if not child15:IsA("Sound") then continue end
				child15:Destroy();
			end
			for __, child16 in pairs(script.Parent.Music:FindFirstChild(t_Value14).StartRound:GetChildren()) do
				if not child16:IsA("Sound") then continue end
				child16:Destroy();
			end
			spawn(function() -- Line: 6416
				wait(8);
				script.Parent.GUI.CTWin.Visible = false;
				script.Parent.GUI.TWin.Visible = false;
				script.Parent.GUI.DMWin.Visible = false;
			end);
			for __, child17 in pairs(script.Parent.Music:FindFirstChild(t_Value14):GetChildren()) do
				if not child17:IsA("Sound") then continue end
				child17:Destroy();
			end
			if p130 == "CT" then
				script.Parent.GUI.CTWin.Visible = true;
				script.Parent.GUI.CTWin.MVPPlayer.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Workspace.Status.MVP.ID.Value .. "&width=420&height=420&format=png";
				if game.Players:FindFirstChild(game.Workspace.Status.MVP.Value) then
					script.Parent.GUI.CTWin.Pin.Image = game.Players:FindFirstChild(game.Workspace.Status.MVP.Value).EquippedPin.Value;
				end
				script.Parent.GUI.CTWin.TextLabel.Text = "MVP: " .. game.Workspace.Status.MVP.Value .. game.Workspace.Status.MVP.Reason.Value;
				script.Parent.GUI.CTWin.Info.TextLabel.Text = game.Workspace.Status.FunFact.Value;
				if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
					m_Sound.playsound(script.Parent.Music:FindFirstChild(t_Value14).Win);
				elseif game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright yellow") then
					m_Sound.playsound(script.Parent.Music:FindFirstChild(t_Value14).Lose);
				else
					m_Sound.playsound(script.Parent.Music:FindFirstChild(t_Value14).Win);
				end
				delay(8, function() -- Line: 6440
					--[[
						Upvalues:
							[1] = m_Sound
							[2] = t_Value14
					--]]
					m_Sound.stopsound("Lose", script.Parent.Music:FindFirstChild(t_Value14));
					m_Sound.stopsound("Win", script.Parent.Music:FindFirstChild(t_Value14));
				end);
			elseif p130 == "T" then
				script.Parent.GUI.TWin.Visible = true;
				script.Parent.GUI.TWin.MVPPlayer.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Workspace.Status.MVP.ID.Value .. "&width=420&height=420&format=png";
				if game.Players:FindFirstChild(game.Workspace.Status.MVP.Value) then
					script.Parent.GUI.TWin.Pin.Image = game.Players:FindFirstChild(game.Workspace.Status.MVP.Value).EquippedPin.Value;
				end
				script.Parent.GUI.TWin.TextLabel.Text = "MVP: " .. game.Workspace.Status.MVP.Value .. game.Workspace.Status.MVP.Reason.Value;
				script.Parent.GUI.TWin.Info.TextLabel.Text = game.Workspace.Status.FunFact.Value;
				if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright yellow") then
					m_Sound.playsound(script.Parent.Music:FindFirstChild(t_Value14).Win);
				elseif game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
					m_Sound.playsound(script.Parent.Music:FindFirstChild(t_Value14).Lose);
				else
					m_Sound.playsound(script.Parent.Music:FindFirstChild(t_Value14).Win);
				end
				delay(8, function() -- Line: 6460
					--[[
						Upvalues:
							[1] = m_Sound
							[2] = t_Value14
					--]]
					m_Sound.stopsound("Lose", script.Parent.Music:FindFirstChild(t_Value14));
					m_Sound.stopsound("Win", script.Parent.Music:FindFirstChild(t_Value14));
				end);
			elseif p130 == "DM" then
				script.Parent.GUI.DMWin.Visible = true;
				script.Parent.GUI.DMWin.MVPPlayer.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Workspace.Status.First.ID.Value .. "&width=420&height=420&format=png";
				script.Parent.GUI.DMWin.MVPPlayer.TextLabel.Text = game.Workspace.Status.First.Value;
				script.Parent.GUI.DMWin.Third.Second.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Workspace.Status.Second.ID.Value .. "&width=420&height=420&format=png";
				script.Parent.GUI.DMWin.Third.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Workspace.Status.Third.ID.Value .. "&width=420&height=420&format=png";
			end
		end
		if p129 == "BombDefusedStopMusic" then
			m_Sound.stopsound("Bomb", script.Parent.Music:FindFirstChild(t_Value14));
		end
		if p129 == "BombPlanted45sec" then
			m_Sound.playsound(script.Parent.Music:FindFirstChild(t_Value14).Bomb);
		end
		if p129 == "PreStart" and t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("ColorCorrection") then
			bool45 = false;
			t_CurrentCamera2.ColorCorrection.Saturation = -1;
			if game.Lighting:FindFirstChild("ColorCorrection") then
				t_CurrentCamera2.ColorCorrection.Saturation = t_CurrentCamera2.ColorCorrection.Saturation - game.Lighting.ColorCorrection.Saturation;
			end
			delay((game.ReplicatedStorage.gametype.Value == "competitive" and 15 or 5) - 2, function() -- Line: 6486
				--[[
					Upvalues:
						[1] = t_CurrentCamera2
						[2] = RunService
				--]]
				while t_CurrentCamera2.ColorCorrection.Saturation < 0 do
					RunService.Stepped:wait();
					t_CurrentCamera2.ColorCorrection.Saturation = math.min(0, t_CurrentCamera2.ColorCorrection.Saturation + 0.01);
				end
			end);
			local Children29 = script.Parent.Music:GetChildren();
			for index48 = 1, #Children29 do
				if Children29[index48]:FindFirstChild("BombPlaying") then
					Children29[index48].BombPlaying:Destroy();
				end
			end
			for __, child18 in pairs(script.Parent.Music:FindFirstChild(t_Value14):GetChildren()) do
				if not child18:IsA("Sound") then continue end
				child18:Destroy();
			end
			for __, child19 in pairs(script.Parent.Music:FindFirstChild(t_Value14).StartAction:GetChildren()) do
				if not child19:IsA("Sound") then continue end
				child19:Destroy();
			end
			for __, child20 in pairs(script.Parent.Music:FindFirstChild(t_Value14).StartRound:GetChildren()) do
				if not child20:IsA("Sound") then continue end
				child20:Destroy();
			end
			local v114 = script.Parent.Music:FindFirstChild(t_Value14).StartRound:GetChildren()[math.random(1, #script.Parent.Music:FindFirstChild(t_Value14).StartRound:GetChildren())];
			local v115 = m_Sound.playsound(v114);
			repeat
				wait(0.2);
			until bool45 == true or not v115 or not v115:IsDescendantOf(script.Parent.Music);
			if v115 then
				repeat
					wait();
					v115.Volume = v115.Volume - 0.05;
				until v115.Volume <= 0;
				v115:Destroy();
			end
		end
		if p129 == "Tensec" then
			local v116 = script.Parent.Music:FindFirstChild(t_Value14)["10"];
			m_Sound.playsound(v116);
		end
		if p129 == "Start" then
			local Children28 = script.Parent.Music:GetChildren();
			for index49 = 1, #Children28 do
				if Children28[index49]:FindFirstChild("BombPlaying") then return end
			end
			local v117 = script.Parent.Music:FindFirstChild(t_Value14).StartAction:GetChildren()[math.random(1, #script.Parent.Music:FindFirstChild(t_Value14).StartAction:GetChildren())];
			local v118 = m_Sound.playsound(v117);
			wait(5);
			repeat
				wait();
				v118.Volume = v118.Volume - 0.01;
			until v118.Volume <= 0;
			v118:Destroy();
		end
	end
end
game.ReplicatedStorage.Events.Audio.OnClientEvent:Connect(function(p131, p132) -- Line: 6523
	activatemusic(p131, p132);
end);
game.Workspace.Status.Exploded.Changed:Connect(function() -- Line: 6528
	--[[
		Upvalues:
			[1] = UserInputService_
	--]]
	if game.Workspace.Status.Exploded.Value == true and UserInputService_:GetLastInputType() == Enum.UserInputType.Gamepad1 then
		spawn(function() -- Line: 6530
			GamepadVibrate("Large", 0.75, 0.45);
		end);
		spawn(function() -- Line: 6531
			GamepadVibrate("Small", 0.4, 0.75);
		end);
	end
end);
setcharacter(game.Players.LocalPlayer.Character);
game.Players.LocalPlayer.CharacterAdded:connect(function(character) -- Line: 6538
	if character then
		setcharacter(character);
	end
end);
health1 = game.Players.LocalPlayer.PlayerGui:WaitForChild("GUI"):WaitForChild("Crosshairs"):WaitForChild("Iconhair").Health;
name500 = game.Players.LocalPlayer.PlayerGui:WaitForChild("GUI"):WaitForChild("Crosshairs"):WaitForChild("Iconhair").Name500;
game.Workspace.Ray_Ignore.ChildAdded:connect(function(child5) -- Line: 6542
	--[[
		Upvalues:
			[1] = t_LocalPlayer
	--]]
	wait(0.1);
	if child5 and child5:FindFirstChild("Hostage") and child5.Name == t_LocalPlayer.Name then
		local Descendants = child5:GetDescendants();
		for index40 = 1, #Descendants do
			if Descendants[index40]:IsA("BasePart") or Descendants[index40]:IsA("Decal") then
				Descendants[index40].LocalTransparencyModifier = 1;
				Descendants[index40].Transparency = 1;
			end
		end
	end
end);
game.ReplicatedFirst:WaitForChild("CustomLoadingScreen");
chargeleft = 100;
revert = CFrame.new();
local m_Grenade = require(game.ReplicatedStorage.Modules.Grenade);
game.ReplicatedStorage.Events.ThrowGrenade.OnClientEvent:Connect(function(p133) -- Line: 6560
	--[[
		Upvalues:
			[1] = m_Grenade
	--]]
	m_Grenade["\240\159\153\132"](p133);
end);
game.ReplicatedStorage.Events.MakeInvisible.OnClientEvent:Connect(function(p134) -- Line: 6561
	local Descendants2 = p134:GetDescendants();
	for index24 = 1, #Descendants2 do
		if Descendants2[index24]:IsA("BasePart") then
			Descendants2[index24].Transparency = 1;
		elseif Descendants2[index24]:IsA("ParticleEmitter") then
			Descendants2[index24].Enabled = false;
		end
	end
end);
function decayshake(p135, p136, p137, p138) -- Line: 6562
	p136 = p136 * p138;
	p137 = p137 * p138;
	p135 = p135 * math.exp(-p136);
	local v56 = (p135.X ^ 2 + p135.Y ^ 2) ^ 0.5;
	if p137 < v56 then
		p135 = p135 * (1 - p137 / v56);
	else
		p135 = Vector3.new(0, 0, 0);
	end
	return p135.X, p135.Y;
end
function Lerp(p139, p140, p141) -- Line: 6574
	p141 = math.clamp(p141, 0, 1);
	return p139 + (p140 - p139) * (1 - p141);
end
RunService.RenderStepped:Connect(function(p142) -- Line: 6578
	--[[
		Upvalues:
			[1] = GUI
			[2] = t_CurrentCamera2
			[3] = bool1
			[4] = u10
			[5] = Crosshairs_
			[6] = Scope
			[7] = UserInputService_
			[8] = u4
			[9] = t_Character
			[10] = u21
			[11] = str5
			[12] = u14
			[13] = u29
			[14] = u13
			[15] = u16
			[16] = u31
			[17] = Humanoid
			[18] = num12
			[19] = LoadAnimation_ret9
			[20] = LoadAnimation_ret10
			[21] = u25
			[22] = u26
			[23] = t_LocalPlayer
			[24] = AmmoGUI
			[25] = Vitals
			[26] = bool7
			[27] = m_Mathlib
			[28] = u1
			[29] = u11
			[30] = LoadAnimation_ret12
			[31] = u40
			[32] = m_Sound
			[33] = RunService
			[34] = bool6
			[35] = t_Y3
			[36] = u39
			[37] = u38
			[38] = u41
			[39] = UpperTorso
			[40] = LoadAnimation_ret2
			[41] = u12
			[42] = u34
			[43] = u35
			[44] = t_CurrentCamera
			[45] = u2
			[46] = u3
			[47] = bool2
			[48] = LoadAnimation_ret13
			[49] = BrickColor_new
			[50] = Alive2
			[51] = t_SelectionSphere
			[52] = m_NewMouse
			[53] = g_Cnew
			[54] = bool45
			[55] = u24
			[56] = u22
			[57] = u17
			[58] = u18
			[59] = u19
			[60] = u20
	--]]
	pcall(function() -- Line: 6579
		--[[
			Upvalues:
				[1] = GUI
				[2] = t_CurrentCamera2
				[3] = bool1
				[4] = u10
				[5] = Crosshairs_
				[6] = Scope
				[7] = UserInputService_
		--]]
		if script.Parent.CBScoreboard.Enabled == true or script.Parent.GUI.Main.GlobalChat.ActiveOne.Value == true or script.Parent.GUI.Main.TeamChat.ActiveOne.Value == true or script.Parent.GUI.ShopMenu.Visible == true or script.Parent.Menew.Enabled == true or GUI.TeamSelection.Visible or GUI["Inventory&Loadout"].Visible or Buymenuframe.Visible or GUI.MapVote.Visible or vipmenu.Visible or CrosshairCustom.Visible or ShopMenu.Visible or menugui.Enabled or script.Parent.GUI.Spectate.Visible == true and (t_CurrentCamera2.CameraType ~= Enum.CameraType.Scriptable or t_CurrentCamera2.CameraType == Enum.CameraType.Scriptable and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("toolname") and game.ReplicatedStorage.Weapons:FindFirstChild(t_CurrentCamera2.Arms.toolname.Value) and game.ReplicatedStorage.Weapons:FindFirstChild(t_CurrentCamera2.Arms.toolname.Value):FindFirstChild("Scoped")) then
			script.Parent.GUI.Crosshairs.Crosshair.Visible = true;
			script.Parent.GUI.Crosshairs.Scope.Visible = false;
			script.Parent.GUI.Crosshairs.Frame1.Visible = false;
			script.Parent.GUI.Crosshairs.Frame2.Visible = false;
			script.Parent.GUI.Crosshairs.Frame3.Visible = false;
			script.Parent.GUI.Crosshairs.Frame4.Visible = false;
			bool1 = false;
			u10 = nil;
			Crosshairs_.Visible = false;
			if t_CurrentCamera2.CameraType == Enum.CameraType.Scriptable and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("ADS") then
				Crosshairs_.Visible = true;
				script.Parent.GUI.Crosshairs.Crosshair.Visible = false;
				script.Parent.GUI.Crosshairs.Scope.Visible = true;
				script.Parent.GUI.Crosshairs.Frame1.Visible = true;
				script.Parent.GUI.Crosshairs.Frame2.Visible = true;
				script.Parent.GUI.Crosshairs.Frame3.Visible = true;
				script.Parent.GUI.Crosshairs.Frame4.Visible = true;
				Scope.Position = UDim2.new(0.5, -10 - GUI.AbsoluteSize.y / 2, 0, -28);
				Scope.Size = UDim2.new(0, GUI.AbsoluteSize.y + 20, 0, GUI.AbsoluteSize.y + 20);
				Scope.Scope.ImageTransparency = 0;
				Scope.Scope.Blur.ImageTransparency = 1;
				Scope.Scope.Blur.Blur.ImageTransparency = 1;
				Crosshairs_.Frame1.Size = UDim2.new(1, (GUI.AbsoluteSize.x - GUI.AbsoluteSize.y) / 2 + 24, 3, 20);
				Crosshairs_.Frame1.Position = UDim2.new(-1, -26, -0.75, -10);
				Crosshairs_.Frame2.Size = UDim2.new(1, (GUI.AbsoluteSize.x - GUI.AbsoluteSize.y) / 2 + 120, 3, 20);
				Crosshairs_.Frame2.Position = UDim2.new(1, 3 - (GUI.AbsoluteSize.x - GUI.AbsoluteSize.y) / 2, -0.75, -10);
			end
			if GUI.Spectate.Visible == true and script.Parent.GUI.Main.GlobalChat.ActiveOne.Value == false and script.Parent.GUI.Main.TeamChat.ActiveOne.Value == false and script.Parent.Menew.Enabled == false and GUI["Inventory&Loadout"].Visible == false and script.Parent.GUI.ShopMenu.Visible == false and GUI.TeamSelection.Visible == false and GUI.MapVote.Visible == false and Buymenuframe.Visible == false and CrosshairCustom.Visible == false and vipmenu.Visible == false and ShopMenu.Visible == false and InvenFrame.Visible == false and script.Parent.CBScoreboard.Enabled == false then
				UserInputService_.MouseIconEnabled = false;
				Crosshairs_.Visible = true;
			else
				UserInputService_.MouseIconEnabled = true;
			end
			if script.Parent:FindFirstChild("Loading") then
				UserInputService_.MouseIconEnabled = true;
			end
		else
			UserInputService_.MouseIconEnabled = false;
		end
	end);
	rstick = math.max(p142 * 60, 0);
	local t_p3 = u4.p;
	local v57 = CFrame.Angles(0, t_p3.X, 0) * CFrame.Angles(t_p3.Y, 0, 0);
	t_CurrentCamera2.CFrame = t_CurrentCamera2.CFrame * revert * v57 * CFrame.Angles(0, 0, script.Ang.Value);
	revert = v57:inverse();
	local v58 = 3;
	local bool50 = false;
	local fullycrouched_ret = fullycrouched();
	if gun and gun ~= "none" and gun.Model:FindFirstChild("Shoot") then
		bool50 = true;
		v58 = fullycrouched_ret == true and gun.Spread.RecoveryTime.Crouched.Value or gun.Spread.RecoveryTime.Value;
		if jumping == true then
			v58 = v58 * 2;
		end
	end
	if t_Character and t_Character.PrimaryPart and t_Character.PrimaryPart.Velocity.Y >= (game.Workspace.Gravity * 2 * 4) ^ 2 then
		local t_PrimaryPart = t_Character.PrimaryPart;
		t_PrimaryPart.Velocity = t_PrimaryPart.Velocity * Vector3.new(1, 0, 1);
	end
	tickspent = tickspent + rstick;
	if tickspent >= 1 then
		tickspent = math.min(2, tickspent - 1);
		if math.abs(rotx) <= 0.001 then
			rotx = 0;
		else
			rotx = rotx * 0.15;
		end
		if math.abs(rotz) <= 0.001 then
			rotz = 0;
		else
			rotz = rotz * 0.15;
		end
	end
	if (docam == nil or tick() - docam >= 1 / 60) and (recoilx > 0 or recoily > 0 or recoily2 > 0 or recoilx2 > 0 or recoily3 > 0 or recoilx3 > 0) then
		local decayshake_ret1, decayshake_ret2 = decayshake(Vector3.new(recoilx2, recoily2, 0), 18, 0.059341194567807204, p142);
		recoilx2 = decayshake_ret1;
		recoily2 = decayshake_ret2;
		local decayshake_ret1_2, decayshake_ret2_2 = decayshake(Vector3.new(recoilx, recoily, 0), 4.5, 0.059341194567807204, p142);
		recoilx = decayshake_ret1_2;
		recoily = decayshake_ret2_2;
	end
	FramesPerSecond = 1 / (tick() - PreviousTime);
	PreviousTime = tick();
	if u21 ~= "" and game.Workspace.Status.HasBomb.Value ~= player.Name then
		u21 = "";
		updateInventory();
		if str5 == "equipment2" then
			autoequip();
		end
	end
	local success2 = pcall(function() -- Line: 6675
		game:Kick();
	end);
	if success2 then
		for __ in function() -- Line: 6680
			return function() -- Line: 6680
				return true;
			end;
		end do
		end
	end
	if script.Parent:FindFirstChild("GUI") then
		GUI.ShopMenu.TempMenu.Visible = GUI.ShopMenu.Visible;
		if game.ReplicatedStorage.gametype.Value == "deathmatch" then
			if u14 ~= "" then
				u29 = game.ReplicatedStorage.Weapons[u13].StoredAmmo.Value;
			end
			if u16 ~= "" then
				u31 = game.ReplicatedStorage.Weapons[u16].StoredAmmo.Value;
			end
		end
		if UserInputService_.MouseIconEnabled == true then
			script.Parent.GUI.TextButton.Visible = true;
			script.Parent.GUI.TextButton.Modal = true;
		else
			script.Parent.GUI.TextButton.Visible = false;
			script.Parent.GUI.TextButton.Modal = false;
		end
		if Humanoid then
			if Humanoid:GetState() == Enum.HumanoidStateType.Swimming then
				Humanoid.JumpPower = 22.2;
			else
				Humanoid.JumpPower = 20;
			end
		end
		num12 = 0.9;
		if LoadAnimation_ret9 and LoadAnimation_ret9.IsPlaying == true and adsmodifier > 0 then
			LoadAnimation_ret9:Stop();
		end
		if LoadAnimation_ret10 and LoadAnimation_ret10.IsPlaying == true and adsmodifier > 0 then
			LoadAnimation_ret10:Stop();
		end
		if game.ReplicatedFirst:FindFirstChild("CustomLoadingScreen") == nil then
			game.ReplicatedStorage.Events.RemoteEvent:FireServer({
				"kick",
				"error 4"
			});
		end
		if u25 > 150 or u26 > 150 then
			game.ReplicatedStorage.Events.RemoteEvent:FireServer({
				"kick",
				"error 2"
			});
		end
		if t_LocalPlayer and t_LocalPlayer:FindFirstChild("DefuseKit") then
			GUI.AmmoGUI.DefuseKit.Visible = true;
		else
			GUI.AmmoGUI.DefuseKit.Visible = false;
		end
		if t_LocalPlayer.Status.Alive.Value == false and player.Character == nil and t_LocalPlayer.PlayerGui.GUI.Spectate.Visible == false then
			t_CurrentCamera2.CameraSubject = nil;
			t_CurrentCamera2.CameraType = "Fixed";
			t_LocalPlayer.CameraMaxZoomDistance = 10;
			t_LocalPlayer.CameraMinZoomDistance = 10;
			t_LocalPlayer.PlayerGui.GUI.Spectate.Visible = true;
			str5 = "none";
			AmmoGUI.Visible = false;
			Vitals.Visible = false;
			gun = "none";
			fgun = getref(gun);
			updateInventory();
			bool7 = true;
			return;
		end
		if Buymenuframe.Visible == true then
			t_CurrentCamera2.Blur.Size = math.min(t_CurrentCamera2.Blur.Size + 1.8, 24);
		else
			t_CurrentCamera2.Blur.Size = math.max(t_CurrentCamera2.Blur.Size - 2.4, 0);
		end
		if game.ReplicatedStorage.Warmup.Value == false and game.Workspace.Status.TWins.Value == 0 and game.Workspace.Status.CTWins.Value == 0 and u14 ~= "" and game.ReplicatedStorage.gametype.Value ~= "juggernaut" and game.ReplicatedStorage.gametype.Value ~= "deathmatch" and game.ReplicatedStorage.RifleRound.Value == false then
			u13 = "";
			u14 = "";
			autoequip();
			updateInventory();
		end
		local v90 = 0;
		spread2 = 0;
		local v95;
		if bool50 then
			local t_Value15 = gun.Spread.Value;
			v95 = fullycrouched_ret == true and t_Value15 + gun.Spread.Crouch.Value or t_Value15 + gun.Spread.Stand.Value;
			if v95 <= 20 and gun:FindFirstChild("SMGThing") == nil then
				v95 = v95 / 10;
			end
			if gun:FindFirstChild("snipo") then
				v95 = v95 * (1 - adsmodifier);
			end
			if gun.Name == "Negev" and numShots >= 16 then
				v95 = 0;
			end
			if t_Character and t_Character.PrimaryPart and jumping == true and climbing == false then
				v95 = v95 + gun.Spread.Jump.Value * 1.5;
				local v141 = gun.Spread.InitialJump.Value * 1.5;
				local v142 = (Humanoid.JumpHeight * workspace.Gravity * 2) ^ 0.25;
				local v143 = math.abs(t_Character.PrimaryPart.Velocity.Y) ^ 0.5;
				local v144 = m_Mathlib.RemapVal(v143, v142 * 0.25, v142, 0, v141);
				if v144 < 0 then
					v144 = 0;
				elseif v141 * 2 < v144 then
					v144 = v141 * 2;
				end
				spread2 = spread2 + v144;
			end
			if climbing == true then
				v95 = v95 + gun.Spread.Ladder.Value * 1.5;
			end
			local rec = getrec();
			if tick() - ftick > 0 and numShots > 0 then
				numShots = Lerp(numShots, 0, (math.exp(p142 * -4.605170185988092)));
				if numShots <= 0.001 then
					numShots = 0;
				end
			end
			firespread = rec;
			if fgun.Bullets.Value > 1 then
				firespread = 0;
			end
			if numShots > 0 and bool50 == true then
				v90 = getpat(numShots + 1).fMagnitude;
			end
			if isburst() then
				v95 = (v95 + 5) * 1.5;
				firespread = firespread * 1.5;
			end
			if t_Character and t_Character.PrimaryPart then
				local t_Velocity = t_Character.PrimaryPart.Velocity;
				local v145 = (t_Velocity.X ^ 2 + t_Velocity.Z ^ 2) ^ 0.5;
				if (fullycrouched_ret == false or jumping == true) and climbing == false then
					local v148 = curspd * 0.34 * 0.0625;
					local v149 = curspd * 0.95 * 0.0625;
					local v150 = m_Mathlib.RemapValClamped(v145, v148, v149, 0, 1);
					if not walking and not t_Character:FindFirstChild("Crouched") then
						v150 = v150 ^ 0.25;
					end
					spread2 = spread2 + gun.Spread.Move.Value * 1.5 * v150;
				end
			end
		else
			v95 = 0;
			firespread = 0;
		end
		if u1 < v95 then
			u1 = v95;
		else
			u1 = Lerp(u1, v95, (math.exp(p142 * -(2.302585092994046 / v58))));
		end
		local v91 = math.deg((u1 + firespread * 0.55 * v90 * 0.75 + spread2) * accuracy_sd) * 10 * script.Parent.GUI.AbsoluteSize.Y / 600;
		if t_LocalPlayer.PlayerGui.GUI.Crosshairs.Crosshair.Visible then
			local v119 = dynamic == false and CHwideness or math.max(CHwideness, v91 + (CHwideness - 7));
			local t_Crosshair2 = t_LocalPlayer.PlayerGui.GUI.Crosshairs.Crosshair;
			t_Crosshair2.BottomFrame.Position = UDim2.new(0, -1, 0, -(t_Crosshair2.LeftFrame.Size.X.Offset + v119));
			t_Crosshair2.LeftFrame.Position = UDim2.new(0, -(t_Crosshair2.LeftFrame.Size.X.Offset + v119), 0, -1);
			t_Crosshair2.RightFrame.Position = UDim2.new(0, v119, 0, -1);
			t_Crosshair2.TopFrame.Position = UDim2.new(0, -1, 0, v119);
			local v120 = (v119 + t_Crosshair2.RightFrame.Size.X.Offset + t_Crosshair2.RightFrame.BorderSizePixel) * 2;
			t_Crosshair2.Center1.Size = UDim2.new(0, v120, 0, v120);
			t_Crosshair2.Center1.Position = UDim2.new(0, -v120 / 2, 0, -v120 / 2);
		end
		if gun ~= "none" and gun and gun.className == "Folder" and gun:FindFirstChild("Scoped") and u11 == true then
			if aidle and aidle.IsPlaying == false then
				aidle:Play();
			end
		elseif aidle and aidle.IsPlaying == true then
			aidle:Stop();
		end
		local math_ceil_ret2 = math.ceil(FramesPerSecond);
		local t_Performance = script.Parent.Performance;
		local __ = script.Parent.Menew;
		t_Performance.Perf.Text = "FPS: " .. math.clamp(math_ceil_ret2, 0, 1000) .. ", Ping: " .. game.Players.LocalPlayer.Ping.Value .. " ms, Server Location: " .. game.ReplicatedStorage.Location.Value;
		if t_LocalPlayer.Ping.Value >= 300 then
			t_Performance.Perf.TextColor3 = Color3.new(1, 0, 0);
		elseif t_LocalPlayer.Ping.Value >= 150 then
			t_Performance.Perf.TextColor3 = Color3.new(1, 1, 0);
		else
			t_Performance.Perf.TextColor3 = Color3.new(1, 1, 1);
		end
		if Humanoid and Humanoid.Health > 0 then
			if str5 == "equipment2" and LoadAnimation_ret12 and LoadAnimation_ret12.IsPlaying == true then
				changeviewheight(0.05 - num12);
			elseif t_Character and t_Character:FindFirstChild("Crouched") then
				if crouchJump == true then
					if u40 ~= 0.05 - num12 then
						u40 = 0.05 - num12;
						t_Character.HumanoidRootPart.CFrame = t_Character.HumanoidRootPart.CFrame * CFrame.new(0, num12, 0);
					end
				else
					changeviewheight(0.05 - num12);
				end
			elseif crouchJump == false then
				changeviewheight(0.05);
			end
			if Humanoid:GetState() == Enum.HumanoidStateType.Jumping or Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
				if jumping == false then
					maxyvel = 0;
					jumping = true;
					jumptick = tick();
					delay(1 / 30, function() -- Line: 6876
						--[[
							Upvalues:
								[1] = t_Character
						--]]
						jumpat = t_Character.PrimaryPart.Position.Y;
					end);
				end
				if t_Character and t_Character.PrimaryPart and t_Character.PrimaryPart.Velocity.Y <= -game.Workspace.Gravity * 2.5 then
					putatspawn();
				end
				if jumping == true and tick() - jumptick >= 0.1 and workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Clips") and workspace.Map:FindFirstChild("Geometry") then
					local FindPartOnRayWithWhitelist_ret1_3, __ = workspace:FindPartOnRayWithWhitelist(Ray.new(t_Character.PrimaryPart.Position, (Vector3.new(0, -(Humanoid.HipHeight + t_Character.PrimaryPart.Size.Y / 2 + 0.1), 0))), {
						workspace.Map.Geometry,
						workspace.Map.Clips
					});
					if FindPartOnRayWithWhitelist_ret1_3 then
						Humanoid:ChangeState(Enum.HumanoidStateType.Landed);
					end
				end
			elseif jumping == true then
				if t_Character and t_Character:FindFirstChild("Head") then
					local v158 = -t_Character.PrimaryPart.Velocity.Y;
					if maxyvel < v158 then
						maxyvel = v158;
					end
					if t_Character.PrimaryPart.Position.Y <= jumpat then
						if t_LocalPlayer and t_LocalPlayer.Status.Team.Value == "CT" then
							m_Sound.rplaysound(t_Character.Head["CTLand" .. math.random(1, 4)]);
						else
							m_Sound.rplaysound(t_Character.Head["Land" .. math.random(1, 4)]);
						end
					end
					lastlanded = tick();
					landing = true;
					if gun ~= "none" and gun:FindFirstChild("Spread") and gun.Spread:FindFirstChild("Land") then
						u1 = u1 + gun.Spread.Land.Value * 1.5 * maxyvel / 0.0625;
					end
					crouchJump = false;
					task.spawn(function() -- Line: 6903
						--[[
							Upvalues:
								[1] = RunService
						--]]
						local tick_ret24 = tick();
						while true do
							RunService.RenderStepped:wait();
							if jumping == true then return end
							if tick() - tick_ret24 < 0.25 then continue end
							landing = false;
							return;
						end
					end);
				end
				jumping = false;
			end
			climbing = Humanoid and (Humanoid:GetState() == Enum.HumanoidStateType.Climbing or t_Character:FindFirstChild("Climbing")) and true or false;
			if t_LocalPlayer and t_LocalPlayer.Character and t_LocalPlayer.Character:FindFirstChild("UpperTorso") and t_LocalPlayer.Character.UpperTorso.Velocity.magnitude >= 1 and jumping == false and (Humanoid:GetState() == Enum.HumanoidStateType.Running or Humanoid:GetState() == Enum.HumanoidStateType.RunningNoPhysics) and (bool6 == false or crouchcooldown > 2 or t_LocalPlayer.Character.UpperTorso.Velocity.magnitude >= 5) and climbing == false then
				running = true;
			else
				running = false;
			end
			t_Y3 = t_CurrentCamera2.CFrame.lookVector.Y;
			if t_Y3 and u39 and t_Y3 ~= u39 then
				game.ReplicatedStorage.Events.ControlTurn:FireServer(t_Y3, climbing);
			end
			u39 = t_Y3;
			speedupdate();
			if t_Character:FindFirstChild("Crouched") then
				if u38 < 1 then
					u38 = math.min(1, u38 + 0.1);
				end
			elseif bool6 == false and u38 > 0 then
				u38 = math.max(0, u38 - 0.1);
			end
			local t_Crosshair = GUI.Crosshairs.Crosshair;
			local bool52;
			if (gun == "none" or not gun or not gun:FindFirstChild("Scoped") or gun:FindFirstChild("RifleThing") ~= nil or RunService:IsStudio()) and u11 ~= true then
				bool52 = true;
			else
				bool52 = false;
			end
			t_Crosshair.Visible = bool52;
			if str5 ~= "none" and gun ~= "none" and gun and gun:FindFirstChild("Scoped") then
				Scope.Position = UDim2.new(0.5, -10 - GUI.AbsoluteSize.y / 2, 0, -28);
				Scope.Size = UDim2.new(0, GUI.AbsoluteSize.y + 20, 0, GUI.AbsoluteSize.y + 20);
				u41 = math.clamp((u1 + spread2) / 25, 0, 1);
				Scope.Scope.ImageTransparency = u41 * 1;
				if t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Dot") then
					t_CurrentCamera2.Arms.Dot.Transparency = u41 * 0.8 + 0;
				end
				Scope.Scope.Blur.ImageTransparency = 1 - u41 * 0.05;
				Scope.Scope.Blur.Blur.ImageTransparency = 1 - u41 * 0.15;
				Crosshairs_.Frame1.Size = UDim2.new(1, (GUI.AbsoluteSize.x - GUI.AbsoluteSize.y) / 2 + 24, 3, 20);
				Crosshairs_.Frame1.Position = UDim2.new(-1, -26, -0.75, -10);
				Crosshairs_.Frame2.Size = UDim2.new(1, (GUI.AbsoluteSize.x - GUI.AbsoluteSize.y) / 2 + 120, 3, 20);
				Crosshairs_.Frame2.Position = UDim2.new(1, 3 - (GUI.AbsoluteSize.x - GUI.AbsoluteSize.y) / 2, -0.75, -10);
			end
			if t_Character and t_Character:FindFirstChild("Crouched") then
				if UpperTorso and UpperTorso.Velocity.magnitude >= 1 and LoadAnimation_ret2 then
					if dochange ~= "" then
						if LoadAnimation_ret2 and LoadAnimation_ret2.IsPlaying == true then
							LoadAnimation_ret2:Stop(crouchcooldown / 4 * 2, nil, nil);
						end
						LoadAnimation_ret2 = Humanoid.Animator:LoadAnimation(script.Crouching[dochange .. "Walk"]);
						dochange = "";
					end
					if LoadAnimation_ret2 and LoadAnimation_ret2.IsPlaying == false then
						LoadAnimation_ret2:Play(math.max(0.4, crouchcooldown / 4 * 2), nil, nil);
					end
					if LoadAnimation_ret2 then
						LoadAnimation_ret2:AdjustSpeed(UpperTorso.Velocity.Magnitude / 6.116);
					end
				elseif LoadAnimation_ret2 and LoadAnimation_ret2.IsPlaying == true then
					LoadAnimation_ret2:Stop(math.max(0.4, crouchcooldown / 4 * 2), nil, nil);
				end
			end
			if t_Character and bool6 == false then
				if UpperTorso and UpperTorso.Velocity.magnitude < 10 and shiftwalkanim and running == true then
					if dochange2 ~= "" then
						if shiftwalkanim and shiftwalkanim.IsPlaying == true then
							shiftwalkanim:Stop(0.4, nil, nil);
						end
						shiftwalkanim = Humanoid.Animator:LoadAnimation(script.Walking[dochange2 .. "Walk"]);
						dochange2 = "";
					end
					if shiftwalkanim and shiftwalkanim.IsPlaying == false then
						shiftwalkanim:Play(0.4, nil, nil);
					end
					if shiftwalkanim then
						shiftwalkanim:AdjustSpeed(UpperTorso.Velocity.Magnitude / 10);
					end
				elseif shiftwalkanim and shiftwalkanim.IsPlaying == true then
					shiftwalkanim:Stop(0.4, nil, nil);
				end
			end
		end
		if UpperTorso and t_Character and t_Character:FindFirstChild("HumanoidRootPart") and t_Character:FindFirstChild("Head") and t_Character:FindFirstChild("Humanoid") then
			Humanoid.CameraOffset = Vector3.new(0, u40, 0);
		end
		if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_Character and t_Character:FindFirstChild("UpperTorso") then
			local Arms = t_CurrentCamera2:FindFirstChild("Arms");
			if u12 then
				if u34 < 0.5 then
					u34 = math.min(0.5, u34 + rstick * 0.05);
				end
			elseif u34 > 0 then
				u34 = math.max(0, u34 - rstick * 0.05);
			end
			local math_abs = math.abs;
			local math_cos = math.cos;
			local v121 = math_cos(tick() * (math.pi * 2.5));
			if mgn < UpperTorso.Velocity.magnitude then
				mgn = math.min(UpperTorso.Velocity.magnitude, mgn + 1);
			end
			if mgn > UpperTorso.Velocity.magnitude then
				mgn = math.max(UpperTorso.Velocity.magnitude, mgn - 1.5);
			end
			local v122 = mgn / 18.35;
			local v123 = u11 == true and CFrame.new(v121 / 10 * (v122 * 0.35) * u34, math_abs(v121 / 10) * v122 * 0.35 * -u34, 0) or CFrame.new((v122 * 0.25 + v121 / 10 * v122) * u34, (v122 * 0.25 + math_abs(v121 / 10) * v122) * -u34, math_abs(v122 * 0.25) * u34);
			if Arms:FindFirstChild("CSSArms") and t_LocalPlayer and t_LocalPlayer.Character and t_LocalPlayer.Character:FindFirstChild("RightUpperArm") and t_LocalPlayer.Character:FindFirstChild("Shirt") then
				local CSSArms = Arms:FindFirstChild("CSSArms");
				local FindFirstChild_ret9 = CSSArms:FindFirstChild("Right Arm");
				FindFirstChild_ret9.Transparency = 0;
				FindFirstChild_ret9.Shirt.Texture = t_LocalPlayer.Character.Shirt.ShirtTemplate;
				FindFirstChild_ret9.BrickColor = t_LocalPlayer.Character.RightUpperArm.BrickColor;
				if t_LocalPlayer.Character:FindFirstChild("LeftUpperArm") and t_CurrentCamera2.Arms.CSSArms:FindFirstChild("Left Arm") then
					local FindFirstChild_ret10 = CSSArms:FindFirstChild("Left Arm");
					FindFirstChild_ret10.Transparency = 0;
					FindFirstChild_ret10.Shirt.Texture = t_LocalPlayer.Character.Shirt.ShirtTemplate;
					FindFirstChild_ret10.BrickColor = t_LocalPlayer.Character.LeftUpperArm.BrickColor;
				end
			end
			local v124 = Arms:FindFirstChild("VOffset") and CFrame.new(Arms.VOffset.Value * (1 - adsmodifier)) or CFrame.new(Vector3.new(0.6, -0.45, -0.15) * (1 - adsmodifier));
			if tonumber(adsmodifier) and adsmodifier < 1 and t_Character:FindFirstChild("AIMING") then
				if gun ~= "none" and gun and gun:FindFirstChild("Scoped") and gun:FindFirstChild("RifleThing") == nil then
					adsmodifier = 1;
				else
					adsmodifier = mmin(1, Lerp(adsmodifier, 1, (math.exp(p142 * -18))));
				end
			end
			if tonumber(adsmodifier) and adsmodifier > 0 and t_Character:FindFirstChild("AIMING") == nil then
				if gun ~= "none" and gun and gun:FindFirstChild("Scoped") and gun:FindFirstChild("RifleThing") == nil then
					adsmodifier = 0;
				else
					adsmodifier = mmax(0, Lerp(adsmodifier, 0, (math.exp(p142 * -18))));
				end
			end
			Arms.PrimaryPart.Anchored = true;
			local v125 = t_CurrentCamera2.CFrame * v124;
			if dontshowme > 0 then
				dontshowme = dontshowme - rstick * 1;
				v125 = v125 * CFrame.new(0, 100, 0);
			end
			local v126 = v125 * v123;
			if u11 == true and gun ~= "none" and gun and gun:FindFirstChild("Scoped") then
				Crosshairs_.Position = UDim2.new(v123.X, 0, -v123.Y, 0);
			else
				Crosshairs_.Position = UDim2.new(0, 0, 0, 0);
			end
			u35 = adsoffset;
			local toEulerAnglesXYZ_ret1_2, toEulerAnglesXYZ_ret2_2, toEulerAnglesXYZ_ret3_2 = u35:toEulerAnglesXYZ();
			if tonumber(adsmodifier) then
				v126 = v126 * CFrame.new(u35.X * adsmodifier, u35.Y * adsmodifier, u35.Z * adsmodifier) * CFrame.Angles(toEulerAnglesXYZ_ret1_2 * adsmodifier, toEulerAnglesXYZ_ret2_2 * adsmodifier, toEulerAnglesXYZ_ret3_2 * adsmodifier);
			end
			if t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms2") then
				t_CurrentCamera2.Arms2.PrimaryPart.Anchored = true;
				t_CurrentCamera2.Arms2:SetPrimaryPartCFrame(t_CurrentCamera.CFrame * v123);
			end
			local v127 = u2.p / 2;
			local vec3_2 = Vector3.new(-v127.Z, v127.Y, v127.X);
			local t_p4 = u3.p;
			local v128 = v126 * CFrame.new(t_p4.X, t_p4.Y, t_p4.Z) * CFrame.Angles(vec3_2.X, vec3_2.Y, vec3_2.Z);
			local __, __, __ = (t_CurrentCamera2.CFrame * revert):toEulerAnglesXYZ();
			u2.t = Vector3.new(0, recoilx * (1 - adsmodifier) * 0.5, -recoily * (1 - adsmodifier) * 0.5);
			u3.t = Vector3.new(-clmp(rotx), clmp(rotz), -math.abs((clmp(rotx))) / 4);
			updtcam();
			if game.Workspace:FindFirstChild("Crate") then
				v128 = v128 * CFrame.new(0, 150, 0);
			end
			Arms:SetPrimaryPartCFrame(v128);
		end
		if t_Character and t_Character:FindFirstChild("PF") == nil and (bool1 == true or gun and gun ~= "none" and gun.Name == "R8" and bool2 == true) and DISABLED == false and Humanoid and Humanoid.Health > 0 and game.Workspace.Status.Preparation.Value == false and t_LocalPlayer.PlayerGui.GUI.Defusal.Visible == false then
			if gun.Name == "R8" and bool1 == true then
				bool1 = false;
				LoadAnimation_ret12:Stop();
				LoadAnimation_ret13:Play(nil, nil, 0.65);
				pulling = true;
				local tick_ret23 = tick();
				task.spawn(function() -- Line: 7058
					--[[
						Upvalues:
							[1] = t_Character
							[2] = m_Sound
							[3] = LoadAnimation_ret13
							[4] = tick_ret23
							[5] = str5
							[6] = u26
							[7] = u25
							[8] = bool1
					--]]
					if pulling == true then
						if t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("pull") then
							m_Sound.rplaysound(t_Character.Gun.pull);
						end
						repeat
							task.wait(1 / 60);
							if jumping == true then
								LoadAnimation_ret13:Stop(0.3);
								return;
							end
							if DISABLED == true then return end
							if pulling == false then return end
						until tick() - tick_ret23 >= 0.2;
						pulling = false;
						firebullet();
						if (str5 == "secondary" and u26 <= 0 or str5 == "primary" and u25 <= 0) and t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Empty") then
							m_Sound.rplaysound(t_Character.Gun.Empty);
							bool1 = false;
						end
					end
				end);
			elseif isgrenade() == false then
				if (bool1 == true or gun and gun ~= "none" and gun.Name == "R8" and bool2 == true) and mode ~= "automatic" and (gun == "none" or not gun or gun == "none" or not gun:FindFirstChild("Melee") and not gun:FindFirstChild("Grenade") or not fgun:FindFirstChild("Auto") or fgun.Auto.Value ~= true) then
					bool1 = false;
					if gun and gun.Name == "R8" then
						bool2 = false;
					end
				end
				if gun.Name == "R8" then
					firebullet(true);
				else
					firebullet();
				end
				if t_Character:FindFirstChild("Charging") then
					chargeleft = 0;
				end
				if (str5 == "secondary" and u26 <= 0 or str5 == "primary" and u25 <= 0) and t_Character and t_Character:FindFirstChild("Gun") and t_Character.Gun:FindFirstChild("Empty") then
					local v159 = m_Sound.rplaysound(t_Character.Gun.Empty);
					v159.Parent = script.Parent.LocalSounds;
					bool1 = false;
				end
			end
		end
		if t_Character and t_Character:FindFirstChild("Charging") and t_Character:FindFirstChild("HumanoidRootPart") and Vector3.new(t_Character.HumanoidRootPart.Velocity.X, 0, t_Character.HumanoidRootPart.Velocity.Z).magnitude <= 16 and chargeleft <= 80 then
			chargeleft = 0;
		end
		if t_Character and t_Character:FindFirstChild("Charging") then
			chargeleft = math.clamp(chargeleft - rstick * 100 / 90, 0, 100);
			if chargeleft <= 0 then
				t_Character.Charging:Destroy();
				m_Sound.stopsound("Charge", t_LocalPlayer.Character.HumanoidRootPart);
			end
		else
			local v129 = chargeleft < 100;
			chargeleft = math.clamp(chargeleft + rstick * 100 / 480, 0, 100);
			if chargeleft == 100 and v129 == true then
				m_Sound.playsound(script.Parent.Sounds.Recharged);
			end
		end
		if game.ReplicatedStorage.gametype.Value == "juggernaut" and player.Status.Team.Value == "T" and t_Character and t_Character:FindFirstChild("Rage") then
			script.Parent.GUI.AmmoGUI.chrg.Visible = true;
			script.Parent.GUI.AmmoGUI.rag.Visible = true;
			script.Parent.GUI.AmmoGUI.chrg.Text = "Rage (G): " .. math.floor(t_Character.Rage.Value) .. "%";
			script.Parent.GUI.AmmoGUI.rag.Text = "Charge (RMB): " .. math.floor(chargeleft) .. "%";
		else
			script.Parent.GUI.AmmoGUI.chrg.Visible = false;
			script.Parent.GUI.AmmoGUI.rag.Visible = false;
		end
		if t_Character and bool2 == true and DISABLED == false and Humanoid and Humanoid.Health > 0 then
			if game.ReplicatedStorage.gametype.Value == "juggernaut" and t_LocalPlayer.Status.Team.Value == "T" and t_Character:GetAttribute("Speed") > 0 then
				if chargeleft == 100 then
					bool2 = false;
					m_Sound.rplaysound(t_LocalPlayer.Character.HumanoidRootPart.Charge);
					local Charging = Instance.new("IntValue");
					Charging.Name = "Charging";
					Charging.Parent = t_LocalPlayer.Character;
				end
			else
				if str5 == "melee" and game.Workspace.Status.Preparation.Value == false and t_CurrentCamera2 and t_CurrentCamera2:FindFirstChild("Arms") and t_CurrentCamera2.Arms:FindFirstChild("Flash") == nil and t_LocalPlayer.PlayerGui.GUI.Defusal.Visible == false then
					if mode ~= "automatic" and (gun == "none" or not gun or gun == "none" or not gun:FindFirstChild("Melee")) then
						bool2 = false;
					end
					firebullet();
				end
				changeburstmode();
			end
		end
		if Humanoid and Humanoid.Health > 0 then
			player.PlayerGui.GUI.KillCam.Visible = false;
			player.PlayerGui.GUI.KillCam.Animate.Disabled = true;
			if t_Character:FindFirstChild("PF") then
				Humanoid.PlatformStand = true;
			else
				Humanoid.PlatformStand = false;
			end
		else
			script.Parent.GUI.Crosshairs.Crosshair.Visible = true;
			script.Parent.GUI.Crosshairs.Scope.Visible = false;
			script.Parent.GUI.Crosshairs.Frame1.Visible = false;
			script.Parent.GUI.Crosshairs.Frame2.Visible = false;
			script.Parent.GUI.Crosshairs.Frame3.Visible = false;
			script.Parent.GUI.Crosshairs.Frame4.Visible = false;
		end
		if UserInputService_.MouseIconEnabled == true then
			Crosshairs_.Visible = false;
		end
		if UserInputService_.MouseIconEnabled == false and game.Workspace:FindFirstChild("Map") then
			Crosshairs_.Visible = true;
			local table21 = {
				game.Workspace.Ray_Ignore,
				t_CurrentCamera2,
				game.Workspace.Map:WaitForChild("Clips"),
				game.Workspace.Map:WaitForChild("SpawnPoints")
			};
			if t_Character then
				table.insert(table21, t_Character);
			end
			local Ray_new_ret7 = Ray.new(t_CurrentCamera2.CFrame.p, t_CurrentCamera2.CFrame.lookVector * 999);
			local v130, __ = game.Workspace:FindPartOnRayWithIgnoreList(Ray_new_ret7, table21);
			if v130 ~= u10 or health1.Visible == false or currentTargetHealth and u10 and u10:FindFirstChild("Humanoid") and u10:FindFirstChild("Humanoid").Health ~= currentTargetHealth then
				u10 = v130;
				health1.Visible = false;
				name500.Visible = false;
				name500.TextColor3 = BrickColor_new("White").Color;
				if Humanoid and Humanoid.Health > 0 or not Alive2.Value then
					if v130 and v130.Parent and v130.Parent.Parent and (v130.Parent.Parent:FindFirstChild("Humanoid") or v130.Parent.Parent:FindFirstChild("Humanoid2")) then
						v130 = v130.Parent;
						u10 = v130;
					end
					if v130 and v130.Parent and v130.Parent:FindFirstChild("Humanoid2") or v130 and v130.Parent and v130.Parent:FindFirstChild("Humanoid") then
						local t_Parent = v130.Parent;
						if not v130 or not t_Parent or not t_Parent:FindFirstChild("Humanoid2") then
							if game.Players:GetPlayerFromCharacter(t_Parent) and game.Players:GetPlayerFromCharacter(t_Parent).Status.Team.Value == t_LocalPlayer.Status.Team.Value then
								if game.Players:GetPlayerFromCharacter(t_Parent) then
									if game.Players:GetPlayerFromCharacter(t_Parent):FindFirstChild("LockedIn") then
										game.Players:GetPlayerFromCharacter(t_Parent).LockedIn:Destroy();
									end
									local LockedIn = Instance.new("IntValue");
									LockedIn.Name = "LockedIn";
									LockedIn.Parent = game.Players:GetPlayerFromCharacter(t_Parent);
									delay(0.5, function() -- Line: 7222
										--[[
											Upvalues:
												[1] = LockedIn
										--]]
										LockedIn:Destroy();
									end);
								end
								u10 = nil;
							else
								name500.Text = "";
								u10 = nil;
								currentTargetHealth = nil;
							end
						end
					else
						name500.Text = "";
						currentTargetHealth = nil;
					end
				end
				t_SelectionSphere.Adornee = nil;
				door = nil;
				if v130 and v130.Parent and v130.Parent:FindFirstChild("Event") and ((v130.Name == "HumanoidRootPart" or v130.Name == "Handle") and v130.Parent.Name == "Door" or v130.Parent.Name ~= "Door") then
					door = v130;
				end
				if Alive2.Value and m_NewMouse and v130 and v130:IsA("BasePart") and v130:IsDescendantOf(game.Workspace.Debris) and UpperTorso and (v130.Position - UpperTorso.Position).magnitude <= 12 then
					local v151 = v130.Parent == game.Workspace.Debris and v130 or v130.Parent;
					if v151 and game.ReplicatedStorage.Weapons:FindFirstChild(v151.Name) and (game.ReplicatedStorage.Weapons:FindFirstChild(v151.Name):FindFirstChild("Equipment2") == nil or game.ReplicatedStorage.Weapons:FindFirstChild(v151.Name):FindFirstChild("Equipment2") and t_LocalPlayer.Status.Team.Value == "T") then
						name500.Visible = true;
						health1.Visible = true;
						health1.Text = "Press E to pick up";
						health1.TextColor3 = g_Cnew(1, 1, 1);
						name500.Text = GetName.getName(v151.Name);
						t_SelectionSphere.Adornee = v151;
					end
				end
			end
		end
	end
	crouchcooldown = math.max(0, crouchcooldown - rstick / 32);
	if Buymenuframe.Visible then
		GUI.Radar.Visible = false;
	elseif game.ReplicatedStorage.gametype.Value ~= "deathmatch" then
		GUI.Radar.Visible = true;
	end
	if Buymenuframe.Visible or player and player:FindFirstChild("Status") and player.Status.Alive.Value == false then
		GUI.Cash.Visible = false;
		GUI.Radar.Location.Visible = false;
		GUI.Top.Visible = false;
	else
		GUI.Radar.Location.Visible = true;
		GUI.Radar.Location.Text = "  " .. player.Location.Value;
		if game.ReplicatedStorage.gametype.Value == "deathmatch" then
			GUI.Top.Visible = true;
		else
			GUI.Radar.Visible = true;
		end
		GUI.Cash.Visible = true;
		GUI.Cash.Text = "$" .. player.Cash.Value;
	end
	if player and player.Status and player.Status.Alive.Value == false and player.Character == nil and GUI.TeamSelection.Visible == false then
		if game.ReplicatedStorage.gametype.Value == "deathmatch" then
			GUI.Top.Visible = true;
		else
			GUI.Top.Visible = false;
		end
	end
	if player and player.Status and player.Status.Alive.Value == true and game.Workspace.Status.BuyTime.Value > 0 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and game.Workspace.Map:FindFirstChild("SpawnPoints") then
		local Ray_new_ret6 = Ray.new(player.Character.HumanoidRootPart.Position, (Vector3.new(0, -150, 0)));
		local FindPartOnRayWithWhitelist_ret1_2, __ = game.Workspace:FindPartOnRayWithWhitelist(Ray_new_ret6, {game.Workspace.Map.SpawnPoints});
		if FindPartOnRayWithWhitelist_ret1_2 and FindPartOnRayWithWhitelist_ret1_2.Name == "BuyArea" and t_LocalPlayer.Status.Team.Value == "T" or FindPartOnRayWithWhitelist_ret1_2 and FindPartOnRayWithWhitelist_ret1_2.Name == "BuyArea2" and t_LocalPlayer.Status.Team.Value == "CT" or game.ReplicatedStorage.WarmupComp.Value == true or game.ReplicatedStorage.gametype.Value == "deathmatch" then
			GUI.Cash.BuyZone.Visible = true;
			if game.Players.LocalPlayer.Cash.Value >= 1000 then
				GUI.Cash:TweenSize(UDim2.new(0.32, 0, 0.04, 0), "In", "Sine", 0.35);
			end
		else
			GUI.Cash.BuyZone.Visible = false;
			GUI.Cash:TweenSize(UDim2.new(0.27, 0, 0.04, 0), "Out", "Sine", 0.35);
			if bool45 == false and t_Character and t_Character:FindFirstChild("Humanoid") and t_Character.Humanoid.Health > 0 and game.Workspace.Status.Preparation.Value == false and UpperTorso and UpperTorso.Velocity.magnitude >= 6 then
				bool45 = true;
				activatemusic("Start");
			end
		end
	end
	FixKillFeed();
	Buymenuframe.Base.Outline.Cash.Text = "$" .. player.Cash.Value;
	Buymenuframe.Base.Outline.TimeLeft.Text = "Buy Time Left: " .. game.Workspace.Status.BuyTime.Value;
	if Humanoid and Humanoid.Health > 0 then
		if Humanoid:GetState() == Enum.HumanoidStateType.StrafingNoPhysics then
			player:Kick("\nNoclipping.");
		end
		if Humanoid.Parent:FindFirstChild("Head") and not Humanoid.Parent.Head.CanCollide then
			player:Kick("\nNoclipping.");
		end
	elseif script.Parent:FindFirstChild("GUI") then
		script.Parent.GUI.Defusal.Visible = false;
	end
	if game.Workspace:FindFirstChild("C4") and script.Parent:FindFirstChild("GUI") then
		game.Players.LocalPlayer.PlayerGui.GUI.UpperInfo.Timer.TextTransparency = 1;
		game.Players.LocalPlayer.PlayerGui.GUI.UpperInfo.Timer.Bomb.Visible = true;
	elseif script.Parent:FindFirstChild("GUI") then
		game.Players.LocalPlayer.PlayerGui.GUI.UpperInfo.Timer.TextTransparency = 0;
		game.Players.LocalPlayer.PlayerGui.GUI.UpperInfo.Timer.Bomb.Visible = false;
	end
	if tick() - invcheck >= 0.05 then
		local v92 = u24;
		local bool51 = false;
		local v93 = nil;
		if v92 == 3 then
			if u22 ~= "" and str5 ~= "melee" then
				str5 = "melee";
				gun = game.ReplicatedStorage.Weapons[u22];
				bool51 = true;
			end
		elseif v92 == 2 then
			if u16 ~= "" and str5 ~= "secondary" then
				bool51 = true;
				str5 = "secondary";
				v93 = secondaryowner;
				gun = game.ReplicatedStorage.Weapons[u16];
			end
		elseif v92 == 1 then
			if u14 ~= "" and str5 ~= "primary" then
				bool51 = true;
				str5 = "primary";
				v93 = primaryowner;
				gun = game.ReplicatedStorage.Weapons[u14];
			end
		elseif v92 == 4 then
			if u17 ~= "" and str5 ~= "grenade" then
				bool51 = true;
				str5 = "grenade";
				gun = game.ReplicatedStorage.Weapons[u17];
			end
		elseif v92 == 5 then
			if u18 ~= "" and str5 ~= "grenade2" then
				bool51 = true;
				str5 = "grenade2";
				gun = game.ReplicatedStorage.Weapons[u18];
			end
		elseif v92 == 6 then
			if u19 ~= "" and str5 ~= "grenade3" then
				bool51 = true;
				str5 = "grenade3";
				gun = game.ReplicatedStorage.Weapons[u19];
			end
		elseif v92 == 7 then
			if u20 ~= "" and str5 ~= "grenade4" then
				bool51 = true;
				str5 = "grenade4";
				gun = game.ReplicatedStorage.Weapons[u20];
			end
		elseif v92 == 8 and u21 ~= "" and str5 ~= "equipment2" then
			bool51 = true;
			str5 = "equipment2";
			gun = game.ReplicatedStorage.Weapons[u21];
		end
		invcheck = tick();
		if bool51 then
			fgun = getref(gun);
			usethatgun(v93);
		end
	end
end);
game.Workspace.ChildAdded:connect(function(child6) -- Line: 7397
	if child6.Name == "Map" and game.Players.LocalPlayer:FindFirstChild("LocalData") and game.Players.LocalPlayer.LocalData:FindFirstChild("NoDecals") and game.Players.LocalPlayer.LocalData.NoDecals.Value == false then
		for __, descendant11 in pairs(child6:GetDescendants()) do
			pcall(function() -- Line: 7400
				--[[
					Upvalues:
						[1] = descendant11
				--]]
				if descendant11:IsA("Texture") or descendant11:IsA("Decal") and descendant11.Parent and descendant11.Parent.Name ~= "Radar2" and descendant11.Parent.Name ~= "Radar" then
					descendant11:Destroy();
				end
			end);
		end
	end
end);
local coroutine_wrap_ret3 = coroutine.wrap(function() -- Line: 7409
	while wait(5) do
		if game.Workspace.Status.CanRespawn.Value == true and game.Players.LocalPlayer.Status.Alive.Value == true and game.Players.LocalPlayer.Status.Team.Value ~= "Spectator" and (game.Players.LocalPlayer.Character == nil or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") == nil) then
			game.ReplicatedStorage.Events.ForceRespawn:FireServer();
		end
	end
end);
coroutine_wrap_ret3();
local tick_ret25 = nil;
while wait(0.2) do
	local bool53 = false;
	local Children30 = game.Workspace.Ray_Ignore.Fires:GetChildren();
	if #Children30 > 0 and t_Character and t_Character:FindFirstChild("HumanoidRootPart") then
		for index25 = 1, #Children30 do
			local Ray_new_ret8 = Ray.new(t_Character.HumanoidRootPart.Position, (Vector3.new(0, -10, 0)));
			local FindPartOnRayWithWhitelist_ret1_4, __ = game.Workspace:FindPartOnRayWithWhitelist(Ray_new_ret8, {Children30[index25]});
			if not FindPartOnRayWithWhitelist_ret1_4 or FindPartOnRayWithWhitelist_ret1_4.Fire.Enabled ~= true then continue end
			bool53 = true;
			if tick_ret25 == nil then
				tick_ret25 = tick();
			end
			game.ReplicatedStorage.Events.BURNME:FireServer(FindPartOnRayWithWhitelist_ret1_4, tick() - tick_ret25);
			break;
		end
		wait(0.2);
	end
	if bool53 == false then
		tick_ret25 = nil;
	end
end
