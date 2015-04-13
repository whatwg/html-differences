ANOLIS = anolis

all: Overview.whatwg.html

Overview.whatwg.html: Overview.src.html ../xref Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs \
 --xref="../xref" $< $@
