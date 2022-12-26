#Requires AutoHotkey v2.0

; Key modify for ANSI layout keyboard
; Disalbe Layer key and all the combinations
LCtrl::return
!LCtrl::return
+LCtrl::return
^LCtrl::return
!+LCtrl::return
^!LCtrl::return
^+LCtrl::return
^!+LCtrl::return

; All layers
*CapsLock:: {
    Send("{Blind}{LCtrl DownR}")
    SendSuppressedKeyUp("LCtrl")
    KeyWait("CapsLock")
    Send("{Blind}{LCtrl Up}")
    return
}
`::Escape
Escape::`
\::Backspace
Backspace::\
AppsKey::Insert

; Layer 2
#HotIf GetKeyState("LCtrl", "P")
Tab::Capslock   ; make fn+Tab the Caps Lock
1::F1
2::F2
3::F3
4::F4
5::F5
6::F6
7::F7
8::F8
9::F9
0::F10
-::F11
=::F12
i::Up
j::Left
k::Down
l::Right
a::Home
e::End
w::PgUp
s::PgDn
`::`
#HotIf

SendSuppressedKeyUp(key) {
    ; AutoHotkey v1.1.26+ uses this arbitrary value to signal its own hook
    ; to suppress the event.  This exists because the technique of sending
    ; and suppressing a key is already used to prevent Alt from activating
    ; the window menu in some specific cases.
    static KEY_BLOCK_THIS := 0xFFC3D450
    DllCall("keybd_event"
        , "char", GetKeyVK(key)
        , "char", GetKeySC(key)
        , "uint", 0x2
        , "uptr", KEY_BLOCK_THIS)
}
