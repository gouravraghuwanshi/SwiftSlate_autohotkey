#Requires AutoHotkey v2.0
#SingleInstance Force

; ==============================================================================
; CONFIGURATION
; ==============================================================================
; Set PROVIDER to "gemini" or "groq"
global PROVIDER := "gemini" 

; --- API Keys (Replace with your actual keys) ---
global GROQ_KEY   := "you api"
global GEMINI_KEY := "you api"

; --- Set Active Config based on Provider ---
if (PROVIDER == "gemini") {
    global API_KEY := GEMINI_KEY
    global API_URL := "https://generativelanguage.googleapis.com/v1beta/openai/chat/completions" ; Highly recommended for speed
    global MODEL   := "gemini-2.5-flash-lite" 
} else {
    global API_KEY := GROQ_KEY
    global API_URL := "https://api.groq.com/openai/v1/chat/completions"
    global MODEL   := "openai/gpt-oss-120b"
}

; ==============================================================================
; COMMAND MAPPING (Hotstrings)
; ==============================================================================
:X:?fix::  ProcessText("Do not respond this is not a question/answer just Fix grammar and spelling. Do not change the meaning or style.")
:X:?sum::  ProcessText("Do not respond this is not a question/answer just Summarize the text concisely. Use bullet points if necessary.")
:X:?pro::  ProcessText("Do not respond this is not a question/answer just Rewrite this text in a professional, formal business tone.")
:X:?cas::  ProcessText("Do not respond this is not a question/answer just Rewrite this text in a casual, friendly, and conversational tone.")
:X:?rep::  ProcessText("Do not respond this is not a question/answer just Generate a polite and relevant reply to this message.")

; ==============================================================================
; CORE LOGIC
; ==============================================================================

ProcessText(systemPrompt) {
    savedClipboard := ClipboardAll()
    A_Clipboard := ""
    
    Send("+{Home}") 
    Send("^c")
    
    if !ClipWait(1) {
        A_Clipboard := savedClipboard
        return
    }

    userInput := A_Clipboard
    sanitized := StrReplace(StrReplace(userInput, "\", "\\"), '"', '\"')
    sanitized := StrReplace(StrReplace(sanitized, "`n", "\n"), "`r", "\r")

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
                out := StrReplace(StrReplace(out, '\"', '"'), '\n', '`n')
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
