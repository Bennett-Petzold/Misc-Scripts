# Misc-Scripts
Miscellaneous scripts and tools I use on my system (usually living in ~/bin).

Each script is provided in its own file with a README for usage and dependencies.
All scripts are provided without any guarantee of functionality or safety -- read them before using, and run them on your system at your own risk.
They are only built to run on UNIX environments.

Some scripts require the "-S" extension provided on FreeBSD since 6.0 and on coreutils since 8.30.
To find all files relying on this extension, [find][find] and [gawk][gawk].
```bash
find -type f -exec \
	gawk '/^#!\/usr\/bin\/env -S/ { print FILENAME }
		FNR == 1 { nextfile }' {} \+
```
To replace "/usr/bin/env" use [find][find], [gawk][gawk], [xargs][find], and [sed][sed].
```bash
find -type f -exec \
	gawk -v ORS='\0' '/^#!\/usr\/bin\/env -S/ { print FILENAME }
		FNR == 1 { nextfile }' {} \+ | \
	xargs -0L 1 sed -i '1s:^#!/usr/bin/env:#!REPLACEMENT:'
```

The top-level "convert.bash" converts my system shebang to a more general "/usr/bin/env" launch.
It requires [find][find], [gawk][gawk], and [GNU xargs][find].

[find]: https://www.gnu.org/software/findutils/
[gawk]: https://www.gnu.org/software/gawk/
[sed]: https://www.gnu.org/software/sed/
