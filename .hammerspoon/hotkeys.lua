---@diagnostic disable:undefined-global
--[[hs.hotkey.bind({ "ctrl" }, "d", function()
  local kitty = hs.application.get("kitty")
  if kitty == nil then
    hs.application.launchOrFocus("/Applications/kitty.app")
  elseif kitty:isFrontmost() then
    kitty:hide()
  else
    local space = hs.spaces.focusedSpace()
    local win = kitty:focusedWindow()
    hs.spaces.moveWindowToSpace(win, space)
    win:focus()
  end
end)]]
       --

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
