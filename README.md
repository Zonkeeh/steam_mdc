# Steam MDC
Convert **Markdown** code/text into [Steam's custom markup language](https://steamcommunity.com/comment/Recommendation/formattinghelp)  via *regular expressions*.
![steam_mdc](https://i.imgur.com/LbKgBiJ.gif)

## Description
`Steam MDC` is a bash command line utility to convert conventional markdown text/code into *Steam's markup language* - used in the Steam workshop. It accomplishes this task by leveraging various *regular expressions* to match, capture and replace the markdown elements into their respective counterparts. Not all elements can be transferred across to Steam's markup, however, a best effort has been made to ensure compatible markdown syntax can be converted. If, however, the default regular expressions do not convert a piece of markdown - feel free to use your own regex, submit an issue request, or contribute to this repository to fix the required section/s.

*Pre-requisites: `perl` `bash` `sed` `grep` `awk`*


## Usage
### Quick Start
Running `steam_mdc` is as simple as calling the command with a input markdown file:
```sh
steam_mdc -i markdown.md
```
This will generate an output file at `markdown.md.out` and will use the default regex and argument parameters.

### Arguments
For those wishing to customise their experience there are various input arguments/parameters which change the program's execution.
</br>
These can be seen using the `-h` or `--help` commands and are summarised below.
```
Usage: steam_mdc --input <path> [-o | --output <path>] [-r | --regex <path>] [-n | --line-number <int>] [-q | --quiet] [-w | --overwrite] [-h | --help]

 -i, --input <path>             Specify the input file to perform the regex substitution over (Required)
 -o, --output <path>            Specify the output file path, not overwriting by default (Default: <input-file>.out)
 -r, --regex <path>             Specify the delimited regex file to perform the matches over (Optional)
 -n, --line-number <int>        Specifies the end regex file line number to execute until (Optional)
 -q, --quiet                    Launches the program in quiet mode, leading to no console output (Optional)
 -w, --overwrite                Allows the program to write over the output file (Optional)
 -h, --help                     Outputs the help log to the console
```

### Custom Regex Example
To iterate over some custom, user-defined regular expressions you can give the program a delimitated regex file using the `-r <file>` argument. This file must consist of `3` columns which denote a ***Label, Search Expression and Replace Expression***. These columns must be tab-separated `\t`, comma-separated `,` or, space-separated and the data of each column must be contained in quotation marks `""`. For usability, a comment can also be defined with a `#` at the start of a line.

*Note: Unlike traditional delimited files, the first row is not treated as a header row.*

This schema is checked before the program executes, displaying an error if the file is invalid. An example small regex file can be seen below:
```
# Columns: Label, Search Regex, Replace Regex
"URL-LINK","(?<!!)\[(.*)\]\((.+?)(\s.*)?\)","\[url=$2\]$1\[\/url\]"
"IMG-LINK","(?<!!)!{1}(?!!)\[(.*)\]\((.+?)(\s.*)?\)","\[img\]$2\[\/img\]"
"BOLD","(?<![*_])[*_]{2}(.+)[*_]{2,3}(?![*_])","\[b\]$1\[\/b\]"
"ITALIC","[*_]{1}(?![*_])(.+)(?<![*_])[*_]{1}","\[i\]$1\[\/i\]"
"STRIKETHROUGH","(?<!~)~{2}(?!~)(.+)(?<!~)~{2}(?!~)","\[strike\]$1\[\/strike\]"
"UNDERLINE","<ins>(.+)<\/ins>","\[u\]$1\[\/u\]"
"HEADING-ID","^#{1,3}\s(.+)\s\{(#.+)\}\s$","\[h1\]$1($2)\[\/h1\]\n"
"HEADING","^#{1,3}\s((?:\b\S+\b\s?)+)\s.*$","\[h1\]$1\[\/h1\]\n"
"CODE-BLOCK","(`+)((?:\s|.)+?)\1","\[code\]$2\[\/code\]"
"HORIZONTAL-RULE","^([-*_]{3,})$","\[hr\]\[\/hr\]"
```


## Installation
Below we leverage `make` to install `steam_mdc` - the single bash script which contains the program.</br>
If you'd rather manage the installation yourself, you can [download](https://raw.githubusercontent.com/zonkeeh/steam_mdc/master/steam_mdc) the script and make it available on your `$PATH`.

For the simplest installation, execute the following command in a terminal which:
* Clones this `steam_mdc` repository into the current directory.
* Navigates inside the directory.
* Uses the dependency `make` to install the script into the default `/usr/local/bin` directory.

```sh
git clone https://github.com/Zonkeeh/steam_mdc.git && cd steam_mdc && sudo make install
```

To install the script into a custom path - e.g. `<dir>/steam_mdc`, you can use the custom environment variable `$DIST`

```sh
git clone https://github.com/Zonkeeh/steam_mdc.git && cd steam_mdc && sudo make PREFIX="<dir>" install
```

Then add the following source to your `$HOME` directory's `~/.bashrc` file:

```sh
source $DIST/steam_mdc
```

The included `make` makefile can also but used to both *update* and *uninstall* `steam_mdc` using the commands:

```sh
make uninstall
make update
```
*Note:  Be sure to specify the custom installation directory again in these commands if declared on installation*


If installed by another route you can simply update the bash script to the latest release or remove it from the installed location manually.
