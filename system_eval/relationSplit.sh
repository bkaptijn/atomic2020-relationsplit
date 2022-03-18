#!/bin/sh


rm runlog.txt
rm relationsplitResults.tex
for i in `cat $1 | jq -r .relation | sort -u`; 
do 
	rm test-$i.tsv	
	rm split-$i.json
	rm split-$i_gens.jsonl	
	rm test.tsv	
	cat $1 | jq -ac --arg i "$i" 'select(.relation==$i)' >> split-$i.json; 
	grep @@.$i original-test.tsv >> test-$i.tsv
	wc -l test-$i.tsv	
	grep \{ split-$i.json | wc -l
	cp test-$i.tsv test.tsv	
	wc -l test.tsv	
	echo python3 automatic_eval.py --input_file split-$i.json	
	python3 automatic_eval.py --input_file split-$i.json >> runlog.txt 
	cat runlog.txt | tail -9 >> relationsplitResults.tex
done
