#!/bin/bash
sudo mount -o remount,rw /
cd /tmp && \
git clone -n https://github.com/anerdins/nibepi-flow.git --depth 1 && \
cd nibepi-flow && \
git checkout HEAD update/bugfix/* && \
mv update/bugfix /tmp && \
rm -R -f /tmp/nibepi-flow

for filename in /tmp/bugfix/bugfix-*.sh; do
    [ -e "$filename" ] || continue
    # ... rest of the loop body
    echo "Running $filename"
    sudo bash $filename
    echo "Done with $filename"
done
