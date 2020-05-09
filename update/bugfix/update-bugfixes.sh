#!/bin/bash
for filename in bugfix-*.sh; do
    [ -e "$filename" ] || continue
    # ... rest of the loop body
    echo "Running $filename"
    sudo bash $filename
    echo "Done with $filename"
done
