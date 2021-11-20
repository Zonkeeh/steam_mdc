# Steam MDC Makefile	(https://github.com/Zonkeeh/steam_mdc)

ifeq ($(PREFIX),)
	PREFIX := /usr/local
endif

# Ensure 'steam_mdc' is in the current directory
exists :
	git checkout --force -- steam_mdc

# Install 'steam_mdc' in the specified directory
install :
	exists
	chmod 755 steam_mdc && \
	mkdir -v -p $(DESTDIR)$(PREFIX)/bin && \
	cp -v steam_mdc $(DESTDIR)$(PREFIX)/bin/steam_mdc

# Update 'steam_mdc'
update :
	rm -f steam_mdc
	git fetch --verbose --force
	exists

# Uninstall 'steam_mdc'
uninstall :
	rm -f $(DESTDIR)$(PREFIX)/bin/steam_mdc

.PHONY: install update uninstall
