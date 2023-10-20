hs.hotkey.bind({ "ctrl" }, "s", function()
  local app = hs.application.get("Obsidian")
  if app == nil then
    hs.application.launchOrFocus("/Applications/Obsidian.app")
  elseif app:isFrontmost() then
    app:hide()
  else
    local space = hs.spaces.focusedSpace()
    local win = app:focusedWindow()
    hs.spaces.moveWindowToSpace(win, space)
    win:focus()
  end
end)

hs.hotkey.bind({ "ctrl" }, "d", function()
  local app = hs.application.get("Arc")
  if app == nil then
    hs.application.launchOrFocus("/Applications/Arc.app")
  elseif app:isFrontmost() then
    app:hide()
  else
    local space = hs.spaces.focusedSpace()
    local win = app:focusedWindow()
    hs.spaces.moveWindowToSpace(win, space)
    win:focus()
  end
end)

hs.hotkey.bind({ "ctrl" }, "c", function()
  local app = hs.application.get("Parsec")
  if app == nil then
    hs.application.launchOrFocus("/Applications/Parsec.app")
  elseif app:isFrontmost() then
    app:hide()
  else
    local space = hs.spaces.focusedSpace()
    local win = app:focusedWindow()
    hs.spaces.moveWindowToSpace(win, space)
    win:focus()
  end
end)

-- To get a keyboard id, use hs.keycodes.currentSourceID() on hammerspoon terminal
hs.hotkey.bind({ "ctrl", "alt" }, "j", function()
  hs.keycodes.currentSourceID("com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese")
end)

hs.hotkey.bind({ "ctrl", "alt" }, "e", function()
  hs.keycodes.currentSourceID("com.apple.keylayout.British")
end)

hs.hotkey.bind({ "ctrl", "alt" }, "c", function()
  hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
end)

hs.hotkey.bind({ "ctrl", "alt" }, "k", function()
  hs.keycodes.currentSourceID("com.apple.inputmethod.Korean.2SetKorean")
end)

hs.hotkey.bind({ "ctrl", "alt" }, "p", function()
  hs.keycodes.currentSourceID("com.apple.keylayout.USExtended")
end)
