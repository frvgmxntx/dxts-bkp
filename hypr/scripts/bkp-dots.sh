#!/bin/bash

rm -rf ~/Projects/Git/dxts/fish
rm -rf ~/Projects/Git/dxts/hypr
rm -rf ~/Projects/Git/dxts/ignis
rm -rf ~/Projects/Git/dxts/matugen
rm -rf ~/Projects/Git/dxts/waybar

cp -r ~/.config/fish ~/Projects/Git/dxts/
cp -r ~/.config/hypr ~/Projects/Git/dxts/
cp -r ~/.config/ignis ~/Projects/Git/dxts/
cp -r ~/.config/matugen ~/Projects/Git/dxts/
cp -r ~/.config/waybar ~/Projects/Git/dxts/

cd ~/Projects/Git/dxts/
git add ./*
git commit -m "bang bang snapshoted!"
git push
