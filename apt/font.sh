#! /bin/bash -ex

TMP_FILE='/tmp/JetBrainsMono.zip'
TMP_DIR='/tmp/JetBrainsMono'

wget 'https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip' -O "$TMP_FILE"

mkdir -p "$TMP_DIR"
cd "$TMP_DIR"
unzip -j "$TMP_FILE" -d "$TMP_DIR"
cp JetBrainsMono*.ttf ~/.fonts
