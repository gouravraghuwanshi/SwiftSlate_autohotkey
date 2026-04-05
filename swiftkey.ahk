#Requires AutoHotkey v2.0
#SingleInstance Force

; ==============================================================================
; CONFIGURATION
; ==============================================================================
global API_KEY := "Your_API_KEY" ; <--- Replace with your Groq API Key
global API_URL := "https://api.groq.com/openai/v1/chat/completions"
global MODEL   := "openai/gpt-oss-120b"

; ==============================================================================
; COMMAND MAPPING (Hotstrings)
; ==============================================================================

:X:?fix::  ProcessText("Fix grammar and spelling. Do not change the meaning or style.")
:X:?sum::  ProcessText("Summarize the text concisely. Use bullet points if necessary.")
:X:?ext::  ProcessText("Expand this text. Add detail and depth while maintaining the core message.")
:X:?sh::   ProcessText("Shorten this text. Make it as brief as possible without losing information.")
:X:?pro::  ProcessText("Rewrite this text in a professional, formal business tone.")
:X:?cas::  ProcessText("Rewrite this text in a casual, friendly, and conversational tone.")
:X:?code:: ProcessText("Explain what this code does in 2-3 sentences.")
:X:?rep::  ProcessText("Generate a polite and relevant reply to this message.")

; ==============================================================================
; CORE LOGIC
; ==============================================================================

ProcessText(systemPrompt) {
    savedClipboard := ClipboardAll()
    A_Clipboard := ""
    
    ; Capture text to the left of the cursor
    Send("+{Home}") 
    Send("^c")
    
    if !ClipWait(1) {
        A_Clipboard := savedClipboard
        return
    }

    userInput := A_Clipboard
    ; Sanitize for JSON
    sanitized := StrReplace(userInput, "\", "\\")
    sanitized := StrReplace(sanitized, '"', '\"')
    sanitized := StrReplace(sanitized, "`n", "\n")
    sanitized := StrReplace(sanitized, "`r", "\r")

    payload := '{"model": "' MODEL '", "messages": [{"role": "system", "content": "' systemPrompt '"}, {"role": "user", "content": "' sanitized '"}], "temperature": 0.3}'

    try {
        http := ComObject("WinHttp.WinHttpRequest.5.1")
        http.Open("POST", API_URL, true)
        http.SetRequestHeader("Content-Type", "application/json")
        http.SetRequestHeader("Authorization", "Bearer " API_KEY)
        http.Send(payload)
        http.WaitForResponse()

        if (http.Status == 200) {
            if RegExMatch(http.ResponseText, '"content":\s*"(.*?)(?<!\\)"', &match) {
                out := match[1]
                out := StrReplace(out, '\"', '"')
                out := StrReplace(out, '\n', '`n')
                out := StrReplace(out, '\\', '\')
                
                A_Clipboard := out
                Send("^v")
            }
        } else {
            MsgBox("API Error: " http.Status " - " http.ResponseText)
        }
    } catch Error as e {
        ToolTip("Request Failed: " e.Message)
        SetTimer () => ToolTip(), -3000
    }

    Sleep(200)
    A_Clipboard := savedClipboard
}