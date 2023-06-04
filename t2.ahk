#SingleInstance force

rwK:="
(
さん、お疲れ様です。
下記レビュー完了しました。ご確認お願い致します。


)"

rwS:="
(
さん、お疲れ様です。
下記指摘について、ご確認お願い致します。


)"

!r::
	;ClipSave := %ClipboardAll%
	;Send ^c
	Input, char, L1
    if % (Char = "a")
    {
        clipboard = %rwk%%clipboard%
    }
    else if % (Char = "s")
    {
        clipboard = %rwS%%clipboard%
    }
    else if % (Char = "(")
    {
        clipboard = (%clipboard%)
    }
    else
    {
        clipboard = %Char%%clipboard%%Char%
    }
	Send ^v

return

;---------------------
!q::
	WinActive("A")                           ; sets last found window
	ControlGetFocus, ctrl
	;if (RegExMatch(ctrl, "A)Edit\d+"))       ; attempt copying without clipboard
		ControlGet, text, Selected,, %ctrl%
	MsgBox, % ctrl "<" text ">"

return