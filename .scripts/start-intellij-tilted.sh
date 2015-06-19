#!/bin/sh
sed -i 's/.*Xft.rgba:\s*rgb.*/Xft.rgba: vrgb/' /home/babken/.Xresources
xrdb /home/babken/.Xresources
intellij-idea-ultimate-edition &
sed -i 's/.*Xft.rgba:\s*vrgb.*/Xft.rgba: rgb/' /home/babken/.Xresources
xrdb /home/babken/.Xresources
