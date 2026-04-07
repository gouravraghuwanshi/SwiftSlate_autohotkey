# SwiftSlate Desktop 🚀

**SwiftSlate Desktop** is a high-precision, lightweight AI text assistant for Windows. Inspired by the [SwiftSlate](https://github.com/Musheer360/SwiftSlate) Android project, this tool provides system-wide, inline text transformation using high-speed LLMs.

[cite_start]By leveraging **AutoHotkey v2.0**[cite: 1], the script allows you to trigger complex AI tasks—like grammar correction or summarization—directly within any text field without ever leaving your active application.

---

## ✨ Key Features

* [cite_start]**Dual Provider Support**: Choose between **Google Gemini** or **Groq** as your processing engine[cite: 2, 3].
* [cite_start]**Optimized for Speed**: Specifically configured for low-latency models like `gemini-2.5-flash-lite` or `openai/gpt-oss-120b`[cite: 3, 4].
* [cite_start]**Direct-Action Prompts**: Custom system instructions ensure the AI returns **only** the processed text, eliminating conversational "fluff" or preamble[cite: 5].
* [cite_start]**Zero Context Switching**: Automatically captures text to the left of your cursor and replaces it instantly using a native paste command[cite: 6, 9].
* [cite_start]**Deterministic Output**: Uses a low temperature setting (0.3) to ensure consistent, literal, and focused results[cite: 7].

---

## 🛠 Built-in Commands

Type your text followed by one of these triggers to transform it:

| Trigger | Action | [cite_start]AI Instruction Purpose [cite: 5] |
| :--- | :--- | :--- |
| `?fix` | **Fix Grammar** | Corrects spelling and grammar without changing style. |
| `?sum` | **Summarize** | Condenses text into concise bullet points. |
| `?pro` | **Professional** | Rewrites text in a formal business tone. |
| `?cas` | **Casual** | Rewrites text in a friendly, conversational tone. |
| `?ext` | **Extend** | Elaborates and adds depth to the message. |
| `?sh` | **Shorten** | Makes the text as brief as possible. |
| `?code`| **Explain Code**| Provides a 2-3 sentence technical explanation. |
| `?rep` | **Reply** | [cite_start]Generates a polite and relevant response[cite: 5]. |

---

## 🚀 Setup & Installation

### 1. Prerequisites
* [cite_start]**AutoHotkey v2.0+**: Ensure the latest version of AHK is installed[cite: 1].
* [cite_start]**API Credentials**: You will need a valid key from [Google AI Studio](https://aistudio.google.com/) or [Groq Cloud](https://console.groq.com/)[cite: 2].

### 2. Configuration
Open `swiftkey.ahk` in a text editor and update the following variables:

* [cite_start]**Provider**: Set `global PROVIDER := "gemini"` or `"groq"`[cite: 3].
* [cite_start]**API Keys**: Paste your respective keys into `global GROQ_KEY` or `global GEMINI_KEY`[cite: 2].
* [cite_start]**Model Selection**: The script defaults to `gemini-2.5-flash-lite` or `openai/gpt-oss-120b` for maximum efficiency[cite: 3, 4].

### 3. Usage
1.  Run the `swiftkey.ahk` script.
2.  In any application, type a sentence (e.g., `i am go home ?fix`).
3.  [cite_start]The script will highlight the text [cite: 6][cite_start], call the API, and paste the corrected result[cite: 9, 10].

---

## 📜 Acknowledgments
A special thanks to the original [SwiftSlate](https://github.com/Musheer360/SwiftSlate) project for the concept. This desktop implementation brings that vision to Windows, optimized for speed and professional workflows.

---

## ⚖️ License
Distributed under the MIT License.
