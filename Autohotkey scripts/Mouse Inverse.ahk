;By Raccoon Dec-2010
;Mouse Inverse using Mouse Hook

#SingleInstance, Force  ; Only one at a time.
#NoEnv         ; Just use it.
#Persistent    ; Needed if there are no hotkeys or timers.
OnExit, OnExit ; Needed to Unhook when Exiting.

hHookMouse := SetWindowsHookEx(14, RegisterCallback("WH_MOUSE_LL", "Fast"))

RETURN ; End Auto-execute.

OnExit:
  UnhookWindowsHookEx(hHookMouse) ; VERY IMPORTANT.
  ExitApp

WH_MOUSE_LL(nCode, wParam, lParam)
{
  Static lx:=999999, ly
  Critical
  
  if !nCode && (wParam = 0x200) { ; WM_MOUSEMOVE 

    mx := NumGet(lParam+0, 0, "Int") ; x-coord
    my := NumGet(lParam+0, 4, "Int") ; y-coord
    ;OutputDebug % "MouseMove : mx = " mx ", lx = " lx ", my = " my ", ly = " ly
    
    if (lx != 999999) { ; skip if last-xy coordinates haven't been initilized (first move).

      ; normal movement example.
      ;mx := lx + (mx - lx)
      ;my := ly + (my - ly)
      
      ; modify (invert) movement.
      mx := lx - (mx - lx)
      my := ly - (my - ly)
      
      ; modify (half-speed) movement.
      ;mx := lx + (mx - lx) / 2
      ;my := ly + (my - ly) / 2
      
      ; control desktop edges  /// this method is replaced by MouseGetPos or GetCursorPos below.
      ;if (mx < 0)
      ;  mx := 0
      ;else if (mx >= A_ScreenWidth)
      ;  mx := A_ScreenWidth -1
      ;if (my < 0)
      ;  my := 0
      ;else if (my >= A_ScreenHeight)
      ;  my := A_ScreenHeight -1
    }
    
    ; This is where the magic happens, in combination with Return 1.
    DllCall("SetCursorPos", "Int", mx, "Int", my)

    ;CoordMode, Mouse, Screen ; only needed if using MouseGetPos,
    ;MouseGetPos, lx, ly      ; lets use GetCursorPos instead.
    VarSetCapacity(lpPoint,8)
    DllCall("GetCursorPos", "Uint", &lpPoint) ; SetCursorPos controls desktop edges; less math for us.
    lx := NumGet(lpPoint, 0, "Int")
    ly := NumGet(lpPoint, 4, "Int")
    
    ; Send the modified mouse coords to other hooking processes along the chain.
    NumPut(mx, lParam+0, 0, "Int")
    NumPut(my, lParam+0, 4, "Int")
    ret:=DllCall("CallNextHookEx", "Uint", 0, "int", nCode, "Uint", wParam, "Uint", lParam)
    ;Return ret
    
    Return 1 ; Halt default mouse processing. (same method used by 'BlockInput, MouseMove')
  }
  else {
    Return DllCall("CallNextHookEx", "Uint", 0, "int", nCode, "Uint", wParam, "Uint", lParam) 
  }
} ; End WH_MOUSE_LL

SetWindowsHookEx(idHook, pfn)
{
  Return DllCall("SetWindowsHookEx", "int", idHook, "Uint", pfn, "Uint", DllCall("GetModuleHandle", "Uint", 0), "Uint", 0)
}

UnhookWindowsHookEx(hHook)
{
  Return DllCall("UnhookWindowsHookEx", "Uint", hHook)
}

; Since the below function is called so frequently, it's faster to use the DllCall() instead of this func.
CallNextHookEx(nCode, wParam, lParam, hHook = 0)
{
  Return DllCall("CallNextHookEx", "Uint", hHook, "int", nCode, "Uint", wParam, "Uint", lParam)
}



