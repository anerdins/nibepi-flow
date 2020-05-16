#!/bin/bash

file1="/etc/cron.hourly/sync_time"
file2="/tmp/bugfix/sync_time"
if [ ! -f ${file2} ];
then
cd /tmp/bugfix && wget "https://raw.githubusercontent.com/anerdins/nibepi-flow/master/update/bugfix/sync_time"
fi
if [ -f ${file2} ];
then
if cmp -s "$file1" "$file2"; then
    printf 'The file "%s" is the same as "%s"\n' "$file1" "$file2"
    rm $file2
else
    printf 'The file "%s" is different from "%s"\n' "$file1" "$file2"
        if [ -f ${file2} ];
        then
        sudo mount -o remount,rw / && sudo chmod u+x $file2
        sudo mount -o remount,rw / && sudo mv $file2 $file1
        fi
fi
fi


