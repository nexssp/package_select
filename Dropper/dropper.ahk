; Nexss PROGRAMMER 2.x - Auto Hot Ke
; SETUP
EnvGet, NEXSS_PACKAGES_PATH, NEXSS_PACKAGES_PATH
#Include %A_AppData%/../../.nexss/packages/Nexss/Lib/NexssIn.ahk
#Include %A_AppData%/../../.nexss/packages/Nexss/Lib/NexssLog.ahk

#SingleInstance, force
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

Menu, tray, Icon , %icon%, 1, 1
Gui, Dropper: New 
Gui, Dropper: +AlwaysOnTop +Resize -MaximizeBox
Gui, Dropper: Font, s22
Gui, Dropper: Add, Text, y80 vText1, %text%
; Gui, Dropper: Add, Button, x206 y117 w120 h20 gRed, Red
Gui, Dropper: Show, w%width% h%height% x%x% y%y% %autosize% %centr%, %title%
Gui, Color, %color%
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


if (ErrorLevel){
    nxsError("Cancelled.")
    Exit 1
}   
else{
    NexssStdout.xxxxxxxxxxxxxxxxxxxxxx:=111111111111111111
    NexssStdout[NexssStdout.resultField_1]:=ReturnValue
}

DropperGuiClose:
Gui, Hide
ExitApp

Esc::ExitApp
; NexssStdout.Delete("start")

; ======================================================
#Include %A_AppData%/../../.nexss/packages/Nexss/Lib/NexssOut.ahk