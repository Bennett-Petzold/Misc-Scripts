#!/usr/bin/env bash

# Filter for files starting with shebang but not env
find -type f -exec \
	gawk -v ORS='\0' '/^#!/ && !/^#!\/usr\/bin\/env/ { print FILENAME }
		FNR == 1 { nextfile }' {} \+ |
	# Add env, including -S when there are multiple arguments
	xargs -0r gawk -i inplace '
		FNR == 1 {
			if($0 ~ /^.+([[:space:]].+)+$/) replace = "#!/usr/bin/env -S ";
				else replace = "#!/usr/bin/env ";
			gsub(/^#!\/((bin)|(usr\/bin))\//, replace);
		}
		{print $0}'
