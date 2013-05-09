;---------------
;  No Capslock
;---------------

; Default editor
Editor := "VIM"

; Use the window title as an identifier
SetTitleMatchMode, 2

Capslock::
{
  ; Send "Esc" if the editor is active
  IfWinActive, %Editor%
  {
    Send {Esc}
  }
  ; Exit the thread
  exit
}
