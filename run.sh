#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: ./run.sh /path/to/input_ssf_file /path/to/trained_model"
    exit
fi
INPUT_FILE_SSF=$1
TRAINED_MODEL=$2
TESTING_FILE="./run/testing.in_$RANDOM"
cat $INPUT_FILE_SSF | perl ./utils/ssf2tnt.pl | perl ./utils/extra_features.pl > $TESTING_FILE
crf_test -m $TRAINED_MODEL $TESTING_FILE | awk '{if (NF > 0) {printf "%s %s %s\n",$1,$NF,$(NF-1)} else print}' | perl utils/tnt2ssf.pl
rm -f $TESTING_FILE
