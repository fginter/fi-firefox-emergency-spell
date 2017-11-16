import sys
import re
import argparse

parser = argparse.ArgumentParser(description='Filter morpho-analyzed data from stdin.')
parser.add_argument('--max', type=int, default=500000, help="How many unique words to include. Default %(default)d.")
parser.add_argument('FILE', default='extension/dict-purelist/fi_FI', action='store', help="FILE.dic and FILE.aff will be created")

args = parser.parse_args()
word_re=re.compile(r"^[a-zA-ZåäöÅÄÖ]([a-zA-ZåäöÅÄÖ-]*[a-zA-ZåäöÅÄÖ])?$")

words_s=set()
words_l=[]
for line in sys.stdin:
    line=line.rstrip()
    if not line: #empty
        continue
    wrd,analysis=line.split("\t",1)
    if analysis.endswith("+?"): #unrecognized
        continue
    if wrd in words_s: #already done
        continue
    if wrd[0]!=analysis[0] and wrd[0].lower()==analysis[0]: #capitalized version of lowercased lemmas
        wrd=wrd.lower()
    if wrd in words_s: #already done
        continue
    if word_re.match(wrd): #is word
        words_s.add(wrd)
        words_l.append(wrd)
    else:
        continue
    if len(words_l)>=args.max:
        break
    if len(words_l)%10000==0:
        print("at word",len(words_l))

        
with open(args.FILE+".dic","w") as f:
    print(len(words_l),file=f)
    for w in words_l:
        print(w,file=f)

with open(args.FILE+".aff","w") as f:
    print("SET UTF-8",file=f)
    print("TRY abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZäöåÄÖÅ",file=f)
    
