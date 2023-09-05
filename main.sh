#!/bin/bash

FILES=$(ls *.txt)

echo "This is a tutorial for working with GitHub. This script will print the outputs of every text file it sees in the current directory."

for FILE in FILES; do
  echo "The contents of $FILE are:"
  echo ""
  cat $FILE
done
