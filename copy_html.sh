HTMLS=$(find ./_site -name "*.html" | grep -v "/html/" | grep -v "/node_modules/" | grep -v "index");

for html in $HTMLS; do
	echo $html;
	cp $html ./html;
done
