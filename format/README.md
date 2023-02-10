# format

Format takes an image and writes it to one or more other file descriptors.

## Dependencies:
* [bash](https://www.gnu.org/software/bash/)
	* Execution environment
* [sync](https://www.gnu.org/software/coreutils/)
	* Ensures filesystem integrity before disconnect
* [progress](https://github.com/Xfennec/progress)
	* Monitors write utility
* [cp](https://www.gnu.org/software/coreutils/) (Optional)
	* Writes data between files
	* Can be replaced with any command that takes bits from one file and writes to another (cat, dd, etc.)
		* Change "WRITE" value (line 3) and write command (line 27)

## Features:
* Prompts for confirmation
* Performs all writes at once
* Syncs all devices before completing
* Shows write progress
	* Does not display sync progress, just shows the write command hanging

## Uses:
* Plain old writing an image file to one or more devices
* Copying an image from one device to one or more devices/files

## Examples:
* Write ubuntu 22.04 image to two USB drives
	```bash
	format ubuntu-22.04-desktop-amd64.iso /dev/sda /dev/sdb
	```
* Write compressed ubuntu image to two USB drives
	```bash
	format <(xzcat ubuntu.img.xz) /dev/sda /dev/sdb
	```
* Backup disk to another drive and a compressed file
	```bash
	format /dev/sda /dev/sdb >(xz > important.img.xz)
	```
