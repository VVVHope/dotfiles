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

; All layers (Layer 0)
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
AppsKey::return

; Layer 1
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
q::Insert
`::`
p::PrintScreen
[::ScrollLock
]::NumLock
b::Pause
RWin::AppsKey
Backspace::Delete
#HotIf

; Layer 2
#HotIf GetKeyState("AppsKey", "P")
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
q::Insert
`::`
p::PrintScreen
[::ScrollLock
]::NumLock
b::Pause
RWin::AppsKey
Backspace::Delete
#HotIf

; Layer 3
#HotIf GetKeyState("LCtrl", "P") and GetKeyState("AppsKey", "P")
1::Numpad1
2::Numpad2
3::Numpad3
4::Numpad4
5::Numpad5
6::Numpad6
7::Numpad7
8::Numpad8
9::Numpad9
0::Numpad0
Enter::NumpadEnter
-::NumpadSub
=::NumpadAdd
x::NumpadMult
/::NumpadDiv
Backspace::Volume_Mute
[::Media_Prev
]::Media_Next
\::Media_Play_Pause
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
