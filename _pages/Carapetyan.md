---
layout: page
permalink: /Carapetyan/
nav: false
---

<style>
	table {
		font: 400 12px/1 -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
	}
	div.container.mt-5 {margin-left: 100px; min-width: 1250px;}
	h1 { font-size: 40px; }
	th { text-align: left; }
	table.browse { min-width: 1000px;}
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

<div id="search-interface"></div>

[Analysis of the catalogue](../Carapetyan_analysis/)

<div id="list"></div>

<script>
// vim: ts=3:nowrap

let METADATA = [];
let INDEX_Year		  = "Year";
let INDEX_Date        = "Date";
let INDEX_C_Address   = "Carapetyan Address";
let INDEX_C_Country   = "Carapetyan Country";
let INDEX_Sender      = "Sender";
let INDEX_Recipient   = "Recipient";
let INDEX_Info 		  = "Substance of Correspondence";
let INDEX_Archive 	  = "Archive";
let INDEX_Arch_Sig	  = "Archival Signature";

document.addEventListener("DOMContentLoaded", function () {
	METADATA = {% include metadata/correspondence.json %};
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
	output += buildSenderSelect(data);
	output += buildRecipientSelect(data); 
	output += buildYearSelect(data);
	element.innerHTML = output;
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
	let headings = [INDEX_Date, INDEX_C_Address, INDEX_C_Country, INDEX_Sender, INDEX_Recipient, INDEX_Info, INDEX_Archive, INDEX_Arch_Sig];
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
			if (typeof entry[headings[i]] !== "undefined") {
				value = entry[headings[i]];
			}
			output += "<td>";
			output += value;
			output += "</td>";
		}
		output += "</tr>\n";
	}
	return output;
}




//////////////////////////////
//
// buildSenderSelect --
//

function buildSenderSelect(data) {
	let counter = {};
	let sum = data.length;
	for (let i=0; i<sum; i++) {
		let entry = data[i];
		let sender = entry[INDEX_Sender];
		if (!sender) {
			console.error("WARNING: ", entry, " DOES NOT HAVE A SENDER");
			continue;
		}
		counter[sender] = (counter[sender] === undefined) ? 1 : counter[sender] + 1;
	}

	let slist = Object.keys(counter).sort();
	let senderCount = slist.length;
	let output = "<select class='sender' onchange='doSearch()'>\n";
	output += `<option value="">Any sender [${senderCount}]</option>`;
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
// buildRecipientSelect --
//

function buildRecipientSelect(data) {
	let counter = {};
	let sum = data.length;
	for (let i=0; i<sum; i++) {
		let entry = data[i];
		let recipient = entry[INDEX_Recipient];
		if (!recipient) {
			console.error("WARNING: ", entry, " DOES NOT HAVE A SENDER");
			continue;
		}
		counter[recipient] = (counter[recipient] === undefined) ? 1 : counter[recipient] + 1;
	}

	let rlist = Object.keys(counter).sort();
	let recipientCount = rlist.length;
	let output = "<select class='recipient' onchange='doSearch()'>\n";
	output += `<option value="">Any recipient [${recipientCount}]</option>`;
	for (let i=0; i<rlist.length; i++) {
		let name = rlist[i];
		let count = counter[rlist[i]];
		output += `<option value="${name}">${name} (${count})</option>`;
	}
	output += "</select>\n";
	return output;
}


//////////////////////////////
//
// buildYearSelect --
//

function buildYearSelect(data) {
	let counter = {};
	let sum = data.length;
	for (let i=0; i<sum; i++) {
		let entry = data[i];
		let year = entry[INDEX_Year];
		if (!year) {
			console.error("WARNING: ", entry, " DOES NOT HAVE A YEAR");
			continue;
		}
		counter[year] = (counter[year] === undefined) ? 1 : counter[year] + 1;
	}

	let ylist = Object.keys(counter).sort();
	let yearCount = ylist.length;
	let output = "<select class='year' onchange='doSearch()'>\n";
	output += `<option value="">Any year [${yearCount}]</option>`;
	for (let i=0; i<ylist.length; i++) {
		let year = ylist[i];
		let count = counter[ylist[i]];
		output += `<option value="${year}">${year} (${count})</option>`;
	}
	output += "</select>\n";
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

	let senderField = searchInterface.querySelector("select.sender");
	if (!senderField) {
		console.log("Problem finding sender field in search interface");
		return;
	}
	let senderQuery = senderField.value;

	let recipientField = searchInterface.querySelector("select.recipient");
	if (!recipientField) {
		console.log("Problem finding recipient field in search interface");
		return;
	}
	let recipientQuery = recipientField.value; 

	let yearField = searchInterface.querySelector("select.year");
	if (!yearField) {
		console.log("Problem finding year field in search interface");
		return;
	}
	let yearQuery = yearField.value; 

	if (senderQuery) {
		let tempdata = [];
		for (let i=0; i<data.length; i++) {
			let entry = data[i];
			let sender = entry[INDEX_Sender];
			if (sender === senderQuery) {
				tempdata.push(entry);
			}
		}
		data = tempdata;
	}

	if (recipientQuery) {
		let tempdata = [];
		for (let i=0; i<data.length; i++) {
			let entry = data[i];
			let recipient = entry[INDEX_Recipient];
			if (recipient == recipientQuery) {
				tempdata.push(entry);
			}
		}
		data = tempdata;
	}

	if (yearQuery) {
		let tempdata = [];
		for (let i=0; i<data.length; i++) {
			let entry = data[i];
			let year = entry[INDEX_Year];
			if (year == yearQuery) {
				tempdata.push(entry);
			}
		}
		data = tempdata;
	}

	displayBrowseTable(data);
}

</script>