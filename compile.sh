

# 1) get the vocab file from TODO-URL
#wget http://bionlp-www.utu.fi/.jmnybl/finnish_vocab.txt.gz

# 2) Note you need giellatekno transducer for Finnish to run the next command http://giellatekno.uit.no/
# 
# zcat finnish_vocab.txt.gz | perl -pe 's/^\s+//' | cut -f 2 -d ' ' | head -n 10000000 | hfst-optimized-lookup ../fin/src/analyser-gt-norm.hfstol > finnish_vocab_analyzed.10M.txt
# 


cat finnish_vocab_analyzed.10M.txt | python3 filter.py --max 750000 extension/dict-purelist/fi_FI

# 3)
cd extension
## List files
rm -f fi-dictionary-lst.xpi
cp -r dict-purelist dictionaries
zip -r fi-dictionary-lst.xpi install.rdf dictionaries
rm -rf dictionaries

### Flammie files
#rm -f fi-dictionary-flammie.xpi
#cp -r dict-flammie dictionaries
#zip -r fi-dictionary-flammie.xpi install.rdf dictionaries
#rm -rf dictionaries

