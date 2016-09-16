#Raspbian Clone and Restore

##Cloning or backupping the Raspian SC Card
Insert SD Card in slot

In terminal type the following to find the disk device

`diskutil list`

This usually is something like `/dev/disk2` , but note the disk size, so make sure you have the right one!

Then clone the SD Card to a disk image, note we type `rdisk` instead of `disk` because of speed issues.

`sudo dd if=/dev/rdisk2 of=~/Desktop/raspberrypi-bkup.dmg bs=5m`

It will ask for your password.

Cloning takes quite some time, be patient. Type `Ctrl-T` to see progress.

##Copying a backup to a SD Card

This is the reverse process from above.

`sudo dd if=~/Desktop/raspberrypi.dmg of=/dev/rdisk2 bs=5m`
