scrot -d 1 /tmp/locking_screen.png
convert  -blur 4x3 /tmp/locking_screen.png /tmp/screen_blur.png
i3lock -i /tmp/screen_blur.png
sleep 60; pgrep i3lock && xset dpms force off
