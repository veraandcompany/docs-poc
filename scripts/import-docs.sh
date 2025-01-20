#!/bin/bash

# Configuración
REPO="veraandcompany/project-docs-poc" # Solo el nombre del repositorio (sin "git@github.com")
BRANCH="main"
FOLDER="docs"
TARGET="imported-docs/tms-docs"

# Verificar si GH_TOKEN está disponible
if [ -z "$GH_TOKEN" ]; then
  echo "Error: GH_TOKEN no está configurado. Asegúrate de pasarlo al script."
  exit 1
fi

# Crear carpeta temporal
TMP_DIR=$(mktemp -d)

# Clonar el repositorio usando HTTPS y el GH_TOKEN
echo "Cloning repository..."
git clone --depth 1 --branch "$BRANCH" "https://x-access-token:${GH_TOKEN}@github.com/${REPO}.git" "$TMP_DIR"
if [ $? -ne 0 ]; then
  echo "Error: No se pudo clonar el repositorio. Verifica el token y los permisos."
  exit 1
fi

# Mover la carpeta específica a su destino final
echo "Moving $FOLDER to $TARGET..."
mkdir -p "$(dirname "$TARGET")"
rm -rf "$TARGET"
mv "$TMP_DIR/$FOLDER" "$TARGET"

# Limpiar
rm -rf "$TMP_DIR"

echo "Done! Files downloaded to $TARGET"
