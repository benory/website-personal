---
layout: page
title: Ory's archive
permalink: /archive/
nav: true
---

My collection includes a number of archival documents that pertain to the history of musicology. I'd be happy to provide high-quality, publication-ready scans of these materials. It includes pages from a scrapbook of publicity materials for Gustave Reese's  _Music in the Middle Ages_ (1940), the original copy of Walter Gerstenberg's unpublished Habilitationsschrift, "Beiträge zur Problemgeschichte der evangelischen Kirchenmusik" (1935), and the collected papers for Peter Gradenwitz (1910–2001), a German-Israeli musicologist.

<div id="search-interface"></div>
<div id="list"></div>

<style>
	table {
		font: 400 12px/1 -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
	}
	div.container.mt-5 {margin-left: 100px; min-width: 1250px;}
	h1 { font-size: 40px; }
	th { text-align: left; }
	table.browse { min-width: 1250px;}
	table.browse { margin-left: auto; margin-right: auto; } /* center table */
	table.browse { border-collapse: collapse; } /* don't put gaps between cells */
	table.browse th { background:skyblue;}
	table.browse td, table.browse th { padding-left: 2px; padding-top: 2px; padding: 2px}
	table.browse tr:hover { background:#ff000011; }
	a { text-decoration: none; }
	#search-interface { margin-bottom: 30px; }
	.wrapper {margin-left: 10px;}
	table.browse td:nth-child(1)  {white-space: nowrap;}
	table.browse td:nth-child(3) {white-space: nowrap;}
	table.browse td:nth-child(6) {min-width: 250px}

</style>

<script>
// vim: ts=3:nowrap

let METADATA = [];
let INDEX_Series		= "Series";
let INDEX_Folder        = "Folder";
let INDEX_Series_Info   = "Series Description";
let INDEX_Folder_Info   = "Folder Description";
let INDEX_Scanned      	= "Scanned";
let INDEX_Acquisition   = "Acquisition Information";
let INDEX_Permissions   = "Permissions";
let INDEX_Hidden		= "Hidden";
let INDEX_URL			= "URL";
let INDEX_Image			= "Image Available";

document.addEventListener("DOMContentLoaded", function () {
	METADATA = {% include archives/archives.json %};
	buildSearchInterface(METADATA, "#search-interface");
	displayBrowseTable(METADATA, "#list"); 
});

//////////////////////////////
//
// buildSearchInterface --
//

function buildSearchInterface(data, selector) {
	if (!selector) {
		selector = "#search-interface";
	}
	let element = document.querySelector(selector);
	if (!element) {
		console.error(`Error: cannot find ${selector} element to create search interface`);
		return;
	}

	let output = "";
	output += buildSeriesSelect(data);
	output += buildImageSelect(data);
	element.innerHTML = output;
}


//////////////////////////////
//
// buildSeriesSelect --
//

function buildSeriesSelect(data) {
	let counter = {};
	let sum = data.length;
	for (let i=0; i<sum; i++) {
		let entry = data[i];
		let series = entry[INDEX_Series_Info];
		if (!series) {
			console.error("WARNING: ", entry, " DOES NOT HAVE A SERIES");
			continue;
		}
		counter[series] = (counter[series] === undefined) ? 1 : counter[series] + 1;
	}

	let slist = Object.keys(counter).sort();
	let seriesCount = slist.length;
	let output = "<select class='series' onchange='doSearch()'>\n";
	output += `<option value="">Any archival series [${seriesCount}]</option>`;
	for (let i=0; i<slist.length; i++) {
		let name = slist[i];
		let count = counter[slist[i]];
		output += `<option value="${name}">${name} (${count})</option>`;
	}
	output += "</select>\n";
	return output;
}

//////////////////////////////
//
// buildImageSelect --
//

function buildImageSelect(data) {
	let counter = {};
	let sum = data.length;
	for (let i=0; i<sum; i++) {
		let entry = data[i];
		let image = entry["Image Available"];
		if (!image) {
			console.error("WARNING: ", entry, " DOES NOT HAVE AN IMAGE AVAILABLE");
			continue;
		}
		counter[image] = (counter[image] === undefined) ? 1 : counter[image] + 1;
	}

	let ilist = Object.keys(counter).sort();
	let output = "<select class='image' onchange='doSearch()'>\n";
	output += `<option value="">Image available online?</option>`;
	for (let i=0; i<ilist.length; i++) {
		let name = ilist[i];
		output += `<option value="${name}">${name}</option>`;
	}
	output += "</select>\n";
	return output;
}


//////////////////////////////
//
// displayBrowseTable --
//

function displayBrowseTable(data, selector) {
	if (!selector) {
		selector = "#list";
	}
	let element = document.querySelector(selector);
	if (!element) {
		console.error(`Error: cannot find ${selector} element to display work table`);
		return;
	}
	let headings = [INDEX_Series, INDEX_Series_Info, INDEX_Folder, INDEX_Folder_Info];
	let contents = "";
	contents += "<table class='browse'>\n";
	contents += "<thead>\n";
	contents += makeTableHeader(headings);
	contents += "</thead>\n";
	contents += "<tbody>\n";
	contents += makeTableBody(headings, data);
	contents += "</tbody>\n";
	contents += "</table>\n";
	element.innerHTML = contents;
}

//////////////////////////////
//
// makeTableHeader -- Generate HTML content for browse table header.
//

function makeTableHeader(headings) {
	let output = `<th>${headings.join("</th><th>")}</th>\n`;
	return output;
}


//////////////////////////////
//
// makeTableBody -- Generate HTML content for browse table's body.
//

function makeTableBody(headings, data) {
	let output = "";
	for (let i=0; i<data.length; i++) {
		let entry = data[i];
		output += "<tr>";
		for (let i=0; i<headings.length; i++) {
			let value = "";
			let URL = entry["URL"];
			if (typeof entry[headings[i]] !== "undefined") {
				value = entry[headings[i]];
			}
			let hidden = entry["Hidden"];
			if (hidden == "no"){
				output += "<td>";
				if (value.match(":")){
					value = value.replace(':', '<br /><br />');
				}
				if (value.match(";")){
					value = value.replace(/(;)+/g, '<br />');
					console.warn(value, "value");
				}

				if (URL){
					if (headings[i] == INDEX_Folder_Info) {
						output += `<a target="_blank" href="${URL}">${value}</a>`;
					} else {
						output += value;
					}
				} else {
					output += value;	
				}
				output += "</td>";
			}
		}
		if (output !== ""){
			output += "</tr>\n";
		}
	}
	return output;
}


//////////////////////////////
//
// doSearch --
//

function doSearch(data) {
	if (!data) {
		data = METADATA;
	}

	let searchInterface = document.querySelector("#search-interface");
	if (!searchInterface) {
		console.log("Problem finding search interface");
		return;
	}

	let seriesField = searchInterface.querySelector("select.series");
	if (!seriesField) {
		console.log("Problem finding series field in search interface");
		return;
	}
	let seriesQuery = seriesField.value;

	let imageField = searchInterface.querySelector("select.image");
	if (!imageField) {
		console.log("Problem finding series field in search interface");
		return;
	}
	let imageQuery = imageField.value;

	if (seriesQuery) {
		let tempdata = [];
		for (let i=0; i<data.length; i++) {
			let entry = data[i];
			let series = entry[INDEX_Series_Info];
			if (series === seriesQuery) {
				tempdata.push(entry);
			}
		}
		data = tempdata;
	}

	if (imageQuery) {
		let tempdata = [];
		for (let i=0; i<data.length; i++) {
			let entry = data[i];
			let image = entry[INDEX_Image];
			if (image === imageQuery) {
				tempdata.push(entry);
			}
		}
		data = tempdata;
	}

	displayBrowseTable(data);
}

</script>