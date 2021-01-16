#!/usr/bin/env sh

db=$(head -1 "$1" | sed 's/^--//')
db=$HOME/.config/psql/dbs/$db
[[ -e $db ]] && source $db

tsv=/tmp/sql-query.tsv
error=/tmp/sql-error.txt
psql -P format=unaligned -P fieldsep='	' -P null='NULL' -f $1 >$tsv 2>$error
sed -i '/^(\([0-9]* rows\))$/d' $tsv
if [[ -s $error ]]; then
	nvim $error	
else
	sc-im $tsv
fi
