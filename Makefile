# Steam MDC Makefile
#		Source:	https://github.com/Zonkeeh/steam_mdc

ifeq ($(DIST),)
	DIST := /usr/local/bin
endif

# Ensure 'steam_mdc' is in the current directory
exists :
	git checkout --force -- steam_mdc

# Install 'steam_mdc' in the specified directory
install : exists
	chmod 755 steam_mdc && \
	mkdir -v -p $(DIST) && \
	cp -v steam_mdc $(DIST)/steam_mdc

# Update 'steam_mdc'
update :
	rm -f steam_mdc
	git fetch --verbose --force

# Uninstall 'steam_mdc'
uninstall :
	rm -f $(DIST)/steam_mdc

.PHONY: install update uninstall
