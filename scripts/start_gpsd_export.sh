#!/bin/bash

: '
This script exports gpsd output using gpspipe via
tcp on port PORT using socat.
Console and/or info and errors logged to LOG_FILE
'

set -e
LOG_FILE=/var/log/gpsd_export.log
PORT=2948 # one port above gpsd port, can select any unused port
>>$LOG_FILE
exec 3>&1 1>>${LOG_FILE} 2>&1

DATE=$(date "+%Y%m%d %T")

socat_gpspipe() {
    if [ -x "$(command -v gpspipe)" ] && [ -x "$(command -v socat)" ]; then
        echo "$DATE : Exporting gpsd via TCP port $PORT"
        (socat EXEC:'gpspipe -r' TCP-LISTEN:$PORT,reuseaddr,fork &)
    else
        echo "$DATE : error gpspipe or socat not found."
    fi
}

socat_gpspipe >>$LOG_FILE
