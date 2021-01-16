#!/usr/bin/env sh

db=$HOME/doc/finance/wage.db
query="select name from customer where name = '$1';"
name=$(sqlite3 $db "$query")
if [ "$name" == "" ]; then
	echo "$1 does not exist"
else
	query="select * from delta where delta_customer = '$name'"
	exist=$(sqlite3 $db "$query")
	if [ "$exist" == "" ]; then
		query="insert into delta (delta_customer) values ('$name')"
		sqlite3 $db "$query"
		echo "Start work for $name"
	else
		query="select end from delta where start in (select max(start) from delta where delta_customer = '$name');"
		end=$(sqlite3 $db "$query")
		if [ "$end" == "" ]; then
			query="update delta set end = datetime('now', 'localtime') where start in (select max(start) from delta where delta_customer = '$name');"
			sqlite3 $db "$query"
			echo "End work for $name"
		else
			query="insert into delta (delta_customer) values ('$name')"
			sqlite3 $db "$query"
			echo "Start work for $name"
		fi
	fi

fi
