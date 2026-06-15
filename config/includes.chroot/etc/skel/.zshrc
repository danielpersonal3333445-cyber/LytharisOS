# LytharisOS shell config

# Plugins
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Modern replacements
alias cat='bat --style=plain'
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --git --group-directories-first'
alias grep='rg'
alias find='fd'
alias top='btop'
alias du='duf'
alias tree='eza --tree --icons'

# System
alias up='sudo lytharis-update'
alias install='sudo apt install -y'
alias remove='sudo apt remove --purge -y'
alias search='apt search'
alias clean='sudo apt autoremove -y && sudo apt autoclean'
alias ports='ss -tulanp'
alias psg='ps aux | rg'
alias mem='free -h'
alias disk='df -h'
alias boot='systemd-analyze blame | head -20'
alias services='systemctl list-units --type=service --state=running'
alias failed='systemctl --failed'
alias journal='journalctl -xe'

# Security shortcuts
alias msf='sudo msfconsole'
alias scan='sudo nmap -sV -sC -O'
alias sniff='sudo tshark -i any'
alias subdom='subfinder -d'
alias harvest='theHarvester -b all -d'
alias fuzz='ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u'
alias av='sudo av-toggle'
alias fwstatus='sudo ufw status verbose'
alias fwon='sudo ufw --force enable'
alias fwoff='sudo ufw disable'
alias scanfile='sudo aether-scan'
alias quarantine='ls -lah /var/quarantine/'
alias avlog='tail -50 /var/log/aetheros-av.log'
alias watchlog='tail -50 /var/log/aetheros-watch.log'
alias updatelog='tail -50 /var/log/lytharis-update.log'
alias linpeas='sudo /usr/local/bin/linpeas'
alias searchsploit='/usr/local/bin/searchsploit'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias dl='cd ~/Downloads'
alias docs='cd ~/Documents'
alias desk='cd ~/Desktop'

# Quick edit
alias zrc='nano ~/.zshrc && source ~/.zshrc'
alias src='source ~/.zshrc'

# Settings app
alias settings='aetheros-settings &'

# Git shortcuts
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --all'
alias gd='git diff'

# Docker shortcuts
alias dps='docker ps'
alias dpa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlog='docker logs'

# Functions
info() {
  echo "┌─ $(hostname) ──────────────────────"
  echo "│ os:   LytharisOS 1.0 (Spectre)"
  echo "│ kern: $(uname -r)"
  echo "│ cpu:  $(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs)"
  echo "│ mem:  $(free -h | awk '/Mem/{print $3"/"$2}')"
  echo "│ disk: $(df -h / | awk 'NR==2{print $3"/"$2" ("$5")"}')"
  echo "│ ip:   $(hostname -I | awk '{print $1}')"
  echo "│ up:   $(uptime -p | sed 's/up //')"
  echo "└────────────────────────────────────"
}

extract() {
  case $1 in
    *.tar.gz)  tar -xzf "$1" ;;
    *.tar.bz2) tar -xjf "$1" ;;
    *.tar.xz)  tar -xJf "$1" ;;
    *.zip)     unzip "$1" ;;
    *.7z)      7z x "$1" ;;
    *.rar)     unrar e "$1" ;;
    *.gz)      gunzip "$1" ;;
    *.bz2)     bunzip2 "$1" ;;
    *)         echo "unknown format: $1" ;;
  esac
}

serve() { python3 -m http.server ${1:-8000}; }
killport() { fuser -k ${1}/tcp; }
mkcd() { mkdir -p "$1" && cd "$1"; }

backup() {
  cp -r "$1" "$1.bak.$(date +%Y%m%d%H%M%S)"
  echo "Backed up to $1.bak.$(date +%Y%m%d%H%M%S)"
}

myip() {
  echo "Local:  $(hostname -I | awk '{print $1}')"
  echo "Public: $(curl -s ifconfig.me)"
}

ports_detail() {
  ss -tulanp | grep LISTEN
}

biggest() {
  du -ah ${1:-.} | sort -rh | head -20
}

genpass() {
  tr -dc 'A-Za-z0-9!@#$%^&*' < /dev/urandom | head -c ${1:-32}
  echo
}

whoisport() {
  grep -r ":${1}" /etc/services | head -5
}

# Show Lytharis banner on terminal open
fastfetch

# Starship prompt
eval "$(starship init zsh)"
