# XAMPP Vhosts Script for macOS

This script is used to enable vhosts in Apache for XAMPP on macOS, and to add a virtual host configuration and entry 
in the /etc/hosts file.

## Requirements
- XAMPP installed in the default location of /Applications/XAMPP
- Running the script as an administrator

## Usage
1. Download the script and make it executable by running the command `chmod +x xampp-vhosts.sh`
2. Run the script by executing `sudo xampp-vhosts.sh`
3. The script will prompt you for the path to your website's root directory and the domain name for your website
4. The script will add the virtual host configuration and the entry in the /etc/hosts file
5. Finally it will restart the Apache server to make the changes take effect

## Warning
Be careful when running this script, as it makes changes to system files. Make sure to test the script on your own 
machine before using it in production.

## Author: masterpreshy.com
