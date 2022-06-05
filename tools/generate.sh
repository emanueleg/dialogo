echo "Inizio generazione dizionario DIALOGO..."

echo "Pulizia vecchi dizionari..."
rm -f hunspell02.txt
rm -f nvdb02.txt
rm -f fullita01.txt

echo "Elaborazione NVdB, Tullio De Mauro 2016..."
cut -d, -f 1,2 < nvdb01.txt > nvdb02.txt
sed -i 's/[0-9]*//g' nvdb02.txt
sed -i 's/^b,/1,/g' nvdb02.txt
sed -i 's/^i,/2,/g' nvdb02.txt
sed -i 's/^n,/3,/g' nvdb02.txt
sed -i '/^[0-9],$/d' nvdb02.txt

echo "Elaborazione dizionario italiano Hunspell / LibreOffice..."
cut -d/ -f1 hunspell01.txt > hunspell02.txt
sed -i '/^$/d' hunspell02.txt
sed -i 's/[0-9]*//g' hunspell02.txt
sed -i '/^$/d' hunspell02.txt
sed -i 's/^/4,/g' hunspell02.txt

echo "Unione dei dizionari e delle frequenze..."
cat hunspell02.txt nvdb02.txt | sort -t "," -k 2 | uniq -s1 | awk 'BEGIN {FS=",";OFS=","} {print $2, $1}' | sort > fullita01.txt
sed -i '/^[A-Z]/s/$/,NP/' fullita01.txt
sed -i '/[0-9]$/s/$/,NC/' fullita01.txt

echo "Sillabazione e generazione schemi C-V..."
python3 hyphenator.py -d hyph_it_IT.dic -i fullita01.txt -o dialogo.csv

echo "Pulizia file temporanei"
rm hunspell02.txt
rm nvdb02.txt
rm fullita01.txt

echo "Fatto! Dizionario DIALOGO salvato in dialogo01.csv"
