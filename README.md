# 🎙️ Raspberry Pi Voice Assistant

A lightweight AI-powered voice assistant built on a **Raspberry Pi 3** using an INMP441 I2S microphone. The assistant listens to spoken commands, understands them, and responds — with plans to speak back using a MAX98357A speaker amplifier.

---

## 🎯 Project Goal

Build a fully working voice assistant on Raspberry Pi 3 that can:

- 🎤 Listen through a microphone
- 🧠 Understand spoken commands
- ⏱️ Handle real-time tasks (time, date, weather, timers)
- 🤖 Answer general questions using a local AI model
- 📧 Check and read emails *(coming soon)*
- 🔊 Speak responses aloud *(coming soon)*

**Pipeline:** `speech → understanding → action or AI answer → response`

---

## 🛠️ Hardware

| Component | Details |
|-----------|---------|
| Main board | Raspberry Pi 3 |
| Microphone | INMP441 I2S digital microphone |
| Speaker amp | MAX98357A I2S amplifier |
| Audio out | 3.5mm headphone jack (for testing) |
| Access | SSH from laptop / direct monitor |

---

## 📦 Software Stack

| Tool | Purpose |
|------|---------|
| Raspberry Pi OS | Operating system |
| Python 3 + venv | Main programming environment |
| Vosk | Offline speech-to-text |
| sounddevice | Live microphone audio capture |
| requests | HTTP calls for weather API |
| wttr.in | Free weather data source |
| llama.cpp | Local LLM inference *(planned)* |

---

## ✅ Current Status

| Feature | Status |
|---------|--------|
| SSH remote access | ✅ Working |
| INMP441 mic wiring | ✅ Working |
| I2S mic software config | ✅ Working |
| Audio recording | ✅ Working |
| Audio playback | ✅ Working |
| Speech-to-text (Vosk) | ✅ Working |
| Time command | ✅ Working |
| Date command | ✅ Working |
| Weather command | ✅ Working |
| Temperature command | ✅ Working |
| Timer command | ✅ Working |
| Local LLM (llama.cpp) | 🔄 In Progress |
| Email integration | 📋 Planned |
| Voice output (TTS) | 📋 Planned |

---

## 🔌 Microphone Wiring (INMP441 → Raspberry Pi 3)

| INMP441 Pin | Raspberry Pi Pin |
|-------------|-----------------|
| VDD | 3.3V (Pin 1) |
| GND | GND (Pin 6) |
| SCK / BCLK | GPIO18 (Pin 12) |
| WS / LRCLK | GPIO19 (Pin 35) |
| SD / DOUT | GPIO20 (Pin 38) |
| L/R | GND (Pin 6) |

---

## 📁 Project Structure

```
pi-voice-assistant/
│
├── README.md               ← You are here
├── PROGRESS.md             ← Step-by-step build diary
│
├── code/
│   └── assistant_stage2.py ← Main assistant script
│
├── docs/
│   ├── hardware_setup.md   ← Wiring and hardware guide
│   ├── software_setup.md   ← Installation steps
│   └── future_plans.md     ← Roadmap and upcoming features
│
└── notes/
    └── problems_and_solutions.md  ← Bugs found and fixes applied
```

---

## 🚀 Supported Voice Commands

```
"what time is it"
"what is the date today"
"what was the date yesterday"
"what was the date two days ago"
"what is the date after seven days"
"weather in lahore"
"weather in karachi"
"weather in islamabad"
"weather in frankfurt"
"temperature in [city]"
"timer for one minute"
"timer for two minutes"
"timer for five minutes"
"exit"
```

---

## 🏗️ Architecture Design

The assistant uses a **hybrid two-stage approach**:

```
Stage 1: Restricted Command Recognition
         → Fast, accurate, handles: time / date / weather / timer

Stage 2: Local LLM Fallback (llama.cpp)
         → Handles general questions when Stage 1 has no match
```

This is the best design for Raspberry Pi 3's limited processing power.

---

## 📖 How to Run

```bash
# SSH into your Pi
ssh pi@<your-pi-ip>

# Go to project folder
cd ~/stt

# Activate virtual environment
source .venv/bin/activate

# Run the assistant
python assistant_stage2.py
```

---

## 🗺️ Roadmap

- [x] Hardware setup and mic wiring
- [x] Speech-to-text with Vosk
- [x] Restricted command assistant
- [ ] Local LLM integration (llama.cpp + GGUF model)
- [ ] Email checking (Gmail API)
- [ ] Text-to-speech voice output
- [ ] Wake word detection ("hey assistant")
- [ ] More cities for weather
- [ ] Better timer/reminder formats

---

## 📝 Author

Personal project — building a practical voice assistant from scratch on affordable hardware.

*Started: 2025 | Ongoing*
