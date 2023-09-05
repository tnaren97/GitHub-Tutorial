#!/bin/bash

FILES=$(ls *.txt)

echo "This is a tutorial for working with GitHub. This script will print the outputs of every text file it sees in the current directory."
echo "You are currently in branch2"
echo ""

for FILE in $FILES; do
  echo "~~~~~~~~~~~~~~~~~~~~~The contents of $FILE~~~~~~~~~~~~~~~~~~~~~~~~"
  echo ""
  cat $FILE
  echo ""
done
