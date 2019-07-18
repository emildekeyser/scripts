#!/usr/bin/env sh

db=$HOME/doc/wage/wage.db
hwage=15

query="select strftime('%H:%M',(julianday(end) - julianday(start)),'12:00') from delta where delta_customer = '$1' and payed = 0;"
sqlite3 $db "$query"
echo "-----"
query="select strftime('%H:%M', sum(julianday(end) - julianday(start)),'12:00') from delta where delta_customer = '$1' and payed = 0;"
sqlite3 $db "$query"
echo "-----"
query="select printf('%.3f', sum(julianday(end) - julianday(start))) * 24 * $hwage from delta where delta_customer = '$1' and payed = 0;"
sqlite3 $db "$query"
