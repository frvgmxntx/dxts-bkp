#!/usr/bin/env bash

source ./color.sh

if [ -z "$COLOR" ]; then
  echo "Error: COLOR variable not found in color.sh"
  exit 1
fi

./change_color.sh -o archdroid -c "$COLOR"
