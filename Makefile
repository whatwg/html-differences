ANOLIS = anolis

all: Overview.html Overview.whatwg.html

Overview.html: Overview.src.html ../xref Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs --w3c-shortname="html5-diff" \
	--filter=".not-draft, .not-w3c" --xref="../xref" $< $@

Overview.whatwg.html: Overview.src.html ../xref Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs \
	--filter=".not-draft, .not-whatwg" --xref="../xref" $< $@

tr: Overview.src.html ../xref Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs --w3c-shortname="html5-diff" \
	--filter=".not-tr, .not-whatwg" --xref="../xref" --pubdate="$(PUBDATE)" --w3c-status=WD \
	$< TR.html
