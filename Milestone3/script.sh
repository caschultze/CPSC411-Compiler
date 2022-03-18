#!/bin/bash
read -p 'Main file path (e.g. ./src): ' mainfilepath

# $makefile/make

read -p 'Test file path (e.g. ./test): ' testfilepath

for file in $testfilepath/*
do
    [ -f "$file" ] || continue
    echo ""
    echo ""
    echo "Semantic checking file $file"
    echo "================================================="
    $mainfilepath/main "$file"
done
