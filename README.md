# Mac Bash Distration Blocker Script
**Note: This product comes with no warranty whatsoever. I am not responsible for any damage that happens using this script!** 

A very simple Mac script to block distracting websites. At this time, the following websites are blocked:
1. www.reddit.com
2. www.instagram.com
3. www.facebook.com
## How to Use
In order to use this script, simply download it onto your computer, and then run `chmod a+x macblocker.command` in the directory which contains the script in order to give executing permissions to the script. Then, run the script. The script will ask for how long, in minutes, to block distracting websites. Once that is given, the script will, after a brief "are you sure" period, lock the user out of afformentioned websites.
## What Happens
The script will make a current backup of your **hosts** file (located in /etc/hosts) in the current directory. It will then append the afformentioned websites to the hosts file, causing the computer to direct them to localhost. Once the time has run out, the script will remove the websites from the hosts file, and the websites can be accessed again.
## Manually Unblocking
If, for whatever reason, the program terminated before the time is up, it is possible to unblock the websites. In order to do so, using your favorite text editor (we are using VIM in this case), enter the hosts file from terminal using the command `sudo vim /etc/hosts`, and delete all the lines of code in between and including the *#start-Blocking* and *#stop-Blocking* comment.
## Adding More Websites
If you wish to add additional websites to block, simply go into the script using the text editor of your choice and find the `declare -a websitesToBlock=("reddit.com" "facebook.com" "instagram.com")` line, and add in any additional websites you wish to block, making sure to encompass the URL with quotes. The URL should not contain `http://` and/or `www.` in order to work properly (for example, `"example.com"` is a valid URL while `"http://example.com"` and `"www.example.com"` are not).
