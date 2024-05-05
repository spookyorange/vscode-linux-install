#!/usr/bin/env bash

app_name="code"
display_name="Visual Studio Code"
literal_name_of_installation_directory=".tarball-installations"
universal_path_for_installation_directory="$HOME/$literal_name_of_installation_directory"
app_installation_directory="$universal_path_for_installation_directory/$app_name"
official_package_location="https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
local_bin_path="$HOME/.local/bin"
local_application_path="$HOME/.local/share/applications"
app_bin_in_local_bin="$local_bin_path/$app_name"
desktop_in_local_applications="$local_application_path/$app_name.desktop"
icon_path=$app_installation_directory/resources/app/resources/linux/code.png
executable_path=$app_installation_directory/code
tar_location=$(mktemp /tmp/vscode.XXXXXX.tar.gz)
desktop_keywords=web,development,code,api,text,editor
desktop_terminal=false
desktop_type=Application
desktop_categories="Api;Code;Development;Text;Edit;Editor;"
desktop_startup_wm_class="Visual Studio Code"
desktop_exec="$executable_path %u"
desktop_actions="new-empty-window;"
desktop_other_actions="
[Desktop Action new-empty-window]
Name=New Empty Window
Exec=$executable_path --new-window %F
Icon=$icon_path
"

echo "Welcome to $display_name tarball installer, just chill and wait for the installation to complete!"

sleep 1

echo "Checking if old files exist"
if [ -f $app_bin_in_local_bin ]; then
  echo "Old bin file detected, removing..."
  rm $app_bin_in_local_bin
fi

if [ -d $app_installation_directory ]; then
  echo "Old app files are found, removing..."
  rm -rf $app_installation_directory
fi

if [ -f $desktop_in_local_applications ]; then
  echo "Old bin file detected, removing..."
  rm $desktop_in_local_applications
fi

sleep 1

echo "Installing the latest package"
curl -L -o $tar_location $official_package_location
if [ $? -eq 0 ]; then
    echo OK
else
    echo "Installation failed. Curl not found or not installed"
    exit
fi

mkdir $app_name

tar -xvf $tar_location -C $app_name --strip-components=1

echo "Installed and untarred successfully"

if [ ! -d $universal_path_for_installation_directory ]; then
  echo "Creating the $universal_path_for_installation_directory directory for installation"
  mkdir $universal_path_for_installation_directory
fi

mv $app_name $app_installation_directory

echo "$app_name successfully moved to your safe place!"

rm $tar_location

if [ ! -d $local_bin_path ]; then
  echo "$local_bin_path not found, creating it for you"
  mkdir $local_bin_path
fi

ln -s $executable_path $app_bin_in_local_bin

echo "Created executable for your \$PATH if you ever need"

if [ ! -d $local_application_path ]; then
  echo "Creating the $local_application_path directory for desktop file"
  mkdir $local_application_path
fi

touch $desktop_in_local_applications
echo "
[Desktop Entry]
Name=$display_name
Keywords=$desktop_keywords
Exec=$desktop_exec
Icon=$icon_path
Terminal=$desktop_terminal
Type=$desktop_type
StartupWMClass=$desktop_startup_wm_class
Categories=$desktop_categories
Actions=$desktop_actions

$desktop_other_actions
" >> $desktop_in_local_applications

echo "Created desktop entry successfully"

sleep 1

echo "Installation is successful"

sleep 1

echo "Done, and done, have fun!"

sleep 1

exit 0


