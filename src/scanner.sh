#!/bin/bash
make

for file in ../test/ms1/*
do
    [ -f "$file" ] || continue
    echo "Scanning file $file \n"
    ./main "$file"
done