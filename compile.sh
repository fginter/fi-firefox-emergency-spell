# 1) get the vocab file from TODO-URL

# 2)
cd extension
## List files
rm fi-dictionary-lst.xpi
cp -r dict-purelist dictionaries
zip -r fi-dictionary-lst.xpi install.rdf dictionaries
rm -rf dictionaries

## Flammie files
rm fi-dictionary-flammie.xpi
cp -r dict-flammie dictionaries
zip -r fi-dictionary-flammie.xpi install.rdf dictionaries
rm -rf dictionaries

