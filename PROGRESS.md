# 📓 Build Progress Diary

This file documents every step of the project from day one.
Updated regularly as new features are added.

---

## 📅 Phase 1 — Hardware Setup & Remote Access

### ✅ Step 1: Raspberry Pi Remote Access via SSH

**What was done:**
- Connected laptop to Raspberry Pi 3 over the local network
- Enabled SSH on the Pi
- Successfully logged in remotely from laptop terminal

**Result:** Pi is fully accessible from laptop. No need to plug in monitor every time.

**Command used:**
```bash
ssh pi@<raspberry-pi-ip-address>
```

---

### ✅ Step 2: INMP441 Microphone Wiring

**What was done:**
- Researched INMP441 I2S microphone pin layout
- Mapped each pin to correct Raspberry Pi 3 GPIO

**Final working wiring:**

| INMP441 Pin | Raspberry Pi Pin |
|-------------|-----------------|
| VDD | 3.3V (Pin 1) |
| GND | GND (Pin 6) |
| SCK / BCLK | GPIO18 (Pin 12) |
| WS / LRCLK | GPIO19 (Pin 35) |
| SD / DOUT | GPIO20 (Pin 38) |
| L/R | GND (Pin 6) |

**Result:** Microphone physically connected and ready for software setup.

---

### ✅ Step 3: I2S Microphone Software Configuration

**What was done:**
- Added I2S microphone overlay to `/boot/config.txt`
- Configured the Pi kernel to recognize I2S input device
- Verified the mic appeared in ALSA device list

**Config added to `/boot/config.txt`:**
```
dtparam=i2s=on
dtoverlay=googlevoicehat-soundcard
```

**Verification command:**
```bash
arecord -l
```

**Result:** INMP441 showed up as a capture device. Mic is recognized by the system.

---

### ✅ Step 4: Recording and Playback Test

**What was done:**
- Recorded a short audio clip using `arecord`
- Played it back through 3.5mm audio jack using `aplay`

**Commands used:**
```bash
# Record 5 seconds of audio
arecord -D plughw:1 -c1 -r 48000 -f S32_LE -t wav -V mono -v test.wav

# Play it back
aplay test.wav
```

**Result:** Recording and playback both work. Full audio path confirmed end-to-end.

---

## 📅 Phase 2 — Speech to Text Setup

### ✅ Step 5: Python Environment Setup

**What was done:**
- Created a Python virtual environment inside `~/stt/`
- Installed all required packages

**Commands used:**
```bash
cd ~/stt
python3 -m venv .venv
source .venv/bin/activate
pip install vosk sounddevice requests
sudo apt install portaudio19-dev
```

**Result:** Clean Python environment ready. All packages installed.

---

### ✅ Step 6: Vosk Speech-to-Text Working

**What was done:**
- Downloaded Vosk small English model
- Wrote Python script to read mic audio live
- Converted spoken words into text in real time

**Model used:**
```
vosk-model-small-en-us-0.15
```

**Result:** Pi can now hear and convert speech to text. This is the core foundation of the assistant.

---

## 📅 Phase 3 — Assistant Logic

### ✅ Step 7: First Assistant Version

**What was done:**
- Built first Python assistant script
- Added basic command matching for:
  - time
  - date
  - weather
  - timer
  - exit

**How it works:**
1. Microphone captures live audio
2. Vosk converts speech to text
3. Script checks which command was said
4. Prints the result

**Result:** First working voice assistant. Commands recognized and answered.

---

### ✅ Step 8: Accuracy Testing — Open vs Restricted Mode

**What was done:**
- Tested two recognition styles:
  - **Open listening** — listens for anything, more mistakes
  - **Restricted grammar** — only listens for specific words, much more accurate

**Finding:**
Restricted grammar was significantly better on Raspberry Pi 3 hardware.

**Decision made:**
Keep restricted mode for all important system commands.

**Why this matters:**
Pi 3 has limited CPU. Restricted grammar reduces errors, especially for weather and date commands.

---

### ✅ Step 9: Improved Restricted Assistant (Stage 2)

**What was done:**
- Upgraded assistant with full restricted grammar
- Added more date options
- Added more cities for weather
- Improved timer handling

**File:** `assistant_stage2.py`

**All supported commands:**
```
what time is it
what is the date today
what was the date yesterday
what was the date two days ago
what is the date after seven days
weather in lahore
weather in karachi
weather in islamabad
weather in frankfurt
temperature in [city]
timer for one minute
timer for two minutes
timer for five minutes
exit
```

**Result:** Most accurate and stable assistant version so far. This is the current working base.

---

## 📅 Phase 4 — Architecture Planning

### ✅ Step 10: Hybrid Assistant Design Decision

**What was decided:**
Instead of using only one method for all queries, use a two-stage hybrid design:

```
Stage 1 → Restricted grammar for: time / date / weather / timer
Stage 2 → Local LLM fallback for: general knowledge questions
```

**Why this is the right choice:**
- Pi 3 is not powerful enough for a full LLM on every request
- Direct logic is instant and accurate for time/weather
- LLM only runs when really needed (general questions)

**Result:** Architecture decided. Implementation of LLM stage is next.

---

## 📅 Phase 5 — In Progress

### 🔄 Step 11: Local LLM Integration (llama.cpp)

**Goal:**
- Install and build llama.cpp on the Pi
- Download a small GGUF model (TinyLlama or similar)
- Connect it to the assistant as Stage 2 fallback

**Status:** In progress

---

## 📋 Planned Next Steps

### 📋 Step 12: Email Integration

- Connect to Gmail using Google API
- Check for new emails
- Read email summaries aloud or in text

### 📋 Step 13: Voice Output (Text-to-Speech)

- Install piper or espeak on Pi
- Convert assistant text replies to speech
- Output through MAX98357A amp or 3.5mm jack

### 📋 Step 14: Wake Word Detection

- Implement "hey assistant" or custom wake word
- Assistant only activates when wake word is heard
- Reduces false triggers

### 📋 Step 15: Polish and Improvements

- More timer formats
- More cities for weather
- Better conversation flow
- Reminder support

---

## 🗂️ Key Files Reference

| File | Location | Purpose |
|------|----------|---------|
| Main assistant | `~/stt/assistant_stage2.py` | Current working script |
| Virtual env | `~/stt/.venv/` | Python packages |
| Vosk model | `~/stt/vosk-model-small-en-us-0.15/` | Speech recognition model |

---

## 💡 Key Lessons Learned

- Restricted grammar is much better than open listening on Pi 3
- Always test mic wiring with a simple `arecord` before any software
- Keep virtual environment activated before running scripts
- wttr.in is a great free weather API — no key needed
- The hybrid design (commands + LLM) is the smartest approach for limited hardware

---

*Last updated: Phase 3 complete. Phase 4 in progress.*
