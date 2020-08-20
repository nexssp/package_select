; Nexss PROGRAMMER 2.x - Dropper
; SETUP
EnvGet, NEXSS_PACKAGES_PATH, NEXSS_PACKAGES_PATH
#Include %A_AppData%/../../.nexss/packages/Nexss/Lib/NexssIn.ahk
#Include %A_AppData%/../../.nexss/packages/Nexss/Lib/NexssLog.ahk

#SingleInstance, Off
; ======================================================

; InputBox, OutputVar [, Title, Prompt, HIDE, Width, Height, X, Y, Locale, Timeout, Default]
xTitle := "Enter Value"
try xTitle:=NexssStdout["_title"]
catch e {
}

width := 300
try width:=NexssStdout["_width"]
catch e { 
}

height := 200
try height:=NexssStdout["_height"]
catch e { 
}

x := 250
try x:=NexssStdout["_x"]
catch e { 
}

y := 200
try y:=NexssStdout["_y"]
catch e { 
}

centr =  
try centr:=NexssStdout["_center"]
catch e { 
}

if(centr){
    centr := "Center"
}

autosize =  
try autosize:=NexssStdout["_autosize"]
catch e { 
}

if(autosize){
    autosize := "AutoSize"
}

color:= "" ; Default for dropper here
try color:=NexssStdout["_color"]
catch e { 
}

trans := 255 ; 255 is not transparent
try trans:=NexssStdout["_trans"]
catch e {
}

text:="Drag the files here.."
try text:=NexssStdout["_text"]
catch e {
}

title:="Dropper"
try title:=NexssStdout["_title"]
catch e {
}

icon:="nexss.ico"
try icon:=NexssStdout["_icon"]
catch e {
}

version:="<undefined>"
try version:=NexssStdout["nexss"]
catch e {
}

Menu, tray, Icon , %icon%, 1, 1
Gui, Dropper: New 
Gui, Dropper: +AlwaysOnTop +Resize -MaximizeBox
Gui, Dropper: Font, s22
Gui, Dropper: Add, Text, x20 y10 vText1, %text%
; Horizontal light is shorter
widthHR:=width-20
Gui, Dropper: Add, text, x10 y50 w%widthHR% 0x10  ;Horizontal Line > Etched Gray
Gui, Dropper: Font, s08
Gui, Dropper: Add, Link, x10 y60, Nexss Programmer %version%
Gui, Dropper:  Font, underline
Gui, Dropper: Add, Link, x10 y80, by <a href="www.nexss.com">nexss.com</a> 2007-%A_YYYY%
Gui, Dropper: Font, norm

; Gui, Dropper: Add, Button, x206 y117 w120 h20 gRed, Red
Gui, Dropper: Show, w%width% h%height% x%x% y%y% %autosize% %centr%, %title%
Gui, Dropper: Color, %color%
Gui +LastFound  ; Make the GUI window the last found window for use by the line below.
WinSet, TransColor, 111199 %trans%

return

DropperGuiDropFiles:
DroppedFile:=A_GuiEvent
    ; FileRead, content, %DroppedFile%
    ; msgbox %content%   
    resField:=NexssStdout.resultField_1

    ; lines := StrSplit(DroppedFile, "`n")
    ; nxsError(lines.length())
    ; Loop % lines.length() {
	;     msgbox % lines[A_Index]
    ; }

    ; NexssStdout.droppedFile:= StrSplit(DroppedFile, "\n")
    ; To make below works as array.
    NexssStdout[resField]:= DroppedFile
    subNexssStdout := oHTML.parentWindow.JSON.stringify(NexssStdout)
    FileAppend, %subNexssStdout%, *
return


if (ErrorLevel) {
    nxsError("Cancelled.")
    Exit 1
}   
else {
    NexssStdout[NexssStdout.resultField_1]:=ReturnValue
}

DropperGuiClose:
Gui, Hide
ExitApp

Esc::ExitApp
; NexssStdout.Delete("start")

; ======================================================
#Include %A_AppData%/../../.nexss/packages/Nexss/Lib/NexssOut.ahk