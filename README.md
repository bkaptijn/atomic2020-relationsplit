

Given the repository belonging to the paper on Atomic2020: https://github.com/allenai/comet-atomic-2020 
This repository contains 2 additional scripts to produce the scores splitted on relation type based on the bigger testset with 152K tuples.

In models/comet_atomic2020_bart, after downloading the BART model, you can use generation_testdata.py to process the unrotated
testfile (which can be downloaded here: https://allenai.org/data/atomic-2020). Note however after downloading it (it is the test.tsv within the downloaded zip file): 
sort it using 'sort test.tsv > ./models/comet_atomic2020_bart/testdata/testdata.tsv' before
processing it. This script produces a inputfile.json and test.tsv file (in the testdata subfolder) that both contains the same amount of lines and sorted the same so
it can be used with the scripts in system_eval. Note this script can take a long time to run.

In system_eval/ after following the README of the original given repository on Atomic2020 referenced above to reproduce the results in the paper
you can use the relationSplit.sh shell script to process the inputfile.json and test.tsv. It expects the test.tsv in the same folder as the shell script
and the shell script must be executed in that folder. The shell script takes the path to the inputfile.json as first argument. It will split both files
on relation and process each relation and put out the scores to generationsPerRelation.tex 
Use wc -l split-*.json to find the size of the tuple sets per relation of which the total should match the amount of queries processed by the generation_testdata.py script
which it reports. Note this script can also be used on the original 5K testset. 
