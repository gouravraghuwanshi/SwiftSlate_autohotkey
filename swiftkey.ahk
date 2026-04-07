#Requires AutoHotkey v2.0
#SingleInstance Force

; ==============================================================================
; CONFIGURATION
; ==============================================================================
global PROVIDER := "gemini" 
; --- API Keys (Replace with your actual keys) ---
global GROQ_KEY   := "api_key_of_yours"
global GEMINI_KEY := "api_key_of_yours"
if (PROVIDER == "gemini") {
    global API_KEY := GEMINI_KEY
    global API_URL := "https://generativelanguage.googleapis.com/v1beta/openai/chat/completions"
    global MODEL   := "gemini-2.5-flash-lite" ; Updated to a more stable Flash version
} else {
    global API_KEY := GROQ_KEY
    global API_URL := "https://api.groq.com/openai/v1/chat/completions"
    global MODEL   := "openai/gpt-oss-120b"
}

; ==============================================================================
; COMMAND MAPPING (All SwiftSlate Commands Restored)
; ==============================================================================
:X:?fix::  ProcessText("Act as a grammar correction tool. Fix all errors in the provided text. Return ONLY the corrected text without any preamble or explanation.")
:X:?sum::  ProcessText("Summarize the following text into brief bullet points. Return ONLY the summary.")
:X:?pro::  ProcessText("Rewrite the following text to be professional and formal. Return ONLY the rewritten text.")
:X:?cas::  ProcessText("Rewrite the following text to be casual and friendly. Return ONLY the rewritten text.")
:X:?ext::  ProcessText("Expand the following text with more detail and depth. Return ONLY the expanded version.")
:X:?sh::   ProcessText("Shorten the following text to be as concise as possible. Return ONLY the shortened version.")
:X:?code:: ProcessText("Explain the following code snippet in 2-3 sentences. Return ONLY the explanation.")
:X:?rep::  ProcessText("Draft a polite and relevant reply to the following message. Return ONLY the reply.")

; ==============================================================================
; CORE LOGIC
; ==============================================================================
ProcessText(systemPrompt) {
    savedClipboard := ClipboardAll()
    A_Clipboard := ""
    
    ; Capture text to the left 
    Send("^{a}")
    Send("^c")
    
    if !ClipWait(1) {
        A_Clipboard := savedClipboard
        return
    }

    userInput := A_Clipboard
    ; Strict sanitization for JSON
    sanitized := StrReplace(userInput, "\", "\\")
    sanitized := StrReplace(sanitized, '"', '\"')
    sanitized := StrReplace(sanitized, "`n", "\n")
    sanitized := StrReplace(sanitized, "`r", "\r")

    ; Re-structured Payload: Explicitly labeling the input for the model
    payload := '{"model": "' MODEL '", "messages": [' 
             . '{"role": "system", "content": "' systemPrompt '"}, ' 
             . '{"role": "user", "content": "Text to process: ' sanitized '"}' 
             . '], "temperature": 0.1}' ; Lower temperature = more focus/less chatter

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
