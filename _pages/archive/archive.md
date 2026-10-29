---
layout: modern_page
title: archival materials
permalink: /archive/
nav: false

---

{% include_relative styles-local.html %}
{% include_relative scripts-local.html %}
{% include_relative scripts-listeners.html %}

<main class="archive-page modern-wrap">
  <header class="archive-header">
    <h1>Archival Materials</h1>
  </header>

  <div class="archive-intro">
    <p>I collect correspondence, research papers, concert programs, and other materials relating to the history of musicology and twentieth-century musical life. Holdings include the papers of Peter and Ursula Gradenwitz, a scrapbook of materials for Gustave Reese’s <i>Music in the Middle Ages</i> (1940), and unpublished research by Walter Gerstenberg. The collection also includes a piano-vocal score from an early nineteenth-century opera by Stefano Pavesi.</p>
  </div>

  <form class="archive-controls" role="search" aria-label="Search archival materials">
    <div class="archive-field archive-search-field">
      <label for="archive-search">Search the catalogue</label>
      <input id="archive-search" type="search" placeholder="Names, titles, dates…" autocomplete="off" aria-controls="archive-results">
    </div>
    <div class="archive-field">
      <label for="archive-collection">Collection</label>
      <select id="archive-collection" aria-controls="archive-results">
        <option value="">All collections</option>
      </select>
    </div>
    <div class="archive-field">
      <label for="archive-access">Online access</label>
      <select id="archive-access" aria-controls="archive-results">
        <option value="">All materials</option>
        <option value="online">With online links</option>
        <option value="offline">Without online links</option>
      </select>
    </div>
    <button id="archive-clear" type="button" disabled>Clear filters</button>
  </form>

  <p id="archive-count" class="archive-status" role="status" aria-live="polite" aria-atomic="true"></p>
  <div id="archive-results"></div>
  <div id="archive-empty" class="archive-empty" hidden>
    <h2>No matching materials</h2>
    <p>Try another name or title, or clear the filters to browse all collections.</p>
    <button id="archive-empty-clear" type="button">Clear filters</button>
  </div>
  <noscript>
    <p>Please enable JavaScript to browse the catalogue, or <a href="mailto:{{ site.email }}">contact me about the collection</a>.</p>
  </noscript>
</main>
