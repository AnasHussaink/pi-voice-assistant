# 💻 Software Setup Guide

Complete software installation and configuration guide for the Raspberry Pi Voice Assistant.

---

## Requirements

- Raspberry Pi 3 with Raspberry Pi OS installed
- Internet connection on first setup
- SSH access from laptop (recommended)

---

## Step 1 — Enable SSH

On the Pi, run:

```bash
sudo raspi-config
```

Go to: **Interface Options → SSH → Enable**

Then reboot:

```bash
sudo reboot
```

Now connect from laptop:

```bash
ssh pi@<your-pi-ip-address>
```

---

## Step 2 — Update the Pi

```bash
sudo apt update && sudo apt upgrade -y
```

---

## Step 3 — Install System Dependencies

```bash
sudo apt install -y python3-pip python3-venv portaudio19-dev
```

---

## Step 4 — Create Project Folder and Virtual Environment

```bash
mkdir -p ~/stt
cd ~/stt
python3 -m venv .venv
source .venv/bin/activate
```

> Always activate the virtual environment before running the assistant.

---

## Step 5 — Install Python Packages

```bash
pip install vosk sounddevice requests
```

---

## Step 6 — Download Vosk Speech Model

```bash
cd ~/stt
wget https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip
unzip vosk-model-small-en-us-0.15.zip
```

---

## Step 7 — Run the Assistant

```bash
cd ~/stt
source .venv/bin/activate
python assistant_stage2.py
```

---

## Environment Reference

| Item | Path |
|------|------|
| Project folder | `~/stt/` |
| Virtual environment | `~/stt/.venv/` |
| Main script | `~/stt/assistant_stage2.py` |
| Vosk model | `~/stt/vosk-model-small-en-us-0.15/` |

---

## Activate Virtual Environment (Every Session)

```bash
source ~/.stt/.venv/bin/activate
```

Or if you are already in `~/stt`:

```bash
source .venv/bin/activate
```
