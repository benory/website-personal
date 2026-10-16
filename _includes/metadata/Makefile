# Use the shared direct-CSV downloader for both personal website catalogues.
SHEET_TOOLS ?= ../../../digital-projects-tools/sheet-downloads
SHEET_PYTHON ?= python3
DOWNLOAD = $(SHEET_PYTHON) "$(SHEET_TOOLS)/download.py" --config "$(SHEET_TOOLS)/config/personal.json" --website "$(abspath ../..)"
TABLES = Carapetyan_correspondence Ory_archives

.DEFAULT_GOAL := all
.PHONY: all download $(TABLES)

all: download

# Fetch and validate both catalogues before replacing any metadata.
download:
	$(DOWNLOAD)

$(TABLES):
	$(DOWNLOAD) --table "$@"
