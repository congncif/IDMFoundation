red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

app_dir=~/Library/Developer/Xcode/Templates/Project\ Templates/iOS/Application
if [ ! -d "$app_dir" ] 
then
    mkdir -p "$app_dir"
    echo "Creating new IDM-Foundation.xctemplate..."
fi
temp_dir=~/Library/Developer/Xcode/Templates/Project\ Templates/iOS/Application/IDM\ Foundation.xctemplate
if [ -d "$temp_dir" ] 
then
	rm -rf "$temp_dir"
	echo "Updating IDM-Foundation.xctemplate exists..."
fi
cp -R IDM\ Foundation.xctemplate ~/Library/Developer/Xcode/Templates/Project\ Templates/iOS/Application
echo "${green}Installed IDM-Foundation.xctemplate successfully${reset}"
