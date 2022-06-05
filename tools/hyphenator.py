import csv
import pyphen
import argparse


parser = argparse.ArgumentParser()
parser.add_argument('-l', '--lang', type=str, required=False, default='it_IT')
parser.add_argument('-d', '--dict', type=str, required=False)
parser.add_argument('-i', '--infile', type=str, required=False, default='fullita01.txt')
parser.add_argument('-o', '--outfile', type=str, required=False, default='dialogo.csv')
#parser.add_argument('--heading', action=argparse.BooleanOptionalAction)  # >= python 3.9
parser.add_argument('--headings', action='store_true')
parser.add_argument('--no-heading', dest='feature', action='store_false')
parser.set_defaults(feature=True)
args = parser.parse_args()

dic = pyphen.Pyphen(lang=args.lang, left=1, right=1)
if args.dict:
    dic = pyphen.Pyphen(filename=args.dict, left=1, right=1)

with open(args.infile, newline='') as incsvfile:
    dicreader = csv.reader(incsvfile, delimiter=',')
    with open(args.outfile, 'w', newline='') as outcsvfile:
        dicwriter = csv.writer(outcsvfile, dialect='excel')
        if args.headings:
            dicwriter.writerow(["parola", "frequenza", "comune/proprio", "sillabazione", "tipo_sillabe", "num_sillabe"])
        for row in dicreader:
            hyphenated = dic.inserted(row[0])
            g_hyphenated = ""
            for c in hyphenated.lower():
                if c in ['a', 'e', 'i', 'o', 'u', 'à', 'è', 'é', 'ì', 'ò', 'ù']:
                    g_hyphenated += 'v'
                elif c == '-':
                    g_hyphenated += '-'
                else:
                    g_hyphenated += 'c'
            dicwriter.writerow(row + [hyphenated.lower(), g_hyphenated, len(hyphenated.split("-"))])
