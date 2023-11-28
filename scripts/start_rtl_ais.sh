#!/bin/bash

: '
This script starts rtl_ais.
Console and/or info and errors logged to LOG_FILE
'

set -e
LOG_FILE=/var/log/rtl_ais.log
PORT=10111 # One port above default NMEA port
>>$LOG_FILE
exec 3>&1 1>>${LOG_FILE} 2>&1

DATE=$(date "+%Y%m%d %T")

start_rtl_ais() {
    if [ -x "$(command -v rtl_ais)" ]; then
        echo "$DATE : Starting rtl_ais TCP on $PORT"
        (rtl_ais -P $PORT -T &)
    else
        echo "$DATE : error rtl_ais not found"
    fi
}

start_rtl_ais >>$LOG_FILE
