-- Hammerspoon init.lua

hs.alert("config reloaded")

-- Disable those pesty movement animations
hs.window.animationDuration = 0

-- Quick reload of Hammerspoon config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)

local primaryMon
local secondaryMon
local laptopScreen

-- Define variables for all screens.  To find out IDs uncomment the print line
for i, s in pairs(hs.screen.allScreens()) do
  -- print(tostring(s) .. ", ID: " .. tostring(s:id()))
	if (s:id() == 1007435977) then primaryMon = s   end
	if (s:id() == 69733382)   then laptopScreen = s end
	if (s:id() == 1007453642) then secondaryMon = s end
end

-- Screen functions
function H1 (s)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = s:frame()
  
  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

function H2 (s)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = s:frame()
  
  f.x = max.x + max.w / 2
  f.y = max.y 
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end


--Fullscreen, and a fullscreen-current function
function FCurrent ()
  local win = hs.window.focusedWindow()
  F(win:screen())
end

function F (s)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = s:frame()
  
  f.x = max.x
  f.y = max.y 
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end

-- Center of the screen
function C (s)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = s:frame()
  
  f.x = max.x + max.w / 8
  f.y = max.y + max.h / 8
  f.w = max.w * 6 / 8 
  f.h = max.h * 6 / 8 
  win:setFrame(f)
end

-- The bottom bindings are 1/3 width, in 3 different positions
function B (s, tertile)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = s:frame()
  
  f.x = max.x + tertile * max.w / 3
  f.y = max.y + max.h / 2
  f.w = max.w / 3
  f.h = max.h / 2
  win:setFrame(f)
end

function B1 (s) B(s, 0) end
function B2 (s) B(s, 1) end
function B3 (s) B(s, 2) end

-- The top bindings are 1/2 width, in 3 different positions
function T (s, tertile)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = s:frame()
  
  f.x = max.x + tertile * max.w / 4
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end

function T1 (s) T(s, 0) end
function T2 (s) T(s, 1) end
function T3 (s) T(s, 2) end

-- Toggle the Mac Fullscreen-ness
function FSToggle () hs.window.focusedWindow():toggleFullScreen() end

-- The actual bindings
local activator = {"ctrl"}
hs.hotkey.bind(activator, "pad+", FCurrent)
hs.hotkey.bind(activator, "pad*", FSToggle)

hs.hotkey.bind(activator, "pad1", function () B1(primaryMon) end)
hs.hotkey.bind(activator, "pad2", function () B2(primaryMon) end)
hs.hotkey.bind(activator, "pad3", function () B3(primaryMon) end)

hs.hotkey.bind(activator, "pad4", function () H1(primaryMon) end)
hs.hotkey.bind(activator, "pad5", function () C(primaryMon) end)
hs.hotkey.bind(activator, "pad6", function () H2(primaryMon) end)

hs.hotkey.bind(activator, "pad7", function () T1(primaryMon) end)
hs.hotkey.bind(activator, "pad8", function () T2(primaryMon) end)
hs.hotkey.bind(activator, "pad9", function () T3(primaryMon) end)

hs.hotkey.bind(activator, "pad-", function () F(secondaryMon) end)
hs.hotkey.bind(activator, "pad0", function () H1(laptopScreen) end)
hs.hotkey.bind(activator, "pad.", function () H2(laptopScreen) end)

-- When we're working only on the laptop, have some minimal bindings
hs.hotkey.bind(activator, "[", function () H1(laptopScreen) end)
hs.hotkey.bind(activator, "]", function () H2(laptopScreen) end)







-- Hi
