# LytharisOS

LytharisOS is a custom Linux distribution built on **Debian Bookworm**, designed to deliver a **high-performance, visually refined, and security-focused desktop environment** with deep system control and a unified user experience.

It combines the stability of Debian with a modern KDE Plasma desktop, a performance-tuned kernel stack, and a fully integrated system control center that merges graphical management with terminal-level power.

---

## 🌐 Philosophy

LytharisOS is built around a simple idea:

> A Linux system should not force you to choose between simplicity and power.

Most distributions separate the experience into fragments:
- GUI tools for basic tasks
- terminal tools for advanced control
- inconsistent system configuration layers

LytharisOS merges these into a single cohesive environment where:

- Everything important is visible
- Everything powerful is accessible
- Nothing is hidden behind unnecessary abstraction

It is designed to feel:
- fast
- intentional
- visually consistent
- fully controllable

---

## ⚙ System Base

- **Base:** Debian Bookworm (stable)
- **Desktop Environment:** KDE Plasma (Wayland-first)
- **Init System:** systemd
- **Build System:** live-build ISO generation
- **Graphics Stack:** Wayland + XWayland fallback
- **Package Model:** curated minimal core + extended tool layers

---

## 🚀 Performance Stack

LytharisOS is tuned for responsiveness and smooth system behavior under load.

### Core components:

- :contentReference[oaicite:0]{index=0}  
  Provides reduced latency, improved responsiveness, and optimized scheduling for desktop workloads.

- zram (LZ4 compression)  
  Improves memory efficiency and reduces system slowdowns under pressure.

- preload daemon  
  Speeds up application launch times via predictive caching.

- reduced background services  
  Minimizes idle CPU usage and background overhead.

- sysctl-level tuning  
  Kernel parameters adjusted for responsiveness and stability under load.

---

## 🎨 Desktop Experience

LytharisOS is built to feel visually cohesive and modern out of the box.

### KDE Plasma customization:

- Kvantum theme engine (full Qt visual control)
- Papirus icon theme
- JetBrains Mono + Fira Code fonts
- Centered panel / dock-style layout
- Blur, transparency, and shadow consistency tuning
- Unified dark-first design language

### Design principles:

- minimal but not empty
- modern but not flashy
- consistent across all applications
- focused on readability and workflow clarity

---

## 🧰 System Tooling

LytharisOS ships with curated tools across system administration, development, and diagnostics.

### 🖥 System utilities
- KDE System Monitor
- Filelight (disk usage visualization)
- KInfoCenter (hardware information)
- Dolphin file manager (terminal-integrated)
- Partition Manager (GUI disk management)

### 💻 Developer tools
- zsh shell with Starship prompt
- bat, eza, ripgrep, fd, fzf
- tmux session manager
- gcc, clang, cmake, make toolchain
- Python, Node.js, Go environments

### 🔐 Security toolkit
LytharisOS includes a structured security and auditing environment:

- Network analysis: nmap, wireshark, tcpdump
- Web enumeration: gobuster, ffuf, nikto
- Password auditing: hydra, john, hashcat
- Wireless tools: aircrack-ng suite
- Red team utilities: metasploit-framework, bettercap, responder
- OSINT tools: amass, theHarvester, recon-ng

These tools are intended strictly for **authorized security research, auditing, and lab environments**.

---

## 🔐 Security Architecture

Security is implemented in layered form rather than relying on a single mechanism.

### System protection layers:

- AppArmor mandatory access control
- UFW firewall enabled by default
- fail2ban intrusion prevention
- PAM password policy enforcement
- fingerprint authentication support (fprintd)

### Malware & integrity protection:

- ClamAV antivirus (system-controlled toggle)
- rkhunter + chkrootkit rootkit detection tools
- auditd system logging and audit tracing

### Antivirus control model:

Antivirus services are protected using immutable filesystem flags and can only be controlled via root-level command interface:

```bash
av-toggle on
av-toggle off
av-toggle status
