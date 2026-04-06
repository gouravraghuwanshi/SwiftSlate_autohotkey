# SwiftSlate Desktop 🚀

**SwiftSlate Desktop** is a lightweight, high-performance AI text Autohotkey assistant for Windows. Inspired by the [SwiftSlate](https://github.com/Musheer360/SwiftSlate) Android project, this tool brings seamless, system-wide AI text transformation to your desktop.

No context switching. No copy-pasting. Just type a command, and watch your text transform instantly in any application—from VS Code and Slack to your web browser.

---

## ✨ Features

* **🤖 Multi-Model Support**: Choose between **Google Gemini** (2.5 Flash lite) or **Groq** (GPT-OSS, Llama 3, etc.) for your backend.
* **🌐 Works Everywhere**: Integrates into any Windows text field (Browsers, IDEs, Word, WhatsApp Desktop, etc.).
* **⚡ Inline Replacement**: Commands are processed in-place. Your original text is replaced by the AI response automatically.
* **🪶 Zero Footprint**: Extremely lightweight AutoHotkey v2 script with minimal RAM usage.
* **🔒 Privacy First**: Your text is only sent to the API provider of your choice when you explicitly trigger a command.

---

## 🛠 Built-in Commands

Simply type your text followed by a trigger to transform it:

| Trigger | Action | Description |
| :--- | :--- | :--- |
| `?fix` | **Fix Grammar** | Corrects spelling and grammar while preserving meaning. |
| `?sum` | **Summarize** | Condenses the preceding text into key points. |
| `?pro` | **Professional** | Rewrites the text in a formal business tone. |
| `?cas` | **Casual** | Rewrites the text in a friendly, conversational tone. |
| `?ext` | **Extend** | Elaborates and adds detail to your thoughts. |
| `?sh` | **Shorten** | Makes the text concise and brief. |
| `?code`| **Explain Code** | Provides a 2-3 sentence explanation of code snippets. |
| `?rep` | **Reply** | Generates a polite, context-aware response. |

---

## 🚀 Setup & Usage

### Prerequisites
* [AutoHotkey v2.0+](https://www.autohotkey.com/) installed.
* An API Key from [Google AI Studio](https://aistudio.google.com/) **OR** [Groq Cloud](https://console.groq.com/).

### Installation
1.  Download the `SwiftSlate.ahk` script.
2.  Open the script in any text editor (e.g., Notepad).
3.  **Configure your provider**:
    * Set `global PROVIDER := "gemini"` or `"groq"`.
    * Paste your API key into the corresponding variable (`GEMINI_KEY` or `GROQ_KEY`).
4.  Save and double-click the script to run it.

---

## 🤝 Acknowledgments

Special thanks to the [SwiftSlate](https://github.com/Musheer360/SwiftSlate) team for the original concept. This desktop port aims to provide that same fluid, "AI-at-your-fingertips" experience for Windows power users.

---

## 📜 License

Distributed under the MIT License. See `LICENSE` for more information.
