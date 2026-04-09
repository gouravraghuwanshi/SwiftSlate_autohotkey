# SwiftSlate Desktop 🚀

**SwiftSlate Desktop** is a high-precision, lightweight AI text assistant for Windows. Inspired by the [SwiftSlate](https://github.com/Musheer360/SwiftSlate) Android project, this tool provides system-wide, inline text transformation using high-speed LLMs.

---

## ✨ Key Features

* **Triple Provider Support**: Choose between **Google Gemini**, **Groq**, or **Mistral AI** as your processing engine.
* **Streamlined Selection**: Uses native Windows shortcuts to capture text within any active input field.
* **Direct-Action Prompts**: Custom system instructions ensure the AI returns **only** the processed text, eliminating conversational preamble.
* **Zero Context Switching**: Automatically captures text in the current input field and replaces it instantly.

---

## 🛠 Built-in Commands

| Trigger | Action | AI Instruction Purpose |
| :--- | :--- | :--- |
| `?fix` | **Fix Grammar** | Corrects spelling and grammar without changing style. |
| `?sum` | **Summarize** | Condenses text into concise bullet points. |
| `?pro` | **Professional** | Rewrites text in a formal business tone. |
| `?cas` | **Casual** | Rewrites text in a friendly, conversational tone. |
| `?ext` | **Extend** | Elaborates and adds detail to the message. |
| `?sh` | **Shorten** | Makes the text as brief as possible. |
| `?code`| **Explain Code**| Provides a 2-3 sentence technical explanation. |
| `?rep` | **Reply** | Generates a polite and relevant response. |

---

## 🚀 Setup & Installation

### 1. Prerequisites
* **AutoHotkey v2.0+**
* API Credentials from [Google AI Studio](https://aistudio.google.com/), [Groq Cloud](https://console.groq.com/), or [Mistral Console](https://console.mistral.ai/).

### 2. Configuration
Open `swiftkey.ahk` and update:
* `PROVIDER`: Set to `"gemini"`, `"groq"`, or `"mistral"`.
* `KEYS`: Paste your respective API keys.

### 3. Usage
1. Run the `swiftkey.ahk` script.
2. In any application, type your text followed by a trigger (e.g., `i has a error ?fix`).
3. The script will highlight the text and replace it with the AI-optimized version automatically.

---

## ⚖️ License
Distributed under the MIT License.
