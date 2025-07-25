#!/bin/bash

echo "🎨 Aplicando personalizações finais..."

cat <<EOF >> ~/.zshrc
alias cls='clear'
alias update='pamac update --no-confirm'
alias buscar='pamac search'
alias limpar='pamac clean --no-confirm'
EOF

cat <<'EOF' >> ~/.zshrc
extrair() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1" ;;
      *.tar.gz)    tar xzf "$1" ;;
      *.bz2)       bunzip2 "$1" ;;
      *.rar)       unrar x "$1" ;;
      *.gz)        gunzip "$1" ;;
      *.tar)       tar xf "$1" ;;
      *.tbz2)      tar xjf "$1" ;;
      *.tgz)       tar xzf "$1" ;;
      *.zip)       unzip "$1" ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1" ;;
      *)           echo "Arquivo não suportado." ;;
    esac
  else
    echo "Arquivo não encontrado: $1"
  fi
}
EOF

exec zsh
