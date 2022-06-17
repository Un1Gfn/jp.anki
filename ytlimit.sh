#!/bin/bash

{

  C=/etc/chromium/policies/managed/conf.json
  B='"youtube.com",'
  E='"youtube-allowed-by-home-darren-jp-anki-ytlimit-sh.com",'

  if false; then
    :
  elif grep -Fe "$E" "$C" >/dev/null; then
    read -rp "limit? "
    sudo sed -i "s/$E/$B/g" "$C"
  elif grep -Fe "$B" "$C" >/dev/null; then
    read -rp "lift? "
    sudo sed -i "s/$B/$E/g" "$C"
  else
    echo "err"
    exit 1
  fi

  echo "reload policy in chrome://policy or restart chromium"

}; exit
