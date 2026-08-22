# Makefile for draft-client-side-adox-request
#
# Toolchain:
#   kramdown-rfc  (Markdown -> xml2rfc v3 XML)
#   xml2rfc       (XML -> text / html)

DRAFT = draft-client-side-adox-request-00

KRAMDOWN_RFC ?= kramdown-rfc
XML2RFC      ?= xml2rfc

.PHONY: all txt html xml clean

# Build the text and HTML renderings (the usual deliverables).
all: txt html

txt: $(DRAFT).txt
html: $(DRAFT).html
xml: $(DRAFT).xml

# Markdown -> XML
$(DRAFT).xml: $(DRAFT).md
	$(KRAMDOWN_RFC) $< > $@

# XML -> text
$(DRAFT).txt: $(DRAFT).xml
	$(XML2RFC) --text $< -o $@

# XML -> HTML
$(DRAFT).html: $(DRAFT).xml
	$(XML2RFC) --html $< -o $@

clean:
	rm -f $(DRAFT).xml $(DRAFT).txt $(DRAFT).html
	rm -rf .refcache
