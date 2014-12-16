#SingleInstance force
#NoEnv

;====

Run, C:\Portable Program Files\Scripts\Autohotkey scripts\AutoHotkeyU64.ahk
sleep, 50
Run, C:\Portable Program Files\Scripts\Autohotkey scripts\WindowPadX\WindowPadX.ahk

sleep, 50
Run, C:\Program Files (x86)\Launchy\Launchy.exe

sleep, 100
Run, C:\Users\Elo\AppData\Local\FluxSoftware\Flux\flux.exe, , min

sleep, 200
Run, C:\Program Files\Elantech\ETDCtrl.exe

sleep, 200
Run, C:\Portable Program Files\Scripts\Autohotkey Scripts\StandUp\StandUp.exe

sleep, 20000
Run, C:\Program Files (x86)\uTorrent\uTorrent.exe, , min

ExitApp
