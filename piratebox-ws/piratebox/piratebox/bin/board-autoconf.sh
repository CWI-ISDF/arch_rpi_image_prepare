#!/bin/sh

if [[ ! -d /opt/piratebox/share/board ]]; then
    echo "You have to install the imageboard first!"
    echo "Run (as root):"
    echo "\t/opt/piratebox/bin/install_piratebox.sh /opt/piratebox/conf/piratebox.conf imageboard"
else
    
    exec 4>&1
    BOARDPASSWORD=$(
        dialog \
        --backtitle "PentestBox Post-Installation Script" \
        --title "Kareha Imageboard Admin Password" \
        --insecure \
        --passwordbox "Please enter a password for administration of the Kareha imageboard:" 10 60 \
        2>&1 1>&4
    );
    exec 4>&-
    echo $BOARDPASSWORD
    
    sed -i "s|xyzPASSWORDzyx|$BOARDPASSWORD|g" /opt/piratebox/share/board/config.pl

    TEMPRAND=$(< /dev/urandom tr -dc A-Za-z0-9_ | head -c128)
    sed -i "s|xyzSECRETCODEzyx|$TEMPRAND|g" /opt/piratebox/share/board/config.pl

    sed -i "s|#use constant ADMIN_PASS|use constant ADMIN_PASS|" /opt/piratebox/share/board/config.pl
    sed -i "s|#use constant SECRET|use constant SECRET|" /opt/piratebox/share/board/config.pl

    # Remove temporary index page and then try to initialize the board
    test -e /opt/piratebox/share/board/index.htm && rm /opt/piratebox/share/board/index.htm
    #wget -q -s -O -  http://127.0.0.1/board/kareha.pl 2>/dev/null
    wget -qO- http://127.0.0.1/board/kareha.pl &> /dev/null
fi
