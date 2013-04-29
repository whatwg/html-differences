ANOLIS = anolis

all: Overview.html

Overview.html: Overview.src.html ../xref Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs --w3c-shortname="html5-diff" \
	--filter=".not-draft" --xref="../xref" $< $@

tr: Overview.src.html ../xref Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs --w3c-shortname="html5-diff" \
	--filter=".not-tr" --xref="../xref" --pubdate="$(PUBDATE)" --w3c-status=WD \
	$< TR.html
