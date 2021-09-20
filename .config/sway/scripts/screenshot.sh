#!/bin/bash

entries="Active Screen Output OCR Area Window"

selected=$(printf '%s\n' $entries | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')

case $selected in
  active)
    /usr/share/sway/scripts/grimshot --notify save active;;
  screen)
    /usr/share/sway/scripts/grimshot --notify save screen;;
  output)
    /usr/share/sway/scripts/grimshot --notify save output;;
  ocr)
      TEXT_FILE="/tmp/ocr.txt"
      IMAGE_FILE="/tmp/ocr.png"
      /usr/share/sway/scripts/grimshot save area /tmp/ocr.png
      tesseract "$IMAGE_FILE" "${TEXT_FILE//\.txt/}" 2> /dev/null
      sed -i 's/\x0c//' "$TEXT_FILE"
      wl-copy < "$TEXT_FILE"
      notify-send "OCR:" "$(cat $TEXT_FILE)"
      rm "$IMAGE_FILE"
      rm "$TEXT_FILE"
      ;;
  area)
    /usr/share/sway/scripts/grimshot --notify save area;;
  window)
    /usr/share/sway/scripts/grimshot --notify save window;;
esac
