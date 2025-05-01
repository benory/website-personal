## Description: Download metadata for Benjamin Ory's website
##
## Type "make" in this directory to download the JSON files for the 
## metadata into the _includes/metadata directory.
##

all: download

download:
	(cd _includes/metadata && make download)