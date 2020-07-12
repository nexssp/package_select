; Nexss PROGRAMMER 2.x - Auto Hot Ke
; SETUP
EnvGet, NEXSS_PACKAGES_PATH, NEXSS_PACKAGES_PATH
#Include %A_AppData%/../../.nexss/packages/Nexss/Lib/NexssIn.ahk
#Include %A_AppData%/../../.nexss/packages/Nexss/Lib/NexssLog.ahk
; ======================================================

; Modify Data
NexssStdout.test := "test"

; InputBox, OutputVar [, Title, Prompt, HIDE, Width, Height, X, Y, Locale, Timeout, Default]
xTitle := "Enter Value"
try xTitle:=NexssStdout["_title"]
catch e { 

}

FileSelectFile, ReturnValue, M3  ; M3 = Multiselect existing files.
if (ReturnValue = "")
{
    nxsError("Cancelled By User")
    Exit 1
}
; Loop, parse, files, `n
; {
;     if (A_Index = 1)
;         MsgBox, The selected files are all contained in %A_LoopField%.
;     else
;     {
;         MsgBox, 4, , The next file is %A_LoopField%.  Continue?
;         IfMsgBox, No, break
;     }
; }
; return

if (ErrorLevel){
    nxsError("Cancelled.")
    Exit 1
}   
else{

    NexssStdout[NexssStdout.resultField_1]:=ReturnValue
}

; NexssStdout.Delete("start")

; ======================================================
#Include %A_AppData%/../../.nexss/packages/Nexss/Lib/NexssOut.ahk