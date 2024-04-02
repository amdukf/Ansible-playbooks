#!/bin/bash

# Function to send notification
send_message() {
  API_TOKEN="6378382228:AAF15RS2VeHfcP2oSjqrjtQAFO5SComvvUA"
  CHAT_ID="-4096531966"

  # Set the message text
  memUsage=$(free -m | awk '/Mem/{print $3}')
  MESSAGE="New Root Login Detected in Italy Server!"

  # Use the curl command to send the message
  curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
}   

# Monitor auth.log for new root login attempts
sudo tail -F /var/log/auth.log | grep --line-buffered "pam_unix(sshd:session): session opened for user root(uid=0) by (uid=0)" |
while read line; do
    send_message
done

