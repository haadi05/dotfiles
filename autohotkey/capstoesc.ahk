SetCapsLockState "AlwaysOff"

CapsLock::
{
    usedAsModifier := false

    Send "{Ctrl down}"

    ; Detect if another key is pressed while holding CapsLock
    ih := InputHook("L1")
    ih.Start()

    while GetKeyState("CapsLock", "P")
    {
        if ih.Wait(0.01) = "EndKey"
        {
            usedAsModifier := true
            break
        }
    }

    Send "{Ctrl up}"

    if !usedAsModifier
    {
        Send "{Esc}"
    }
}