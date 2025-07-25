#!/bin/bash

echo "⚙️ Instalando ZSH e plugins..."
pamac install zsh git curl wget nano zsh-autosuggestions zsh-syntax-highlighting --no-confirm
chsh -s /bin/zsh

cat <<EOF >> ~/.zshrc
export LANG=pt_BR.UTF-8
export LC_ALL=pt_BR.UTF-8
EOF

cat <<EOF >> ~/.zshrc
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF

echo "📦 Instalando Atuin..."
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
echo 'eval "$(atuin init zsh)"' >> ~/.zshrc

echo "📦 Instalando Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

mkdir -p ~/.config
starship preset tokyo-night -o ~/.config/starship.toml

echo "✅ Instalação concluída."
