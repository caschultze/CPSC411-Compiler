#!/bin/bash
make

read -p 'Test file path (e.g. ./testFiles/ms1): ' filepath

for file in $filepath/*
do
    [ -f "$file" ] || continue
    echo ""
    echo ""
    echo "Scanning file $file"
    echo "================================================="
    ./main "$file"
done