<h1 align="center">LytharisOS</h1>
<p align="center">A fast, beautiful, security-focused Linux OS built on Debian Bookworm + KDE Plasma</p>

---

## What is LytharisOS?

LytharisOS is a custom Debian-based operating system built for people who want a premium desktop experience with serious security tools built in. It looks incredible, runs fast, and gives you full power through both a polished GUI and a capable terminal.

## Features

- Liquorix kernel — faster, more responsive than stock Debian
- KDE Plasma 6 on Wayland — beautiful, modern, fully customizable
- Lytharis Control Center — native settings app covering security, system, network, and tools
- Triple-layer AV — ClamAV + Maldet + YARA running simultaneously with real-time file watching
- Dual-scan engine — every new file scanned by two independent engines, quarantined if either flags it
- Auto-updating — all tools, signatures, and packages update automatically every night
- Security toolkit — Metasploit, Wireshark, nmap, sqlmap, hydra, aircrack-ng, nuclei, subfinder, and 50+ more tools preinstalled
- Auto driver detection — detects your GPU, WiFi, and audio hardware on first boot and installs the right drivers
- Beautiful wallpaper collection — 4K wallpapers built in plus the full KDE wallpaper library
- Custom terminal — zsh + Starship + eza + bat + fzf + btop out of the box

## Built-in tools

| Category | Tools |
|---|---|
| Exploitation | Metasploit, searchsploit, BeEF |
| Web | sqlmap, nikto, gobuster, ffuf, nuclei, wafw00f |
| Network | nmap, wireshark, bettercap, responder, netdiscover |
| Passwords | hashcat, john, hydra, medusa |
| OSINT | theHarvester, subfinder, amass, shodan, spiderfoot |
| Forensics | binwalk, foremost, testdisk, exiftool, steghide |
| Wireless | aircrack-ng, wavemon |
| Antivirus | ClamAV, Maldet, YARA, rkhunter, chkrootkit |

## Build it yourself

Requirements: Debian or Ubuntu machine, 20GB free space, internet connection.

```bash
sudo apt install -y live-build git
git clone https://github.com/danielpersonal3333445-cyber/LytharisOS
cd LytharisOS
lb config \
  --distribution bookworm \
  --archive-areas "main contrib non-free non-free-firmware" \
  --debian-installer live \
  --bootloaders grub-efi \
  --binary-images iso-hybrid \
  --memtest none \
  --apt-recommends false \
  --cache-packages true
sudo lb build
```

Flash the resulting ISO to USB with:

```bash
sudo dd if=live-image-amd64.hybrid.iso of=/dev/sdX bs=4M status=progress && sync
```

## Status

Version 1.0 (Spectre) — active development


