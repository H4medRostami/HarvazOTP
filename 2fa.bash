#!/usr/bin/bash

#============================
AUTHOR="Hamed Rostami"
EMAIL="hamedrostami@tuta.io"
VERION="1.0.0"
#============================


RED='\033[0;31m' #color used in printf output


2fa_crud(){
    pass ${operation} 2fa/"$2"
    return
}

get_otp_key(){
     if provider=$(pass 2fa/"$1")
                then
                    if result=$(oathtool --base32 --totp "$provider") 
                    then
                        echo $result|xclip -selection clipboard
                        printf "Copied $1 key to clipboard,$RED it will clear after 20 second.\n"
                    fi
                fi
sleep 20 && xclip -selection clipboard /dev/null&
return 
}

get_help(){
    cat <<ASK
    pass: the standard unix password manager OTP extention =
    =                                                      =
    =                       v$VERION                         =
    =                                                      =
    =                 Author : $AUTHOR               = 
    =                  $EMAIL                =
    =                                                      =
    =                                                      =
    ========================================================

    Usage:
        pass 
            List providers.

        pass insert provider-name
            Insert new key. Optionally, echo the password back to the console
            during entry. Or, optionally, the entry may be multiline. Prompt before
            overwriting existing password unless forced.

        pass edit provider
            Insert a new  key or edit an existing key using editor.

        pass rm provider 
            Remove existing password or directory, optionally forcefully.

        pass help
            Show this text.

        pass version
            Show version information.
ASK
return

}


case "$1" in 
        "") pass 2fa/
            exit ;;
    insert|ins*) if [ -z "$2" ]
                 then
                     echo "Usage: 2fa insert key-name"
                 else
                     operation="insert"
                     2fa_crud "$operation" "$2"
                fi 
                exit ;;
      edit|edi*) if [ -z "$2" ]
                 then
                     echo "Usage: 2fa edit key-name"
                 else
                     operation="edit"
                     2fa_crud "$operation" "$2"
                fi 
                exit ;;

    remove|rem*|rm) if [ -z "$2" ]
                 then
                     echo "Usage: 2fa remove key-name"
                 else
                     operation="remove"
                     2fa_crud "$operation" "$2"
                fi 
                exit ;;

        -v) echo "$VERION" 
             exit 0 ;;

         -h) get_help
              exit ;; 
  
    *) get_otp_key "$1"
        exit ;;

esac

exit 0
