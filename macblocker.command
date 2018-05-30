#! /bin/bash
clear
echo "This script will block distracting websites for however long you specify."
echo "Note: This script comes with NO WARRENTY of any kind."
read -p "How many minutes should I block for (if websites are still blocked from last time, press 0 to unblock): " timeToBlock
if ! [[ "$timeToBlock" =~ ^[0-9]+$ ]] ; 
 then exec >&2; echo "Error: Not a positive number! Program will now exit..."; sleep 5; exit 1
fi
clear
echo "If $timeToBlock minutes is not what you want or you change your mind, close the script now!"
timeToBlock=$((timeToBlock * 60))
echo "To ensure a complete block, administrator rights will be needed!"
echo "DO NOT modify the hosts file while this script is running or bad things will happen!"
sudo cp /etc/hosts hosts.bak
clear
echo "Making a backup of the hosts file to the current directory..."
echo "DO NOT CLOSE THE PROGRAM NOW OR THE WEBSITES WILL BE REMAINED BLOCKED."
# add websites to the array below to block. Remember to enclose in quotation marks!
declare -a websitesToBlock=("reddit.com" "facebook.com" "instagram.com")
echo "Blocking Distractions..."
sudo -- sh -c "echo '#start-Blocking' >> /etc/hosts"
for i in "${websitesToBlock[@]}"
do
    sudo -- sh -c "echo '127.0.0.1 $i' >> /etc/hosts"
    sudo -- sh -c "echo '127.0.0.1 www.$i' >> /etc/hosts"
    sudo -- sh -c "echo 'fe80::1%lo0 $i' >> /etc/hosts"
    sudo -- sh -c "echo 'fe80::1%lo0 www.$i' >> /etc/hosts"
done
sudo -- sh -c "echo '#stop-Blocking' >> /etc/hosts"
echo "Successfully blocked distractions! It's time to work now..."
subUnitOfTimeToBlock=$((timeToBlock / 5))
for x in {1..5}
do
    sleep $subUnitOfTimeToBlock
    echo "$x/5 of the way there!"
done
clear
echo "Congratuations, you made it!"
sudo sed -i '' '/#start-Blocking/,/#stop-Blocking/d' /etc/hosts
echo "Unblocking websites now!"
echo "Thanks for using my script :)"
read -p "Press enter to exit..."