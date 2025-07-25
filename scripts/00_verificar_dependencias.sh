#!/bin/bash

comandos=(git curl wget pamac python3)

function log_info() {
  echo "[INFO] $1"
}

function log_error() {
  echo "[ERRO] $1"
}

function log_success() {
  echo "[SUCESSO] $1"
}

log_info "🔍 Verificando dependências..."
for cmd in "${comandos[@]}"; do
  log_info "Verificando $cmd..."
  if ! command -v "$cmd" &> /dev/null; then
    if [ "$cmd" = "python3" ]; then
      log_error "Dependência faltando: python3"
      echo "   Para instalar no Manjaro, rode: sudo pacman -S python"
    else
      log_error "Dependência faltando: $cmd"
    fi
    exit 1
  fi
  log_success "$cmd encontrado"
done

log_success "📦 Todas as dependências estão presentes."
