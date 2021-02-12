﻿; Generated by Coffee-AHK/0.0.29
global __ci_genshin__ := Func("genshin_74")
if (A_IsAdmin != true) {
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}
#HotkeyInterval, 1000
#KeyHistory, 0
#MaxHotkeysPerInterval, 200
#MaxThreads, 20
#NoEnv
#Persistent
#SingleInstance, Force
#UseHook, On

CoordMode, Mouse, Client
CoordMode, Pixel, Client
CoordMode, ToolTip, Client
SendMode, Event
SetBatchLines, 100ms
SetKeyDelay, 0, 50
SetMouseDelay, 0, 50
StringCaseSense, On
; Generated by Coffee-AHK/0.0.28
global __ci_jsShim__ := Func("jsShim_53")
global $ := {}
$.beep := Func("jsShim_52")
$.blockInput := Func("jsShim_51")
$.click := Func("jsShim_50")
global __index_debounce__ := 0
global __timer_debounce__ := {}
$.debounce := Func("jsShim_49")
$.delay := Func("jsShim_47")
$.exit := Func("jsShim_46")
$.findColor := Func("jsShim_45")
$.findImage := Func("jsShim_44")
$.formatHotkey := Func("jsShim_43")
$.getColor := Func("jsShim_42")
$.getPosition := Func("jsShim_41")
$.getState := Func("jsShim_40")
$.i := Func("jsShim_39")
$.includes := Func("jsShim_38")
$.info := Func("jsShim_37")
$.length := Func("jsShim_36")
$.move := Func("jsShim_35")
$.now := Func("jsShim_34")
$.off := Func("jsShim_33")
$.on := Func("jsShim_32")
$.open := Func("jsShim_31")
$.play := Func("jsShim_30")
$.press := Func("jsShim_29")
$.push := Func("jsShim_28")
$.random := Func("jsShim_27")
$.reload := Func("jsShim_26")
$.replace := Func("jsShim_25")
$.reverse := Func("jsShim_24")
$.setFixed := Func("jsShim_23")
$.sleep := Func("jsShim_22")
$.split := Func("jsShim_21")
$.suspend := Func("jsShim_20")
global __index_throttle__ := 0
global __timer_throttle__ := {}
global __ts_throttle__ := {}
$.throttle := Func("jsShim_19")
$.toLowerCase := Func("jsShim_16")
$.toString := Func("jsShim_15")
$.toUpperCase := Func("jsShim_14")
$.trim := Func("jsShim_13")
$.trimEnd := Func("jsShim_12")
$.trimStart := Func("jsShim_11")
$.type := Func("jsShim_10")
global alert := Func("jsShim_9")
global clearInterval := Func("jsShim_8")
global clearTimeout := Func("jsShim_7")
global Math := {abs: Func("jsShim_6"), ceil: Func("jsShim_5"), floor: Func("jsShim_4"), round: Func("jsShim_3")}
global setInterval := Func("jsShim_2")
global setTimeout := Func("jsShim_1")
jsShim_1(callback, time) {
  if (($.type.Call(callback)) == "function") {
    callback := callback.Bind()
  }
  __type__ := $.type.Call(time)
  if !(__type__ == "number") {
    throw Exception("setTimeout: invalid time type '" . (__type__) . "'")
  }
  if (time <= 0) {
    time := 1
  }
  SetTimer, % callback, % 0 - time
  return callback
}
jsShim_2(callback, time) {
  if (($.type.Call(callback)) == "function") {
    callback := callback.Bind()
  }
  __type__ := $.type.Call(time)
  if !(__type__ == "number") {
    throw Exception("setTimeout: invalid time type '" . (__type__) . "'")
  }
  if !(time > 0) {
    throw Exception("setTimeout: invalid time value '" . (time) . "'")
  }
  SetTimer, % callback, % time
  return callback
}
jsShim_3(n) {
  return Round(n)
}
jsShim_4(n) {
  return Floor(n)
}
jsShim_5(n) {
  return Ceil(n)
}
jsShim_6(n) {
  return Abs(n)
}
jsShim_7(callback) {
  if !(callback) {
    return
  }
  SetTimer, % callback, Delete
}
jsShim_8(callback) {
  if !(callback) {
    return
  }
  SetTimer, % callback, Delete
}
jsShim_9(message := "") {
  __msg__ := $.toString.Call(message)
  MsgBox, % __msg__
}
jsShim_10(input) {
  if input is Number
    return "number"
  if (IsFunc(input)) {
    return "function"
  }
  if (IsObject(input)) {
    if (input.Count() == input.Length()) {
      return "array"
    }
    return "object"
  }
  return "string"
}
jsShim_11(input, omitting := " `t") {
  return LTrim(input, omitting)
}
jsShim_12(input, omitting := " `t") {
  return RTrim(input, omitting)
}
jsShim_13(input, omitting := " `t") {
  return Trim(input, omitting)
}
jsShim_14(input) {
  StringUpper, __result__, input
  return __result__
}
jsShim_15(input) {
  __type__ := $.type.Call(input)
  if (__type__ == "array") {
    __result__ := ""
    for __index_for__, key in input {
      __result__ := "" . (__result__) . ", " . ($.toString.Call(key)) . ""
    }
    return "[" . ($.trim.Call(__result__, " ,")) . "]"
  } else if (__type__ == "object") {
    __result__ := ""
    for key, value in input {
      __result__ := "" . (__result__) . ", " . (key) . ": " . ($.toString.Call(value)) . ""
    }
    return "{" . ($.trim.Call(__result__, " ,")) . "}"
  }
  return input
}
jsShim_16(input) {
  StringLower, __result__, input
  return __result__
}
jsShim_17(index, callback) {
  callback.Call()
  __ts_throttle__[__ci_jsShim__.Call(index)] := $.now.Call()
}
jsShim_18(index, time, callback) {
  clearTimeout.Call(__timer_throttle__[__ci_jsShim__.Call(index)])
  __timer_throttle__[__ci_jsShim__.Call(index)] := setTimeout.Call(Func("jsShim_17").Bind(index, callback), __ts_throttle__[__ci_jsShim__.Call(index)] - $.now.Call() + time)
}
jsShim_19(time, callback) {
  __index_throttle__++
  __ts_throttle__[__ci_jsShim__.Call(__index_throttle__)] := 0
  return Func("jsShim_18").Bind(__index_throttle__, time, callback)
}
jsShim_20(isSuspended := "Toggle") {
  if (isSuspended != "Toggle") {
    if (isSuspended) {
      isSuspended := "On"
    } else {
      isSuspended := "Off"
    }
  }
  Suspend, % isSuspended
}
jsShim_21(input, delimiter) {
  return StrSplit(input, delimiter)
}
jsShim_22(time) {
  Sleep, % time
}
jsShim_23(isFixed := "Toggle") {
  if (isFixed != "Toggle") {
    if (isFixed) {
      isFixed := "On"
    } else {
      isFixed := "Off"
    }
  }
  Winset AlwaysOnTop, % isFixed, A
}
jsShim_24(input) {
  __type__ := $.type.Call(input)
  if !(__type__ == "array") {
    throw Exception("$.reverse: invalid type '" . (__type__) . "'")
  }
  __len__ := $.length.Call(input)
  __output_as_array__ := []
  for i, key in input {
    i := i - 1
    __output_as_array__[__ci_jsShim__.Call(__len__ - 1 - i)] := key
  }
  return __output_as_array__
}
jsShim_25(input, searchment, replacement, limit := -1) {
  return StrReplace(input, searchment, replacement, limit)
}
jsShim_26() {
  Reload
}
jsShim_27(min := 0, max := 1) {
  Random, __result__, min, max
  return __result__
}
jsShim_28(list, item) {
  list.Push(item)
  return list
}
jsShim_29(listInput*) {
  if !($.length.Call(listInput)) {
    throw Exception("$.press: invalid key")
  }
  __listKey__ := []
  for __index_for__, input in listInput {
    __input__ := $.toLowerCase.Call(input)
    __input__ := $.replace.Call(__input__, " ", "")
    __input__ := $.replace.Call(__input__, "-", "")
    __list__ := $.split.Call(__input__, "+")
    for __index_for__, it in __list__ {
      __listKey__.Push(it)
    }
  }
  __listResult__ := []
  __len__ := $.length.Call(__listKey__)
  for i, key in __listKey__ {
    i := i - 1
    if (i == __len__ - 1) {
      __listResult__[__ci_jsShim__.Call(i)] := $.split.Call(key, ":")
      continue
    }
    if ($.includes.Call(key, ":")) {
      __listResult__[__ci_jsShim__.Call(i)] := $.split.Call(key, ":")
      __listResult__[__ci_jsShim__.Call((__len__ - 1) * 2 - i)] := $.split.Call(key, ":")
    } else {
      __listResult__[__ci_jsShim__.Call(i)] := [key, "down"]
      __listResult__[__ci_jsShim__.Call((__len__ - 1) * 2 - i)] := [key, "up"]
    }
  }
  for i, it in __listResult__ {
    i := i - 1
    if (it[1] == "win") {
      it[1] := "lwin"
    }
    __listResult__[__ci_jsShim__.Call(i)] := $.trim.Call("" . (it[1]) . " " . (it[2]) . "")
  }
  __output_as_string__ := ""
  for __index_for__, it in __listResult__ {
    __output_as_string__ := "" . (__output_as_string__) . "{" . (it) . "}"
  }
  Send, % __output_as_string__
}
jsShim_30(filename) {
  SoundPlay, % filename
}
jsShim_31(source) {
  Run, % source
}
jsShim_32(key, callback) {
  key := "$" . ($.formatHotkey.Call(key)) . ""
  Hotkey, % key, % callback, On
}
jsShim_33(key, callback) {
  key := $.formatHotkey.Call(key)
  Hotkey, % key, % callback, Off
}
jsShim_34() {
  return A_TickCount
}
jsShim_35(point := "", speed := 0) {
  if !(point) {
    throw Exception("$.move: invalid point")
  }
  MouseMove, point[1], point[2], speed
}
jsShim_36(input) {
  __type__ := $.type.Call(input)
  switch __type__ {
    case "array": {
      return input.Length()
    }
    case "object": {
      return input.Count()
    }
    case "string": {
      return StrLen(input)
    }
    default: {
      throw Exception("$.length: invalid type '" . (__type__) . "'")
    }
  }
}
jsShim_37(message, point := "") {
  if !(message) {
    return message
  }
  if !(point) {
    point := $.getPosition.Call()
  }
  __msg__ := $.toString.Call(message)
  ToolTip, % __msg__, % point[1], % point[2]
  return message
}
jsShim_38(input, needle) {
  __type__ := $.type.Call(input)
  if (__type__ == "string" || __type__ == "number") {
    return (InStr(input, needle)) > 0
  }
  if (__type__ == "array") {
    for __index_for__, it in input {
      if (it == needle) {
        return true
      }
    }
    return false
  }
  throw Exception("$.includes: invalid type '" . (__type__) . "'")
}
jsShim_39(message) {
  $.info.Call("[" . ($.now.Call()) . "] " . ($.toString.Call(message)) . "", [0, 0])
  return message
}
jsShim_40(key) {
  return GetKeyState(key, "P")
}
jsShim_41() {
  MouseGetPos, __x__, __y__
  return [__x__, __y__]
}
jsShim_42(point := "") {
  if !(point) {
    point := $.getPosition.Call()
  }
  PixelGetColor, __result__, % point[1], % point[2], RGB
  return __result__
}
jsShim_43(key) {
  __listkey__ := []
  __key__ := $.toLowerCase.Call(key)
  __key__ := $.replace.Call(__key__, " ", "")
  __key__ := $.replace.Call(__key__, "-", "")
  _list := $.split.Call(__key__, "+")
  for __index_for__, it in _list {
    __listkey__.Push(it)
  }
  __isAlt__ := false
  __isCtrl__ := false
  __isShift__ := false
  __isWin__ := false
  __listResult__ := []
  for __index_for__, key in __listkey__ {
    if (key == "alt") {
      __isAlt__ := true
      continue
    }
    if (key == "ctrl") {
      __isCtrl__ := true
      continue
    }
    if (key == "shift") {
      __isShift__ := true
      continue
    }
    if (key == "win") {
      __isWin__ := true
      continue
    }
    __listResult__.Push(key)
  }
  __prefix__ := ""
  if (__isAlt__) {
    __prefix__ := "" . (__prefix__) . "!"
  }
  if (__isCtrl__) {
    __prefix__ := "" . (__prefix__) . "^"
  }
  if (__isShift__) {
    __prefix__ := "" . (__prefix__) . "+"
  }
  if (__isWin__) {
    __prefix__ := "" . (__prefix__) . "#"
  }
  __result__ := ""
  for __index_for__, it in __listResult__ {
    __result__ := "" . (__result__) . " & " . (it) . ""
  }
  return $.replace.Call("" . (__prefix__) . "" . ($.trim.Call(__result__, " &")) . "", ":", " ")
}
jsShim_44(source, start := "", end := "") {
  if !(start) {
    start := [0, 0]
  }
  if !(end) {
    end := [A_ScreenWidth, A_ScreenHeight]
  }
  ImageSearch __x__, __y__, start[1], start[2], end[1], end[2], % A_ScriptDir . "\\\" . source
  return [__x__, __y__]
}
jsShim_45(color, start := "", end := "", variation := 0) {
  if !(start) {
    start := [0, 0]
  }
  if !(end) {
    end := [A_ScreenWidth, A_ScreenHeight]
  }
  PixelSearch __x__, __y__, start[1], start[2], end[1], end[2], color, variation, Fast RGB
  return [__x__, __y__]
}
jsShim_46() {
  ExitApp
}
jsShim_47(time, callback) {
  __timer__ := setTimeout.Call(callback, time)
  return __timer__
}
jsShim_48(index, time, callback) {
  clearTimeout.Call(__timer_debounce__[__ci_jsShim__.Call(index)])
  __timer_debounce__[__ci_jsShim__.Call(index)] := setTimeout.Call(callback, time)
}
jsShim_49(time, callback) {
  __index_debounce__++
  return Func("jsShim_48").Bind(__index_debounce__, time, callback)
}
jsShim_50(key := "left") {
  key := $.replace.Call(key, "-", "")
  key := $.replace.Call(key, ":", " ")
  Click, % key
}
jsShim_51(block) {
  if (block) {
    BlockInput, On
    return
  }
  BlockInput, Off
}
jsShim_52() {
  SoundBeep
}
jsShim_53(input) {
  if input is Number
    return input + 1
  return input
}

global state := {}
global timer := {}
global ts := {}
global Character := {aether: {color: 0}, albedo: {color: 0}, amber: {color: 0x5C4C63, cd: 15}, ayaka: {color: 0}, barbara: {color: 0xE2E0D4, cd: 32}, beidou: {color: 0x4C332E, cd: 7.5}, bennett: {color: 0xFBF3CF, cd: [5, 10]}, chongyun: {color: 0xCDEFDF, cd: 15}, diluc: {color: 0}, diona: {color: 0xFED6CE, cd: [6, 15]}, fischl: {color: 0xFFE3A9, cd: 25, mode: 1}, ganyu: {color: 0xBDCCC5, cd: 10}, hutao: {color: 0}, jean: {color: 0xE6D0A3, cd: 6, mode: 1}, kaeya: {color: 0x394E64, cd: 6}, keqing: {color: 0xBEB1C3, cd: 7.5, mode: 1}, klee: {color: 0xBE3A0E, cd: 20}, lisa: {color: 0xB6A69B, cd: [1, 16]}, lumine: {color: 0}, mona: {color: 0x5A5064, CD: 12}, ningguang: {color: 0}, noelle: {color: 0xDED8D2, cd: 24}, qiqi: {color: 0xE1DBDE, cd: 30}, rezor: {color: 0xC6CAC6, cd: [6, 10]}, rosaria: {color: 0}, sucrose: {color: 0xD4E9CC, cd: 15}, tartaglia: {color: 0xE08D3F, cd: 6}, venti: {color: 0x5D917E, cd: [6, 15]}, xiangling: {color: 0x22337B, cd: 12}, xiao: {color: 0x39483E, cd: 10}, xingqiu: {color: 0x488892, cd: 21}, xinyan: {color: 0x503B40, cd: 18}, zhongli: {color: 0x4B3525, cd: [4, 12]}}
class ClientX {
  height := 0
  isSuspend := false
  width := 0
  __New() {
    this.setSize.Call()
  }
  check := Func("genshin_73").Bind(this)
  isActive := Func("genshin_72").Bind(this)
  reset := Func("genshin_71").Bind(this)
  resetKey := Func("genshin_70").Bind(this)
  resetTimer := Func("genshin_69").Bind(this)
  setSize := Func("genshin_68").Bind(this)
  suspend := Func("genshin_67").Bind(this)
  setPriority := Func("genshin_66").Bind(this)
  vh := Func("genshin_65").Bind(this)
  vw := Func("genshin_64").Bind(this)
}
class ConfigX {
  data := {}
  source := "config.ini"
  __New() {
    this.data.process := this.read.Call("region/process", "YuanShen.exe")
    for __index_for__, key in ["autoESkill", "betterElementalVision", "betterJumping", "betterRunning", "easySkillTimer", "fastPickup"] {
      this.data[__ci_genshin__.Call(key)] := this.read.Call("feature/enable" . (key) . "", 1)
    }
  }
  read := Func("genshin_63").Bind(this)
}
class ConsoleX {
  lifetime := 5000
  list := []
  tsLast := 0
  check := Func("genshin_62").Bind(this)
  clean := Func("genshin_61").Bind(this)
  hide := Func("genshin_60").Bind(this)
  log := Func("genshin_59").Bind(this)
  render := Func("genshin_58").Bind(this)
}
class EmitterX {
  busEvent := []
  emit := Func("genshin_57").Bind(this)
  on := Func("genshin_56").Bind(this)
}
class HudX {
  getColor := Func("genshin_55").Bind(this)
  getPosition := Func("genshin_54").Bind(this)
  hide := Func("genshin_53").Bind(this)
  render := Func("genshin_52").Bind(this)
}
class MemberX {
  current := 0
  map := {}
  name := ""
  checkCharacterByPosition := Func("genshin_51").Bind(this)
  getRange := Func("genshin_50").Bind(this)
  scan := Func("genshin_49").Bind(this)
  toggle := Func("genshin_48").Bind(this)
}
class SkillTimerX {
  listCountDown := {}
  listRecord := {}
  listTimer := {}
  check := Func("genshin_47").Bind(this)
  hide := Func("genshin_46").Bind(this)
  record := Func("genshin_44").Bind(this)
  recordEnd := Func("genshin_43").Bind(this)
  recordStart := Func("genshin_42").Bind(this)
  reset := Func("genshin_41").Bind(this)
  show := Func("genshin_40").Bind(this)
}
class TickerX extends EmitterX {
  emitter := ""
  interval := 200
  max := 1000
  tick := 0
  __New() {
    base.__New()
    setInterval.Call(this.change, this.interval)
  }
  change := Func("genshin_39").Bind(this)
}
state.isDashing := false
state.isSwimming := false
timer.dash := ""
ts.dash := 0
global checkSwimming := Func("genshin_38")
global dash := Func("genshin_37")
global startDash := Func("genshin_35")
global stopDash := Func("genshin_34")
state.isJumping := false
timer.jump := ""
global jump := Func("genshin_33")
global jumpTwice := Func("genshin_31")
global isMoving := Func("genshin_28")
global pauseMove := Func("genshin_27")
global resumeMove := Func("genshin_26")
state.isPicking := false
timer.pick := ""
global pick := Func("genshin_25")
global startPick := Func("genshin_23")
global stopPick := Func("genshin_22")
state.isToggleDown := false
state.toggleDelay := 100
timer.toggleDown := ""
timer.toggleUp := ""
global getToggleDelay := Func("genshin_21")
global startToggle := Func("genshin_20")
global stopToggle := Func("genshin_18")
state.isViewing := false
timer.view := ""
global toggleView := Func("genshin_16")
global view := Func("genshin_15")
global config := new ConfigX()
global client := new ClientX()
global console := new ConsoleX()
global skillTimer := new SkillTimerX()
global hud := new HudX()
global member := new MemberX()
global ticker := new TickerX()
ticker.on.Call("change", Func("genshin_13"))
$.on.Call("alt + enter", Func("genshin_12"))
$.on.Call("alt + f4", Func("genshin_11"))
$.on.Call("alt + f11", Func("genshin_10"))
$.on.Call("ctrl + f5", Func("genshin_9"))
$.on.Call("f12", member.scan)
for __index_for__, key in [1, 2, 3, 4] {
  $.on.Call(key, Func("genshin_8").Bind(key))
  $.on.Call("" . (key) . ":up", Func("genshin_7").Bind(key))
  $.on.Call("alt + " . (key) . "", Func("genshin_6").Bind(key))
}
if (config.data.easySkillTimer) {
  $.on.Call("e", Func("genshin_5"))
  $.on.Call("e:up", Func("genshin_4"))
}
if (config.data.fastPickup) {
  $.on.Call("f", startPick)
  $.on.Call("f:up", stopPick)
}
if (config.data.betterElementalVision) {
  $.on.Call("m-button", toggleView)
}
if (config.data.betterJumping) {
  $.on.Call("space", jump)
  $.on.Call("x", Func("genshin_3"))
}
$.on.Call("r-button", startDash)
$.on.Call("r-button:up", stopDash)
if (config.data.betterRunning) {
  $.on.Call("w", Func("genshin_2"))
  $.on.Call("w:up", Func("genshin_1"))
}
genshin_1() {
  if (state.isDashing) {
    return
  }
  $.press.Call("w:up")
}
genshin_2() {
  $.press.Call("w:down")
}
genshin_3() {
  $.press.Call("x")
  $.press.Call("space")
}
genshin_4() {
  $.press.Call("e:up")
  skillTimer.record.Call("end")
}
genshin_5() {
  $.press.Call("e:down")
  skillTimer.record.Call("start")
}
genshin_6(key) {
  $.press.Call("alt + " . (key) . "")
  member.toggle.Call(key)
}
genshin_7(key) {
  stopToggle.Call(key)
}
genshin_8(key) {
  startToggle.Call(key)
}
genshin_9() {
  $.beep.Call()
  client.reset.Call()
  $.reload.Call()
}
genshin_10() {
  $.beep.Call()
  hud.getColor.Call()
}
genshin_11() {
  $.beep.Call()
  client.reset.Call()
  $.exit.Call()
}
genshin_12() {
  $.press.Call("alt + enter")
  $.delay.Call(1000, client.setSize)
}
genshin_13(tick) {
  client.check.Call()
  if (config.data.easySkillTimer) {
    skillTimer.check.Call()
  }
  if (tick == 1000) {
    console.check.Call()
  }
}
genshin_14() {
  $.click.Call("middle:up")
}
genshin_15() {
  $.click.Call("middle:down")
  setTimeout.Call(Func("genshin_14"), 2500)
}
genshin_16() {
  clearInterval.Call(timer.view)
  state.isViewing := !state.isViewing
  $.click.Call("middle:up")
  if !(state.isViewing) {
    return
  }
  timer.view := setInterval.Call(view, 3000)
  view.Call()
}
genshin_17() {
  state.isToggleDown := false
  $.press.Call("e:up")
  skillTimer.record.Call("end")
}
genshin_18(key) {
  $.press.Call("" . (key) . ":up")
  if !(config.data.autoESkill) {
    return
  }
  timer.toggleUp := $.delay.Call(state.toggleDelay, Func("genshin_17"))
}
genshin_19() {
  $.press.Call("e:down")
  skillTimer.record.Call("start")
}
genshin_20(key) {
  $.press.Call("" . (key) . ":down")
  member.toggle.Call(key)
  if !(config.data.autoESkill) {
    return
  }
  if (state.isToggleDown) {
    return
  }
  state.isToggleDown := true
  state.toggleDelay := getToggleDelay.Call()
  timer.toggleDown := $.delay.Call(state.toggleDelay, Func("genshin_19"))
}
genshin_21() {
  delay := 500 - ($.now.Call() - ts.dash)
  if (delay < 200) {
    delay := 200
  }
  return delay
}
genshin_22() {
  state.isPicking := false
}
genshin_23() {
  if (state.isPicking) {
    return
  }
  state.isPicking := true
  pick.Call()
}
genshin_24() {
  if !(state.isPicking) {
    return
  }
  pick.Call()
}
genshin_25() {
  $.press.Call("f")
  $.click.Call("wheel-down")
  clearTimeout.Call(timer.pick)
  timer.pick := $.delay.Call(100, Func("genshin_24"))
}
genshin_26() {
  for __index_for__, key in ["w", "a", "s", "d"] {
    if ($.getState.Call(key)) {
      $.press.Call("" . (key) . ":down")
    }
  }
}
genshin_27() {
  for __index_for__, key in ["w", "a", "s", "d"] {
    if ($.getState.Call(key)) {
      $.press.Call("" . (key) . ":up")
    }
  }
}
genshin_28() {
  for __index_for__, key in ["w", "a", "s", "d"] {
    if ($.getState.Call(key)) {
      return key
    }
  }
  return false
}
genshin_29(callback) {
  $.press.Call("space")
  callback.Call()
}
genshin_30(callback) {
  if !(isMoving.Call()) {
    callback.Call()
    return
  }
  $.press.Call("space")
  clearTimeout.Call(timer.jump)
  timer.jump := $.delay.Call(100, Func("genshin_29").Bind(callback))
}
genshin_31(callback) {
  $.press.Call("space")
  clearTimeout.Call(timer.jump)
  timer.jump := $.delay.Call(200, Func("genshin_30").Bind(callback))
}
genshin_32() {
  state.isJumping := false
}
genshin_33() {
  if (state.isJumping) {
    return
  }
  state.isJumping := true
  jumpTwice.Call(Func("genshin_32"))
}
genshin_34() {
  ts.dash := $.now.Call()
  if !(config.data.betterRunning) {
    $.click.Call("right:up")
    return
  }
  if (state.isSwimming) {
    state.isDashing := false
    state.isSwimming := false
    $.click.Call("right:up")
    return
  }
  if !(state.isDashing) {
    return
  }
  state.isDashing := false
  key := isMoving.Call()
  if !(key) {
    $.press.Call("w:up")
  } else if (key != "w") {
    $.press.Call("w:up")
  }
}
genshin_35() {
  ts.dash := $.now.Call() + 500
  if !(config.data.betterRunning) {
    $.click.Call("right:down")
    return
  }
  if (state.isSwimming) {
    return
  }
  state.isSwimming := checkSwimming.Call()
  if (state.isSwimming) {
    $.click.Call("right:down")
    return
  }
  if (state.isDashing) {
    return
  }
  state.isDashing := true
  dash.Call()
}
genshin_36() {
  if !(state.isDashing) {
    return
  }
  dash.Call()
}
genshin_37() {
  key := isMoving.Call()
  if !(key) {
    $.press.Call("w:down")
  } else if (key != "w") {
    $.press.Call("w:up")
  }
  $.click.Call("right")
  clearTimeout.Call(timer.dash)
  timer.dash := $.delay.Call(1300, Func("genshin_36"))
}
genshin_38() {
  start := [client.vw.Call(80), client.vh.Call(90)]
  end := [client.width, client.height]
  point := $.findColor.Call(0xFFE92C, start, end, 0.9)
  return point[1] * point[2] > 0
}
genshin_39(this) {
  this.tick := this.tick + this.interval
  this.emit.Call("change", this.tick)
  if (this.tick >= this.max) {
    this.tick := 0
  }
}
genshin_40(this, n, msg) {
  this.hide.Call(n)
  hud.render.Call(n, msg)
}
genshin_41(this) {
  this.listCountDown := {}
  this.listRecord := {}
  this.listTimer := {}
  for __index_for__, n in [1, 2, 3, 4] {
    this.hide.Call(n)
  }
}
genshin_42(this, now) {
  n := member.current
  name := member.name
  __object__ := Character[__ci_genshin__.Call(name)]
  cd := __object__["cd"]
  if (($.type.Call(cd)) == "number") {
    cd := [cd, cd]
  }
  if (this.listRecord[__ci_genshin__.Call(n)]) {
    return
  }
  this.listRecord[__ci_genshin__.Call(n)] := now
}
genshin_43(this, now) {
  n := member.current
  name := member.name
  __object__ := Character[__ci_genshin__.Call(name)]
  cd := __object__["cd"]
  mode := __object__["mode"]
  if (($.type.Call(cd)) == "number") {
    cd := [cd, cd]
  }
  if !(this.listRecord[__ci_genshin__.Call(n)]) {
    return
  }
  diff := now - this.listRecord[__ci_genshin__.Call(n)]
  if (diff < 500) {
    this.listCountDown[__ci_genshin__.Call(n)] := this.listRecord[__ci_genshin__.Call(n)] + (cd[1] * 1000)
    this.listRecord[__ci_genshin__.Call(n)] := 0
    return
  }
  if (mode == 1) {
    this.listCountDown[__ci_genshin__.Call(n)] := now + (cd[2] * 1000)
  } else {
    this.listCountDown[__ci_genshin__.Call(n)] := this.listRecord[__ci_genshin__.Call(n)] + (cd[2] * 1000)
  }
  this.listRecord[__ci_genshin__.Call(n)] := 0
}
genshin_44(this, step) {
  n := member.current
  name := member.name
  if !(name) {
    return
  }
  if (this.listCountDown[__ci_genshin__.Call(n)]) {
    return
  }
  now := $.now.Call()
  if (step == "end") {
    this.recordEnd.Call(now)
    return
  }
  if (step == "start") {
    this.recordStart.Call(now)
    return
  }
}
genshin_45(n) {
  hud.render.Call(n, "")
}
genshin_46(this, n) {
  clearTimeout.Call(this.listTimer[__ci_genshin__.Call(n)])
  this.listTimer[__ci_genshin__.Call(n)] := setTimeout.Call(Func("genshin_45").Bind(n), 5000)
}
genshin_47(this) {
  if (client.isSuspend) {
    hud.hide.Call()
    return
  }
  now := $.now.Call()
  for __index_for__, n in [1, 2, 3, 4] {
    if !(this.listCountDown[__ci_genshin__.Call(n)]) {
      continue
    }
    if (now >= this.listCountDown[__ci_genshin__.Call(n)]) {
      this.listCountDown[__ci_genshin__.Call(n)] := 0
      this.show.Call(n, "")
    } else {
      diff := Math.floor.Call((now - this.listCountDown[__ci_genshin__.Call(n)]) * 0.001)
      this.show.Call(n, "" . (diff) . "s")
    }
  }
}
genshin_48(this, n) {
  this.current := n
  this.name := this.map[__ci_genshin__.Call(n)]
}
genshin_49(this) {
  for __index_for__, n in [1, 2, 3, 4] {
    name := this.checkCharacterByPosition.Call(n)
    this.map[__ci_genshin__.Call(n)] := name
    hud.render.Call(n, name)
  }
  skillTimer.reset.Call()
}
genshin_50(this, n) {
  pointStart := [client.vw.Call(90), client.vh.Call(9 * (n + 1))]
  pointEnd := [client.vw.Call(96), client.vh.Call(9 * (n + 2))]
  return [pointStart, pointEnd]
}
genshin_51(this, n) {
  __array__ := this.getRange.Call(n)
  pointStart := __array__[1]
  pointEnd := __array__[2]
  for name, char in Character {
    if !(char.color) {
      continue
    }
    point := $.findColor.Call(char.color, pointStart, pointEnd)
    if !(point[1] * point[2] > 0) {
      continue
    }
    return name
  }
  return ""
}
genshin_52(this, n, msg) {
  __array__ := this.getPosition.Call(n)
  x := __array__[1]
  y := __array__[2]
  id := n + 2
  ToolTip, % msg, % x, % y, % id
}
genshin_53(this) {
  for __index_for__, n in [1, 2, 3, 4] {
    this.render.Call(n, "")
  }
}
genshin_54(this, n) {
  if (client.width + 100 < A_ScreenWidth) {
    left := client.width
  } else {
    left := client.vw.Call(80)
  }
  return [left, client.vh.Call(4 + 9 * (n + 1))]
}
genshin_55(this) {
  color := $.getColor.Call()
  __array__ := $.getPosition.Call()
  x := __array__[1]
  y := __array__[2]
  x1 := Math.round.Call((x * 100) / client.width)
  y1 := Math.round.Call((y * 100) / client.height)
  console.log.Call("" . (x1) . ", " . (y1) . " / " . (color) . "")
  ClipBoard := color
}
genshin_56(this, name, callback) {
  this.busEvent.Push([name, callback])
}
genshin_57(this, name, args*) {
  for __index_for__, item in this.busEvent {
    __array__ := item
    _name := __array__[1]
    callback := __array__[2]
    if !(_name == name) {
      continue
    }
    callback.Call(args*)
  }
}
genshin_58(this) {
  text := ""
  for __index_for__, item in this.list {
    text := "" . (text) . "`n" . (item[2]) . ""
  }
  text := $.trim.Call(text, " `n")
  ToolTip, % text, 0, 0, 2
}
genshin_59(this, input) {
  switch $.type.Call(input) {
    case "array": {
      for __index_for__, msg in input {
        this.list.Push([$.now.Call(), msg])
      }
    }
    default: {
      this.list.Push([$.now.Call(), input])
    }
  }
  return input
}
genshin_60(this) {
  ToolTip, , 0, 0, 2
}
genshin_61(this) {
  tsNow := $.now.Call()
  if !(tsNow - this.tsLast >= 1000) {
    return
  }
  this.tsLast := tsNow
  listResult := []
  for __index_for__, item in this.list {
    __array__ := item
    ts := __array__[1]
    if (tsNow - ts >= this.lifetime) {
      continue
    }
    listResult.Push(item)
  }
  this.list := listResult
}
genshin_62(this) {
  if (client.isSuspend) {
    this.hide.Call()
    return
  }
  this.clean.Call()
  this.render.Call()
}
genshin_63(this, key, defaultValue := 1) {
  __array__ := $.split.Call(key, "/")
  __section__ := __array__[1]
  __key__ := __array__[2]
  IniRead, __result__, % this.source, % __section__, % __key__, % defaultValue
  return __result__
}
genshin_64(this, n) {
  return Math.round.Call(this.width * n * 0.01)
}
genshin_65(this, n) {
  return Math.round.Call(this.height * n * 0.01)
}
genshin_66(this, level) {
  Process, Priority, % config.data.process, % level
}
genshin_67(this, isSuspend) {
  if (isSuspend) {
    if (this.isSuspend) {
      return
    }
    this.isSuspend := true
    $.suspend.Call(true)
    this.resetTimer.Call()
    this.resetKey.Call()
    return
  }
  if !(isSuspend) {
    if !(this.isSuspend) {
      return
    }
    this.isSuspend := false
    $.suspend.Call(false)
    return
  }
}
genshin_68(this) {
  name := "ahk_exe " . (config.data.process) . ""
  WinGetPos, __x__, __y__, __width__, __height__, % name
  this.width := __width__
  this.height := __height__
}
genshin_69(this) {
  for __key_for__, _timer in timer {
    clearTimeout.Call(_timer)
  }
}
genshin_70(this) {
  for __index_for__, key in ["middle", "right"] {
    if ($.getState.Call(key)) {
      $.click.Call("" . (key) . ":up")
    }
  }
  for __index_for__, key in ["alt", "ctrl", "e", "esc", "f", "space", "w", "x"] {
    if ($.getState.Call(key)) {
      $.press.Call("" . (key) . ":up")
    }
  }
}
genshin_71(this) {
  this.setPriority.Call("normal")
  this.resetTimer.Call()
  this.resetKey.Call()
}
genshin_72(this) {
  return WinActive("ahk_exe " . (config.data.process) . "")
}
genshin_73(this) {
  if (!this.isSuspend && !this.isActive.Call()) {
    this.setPriority.Call("low")
    this.suspend.Call(true)
    state.isAttacking := false
    return
  }
  if (this.isSuspend && this.isActive.Call()) {
    this.setPriority.Call("normal")
    this.suspend.Call(false)
    return
  }
}
genshin_74(input) {
  if input is Number
    return input + 1
  return input
}
