# Refresh personal website metadata directly from Google Sheets.
.DEFAULT_GOAL := all
.PHONY: all download Carapetyan_correspondence Ory_archives

all: download

download Carapetyan_correspondence Ory_archives:
	$(MAKE) -C _includes/metadata $@
