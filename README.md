# Install tarball version of Visual Studio Code with just a basic script!

A script to easily install Visual Studio Code the tarball way on your Linux machine!

Note: This installation script is by no means affiliated with Visual Studio Code project, or its maintainers.

## Prerequisites

* [git](https://git-scm.com/)
* [curl](https://github.com/curl/curl)

## Usage

Clone the repo and run the script
```bash

git clone https://github.com/spookyorange/vscode-linux-install.git
cd vscode-linux-install
sh ./install.sh

```

To remove the application(if it has been installed with this method)
```bash

sh ./uninstall.sh

```

Updates are handled by running the install script again, you can just run the install script and all good!
```bash

sh ./install.sh

```

## Details

The script will install the application in the following destinations if you have installed locally:

- ~/.tarball-installations/code
- ~/.local/bin/code
- ~/.local/share/applications/code.desktop

## Tested Distros

- Fedora by Spookyorange
- Fedora Atomic(Silverblue) by Spookyorange
- SteamOS(Steam Deck) by Spookyorange
- Void Linux with GlibC by Dreampop602
- Ubuntu by Dreampop602
- Gentoo stable by oblivikun 
- Debian by Andrezeira1 and PenguinByte 

## Contributing

If you have a distro that you would like to add to the list of tested distros, please submit a pull request with the changes you made to the script and the distro you tested it on. Check out this guide to make the pull request:
https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork


