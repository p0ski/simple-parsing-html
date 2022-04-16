#!/bin/bash
if [ "$1" == "" ]
then
	echo "Parsing HTML"
	echo "Modo de uso: $0 URL"
	echo "Exemplo: $0 google.com"
else
wget -q $1  #baixar o index
cat index.html | grep "href" | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > lista.txt
host $1  #puxa o ip do host
for url in $(cat lista);
do
host $url | grep "has address";
done
fi
