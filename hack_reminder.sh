#! /usr/bin/bash

# reminder script sends system notifications at given intervals.
#
# modified: 11/19/2020
# by: flowenol
#
# + add button to restart the script! - wont work :(

title="tryhackme"

minute=60
hour=3600
nine_hours=32400
twelve_hours=43200

echo "=> $(date): script started."
echo "=> hack_reminder.sh is running in the background."
echo "=> PID is [$(echo $(($BASHPID+1)))]"
echo "=> Make sure wakelock is held on termux session!"
echo "=>  - love, flowenol"

(
termux-notification -t $title -c "you have less than 24 hours to keep the streak alive!"; 
sleep $twelve_hours;
termux-notification -t $title -c "you have less than 12 hours to keep the streak alive!";
sleep $nine_hours;

for number in 3 2 1
do
   termux-notification -t $title -c "you have less than "$number" hours remaining!";
   sleep $hour;
done
 
termux-notification -t $title -c "Time is up! Streak will reset."
) &
