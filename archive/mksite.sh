#!/usr/bin/env sh

nav=$(mktemp)
echo "<nav>" >$nav
#pandoc nav.md -w html >>$nav
echo "<a href="/index.html">index.html</a><br>" >>$nav
tree out/ -H '' -P '*\.html' -I 'index.html' \
	| sed -z 's:<!DOCTYPE.*</h1><p>::' \
	| sed '/<br><br>/q' \
	| sed 's/^[[:space:]]*//' >>$nav
echo "</nav>" >>$nav

rm -rf out/*

find in -type d | sed 's:^in::' | parallel mkdir -p out/{}
find in -type f -iname '*\.html' -or -iname "*\.css" | sed 's:^in::' | parallel cp in{} out{}
find in -type f -iname '*\.md' | sed 's:^in::' | parallel pandoc in{.}.md -o out{.}.html
tmp_html=$(mktemp)
for html_file in $(find out/ -type f -name '*html'); do

	echo "<main>" >$tmp_html
	cat $html_file >>$tmp_html
	echo "</main>" >>$tmp_html

	sed_title_command='s:<title>TITLE</title>:<title>'$(basename $html_file .html)'</title>:';
	sed $sed_title_command header.html \
		| cat - $nav $tmp_html footer.html >$html_file;
done
