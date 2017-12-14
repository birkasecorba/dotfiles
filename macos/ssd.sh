###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

# Info about hibernatemode: (https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/pmset.1.html)
# We do not recommend modifying hibernation settings. Any changes you make are not supported. If you
# choose to do so anyway, we recommend using one of these three settings. For your sake and mine, please
# don't use anything other 0, 3, or 25.
#
# hibernatemode = 0 (binary 0000) by default on supported desktops. The system will not back memory up to
# persistent storage. The system must wake from the contents of memory; the system will lose context on
# power loss. This is, historically, plain old sleep.
#
# hibernatemode = 3 (binary 0011) by default on supported portables. The system will store a copy of memory
# to persistent storage (the disk), and will power memory during sleep. The system will wake from
# memory, unless a power loss forces it to restore from disk image.
#
# hibernatemode = 25 (binary 0001 1001) is only settable via pmset. The system will store a copy of memory
# to persistent storage (the disk), and will remove power to memory. The system will restore from
# disk image. If you want "hibernation" - slower sleeps, slower wakes, and better battery life, you
# should use this setting.

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Remove the sleep image file to save disk space
sudo rm /private/var/vm/sleepimage
# Create a zero-byte file instead…
sudo touch /private/var/vm/sleepimage
# …and make sure it can’t be rewritten
sudo chflags uchg /private/var/vm/sleepimage

# To revert the changes
# sudo pmset -a hibernatemode 3
# sudo chflags nouchg /private/var/vm/sleepimage
