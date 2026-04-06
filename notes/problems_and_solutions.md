# 🐛 Problems & Solutions

This file documents every problem encountered and how it was fixed.
A useful reference when something breaks again.

---

## Problem 1 — Microphone Not Detected After Wiring

**Symptom:**
`arecord -l` shows no capture devices.

**Cause:**
I2S overlay not added to `/boot/config.txt`.

**Fix:**
Add these lines to `/boot/config.txt`:
```
dtparam=i2s=on
dtoverlay=googlevoicehat-soundcard
```
Then reboot:
```bash
sudo reboot
```

---

## Problem 2 — Open Speech Recognition Too Inaccurate

**Symptom:**
Vosk kept misrecognizing commands. "weather in lahore" became random wrong words.

**Cause:**
Open listening mode tries to match any word in the English language. On Pi 3 with limited CPU, this causes many errors.

**Fix:**
Switch to restricted grammar mode. Only allowed words are in a defined list. Accuracy improved significantly.

---

## Problem 3 — [unk] Appearing in Recognized Text

**Symptom:**
Vosk output contained `[unk]` tokens mixed in with real words.

**Cause:**
Words being spoken that were not in the Vosk small model vocabulary.

**Fix:**
Use restricted grammar so only specific known words are listened for. `[unk]` tokens no longer appear for command phrases.

---

## Problem 4 — Virtual Environment Not Active

**Symptom:**
`python assistant_stage2.py` fails with `ModuleNotFoundError: No module named 'vosk'`

**Cause:**
Virtual environment was not activated before running the script.

**Fix:**
Always run first:
```bash
source ~/stt/.venv/bin/activate
```

---

*More problems and solutions will be added as the project continues.*
