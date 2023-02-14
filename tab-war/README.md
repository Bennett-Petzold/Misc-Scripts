# indent_filter

indent_filter allows you to keep opposite tab/space convention of your collaborators.

## Dependencies:
* [bash](https://www.gnu.org/software/bash/)
	* Execution environment
* [git](https://git-scm.com/)
	* Version control tool
* [expand](https://www.gnu.org/software/coreutils/)
	* Replaces tabs with spaces
* [unexpand](https://www.gnu.org/software/coreutils/)
	* Replaces spaces with tabs
* [find](https://www.gnu.org/software/find/)
	* Checks for the .git folder

## Usage:
* Run in git root directory: indent_filter [choice]
	* indent_filter tabs
		* Use leading tabs locally, save as spaces
	* indent_filter spaces
		* Use leading spaces locally, save as tabs

## Warnings:
* Takes some time for changes with *many* files
	* expand and unexpand are run on every file to/from working tree
* Is not silent on projects with mixed tabs/spaces
	* Clean filter will modify noncompliant files when updated
* Defaults to 4 space tabs.
	* Controlled by TAB_WIDTH (line 3)

## Notes:
* Can be extended to apply globally (do not recommend)
* See https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes
	* Explains smudge and clean
* Smudging changes from staging to working
![Smudging changes from staging to working](https://git-scm.com/book/en/v2/images/smudge.png "Smudging")
* Cleaning changes from working to staging
![Cleaning changes from working to staging](https://git-scm.com/book/en/v2/images/clean.png "Cleaning")
