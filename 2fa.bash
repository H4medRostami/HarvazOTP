#!/bin/bash

RED='\033[0;31m'
pass 2fa/
echo -e "Enter a provider name:\n"
read -t 15 key_name

if [ -z "$key_name" ]
then
    printf "${RED} I have been waiting for you for a long time, it is enough to wait, Bye.\n\n"
    exit 1
else

    if key=$(pass 2fa/$key_name)
    then
        if result=$(oathtool --base32 --totp "$key") 
        then
            echo $result|xclip -selection clipboard
            echo "Copied $key_name key to clipboard, it will clear after 20 second."
        fi
    fi
fi
sleep 20 && xclip -selection clipboard /dev/null&

