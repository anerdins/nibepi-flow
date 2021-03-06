#!/bin/bash
cd /tmp && \
rm -R -f /tmp/nibepi-flow && \
git clone -n https://github.com/anerdins/nibepi-flow.git --depth 1 && \
cd /tmp/nibepi-flow && \
git checkout HEAD update/bugfix/* && \
mv /tmp/nibepi-flow/update/bugfix /tmp && \
cd /tmp && \
rm -R -f /tmp/nibepi-flow
for filename in /tmp/bugfix/bugfix-*.sh; do
    [ -e "$filename" ] || continue
    # ... rest of the loop body
    echo "Running $filename"
    sudo bash $filename
    echo "Done with $filename"
done
rm -R -f /tmp/bugfix
