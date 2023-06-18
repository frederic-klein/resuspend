# resuspend
send linux (ubuntu 22.04) back to sleep

## Why?

* my notebook wakes up from suspend, causing it to drain its battery while trying to cool down in the notebook sleeve
* my system doesn't always suspend/resume cleanly when using the UI command and get's stuck running with blank screen

## How?

* using `echo mem > /sys/power/state` we can send the system into suspend mode, compare included `suspend.sh` file
  * this doesn't lock the system though
  * writing to `/sys/power/state` requires sudo
* to lock the system before suspending we use [i3lock](https://github.com/i3/i3lock): `sudo apt install i3lock`
  * why not use `gnome-screensaver-command --lock`?
    * can't run commands while locked
  * if it takes long to verify password: might be waiting for fingerprint, if configured; type your password and swipe your finger afterwards
* to handle unwanted resumes, we send the system back into suspend in a loop, until we break the loop by typing `y`, compare resuspender.sh
* optional: allow `suspend.sh` to be called without sudo password by protecting the file and allow it in sudoers
* optional: add an alias or function to call, e.g. `alias godown="bash /path/to/your/repos/resuspend/resuspender.sh"`
