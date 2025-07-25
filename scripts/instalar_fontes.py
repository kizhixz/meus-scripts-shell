import os
import shutil
import zipfile
import urllib.request
from pathlib import Path
import subprocess

# Caminhos
FONTS_DIR = Path.home() / ".fonts"
EXTRACAO_TEMP = Path.cwd() / "temp_fontes"
ZIP_JETBRAINS = Path.cwd() / "JetBrainsMono.zip"

URL_JETBRAINS = "https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip"

def fonte_instalada(nome_parcial: str) -> bool:
    try:
        saida = subprocess.check_output(["fc-list"], universal_newlines=True)
        return nome_parcial.lower() in saida.lower()
    except Exception:
        return False

print("📦 Verificando presença da fonte JetBrains Mono...")

if fonte_instalada("JetBrains Mono"):
    print("✅ Fonte JetBrains Mono já instalada no sistema.")
    exit(0)

print("❌ Fonte não encontrada. Baixando do site oficial...")

# Faz download do .zip se ainda não existir
if not ZIP_JETBRAINS.exists():
    print("⬇️ Baixando JetBrainsMono.zip...")
    urllib.request.urlretrieve(URL_JETBRAINS, ZIP_JETBRAINS)
else:
    print("📁 Arquivo zip já presente, usando cache local.")

# Cria pasta temporária
EXTRACAO_TEMP.mkdir(parents=True, exist_ok=True)

# Extrai
print("📂 Extraindo fontes...")
with zipfile.ZipFile(ZIP_JETBRAINS, 'r') as zip_ref:
    zip_ref.extractall(EXTRACAO_TEMP)

# Move os .ttf para ~/.fonts
print("📁 Copiando arquivos .ttf para ~/.fonts...")
FONTS_DIR.mkdir(parents=True, exist_ok=True)

for ttf in EXTRACAO_TEMP.rglob("*.ttf"):
    shutil.copy2(ttf, FONTS_DIR / ttf.name)
    print(f"✅ Fonte instalada: {ttf.name}")

# Limpa temporários
shutil.rmtree(EXTRACAO_TEMP, ignore_errors=True)

# Atualiza cache
print("🔄 Atualizando cache de fontes...")
os.system("fc-cache -fv")

print("🎉 JetBrains Mono instalada com sucesso!")
