# 🔌 Hardware Setup Guide

Complete wiring and hardware configuration for the Raspberry Pi Voice Assistant.

---

## Components List

| Component | Model | Purpose |
|-----------|-------|---------|
| Single-board computer | Raspberry Pi 3 | Main processing unit |
| Microphone | INMP441 | I2S digital audio input |
| Speaker amplifier | MAX98357A | I2S audio output amplifier |
| Audio output | 3.5mm jack | Headphone / speaker output for testing |

---

## INMP441 Microphone Wiring

The INMP441 uses the I2S protocol to send digital audio to the Pi.

### Pin Connection Table

| INMP441 Pin | Function | Raspberry Pi 3 Pin | GPIO |
|-------------|----------|--------------------|------|
| VDD | Power (3.3V) | Pin 1 | — |
| GND | Ground | Pin 6 | — |
| SCK / BCLK | Bit Clock | Pin 12 | GPIO18 |
| WS / LRCLK | Word Select | Pin 35 | GPIO19 |
| SD / DOUT | Data Out | Pin 38 | GPIO20 |
| L/R | Channel Select | Pin 6 (GND) | — |

> **Note:** L/R pin connected to GND = microphone outputs on left channel only. This is correct for mono recording.

---

## I2S Software Configuration

Add the following lines to `/boot/config.txt`:

```
dtparam=i2s=on
dtoverlay=googlevoicehat-soundcard
```

Then reboot the Pi:

```bash
sudo reboot
```

After reboot, verify the mic is recognized:

```bash
arecord -l
```

You should see a capture device in the list.

---

## Testing the Microphone

```bash
# Record 5 seconds
arecord -D plughw:1 -c1 -r 48000 -f S32_LE -t wav -V mono -v test.wav

# Play back the recording
aplay test.wav
```

If you hear your voice — mic and playback are working correctly.

---

## MAX98357A Speaker Amplifier (Future)

The MAX98357A will connect using I2S pins for audio output.
Setup documentation will be added when voice output is implemented.
