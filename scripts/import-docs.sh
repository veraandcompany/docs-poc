#!/bin/bash

# Configuración
REPO="veraandcompany/project-docs-poc" # Cambia al nombre del repo que quieres clonar
FOLDER="docs"
TARGET="imported-docs/tms-docs"

# Crear carpeta temporal
TMP_DIR=$(mktemp -d)

# Clonar el repositorio utilizando HTTPS y GITHUB_TOKEN
echo "Cloning repository..."
git clone --depth 1 --branch main https://x-access-token:${GITHUB_TOKEN}@github.com/${REPO}.git "$TMP_DIR"

# Mover la carpeta específica a su destino final
echo "Moving $FOLDER to $TARGET..."
rm -rf "$TARGET"
mv "$TMP_DIR/$FOLDER" "$TARGET"

# Limpiar
rm -rf "$TMP_DIR"

echo "Done! Files downloaded to $TARGET"
