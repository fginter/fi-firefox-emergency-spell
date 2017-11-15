# 1) get the vocab file from TODO-URL
wget http://bionlp-www.utu.fi/.jmnybl/finnish_vocab.txt.gz

# 2) 
zcat finnish_vocab.txt.gz | perl -pe 's/^\s+//' | cut -f 2 -d ' ' | head -n 5000000 | hfst-optimized-lookup ../fin/src/analyser-gt-norm.hfstol > finnish_vocab_analyzed.5M.txt

# 2)
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

