#SingleInstance force
#NoEnv
#installKeybdHook
#Persistent
#EscapeChar ☺ ;ALT + 1

SetTitleMatchMode 2

;Variables
toggletask := 1 ;Hide Taskbar
looping = 0 ;Rust

EWD_MouseWin := 0

;[[[[[[[[[[[[[[[[[[[[Get current system time]]]]]]]]]]]]]]]]]]]]
GetT()
{
return A_Hour*3600000 + A_Min*60000 + A_Sec*1000 + A_MSec
}

;=========================Transparent Taskbar=========================
WinSet,Transparent,130,ahk_class Shell_TrayWnd

#Include BlackScreen.ahk


;================================Screenshots with nircmd================================
PRINTSCREEN::Run, C:\Portable Program Files\nircmd\nircmd.exe savescreenshotfull D:\Users\%A_UserName%\Pictures\Screenshots\Screenshot_%A_Now%.png
!PRINTSCREEN::Run, C:\Portable Program Files\nircmd\nircmd.exe savescreenshotwin D:\Users\%A_UserName%\Pictures\Screenshots\Screenshot_%A_Now%.png
+PRINTSCREEN::
^PRINTSCREEN::Run "D:\Users\%A_UserName%\Pictures\Screenshots" 

;//////////////////////////////////////////////////////////////////
;||||||||||||||||||||||||: Taskbar :||||||||||||||||||||||||||||||
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

;================================Hide Taskbar================================
#z:: 
	if (toggletask = 1) 
	{
   WinHide ahk_class Shell_TrayWnd
   toggletask := 0
   }
	else {
   WinShow ahk_class Shell_TrayWnd
   toggletask := 1
   }
return

;================================Media controls================================ 
;#MButton::Volume_Mute
;#Down::Volume_Down
;#WheelUp::Volume_Up

ScrollLock::send {Volume_Down}
Pause::send {Volume_Up}

RControl & Down::send {Volume_Down}	
RControl & Up::send {Volume_Up}
RControl & Enter::send {Volume_Mute}
RControl & RShift::send {Media_Play_Pause}
RControl & Numpad1::send {Media_Prev}
RControl & NumpadEnd::send {Media_Prev}
RControl & Numpad2::send {Media_Next}
RControl & NumpadDown::send {Media_Next}
^+!s::send {Media_Stop}

^+!b::
	SoundSet, 1, Master, EQUALIZER  ; Increase bass level by 20%.
	if ErrorLevel
		MsgBox, The EQUALIZER setting is not supported for MASTER.
return

;==========================Azerty fix=============================
;²::Send, {~ down}
;² up::Send {~ up}

;====================Turns Capslock into Shift key, press Shift+Capslock to turn Capslock on====================
/*+Capslock::Capslock
Capslock::Shift
$Capslock::
	If( GetKeyState( "Shift", "D" ) )
		SendInput {Capslock}
	Else
		Send {Shift}
	return*/
	
/*
;================================AZERTY - Invert numbers================================
² & Tab::
	InvertNumberState := !InvertNumberState
		Progress, b fs8 cW000000 cTFFFFFF w7 zx0 zy0 zh0, %InvertNumberState%, , , Verdana
		Progress, 70 ; Set the position of the bar to 50%.
		Sleep, 500
		Progress, Off
	return

if InvertNumberState = 1
{
;1
	*$&::
		if (GetKeyState("Shift"))
        SendInput, {& Down}
    else
        SendInput, {1 Down}
    return
	*& Up::
    if (GetKeyState("Shift"))
        SendInput, {& Up}
    else
        SendInput, {1 Up}
    return
;2
	*$é::
    if (GetKeyState("Shift"))
        SendInput, {é Down}
    else
        SendInput, {2 Down}
    return
	*$é Up::
    if (GetKeyState("Shift"))
        SendInput, {é Up}
    else
			SendInput, {2 Up}
    return
	<^>!é::SendInput {~}
;3
	*$SC004::
    if (GetKeyState("Shift"))
        SendInput, {"}
    else
        SendInput, {3 Down}
    return
	*$SC004 Up::
    if (GetKeyState("Shift"))
        SendInput, {"}
    else
			SendInput, {3 Up}
    return
	<^>!SC004::SendInput {#}
;4
	*$SC005::
    if (GetKeyState("Shift"))
        SendInput, {{'} Down}
    else
        SendInput, {4 Down}
    return
	*$SC005 Up::
    if (GetKeyState("Shift"))
        SendInput, {{'} Up}
    else
			SendInput, {4 Up}
    return
	<^>!SC005::SendInput {{}
;5	
	*$(::
    if (GetKeyState("Shift"))
        SendInput, {( Down}
    else
        SendInput, {5 Down}
    return
	*$( Up::
    if (GetKeyState("Shift"))
        SendInput, {( Up}
    else
			SendInput, {5 Up}
    return
	<^>!(::SendInput {[}
;6	
	*$-::
    if (GetKeyState("Shift"))
        SendInput, {- Down}
    else
        SendInput, {6 Down}
    return
	*$- Up::
    if (GetKeyState("Shift"))
        SendInput, {- Up}
    else
			SendInput, {6 Up}
    return
	<^>!-::SendInput {|}
;7	
	*$è::
    if (GetKeyState("Shift"))
        SendInput, {è Down}
    else
        SendInput, {7 Down}
    return
	*$è Up::
    if (GetKeyState("Shift"))
        SendInput, {è Up}
    else
			SendInput, {7 Up}
    return
	<^>!è::SendInput {}
;8	
	*$_::
    if (GetKeyState("Shift"))
        SendInput, {_ Down}
    else
        SendInput, {8 Down}
    return
	*$_ Up::
    if (GetKeyState("Shift"))
        SendInput, {_ Up}
    else
			SendInput, {8 Up}
    return
	<^>!_::SendInput {\}
;9	
	*$ç::
    if (GetKeyState("Shift"))
        SendInput, {ç Down}
    else
        SendInput, {9 Down}
    return
	*$ç Up::
    if (GetKeyState("Shift"))
        SendInput, {ç Up}
    else
			SendInput, {9 Up}
    return
	<^>!ç::SendInput {^}
;0	
	*$à::
    if (GetKeyState("Shift"))
        SendInput, {à Down}
    else
        SendInput, {0 Down}
    return
	*$à Up::
    if (GetKeyState("Shift"))
        SendInput, {à Up}
    else
			SendInput, {0 Up}
    return
	<^>!à::SendInput {@}
;°	
	*$)::
    if (GetKeyState("Shift"))
        SendInput, {) Down}
    else
        SendInput, {° Down}
    return
	*$) Up::
    if (GetKeyState("Shift"))
        SendInput, {) Up}
    else
			SendInput, {° Up}
    return
	<^>!)::SendInput {]}
;=
	*$=::
    if (GetKeyState("Shift"))
        SendInput, {= Down}
    else
        SendInput, {+ Down}
    return
	*$= Up::
    if (GetKeyState("Shift"))
        SendInput, {= Up}
    else
			SendInput, {+ Up}
    return
	<^>!=::SendInput {}}
}
else
return
*/


;================================Special characters shortcuts================================ 
#é::É
#è::È
#à::À
#ç::Ç
:*?:àà::@

;================================Minimize================================
;~MButton & LButton:: WinMinimize A


;================================Close Window Mouse Control================================
;~MButton & RButton:: AltTab
return

;================================<> & Space = Alt & Space (for Launchy)================================
LWin & F12::Return ;hack
LWin::Return
LWin up::Send !{Space}

;================================Switch Play Back Device Quickly================================
;Win+Shift+a
; #+a::
;Run, mmsys.cpl
;return

;================================Ctrl+W = Close window================================
#If WinActive("ahk_class #32770") || WinActive("ahk_class FM")
	^w::WinClose
#IfWinActive

#If WinActive("ahk_class MediaPlayerClassicW")
	^w::
		WinGetPos,,, Width, Height
		if ((Width = 1680 && Height = 1050) || (Width = 1920 && Height = 1080)) ;if fullscreen mode
			{
			send {Escape}
			}
		else
			{
			WinClose
			}
	return
#IfWinActive

;================================Fullscreen================================
#IfWinActive, ahk_class FullScreenClass
	^w::Send {Escape}
#IfWinActive



;//////////////////////////////////////////////////////////////////////////////
;|||||||||||||||||||||||||||: Application specific :||||||||||||||||||||||||||
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



;===============================File explorer===================================

;=========Ctrl+Alt+E select all files w/ same extension=========
; AutoHotkey Version: 1.1.09.03 Unicode 32-bit
; Language:           English
; Platform:           Win7 SP1 Spanish
; Author:             Antonio Bueno <user atnbueno of Google's popular e-mail service>
; Description:        Modifies the Windows Explorer "Select All" keyboard shortcut (Ctrl+E) to 
;                     select only files that match the extension of the already selected items.
;                     Based on uname's code at http://autohotkey.com/board/topic/90144-/#entry570301
; Last Mod:           2013-02-16
; Initial configuration
SendMode Input
SetWorkingDir %A_ScriptDir%
Menu, Tray, Icon, %A_WinDir%\system32\shell32.dll, 299 ; filelist icon
Menu, Tray, Tip, Expand Windows Explorer Selection (AHK)
; It only modifies Ctrl+E if the active window is Windows Explorer
#IfWinActive ahk_class CabinetWClass
	^!e::
		For Window in ComObjCreate("Shell.Application").Windows
			if (Window.HWND == WinExist()) {
				FolderView := Window.Document
				; Compiles the extensions of the selected items in a list (<1ms/item)
				ExtensionList := ""
				SelectFolders := FALSE
				if (FolderView.SelectedItems.Count > 0) {
					For SelectedItem in FolderView.SelectedItems
						if (!SelectedItem.IsFolder) {
							SelectedItemPath := SelectedItem.Path
							SplitPath, SelectedItemPath, , , Extension
							ExtensionList .= Extension . "`n"
						} else
							SelectFolders := TRUE
					Sort, ExtensionList, U
					ExtensionList := Trim(ExtensionList, "`n")
					Path := FolderView.FocusedItem.Path
					SplitPath, Path, , Path
					; Iterates through the extensions selecting the items
					Folder := FolderView.Folder
					Loop, parse, ExtensionList, `n
						Loop, %Path%\*.%A_LoopField%
						{
							Item := Folder.ParseName(A_LoopFileName)
							FolderView.SelectItem(Item, 1)
						}
					if (SelectFolders) {
						Loop, %Path%\*, 2
						{
							Item := Folder.ParseName(A_LoopFileName) 
							FolderView.SelectItem(Item, 1)
						}
					} 
				} else
					Send, ^e
			}
	return

;Edit file
	^e::
	+Enter::
		Send, ^c
		Run, edit %clipboard%
	return
	
;Edit with gVim
	^+e::
		Send, ^c
		Run, "C:\Program Files (x86)\Vim\vim74\gvim.exe" %clipboard%
	return

	F9::WinClose, A

;Open Git Bash
	^b::
		Send, +{F10}
		Send, s
		Send, s
		Send, {Enter}
	return
#IfWinActive

;==============================Internet browsers==================================
#IfWinActive, ahk_class MozillaWindowClass
F9::
#IfWinActive, ahk_class Chrome_WidgetWin_1
F9::
	Send, ^{Tab}
return

#IfWinActive, ahk_class MozillaWindowClass
F8::
#IfWinActive, ahk_class Chrome_WidgetWin_1
F8::
	Send, ^+{Tab}
return

;==================================Launchy============================================
#IfWinActive, ahk_exe Launchy.exe
	^w::
	!F4::
		Send, !{Space}
	return
#IfWinActive

;================================Command Prompt, cmd======================================
#IfWinActive ahk_class ConsoleWindowClass
	^v::SendInput {Raw}%clipboard%
	^w::WinClose, A
#IfWinActive

;=================================Cygwin terminal emulator, Mintty=================================
#IfWinActive ahk_exe mintty.exe
	^w::Winclose, A
#IfWinActive

;======================================Git Bash==========================================
#IfWinActive ahk_exe sh.exe
	^v::Send, ^{Ins}
#IfWinActive

;================================Foobar2000 sleep at the end of playback================================
#IfWinActive, ahk_class {E7076D1C-A7BF-4f39-B771-BCBE88F2A2A8} ;Foobar2000
+p:: ;Shift+p
	BlockInput, On
	Send,^+I
	WinWaitActive, ahk_class #32770,,2 ;Preferences
	Send {Down}{Tab}{Tab}{Tab}{Down}{Space}{Enter}
		Progress, b fs8 cB000000 cW000000 cTFFFFFF w170 zx4 zy5 zh0 X1750 Y1014, Computer will go to sleep at the end of playback, , , Verdana
		Sleep, 6000
		Progress, Off
	BlockInput, Off
Return
#IfWinActive


;=================================HoneyView (Image Viewer)========================
#IfWinActive, ahk_class HoneyviewClassX
	o::Send, ^{Enter}
	Tab::Send, +{Tab}
	+Tab::Send, {Tab}
#IfWinActive

;=================================Imv_Stb (Image Viewer)==========================
#IfWinActive, imv(stb) ahk_class stb_imv
	WheelUp::
		Send, {Left}
		sleep, 30
	return
	WheelDown::
		Send, {Right}
		sleep, 30
	return
	f::
	MButton::
	Enter::
	NumpadEnter::
		Send, !{Enter}
	return
	Up::
	NumpadAdd::
	XButton1::
;	LButton & WheelUp::
		Send, {WheelUp}
	return
	Down::
	NumpadSub::
	XButton2::
;	LButton & WheelDown::
		Send, {WheelDown}
	Return
	$s::
	d::
		Send, {s}
		Progress, b fs8 cB000000 cW000000 cTFFFFFF w170 zx4 zy5 zh0 X Y0m, Slideshow, , , Verdana
		Sleep, 1000
		Progress, Off
	return
	^w::Winclose, A
	
#IfWinActive

;================================PotPlayer================================
#IfWinActive, ahk_class PotPlayer
	f::send, {F6}
	^f::send, {Enter}
	^w::WinClose, A
#IfWinActive

;================================Sumatra PDF==============================
#IfWinActive, ahk_class SUMATRA_PDF_FRAME
	^w::Winclose, A
#IFWinActive

;===============================LibreOffice Writer========================
#IfWinActive, ahk_exe soffice.bin
	^!e:: ;Change language to english
		send, !t
		send, {down}
		send, {right}
		send, {a}
		send, {enter}
		;send, {e}
	return
		
	^!f:: ;Change language to french
		send, !t
		send, {down}
		send, {right}
		send, a
		send, f 
	return
#IfWinActive

;================================Photoshop================================
;#IfWinActive, ahk_class  Photoshop
;#IfWinActive

;================================Krita====================================
#IfWinActive, Krita ahk_class QWidget
F9::Send, ^{t down}{LButton down}
F9 up::Send, ^{t up}{LButton up}
F12::Send, {Numpad9 down}{LButton down}
F12 up::Send, {Numpad9 up}{LButton up}
#IfWinActive

;================================Carapace================================
#IfWinActive, ahk_class  Photoshop
	^!+h::run "C:\Users\".%A_UserName%."\Shortcuts\Programs\Carapace.lnk"
#IfWinActive

#IfWinActive, Carapace V1.0 ;requires SetTitleMatchMode 2
	^z::send {backspace}
		
	^c:: ;Directly paste in photoshop
		send ^c
		ifWinExist, ahk_class Photoshop
		{
		sleep 100
		WinActivate, ahk_class Photoshop
		WinWait, ahk_class Photoshop,,1
		send ^v
		sleep 100
		send ^!+{$} ;Layer - Blending options
		WinWait, ahk_class PSFloatC,,2
		send +{Tab}
		sleep 10
		send {Down}{Down}{Down}
		sleep 10
		send {Tab}
		sleep 10
		send {8}{0} ;Opacity
		sleep 10
		send {Enter}
		}
#IfWinActive

;=============================Unity 3D==============================
#IfWinActive, ahk_class UnityContainerWndClass
	XButton2::Send, !{LButton down}
	XButton2 up::Send, !{LButton up}
#IfWinActive

;============================= Vim =====================================
#IfWinActive, ahk_class Vim
	NumpadEnter::Escape
	^WheelUp::Send, ^{Up}
	^WheelDown::Send, ^{Down}
#IfWinActive

#IfWinActive, VIM ahk_class ConsoleWindowClass
	NumpadEnter::Escape
#IfWinActive

;============================= Visual Studio =====================================
#IfWinActive, ahk_exe devenv.exe
	^!n::   ;Switch to light theme
		Send, ^+!y
		WinWait, ahk_class #32770
		Send, en
		Send, {Tab}
		Sleep, 10
		Send, light -lleaff
		Send, {Enter}
		return
		
	^!,:: 	;Switch to dark theme
		Send, ^+!y
		WinWait, ahk_class #32770
		Send, en
		Send, {Tab}
		Sleep, 10
		Send, dark -lleaff
		Send, {Enter}
		return
		
	NumpadEnter::Escape ;for VsVim
	
#IfWinActive

;============================= Notepad ++ plus plus ================================
#IfWinActive, ahk_class Notepad++
	NumpadEnter::Escape ;for ViSimulator
#IfWinActive

;============================ VLC - Videolan Media Player =========================
#IfWinActive, ahk_exe vlc.exe
	F8::send, {Space}
#IfWinActive

;============================= AIMP3 =============================
#IfWinActive, AIMP3 ahk_class TAIMPMainForm
	F8::Send, {Space}
	XButton1::Send, !{s}
	XButton2::Send, ^{q}
#IfWInActive

;============================= 7-zip File  Manager ===============================
#IfWinActive, ahk_class FM
	^Backspace::
		WinGetTitle, 7zipWTitle, A
		WinGet, 7ZipWId, ID, A
			loop
				{
					ControlSend,SysListView321,{Backspace}, ahk_id %7ZipWId%,,,
					sleep, 5
					WinGetTitle, 7zipWTitle, A
					sleep, 10
					if 7zipWTitle not contains .zip,.rar,.cbz,.cbr
					 {
					 break
					 }
				}
			WinGetTitle, 7zipWTitle, A
			if 7zipWTitle not contains .zip,.rar,.cbz,.cbr
				{
				ControlSend,SysListView321,{Del},ahk_id %7ZipWId%,,,
				}
		Winclose, ahk_id %7ZipWId%
		return
#IfWinActive

;===================================Retroshare=====================================
#IfWinActive ahk_exe RetroShare.exe
	^w::Winclose, A
#IfWinActive

;========================================Color Picker (ColorMania)=======================
#IfWinActive, ahk_exe ColorMania.exe
	^w::Winclose, A
#IfWinActive

;=====================================VIDEO GAMES===================================

;====================================Endless Legend=================================
#IfWinActive, ahk_exe EndlessLegend.exe
z::send {w down}
z up::send {w up}
q::send {a down}
q up::send {a up}

w::send z
a::send q
#IfWinActive

;=================================Rust===============================================

#IfWinActive, PlayRust ahk_class UnityWndClass
$^Enter::
 HoldRun()
Return
#IfWinActive

HoldRun(){
    SendInput {Z up}{Z down}{Enter up}{Enter down}
    Loop
    {
        Sleep 100
        GetKeyState state, z
        if state = u
            return
        If GetKeyState("s")
        {
            SendInput {z up}{Enter up}
            return
        }
    }
}

;=================================Counter Strike Global Offensive========================
#IfWinActive, Counter-Strike: Global Offensive ahk_class Valve001
F9::Send, {Media_Play_Pause}
#IfWinActive

;================================Dota 2================================================
#IfWinActive, DOTA 2 ahk_class Valve001
;WheelUp::Return
;WheelDown::Return

#IfWinActive

;================================Switch equalizer presets - Win+Shift+E then a number================================

#+Enter::
#+e::
	Progress, b fs8 c01 cB000000 cW000000 cTFFFFFF w170 zx4 zy5 zh0 X1750 Y950m, n. normal`n1. less bass`n2. less bass +`n3. less bass ++`n4. less bass +., , , Verdana
	Input, eqnum, L1 T6, {Enter}{Escape}
	Progress, Off
	BlockInput, On
	if eqnum = &
		{
		eqnum := 1
		eqnam := "less bass"
		}
	else if eqnum = é
		{
		eqnum := 2
		eqnam := "less bass +"
		}
	else if eqnum = `" ;"
		{
		eqnum := 3
		eqnam := "less bass ++"
		}
	else if eqnum = `' ;'
		{
		eqnum := 4
		eqnam := "less bass +."
		}
	else if eqnum = `(
		{
		eqnum := 5
		eqnam := ""
		}
	else if eqnum = -
		{
		eqnum := 6
		eqnam := ""
		}
	else if eqnum = è
		{
		eqnum := 7
		eqnam := ""
		}
	else if eqnum = _
		{
		eqnum := 8
		eqnam := ""
		}
	else if eqnum = ç
		{
		eqnum := 9
		eqnam := ""
		}
	else if eqnum = n
		{
		eqnum := "n"
		eqnam := "Normal"
		}
	if (eqnum = 0) || (eqnum = "")
		{
		return
		}
	Run, mmsys.cpl
	WinWait, ahk_class #32770,,2
	send, {down}
	sleep, 50
	send, {tab}{p}
	WinWait, Speakers Properties,,2
	send, ^{tab}^{tab}
	sleep, 50
	send, eq
	send, {tab}
	sleep, 10
	send, j
	sleep, 50
	if eqnum is number
		{
		Loop, %eqnum%
			{
			send, {Down}
			sleep, 50
			}
		}
	else  if eqnum is not number
		{
		sleep, 100
		SendInput, %eqnum%
		Progress, Off
		}
	sleep, 100
	send, {Enter}
	WinClose, Sound
	BlockInput, Off
		Progress, b fs8 cB000000 cW000000 cTFFFFFF w170 zx4 zy5 zh0 X1750 Y1027m, %eqnam%, , , Verdana
		Sleep, 4000
		Progress, Off
	eqnam := ""
return

;====================================Switch Pointer Sensitivity===========================
#F1::DllCall(“SystemParametersInfo”, Int,113, Int,0, UInt,14, Int,2) ;normal sensisivity
#F2::DllCall(“SystemParametersInfo”, Int,113, Int,0, UInt,6, Int,2) ;low sensitivity
#F3::DllCall(“SystemParametersInfo”, Int,113, Int,0, UInt,20, Int,2) ;high sensitivity
