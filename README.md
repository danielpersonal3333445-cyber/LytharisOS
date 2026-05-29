# LytharisOS

**LytharisOS** is a custom Linux distribution built on Debian Bookworm, designed to deliver a **high-performance, visually refined, and security-oriented desktop experience** without sacrificing system control or transparency.

It combines the stability of Debian with a modern, responsive desktop stack powered by KDE Plasma and the Liquorix kernel, alongside a curated set of tools for development, system administration, and security research.

---

## 🌐 Vision

Most Linux distributions fall into one of three categories:

- Too minimal, requiring extensive manual setup
- Too heavy, filled with unnecessary background services
- Too opinionated, limiting user control over the system

LytharisOS is built to sit in the middle:

> A system that feels instantly usable, visually refined, and performance-tuned — while still remaining completely transparent, modular, and user-controlled underneath.

The goal is not to reinvent Linux, but to refine it into a cohesive desktop experience where every layer is intentional.

---

## ⚙ Base System Architecture

LytharisOS is constructed from the ground up using Debian’s live-build system.

- **Base:** Debian Bookworm (stable)
- **Desktop Environment:** KDE Plasma (Wayland-first)
- **Init System:** systemd
- **Build System:** live-build (custom ISO generation)
- **Package Model:** curated minimal-core + extended toolsets

This approach ensures reproducibility, auditability, and full customization at build time.

---

## 🚀 Performance Philosophy

Performance in LytharisOS is not about stripping the system down to nothing — it is about eliminating inefficiency while preserving functionality.

### Core performance technologies:

- :contentReference[oaicite:0]{index=0}  
  A low-latency kernel tuned for desktop workloads, improving UI responsiveness, scheduling behavior, and input latency under load.

- **zram (LZ4 compressed RAM swap)**  
  Reduces memory pressure and improves multitasking smoothness on limited or high-load systems.

- **preload daemon**  
  Predictively caches frequently used applications for faster launch times.

- **service minimization**  
  Non-essential background services are disabled or removed to reduce idle CPU usage.

- **sysctl-level tuning**  
  Kernel parameters adjusted for responsiveness, reduced lag spikes, and improved scheduling fairness.

The result is a system that feels consistently “instant,” even under heavy multitasking.

---

## 🎨 Desktop Experience

LytharisOS prioritizes a **premium visual and interaction design language**.

### KDE Plasma customization layer:

- Kvantum theme engine (advanced Qt theming control)
- Consistent dark-first visual identity
- Centered panel / dock-style layout
- Smooth blur, transparency, and shadow system
- Papirus icon theme
- JetBrains Mono + Fira Code typography stack

### Design philosophy:

The interface is designed to feel:

- minimal, but not empty  
- modern, but not flashy  
- responsive, but not distracting  

Every visual element is tuned to reduce cognitive load while maintaining a high-end aesthetic.

---

## 🧰 System Tooling

LytharisOS includes a curated selection of tools across system management, development, and diagnostics.

### 🖥 System Utilities

- KDE System Monitor (process + resource tracking)
- Filelight (graphical disk usage visualization)
- KInfoCenter (hardware inspection)
- Dolphin file manager (with terminal integration)
- Partition Manager (GUI disk management)

### 💻 Developer Toolchain

- zsh shell with Starship prompt
- bat, eza, ripgrep, fd, fzf
- tmux for session persistence
- gcc, clang, make, cmake toolchain
- Python, Node.js, Go environments

### 🔐 Security Toolkit

LytharisOS integrates a security research and auditing environment:

- Network analysis: nmap, wireshark, tcpdump
- Web & service enumeration: gobuster, ffuf, nikto
- Password & hash analysis: john, hashcat, hydra
- Wireless tooling: aircrack-ng suite
- Red team utilities: metasploit-framework, bettercap, responder
- OSINT tools: theHarvester, amass, recon-ng

These tools are intended for **authorized testing, auditing, and lab environments only**.

---

## 🔐 Security Architecture

Security in LytharisOS is layered and enforced at multiple levels:

### System hardening:

- AppArmor mandatory access control profiles
- UFW firewall enabled by default
- fail2ban intrusion prevention system
- PAM-based password policy enforcement
- fingerprint authentication support (fprintd)

### Malware and integrity protection:

- ClamAV antivirus (system-controlled toggle)
- rkhunter + chkrootkit rootkit detection
- auditd kernel-level event logging

### Antivirus control model:

Antivirus services are protected using immutable filesystem flags, preventing unauthorized modification.

Control is restricted to root via:

```bash id="avctl"
av-toggle on
av-toggle off
av-toggle status
