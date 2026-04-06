# 🗺️ Future Plans & Roadmap

This document tracks what is planned for future versions of the assistant.

---

## 🔄 Currently In Progress

### Local LLM Integration (llama.cpp)

**Goal:** Add a free local AI model as a fallback for general questions.

**Plan:**
- Build llama.cpp on the Pi
- Download TinyLlama or similar small GGUF model
- Connect to assistant as Stage 2 fallback

**When Stage 1 (restricted commands) fails:**
→ Send text to local LLM
→ Return AI-generated answer

---

## 📋 Planned Features

### Email Integration

**Goal:** Check Gmail and read email summaries by voice.

**Plan:**
- Set up Google Gmail API credentials
- Authorize access with OAuth token
- Python script to fetch latest emails
- Assistant reads subject + sender aloud

**Commands to support:**
```
"any new emails"
"read my latest email"
"how many unread emails"
```

---

### Voice Output (Text-to-Speech)

**Goal:** Assistant speaks responses instead of just printing them.

**Options being considered:**
- `piper` TTS (fast, offline, decent quality)
- `espeak` (very lightweight, robotic sound)
- `festival` TTS

**Output route:**
- 3.5mm jack for testing
- MAX98357A amplifier for final speaker output

---

### Wake Word Detection

**Goal:** Assistant only activates when you say a trigger word.

**Options:**
- "hey assistant"
- Custom wake word using Porcupine or similar

**Benefit:** Mic runs in background, assistant activates on demand.

---

### More Cities for Weather

Currently supported:
- Lahore
- Karachi
- Islamabad
- Frankfurt

**Plan:** Add dynamic city recognition so any city name works.

---

### Better Timer and Reminder Formats

Currently supported:
- "timer for one minute"
- "timer for two minutes"
- "timer for five minutes"

**Plan:** Support more formats like:
- "set a reminder for 10 minutes"
- "wake me up in 30 minutes"
- "remind me in an hour"

---

### Multi-Step Conversation

**Goal:** Assistant can handle follow-up questions.

Example:
```
You: "what is the weather in lahore"
Assistant: "Currently 35 degrees in Lahore"
You: "and in karachi?"
Assistant: understands context → answers Karachi
```

---

## 🏁 Final Target Vision

A fully working Pi-based voice assistant that you can say:

- *"What time is it?"* → instant answer
- *"What's the weather in Lahore?"* → live weather
- *"Set a timer for 5 minutes."* → countdown runs
- *"Any new emails?"* → reads inbox summary
- *"Explain SSH simply."* → AI explanation
- *"Hey assistant"* → activates from standby

And the Pi:
- hears you clearly
- understands correctly
- picks the right path
- gives a useful answer
- speaks the reply aloud
