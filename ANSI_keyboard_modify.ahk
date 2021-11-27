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
Capslock::LControl
`::Escape
Escape::`
\::Backspace
Backspace::\
AppsKey::Insert

; Layer 2
#If, GetKeyState("LCtrl", "P")
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