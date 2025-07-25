#!/bin/bash

chmod +x scripts/*.sh

echo "🚀 Iniciando setup automático do terminal com ZSH no Manjaro..."

bash scripts/00_verificar_dependencias.sh || { echo "❌ Erro: dependências não satisfeitas. Abortando."; exit 1; }
bash scripts/01_limpeza.sh || { echo "❌ Erro na limpeza. Abortando."; exit 1; }
bash scripts/02_instalacao.sh || { echo "❌ Erro na instalação. Abortando."; exit 1; }
bash scripts/03_personalizacao.sh || { echo "❌ Erro na personalização. Abortando."; exit 1; }

echo "📁 Instalando fontes com Python..."
python3 scripts/instalar_fontes.py || echo "⚠️  Instale Python 3 para suporte automático de fontes."

echo "✅ Terminal pronto! Reinicie ou digite: exec zsh"
echo "📌 Veja fontes_instrucao.md para detalhes manuais sobre fontes, se necessário."
