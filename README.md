## oneplus-postmarket-lcdstats

If you are using your oneplus6 with postmarketOS as a server, you might want to see some status but without running a more complex UI than just a framebuffer console

This repository does this by grabbing some statistics and pushing them to /dev/tty1

Will very likely not work on anythinbg but a oneplus6 running postmarketos, no attempt is made to be portable

### Using
To use, stick anywhere on the phone and run install.sh

Then enable the service with `sudo rc-service lcd-show-stats status`

Note that the LCD will blank itself after a few minutes, pressing the power button turns it back on
See https://superuser.com/questions/152347/change-linux-console-screen-blanking-behavior 

### Increasing font size
See Alpine wiki: https://wiki.alpinelinux.org/wiki/Fonts#Changing_the_console_font

I used `ter-132n.psf.gz` which is more readable while not requiring word wrapping

### TODO
-[] Create a proper APKBUILD package
-[] Show RAM usage as well by parsing `free`
-[] Shut down when battery level is too low
-[X] Turn down LCD brightness