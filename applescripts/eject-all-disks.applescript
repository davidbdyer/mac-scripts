-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Tells the Finder to eject all ejectable disks.

tell application "Finder" to eject (every disk whose ejectable is true and local volume is true and free space is not equal to 0)