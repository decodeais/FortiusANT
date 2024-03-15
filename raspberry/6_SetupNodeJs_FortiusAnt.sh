#!/bin/bash
cd ../node/
npm install

echo ""
echo The npm install command has given several warnings which can be ignored.

# ----------------------------------------------------- Done
bash stop.sh "$@"

