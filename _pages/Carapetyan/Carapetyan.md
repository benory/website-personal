---
layout: modern_page
title: catalogue of correspondence
permalink: /Carapetyan/
nav: false
---

{% include_relative styles-local.html %}
{% include_relative scripts-local.html %}
{% include_relative scripts-listeners.html %}

<main class="correspondence-page modern-wrap">
  <header class="correspondence-header">
    <h1>Catalogue of Correspondence for Armen Carapetyan (1908–92)</h1>
  </header>

  <div class="correspondence-intro">
    <p>Few figures were as consequential for the study of early music in the twentieth century as the music publisher Armen Carapetyan. In 1944 Carapetyan founded the American Institute of Musicology, an organization that over the past seventy years has published a wealth of fifteenth- and sixteenth-century music for the first time in modern notation. As my article shows, Carapetyan changed the course of musicological research by offering scholars significant monetary incentives to publish editions of repertoire he deemed worthy.</p>
    <p class="correspondence-citation">This page serves as an appendix to my article “<a href="https://doi.org/10.1525/jm.2025.42.4.452">Financial Incentives for Music Scholarship: The Case of Armen Carapetyan and the American Institute of Musicology</a>,” <i>Journal of Musicology</i> 42 (2025): 452–81. I am grateful to Bonnie J. Blackburn (1939–2026) for carefully copyediting this catalogue.</p>
  </div>

  <form class="correspondence-controls" role="search" aria-label="Search correspondence">
    <div class="correspondence-field correspondence-search-field">
      <label for="correspondence-search">Search the catalogue</label>
      <input id="correspondence-search" type="search" placeholder="Names, topics, archives…" autocomplete="off" aria-controls="correspondence-results">
    </div>
    <div class="correspondence-field">
      <label for="correspondence-sender">Sender</label>
      <select id="correspondence-sender" aria-controls="correspondence-results">
        <option value="">Any sender</option>
      </select>
    </div>
    <div class="correspondence-field">
      <label for="correspondence-recipient">Recipient</label>
      <select id="correspondence-recipient" aria-controls="correspondence-results">
        <option value="">Any recipient</option>
      </select>
    </div>
    <div class="correspondence-field">
      <label for="correspondence-year">Year</label>
      <select id="correspondence-year" aria-controls="correspondence-results">
        <option value="">Any year</option>
      </select>
    </div>
    <div class="correspondence-tools">
      <div class="correspondence-download">
        <a href="{{ '/assets/csv/Carapetyan_correspondence.csv' | relative_url }}" download>Download CSV</a>
        <span>Last updated {{ site.data.Carapetyan.csv_metadata.last_updated }}</span>
      </div>
      <div class="correspondence-filter-status">
        <span id="correspondence-count" role="status" aria-live="polite" aria-atomic="true"></span>
        <button id="correspondence-clear" type="button" disabled>Clear filters</button>
      </div>
    </div>
  </form>

  <div id="correspondence-results">
    <table class="correspondence-table" role="table" aria-label="Correspondence catalogue">
      <colgroup>
        <col class="correspondence-date-column">
        <col class="correspondence-people-column">
        <col class="correspondence-summary-column">
        <col class="correspondence-reference-column">
      </colgroup>
      <thead role="rowgroup">
        <tr role="row">
          <th scope="col" role="columnheader">Date / address</th>
          <th scope="col" role="columnheader">Correspondents</th>
          <th scope="col" role="columnheader">Substance of correspondence</th>
          <th scope="col" role="columnheader">Archival reference</th>
        </tr>
      </thead>
      <tbody id="correspondence-entries" role="rowgroup"></tbody>
    </table>
    <div id="correspondence-empty" class="correspondence-empty" hidden>
      <h2>No matching correspondence</h2>
      <p>Try another name or topic, or clear the filters to browse all entries.</p>
      <button id="correspondence-empty-clear" type="button">Clear filters</button>
    </div>
  </div>
  <noscript>
    <p>Please enable JavaScript to browse the catalogue, or <a href="{{ '/assets/csv/Carapetyan_correspondence.csv' | relative_url }}" download>download the complete catalogue as a CSV</a>.</p>
  </noscript>
</main>
