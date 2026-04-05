# SwiftSlate Desktop 🚀

**SwiftSlate Desktop** is a lightweight, high-performance AI text assistant based on AutoHotkey. Inspired by the [SwiftSlate](https://github.com/Musheer360/SwiftSlate) Android project, this tool brings seamless, system-wide AI text transformation to your desktop.

No context switching. No copy-pasting. Just type a command, and watch your text transform instantly in any application—from VS Code and Slack to your web browser.

---

## ✨ Features

* **🌐 Works Everywhere**: Since it runs via AutoHotkey, it integrates into any Windows text field (Browsers, IDEs, Word, WhatsApp Desktop, etc.).
* **⚡ Inline Replacement**: Commands are processed in-place. Your original text is replaced by the AI response automatically.
* **🤖 Powered by Groq**: Utilizes the high-speed Groq API (`openai/gpt-oss-120b`) for near-instant latency.
* **🪶 Zero Footprint**: Extremely lightweight script with minimal RAM usage.
* **🔒 Privacy First**: Your text is only sent to the API when you explicitly trigger a command.

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

## 🚀 How It Works

1.  **Input Detection**: The script monitors for specific "hotstrings" (like `?fix`).
2.  **Context Capture**: Once triggered, the script automatically highlights the text to the left of your cursor.
3.  **AI Processing**: The text is sent to the Groq API with a specialized hidden prompt.
4.  **Instant Replace**: The script deletes the old text and "pastes" the AI-enhanced version back into the field.

---

## 📦 Setup & Usage

### Prerequisites
* [AutoHotkey v2.0+](https://www.autohotkey.com/) installed.
* A [Groq API Key](https://console.groq.com/).

### Installation
1.  Download the `SwiftSlate.ahk` script.
2.  Open the script in any text editor.
3.  Find the line `global API_KEY := "YOUR_GROQ_API_KEY"` and paste your key between the quotes.
4.  Save and double-click the script to run it.

---

## 🤝 Acknowledgments

A huge thanks to the [SwiftSlate](https://github.com/Musheer360/SwiftSlate) team for the brilliant concept of trigger-based inline text AI. This project aims to bring that same fluid experience to Windows power users.

---

## 📜 License

Distributed under the MIT License. See `LICENSE` for more information.
