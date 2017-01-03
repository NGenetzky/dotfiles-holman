; Copyright (c) 2007-2012 Pavel Chikulaev
; Distributed under BSD license

if not A_IsAdmin
{
    MsgBox Must be run as Admin.
    ExitApp

   ; DllCall("shell32\ShellExecuteA", uint, 0, str, "RunAs", str, A_AhkPath
      ; , str, """" . A_ScriptFullPath . """", str, A_WorkingDir, int, 1)
}

#InstallKeybdHook

SetCapsLockState, AlwaysOff

#IfWinNotActive ahk_class TscShellContainerClass
CapsLock::HotkeyHook("Down")
CapsLock Up::HotkeyHook("Up")
; ScrollLock::HotkeyHook("Down")
; ScrollLock Up::HotkeyHook("Up")
#IfWinNotActive

; If this is not 0 then CapsMode will end when the button is depressed.
press_count = 0

HotkeyHook(Mode)
{
    static sticky_hotkeys = 0
    global press_count
    if (Mode = "Down")
    {
        if (sticky_hotkeys = 1)
        {
            sticky_hotkeys = 2
        }
        else
        {
            MyAppsKeyHotkeys("On")
            press_count = 0
        }
    }
    else if (Mode = "Up")
    {
        if (sticky_hotkeys = 0)
        {
            if (press_count = 0)
            {
                sticky_hotkeys = 1
            }
            else
            {
                MyAppsKeyHotkeys("Off")
            }
        }
        else if (sticky_hotkeys = 2)
        {
            MyAppsKeyHotkeys("Off")
            sticky_hotkeys = 0
        }
    }
}

MyAppsKeyHotkeys(enable)
{
    ; enable should be "Off" or "On"
   if (enable = "Off")
   {
        TrayTip ; Remove previous TrayTip
        TrayTip, ControlKeys, Normal, 10, 1+16
        Menu, TRAY, Icon, %A_ScriptDir%\Letter-E.ico
   }
   else
   {
        TrayTip ; Remove previous TrayTip
        TrayTip, ControlKeys, Super (%keymode%), 10, 1+16
        Menu, TRAY, Icon, %A_ScriptDir%\Letter-C.ico
   }

    ; Modifiers <#Win,!Alt,^Ctrl,+Shift,<!leftAlt,>rightCtrl>

    HotKey, h, vimn_h,  %enable%
    HotKey, j, vimn_j,  %enable%
    HotKey, k, vimn_k,  %enable%
    HotKey, l, vimn_l,  %enable%

    HotKey,  a, MyEmpty, %enable%
    HotKey,  b, MyEmpty, %enable%
    HotKey,  c, MyEmpty, %enable%
    HotKey,  d, MyEmpty, %enable%
    HotKey,  e, MyEmpty, %enable%
    HotKey,  f, MyEmpty, %enable%
    HotKey,  g, MyEmpty, %enable%
    Hotkey, *m, MyEmpty, %enable%
    HotKey, *n, MyEmpty, %enable%
    HotKey, *o, MyEmpty, %enable%
    HotKey, *p, MyEmpty, %enable%
    HotKey,  q, MyEmpty, %enable%
    HotKey,  r, MyEmpty, %enable%
    HotKey,  s, MyEmpty, %enable%
    HotKey,  t, MyEmpty, %enable%
    HotKey, *u, MyEmpty, %enable%
    HotKey,  v, MyEmpty, %enable%
    HotKey,  w, MyEmpty, %enable%
    HotKey,  x, MyEmpty, %enable%
    Hotkey, *y, MyEmpty, %enable%
    HotKey,  z, MyEmpty, %enable%
    HotKey, *;, MyEmpty, %enable%
    HotKey, *[, MyEmpty, %enable%
    HotKey,  ], MyEmpty, %enable%
    HotKey,  ', MyEmpty, %enable%
    HotKey,  ., MyEmpty, %enable%
    HotKey,  /, MyEmpty, %enable%
}

MyEmpty:
   Return
MyUp:
   press_count += 1
   Send {Blind}{Up} ;fix for OneNote use SendPlay
   Return
MyDown:
   press_count += 1
   Send {Blind}{Down} ;fix for OneNote use SendPlay
   Return
MyLeft:
   press_count += 1
   Send {Blind}{Left}
   Return
MyRight:
   press_count += 1
   Send {Blind}{Right}
   Return
MyPgUp:
   press_count += 1
   Send {Blind}{PgUp}
   Return
MyPgDn:
   press_count += 1
   Send {Blind}{PgDn}
   Return
MyEnter:
   press_count += 1
   Send {Blind}{Enter}
   Return
MyBS:
   press_count += 1
   Send {Blind}{BS}
   Return
MyDel:
   press_count += 1
   Send {Blind}{Del}
   Return
MyHome:
   press_count += 1
   Send {Blind}{Home}
   Return
MyEnd:
   press_count += 1
   Send {Blind}{End}
   Return
MyApps:
   press_count += 1
   Send {Blind}{AppsKey}
   Return
MyEsc:
   press_count += 1
   Send {Esc}
   Return

ReloadScript:
    Reload
    Return

ExitScript:
    ExitApp
    Return

vimn_h() {
    Send, {Blind}{left}
}
vimn_j() {
    Send, {Blind}{down}
}
vimn_k() {
    Send, {Blind}{up}
}
vimn_l() {
    Send, {Blind}{right}
}

