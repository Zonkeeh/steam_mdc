# Steam MDC
---
Convert **Markdown** code/files into [Steam's custom markup language](https://steamcommunity.com/comment/Recommendation/formattinghelp)  via a customised list of matched *regular expressions*.

![STEAM_MDC](https://i.imgur.com/sLo3eEx.gif)

---
## Description

---
## Usage

---
## Installation
Below we leverage the package `make` to install `steam_mdc` - the single bash script which contains the program.</br>
If you'd rather manage the installation yourself, you can [download](https://raw.githubusercontent.com/zonkeeh/steam_mdc/master/steam_mdc) the script and make it available on your `$PATH`.

For the simplest installation, execute the following command in a terminal which:
* Clones this `steam_mdc` repository into the current directory.
* Navigates inside the directory.
* Uses the dependency `make` to install the script into the default `/usr/local/bin` directory.

```bash
git clone https://github.com/Zonkeeh/steam_mdc.git && cd steam_mdc && sudo make install
```

To install the script into a custom path - e.g. `<dir>/steam_mdc`, you can use the custom environment variable `$DIST`

```bash
git clone https://github.com/Zonkeeh/steam_mdc.git && cd steam_mdc && sudo make PREFIX="<dir>" install
```

Then add the following source to your `$HOME` directory's `~/.bashrc` file:

```
source $DIST/steam_mdc
```

The included `make` makefile can also but used to both *update* and *uninstall* `steam_mdc` using the commands:

```bash
make uninstall
make update
```
*NOTE:  Be sure to specify the custom installation directory again in these commands if declared on installation*


If installed by another route you can simply update the bash script to the latest release or remove it from the installed location manually.
