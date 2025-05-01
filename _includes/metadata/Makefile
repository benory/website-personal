#Makefile for Personal Website

#SID for Carapetyan catalogue
SID = AKfycbx3BwTcqQzwUHVMfqKCTsIXyZR_bxdm5i7mdYJUdfE3xDVXuX770sxFlYNyJZomrIi8Qg

#SID for Archives
SID2 = AKfycbxcXB7kzf4JiBGsdIi2lKwKw2TxRkHowafaKh1RTtfG4wAi3Xi7C4wopWVoYxxxYSfsUg

all: download

download: Carapetyan_correspondence Ory_archives

Carapetyan_correspondence:
	curl -L "https://script.google.com/macros/s/$(SID)/exec?sheet=correspondence" -o Carapetyan_correspondence.json
	curl -L "https://script.google.com/macros/s/$(SID)/exec?sheet=correspondence&format=csv" -o temp_Carapetyan_correspondence.csv

	if ! cmp -s temp_Carapetyan_correspondence.csv ../../assets/csv/Carapetyan_correspondence.csv; then \
		mv temp_Carapetyan_correspondence.csv ../../assets/csv/Carapetyan_correspondence.csv; \
		mkdir -p ../../_data/Carapetyan; \
		date +"last_updated: %e %B %Y" | sed 's/^ *//g' > ../../_data/Carapetyan/csv_metadata.yml; \
	else \
		rm temp_Carapetyan_correspondence.csv; \
	fi

Ory_archives:
	curl -L "https://script.google.com/macros/s/$(SID2)/exec?sheet=Catalogue" -0 > Ory_archives.json