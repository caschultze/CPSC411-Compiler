#!/bin/bash
read -p 'MakeFile path (e.g. ./src): ' makefilepath

$makefilepath/make

read -p 'Test file path (e.g. ./test): ' testfilepath

for file in $testfilepath/*
do
    [ -f "$file" ] || continue
    echo ""
    echo ""
    echo "Semantic checking file $file"
    echo "================================================="
    ./main "$file"
done