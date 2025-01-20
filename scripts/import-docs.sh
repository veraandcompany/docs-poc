#!/bin/bash

# Configuración
REPO="git@github.com:veraandcompany/project-docs-poc.git"
BRANCH="main"
FOLDER="docs"
TARGET="imported-docs/tms-docs"

# Crear carpeta temporal
TMP_DIR=$(mktemp -d)

# Clonar el repositorio
echo "Cloning repository..."
git clone --depth 1 --branch "$BRANCH" "$REPO" "$TMP_DIR"

# Mover la carpeta específica a su destino final
echo "Moving $FOLDER to $TARGET..."
mkdir -p "$(dirname "$TARGET")"
rm -rf "$TARGET"
mv "$TMP_DIR/$FOLDER" "$TARGET"

# Limpiar
rm -rf "$TMP_DIR"

echo "Done! Files downloaded to $TARGET"
