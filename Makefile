SHELL = /bin/bash

prefix ?= /usr/local
bindir ?= $(prefix)/bin
srcdir = src

.DEFAULT_GOAL = uti

.PHONY: uti
uti: $(srcdir)/uti.bash
	@cp $< $@
	@chmod +x $@

.PHONY: check
check: uti
	@set -e ; \
	EXPECTED="public.data"; \
	ACTUAL=$$(uti Makefile); \
	if [ "$$EXPECTED" != "$$ACTUAL" ]; then \
		echo "Expected: \"$$EXPECTED\"";\
		echo "Actual: \"$$ACTUAL\""; \
		exit 1; \
	fi

.PHONY: install
install: uti
	@install -d "$(bindir)"
	@install uti "$(bindir)"

.PHONY: uninstall
uninstall:
	@rm -rf "$(bindir)/uti"

.PHONY: clean
clean:
	@rm -f uti
