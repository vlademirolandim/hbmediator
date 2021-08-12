#!/bin/bash

if [ "$1" == "--create" ]
then
     if [ ! -f clean.list ]
     then
          echo "Creating default clean.list"
          echo "*.a *.log *.ppo *.exe *.dbf *.dbt *.bak *.hrb" > clean.list
     fi
fi

if [ -f clean.list ]
then
     content=`cat clean.list`
else
     echo "**************************************************************"
     echo "clean.list not found (list pattern to erase content)"
     echo "content example: "
     echo "*.a *.ppo"
     echo "**************************************************************"
     echo "To create file (with default base) use : clean.sh --create"
     echo "**************************************************************"
     exit
fi

for f in $content
do
     for x in `find . -name \$f -print`
     do
          echo Deleting $x
          rm $x
     done
          
done

for f in `find . -type f -print0 | xargs -0 file | grep "ELF 64-bit LSB" | cut -d':' -f1`
do
     echo Deleting $f
     rm $f
done






