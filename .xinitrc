xbacklight -set 100
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# disable touchpad if mouse is detected
if lsusb --verbose 2>&1 | grep --quiet "Mouse"; then
        synclient TouchPadOff="1"
fi

exec dwm
