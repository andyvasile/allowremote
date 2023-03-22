#!/bin/bash
#
# AllowRemotse
# ----------------------------------
# description     : Script was written to help you enable / disable Allow Remote Domains usign WHMAPI1.
# author          : Andy Vasile 
# date            : 10.12.2019
# usage           : bash <(curl -s http://andyvasile.net/s/allowremote.sh)
# =======

ESC="\x1b["
RED=$ESC"31;01m"
GREEN=$ESC"32;01m"
YELLOW=$ESC"33;01m"
BLUE=$ESC"34;01m"
MAGENTA=$ESC"35;01m"
BLUE=$ESC"36;01m"
WHITE=$ESC"37;01m"
GREY=$ESC"30;01m"
RESET=$ESC"39;49;00m"

countdown() {
  #This function will show a timer on screen
  secs=$1
  shift
  msg=$@
  while [ $secs -gt 0 ]
  do
    printf "\r\033[KAllow Remote Domain [$RED ENABLED $RESET] - $MAGENTA%.d$RESET seconds $msg" $((secs--))
    sleep 1
  done
  echo
}

whmapi1 set_tweaksetting key=allowremotedomains value=1
#I'm disabling allowremotedomain key using whmapi1
countdown 60 "Please go ahead now."
whmapi1 set_tweaksetting key=allowremotedomains value=0
#Enabling it back again with whmapi1
echo "Allow Remote Domain [$GREEN DISABLED $RESET]."
echo ""
