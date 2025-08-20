//////////////////////////////////////////////////////////
// The section below creates an overlay to make it more obvious that a search is running
//////////////////////////////////////////////////////////
function createOverlay() {
  const overlay = document.createElement('div');
  overlay.id = 'search-overlay';
  overlay.style.position = 'fixed';
  overlay.style.top = '0';
  overlay.style.left = '0';
  overlay.style.width = '100%';
  overlay.style.height = '100%';
  overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
  overlay.style.display = 'none';
  overlay.style.justifyContent = 'center';
  overlay.style.alignItems = 'center';
  overlay.style.zIndex = '1000';

  const message = document.createElement('h1');
  message.textContent = 'Searching Documentation...';
  message.style.color = 'white';

  overlay.appendChild(message);

  return overlay;
}

// Append the overlay to the body and keep it hidden
document.body.appendChild(createOverlay());

function showOverlay() {
  document.getElementById('search-overlay').style.display = 'flex';
  if (document.querySelector('.vuiTitle')) {
    return;
  } else {
    document.querySelectorAll('.post-title-main, .nav, #mysidebar, .search-grumpquat').forEach(element => {
      element.style.display = 'none';
    });
  }
}

function hideOverlay() {
  document.getElementById('search-overlay').style.display = 'none';
  if (document.querySelector('.vuiTitle')) {
    return;
  } else {
    document.querySelectorAll('.post-title-main, .nav, #mysidebar, .search-grumpquat').forEach(element => {
      element.style.display = 'block';
    });
  }
}

//////////////////////////////////////////////////////////
// The section below handles initialization of the search component and execution of searches.
//////////////////////////////////////////////////////////

function createSearch(
  apikey,
  customerId,
  corpusKeys,
  successFn,
  errorFn,
  icon,
  pageSize = 10,
  maxSummarizedResults = 5,
  sentencesBefore = 2,
  sentencesAfter = 2,
  placeholder = "Enter what you want to ask about",
  autofocus = true,
  // add `offset = 0` once pagination is supported
) {
  const searchDiv = document.querySelector('.vectara__search_Box');
  const searchInput = document.querySelector('#search-input');
  const pulseButton = document.querySelector('.vectara__logo_btn');
  const pulseLogo = document.querySelector('.vectara__search_logo');
  const searchForm = document.querySelector('#vectara__search_form');

  const currentPage = window.location.pathname; // Current URL
  const queryParam = new URLSearchParams(window.location.search).get('query'); // Current query parameter

  let length = 0; // length to pass to the pagination
  let queryText = ""; // queryText is text on which to search, used to pass to the pagination
  let offset = 0; // remove the following line once pagination is supported

  // Search from the input box
  function handleDirectSearch(query) {
    submitFn(searchInput.value.trim(), offset);
  }

  if (icon) {
    pulseLogo.src = icon;
  } else {
    pulseLogo.src = logo;
  }

  if (currentPage.includes('search.html')) {
    searchForm.addEventListener('submit', function(e) {
      e.preventDefault();
      // Always perform the search on form submission, regardless of the query parameter.
      // This allows users to "refresh" their search by submitting the same term again.
      handleDirectSearch();
    });

    // On page load, if there's a query parameter and it's different from the current input value,
    // or if the input is empty (implying direct navigation with a query parameter),
    // perform the search immediately. This avoids ignoring user attempts to refresh the search
    // for the same term via the UI.
    if (queryParam && (searchInput.value.trim() !== queryParam || searchInput.value.trim() === "")) {
      searchInput.value = queryParam;
      handleDirectSearch();
    }
  }

  /**
   * function can be called from anywhere like vectaraSearch.submitFn(query)
   * @param {string} query results will come on behalf of query string
   */

  function submitFn(query, startFrom = offset) {
    console.log("submitFn called with query:", query);
    if (query !== "") {
      queryText = query;
      pulseLogo.classList.add("vectara__search_loading");
      showOverlay();
      searchInput.value = query;

      const corpusKeyObjArr = [];
      corpusKeys.forEach(element => {
        const corpusKeyObject = {
          "corpus_key": element,
          "lexical_interpolation": 0.1
        };
        corpusKeyObjArr.push(corpusKeyObject);
      });

      let startTime = new Date().getTime();
      fetch("https://api.vectara.io/v2/query", {
          method: "post",
          body: JSON.stringify({
            "query": query, // text to run the search
            "search": {
              "offset": startFrom, // for pagination
              "limit": pageSize, // for pagination
              "context_configuration": {
                "sentences_before": sentencesBefore,
                "sentences_after": sentencesAfter,
                "start_tag": "<strong>",
                "end_tag": "</strong>"
              },
              "corpora": corpusKeyObjArr,
              "reranker": {
                "type": "customer_reranker",
                "reranker_name": "Rerank_Multilingual_v1"
              }
            },
            "generation": {
              "generation_preset_name": "vectara-summary-table-md-query-ext-jan-2025-gpt-4o",
              "response_language": "eng",
              "max_used_search_results": maxSummarizedResults
            }
          }),
          headers: {
            "x-api-key": apikey,
            "Content-Type": "application/json",
          },
        })
        .then(async function(response) {
          pulseLogo.classList.remove("vectara__search_loading");
          const data = await response.json(); // parse promise
          console.log(`response is ${JSON.stringify(data)}`);
          if (!data.summary || !data.search_results || data.search_results.length < 1) {
            throw data;
          }
          let endTime = new Date().getTime();
          console.log(`fetch elapsedTime: ${(endTime - startTime) / 1000}`);
          return data;
        })
        .then((results) => {
          return successFn(results, query);
        })
        .catch(function(error) {
          errorFn(error);
          pulseLogo.classList.remove("vectara__search_loading");
        });
    }
  }

  searchDiv.search = function(query, startFrom = offset) {
    submitFn(query, startFrom);
  };
  searchDiv.resultsPerPage = pageSize;
  // sends query text and length to the callback function
  searchDiv.generateMeta = function(callback) {
    callback({
      queryText: queryText,
      length: length,
    });
  };

  return searchDiv;
}

//////////////////////////////////////////////////////////
// The section below defines result tab helpers
//////////////////////////////////////////////////////////

// Ensure the tabs are present in the container
function ensureResultsTabs(containerId) {
  const container = document.getElementById(containerId);
  if (!container) return { docsPanel: null, carePanel: null };

  // If the tabs already exist return only refs
  let docsPanel = container.querySelector("#vectara-docs-panel");
  let carePanel = container.querySelector("#vectara-care-panel");
  if (docsPanel && carePanel) {
    return { docsPanel, carePanel };
  }

  // Otherwise, define WAI-ARIA tabs
  container.innerHTML = `
    <div class="vuiTabs" role="tablist">
      <button id="vectara-tab-docs" role="tab" aria-controls="vectara-docs-panel" aria-selected="true" class="vuiTab">Docs Portal</button>
      <button id="vectara-tab-care" role="tab" aria-controls="vectara-care-panel" aria-selected="false" class="vuiTab">Qumulo Care</button>
    </div>
    <div id="vectara-docs-panel" role="tabpanel" aria-labelledby="vectara-tab-docs" class="vuiTabPanel"></div>
    <div id="vectara-care-panel" role="tabpanel" aria-labelledby="vectara-tab-care" class="vuiTabPanel" hidden></div>
  `;

  // Tab switching functionality
  const tabDocs = container.querySelector("#vectara-tab-docs");
  const tabCare = container.querySelector("#vectara-tab-care");
  docsPanel = container.querySelector("#vectara-docs-panel");
  carePanel = container.querySelector("#vectara-care-panel");

  function selectTab(tab) {
    if (tab === "docs") {
      tabDocs.setAttribute("aria-selected", "true");
      tabCare.setAttribute("aria-selected", "false");
      docsPanel.hidden = false;
      carePanel.hidden = true;
    } else {
      tabDocs.setAttribute("aria-selected", "false");
      tabCare.setAttribute("aria-selected", "true");
      docsPanel.hidden = true;
      carePanel.hidden = false;
    }
  }

  tabDocs.addEventListener("click", () => selectTab("docs"));
  tabCare.addEventListener("click", () => selectTab("care"));

  return { docsPanel, carePanel };
}

// Route the result to the correct tab
function pickTabForResult(res, containerId) {
  const { docsPanel, carePanel } = ensureResultsTabs(containerId);
  const url =
    (res && res.document_metadata && res.document_metadata.url) ||
    "";

  if (url.includes("care.qumulo.com")) return carePanel;
  if (url.includes("docs.qumulo.com")) return docsPanel;
  return docsPanel;
}

function wireUpTabs(containerId) {
  const container = document.getElementById(containerId);
  const tabList = container.querySelector('[role="tablist"]');
  const tabs = Array.from(tabList.querySelectorAll('[role="tab"]'));
  const panels = tabs.map(tab => {
    return document.getElementById(tab.getAttribute("aria-controls"));
  });

  function activateTab(index) {
    tabs.forEach((tab, i) => {
      const selected = i === index;
      tab.setAttribute("aria-selected", selected);
      tab.setAttribute("tabindex", selected ? "0" : "-1");
      panels[i].hidden = !selected;
    });
  }

  tabs.forEach((tab, i) => {
    tab.addEventListener("focus", () => activateTab(i));
  });

  // Initialize first tab active
  activateTab(0);
}

//////////////////////////////////////////////////////////
// The section below handles rendering search results and errors in the containing page
//////////////////////////////////////////////////////////

function renderResults(results, containerId, metadataFieldsToShow = []) {
  // Process the results and display them on the page.
  let txt = "";

  currSelectedVectaraReference = null;

  // Add headings once before the loop
  if (results.summary && results.search_results && results.search_results.length > 0) {
    txt += "<h2 class=\"vuiTitle vuiTitle--xs\" style=\"display: flex; align-items: center;\"><span class=\"emoji\">🤖</span>&nbsp;<strong>AI Summary</strong></h2>";
    const summary = linkCitations(results.summary);
    txt += "<div class=\"vuiText vuiText--m\">" + summary + "</div>";
    txt += "<div class=\"vuiSpacer vuiSpacer--m\"></div>";
    txt += "<h2 class=\"vuiTitle vuiTitle--xs\" style=\"display: flex; align-items: center;\"><span class=\"emoji\">📄</span>&nbsp;<strong>Search Results</strong></h2>";
  }

  // Ensure tabs exist & wire them up
  const { docsPanel, carePanel } = ensureResultsTabs(containerId);
  wireUpTabs(containerId);

  // Clear panels before appending fresh results
  if (docsPanel) docsPanel.innerHTML = "";
  if (carePanel) carePanel.innerHTML = "";

  // Iterate over results
  results.search_results.forEach((res, index) => {
    // Build the result HTML for each tab
    let resultHtml = "";

    // Add citation number
    resultHtml += "<div class=\"vuiSearchResult fs-mask\">";
    resultHtml += "<div id=\"searchResultCitation-" + (index + 1) + "\" class=\"vuiSearchResultPosition\">" + (index + 1) + "</div>";

    // Extract metadata
    const docMetadata = res.document_metadata;
    const partMetadata = res.part_metadata;
    const titleField = { value: docMetadata.title };
    const urlField = { value: docMetadata.url };

    // render clickable title if URL exists
    if (titleField) {
      const snippetStart = res.text.indexOf("<strong>") + 8;
      const snippetEnd = res.text.indexOf("</strong>");
      if (urlField) {
        const url = urlField.value + "#:~:text=" + res.text.substring(snippetStart, snippetEnd);
        resultHtml += "<a class=\"vuiLink vuiTitle vuiTitle--s\" rel=\"noopener\" href=\"" + url + "\" target=\"_self\">";
        resultHtml += "" + titleField.value + "";
        resultHtml += "</a>";
      } else {
        resultHtml += "" + titleField.value + "";
      }
    } else {
      // Fallback heading
      resultHtml += "<h3>" + docMetadata.title + "</h3>";
    }

    // Render snippet text
    resultHtml += "<div class=\"vuiText vuiText--s\">";
    resultHtml += res.text;
    resultHtml += "<div class=\"vuiSpacer vuiSpacer--xs\"></div>";

    // Show requested metadata fields as badges
    // First convert the input to an array if the user just passed in a string scalar
    metadataFieldsToShow = metadataFieldsToShow instanceof Array ? metadataFieldsToShow : [metadataFieldsToShow];
    metadataFieldsToShow.forEach((fieldName) => {
      if (!fieldName.startsWith("part.")) {
        // Check for document level metadata if the name starts with "doc." or does not have the part. prefix
        const fieldNameSuffix = fieldName.substring(fieldName.indexOf("doc.") + 4);
        // FoundField = docMetadata.find((field) => field.name === fieldNameSuffix);
        if (fieldNameSuffix in docMetadata) {
          resultHtml += "<div class=\"vuiBadge--success vuiBadge\">" + fieldNameSuffix + ": " + docMetadata[fieldNameSuffix] + "</div>";
        }
      } else {
        // Check for part level metadata
        const fieldNameSuffix = fieldName.substring(fieldName.indexOf("part.") + 5);
        // FoundField = res.metadata.find((field) => field.name === fieldNameSuffix);
        if (fieldNameSuffix in partMetadata) {
          resultHtml += "<div class=\"vuiBadge--success vuiBadge\">" + fieldNameSuffix + ": " + partMetadata[fieldNameSuffix] + "</div>";
        }
      }
    });

    // Close snippet
    resultHtml += "</div></div>";

    // Instead of appending results to txt,
    // append each result to the correct tab
    const tabContainer = pickTabForResult(res, containerId);
    if (tabContainer) {
      tabContainer.innerHTML += resultHtml;
    }
  });

  // Render the AI summary and section headings above
  // The results themselves are appended to tabs
  const container = document.getElementById(containerId);

  // Remove prior headings to avoid duplicates
  const oldHead = container.querySelector('#vectara-results-head');
  if (oldHead) oldHead.remove();

  // Prepend fresh headings safely
  const tablist = container.querySelector('[role="tablist"]');
  const headBlock = '<div id="vectara-results-head">' + txt + '</div>';
  if (tablist) {
    tablist.insertAdjacentHTML('beforebegin', headBlock);
  } else {
    container.insertAdjacentHTML('afterbegin', headBlock);
  }

  // Hide any tab whose panel has no content
  const tabDocs = container.querySelector("#vectara-tab-docs");
  const tabCare = container.querySelector("#vectara-tab-care");

  if (docsPanel && docsPanel.innerHTML.trim() === "") {
    tabDocs.style.display = "none";
  } else {
    tabDocs.style.display = "";
  }

  if (carePanel && carePanel.innerHTML.trim() === "") {
    tabCare.style.display = "none";
  } else {
    tabCare.style.display = "";
  }

  // Renumber positions per tab (display only; IDs stay global for citations)
  ['#vectara-docs-panel', '#vectara-care-panel'].forEach((sel) => {
    const panel = container.querySelector(sel);
    if (!panel) return;
    const items = panel.querySelectorAll('.vuiSearchResultPosition');
    items.forEach((el, i) => {
      el.dataset.global = el.textContent; // keep original global index for debugging
      el.textContent = String(i + 1);     // show 1..N within the tab
    });
  });

  // Add prefixes
  if (typeof addResultPrefixes === "function") {
    addResultPrefixes();
  }
}

function linkCitations(summary) {
  for (let i = 1; i < 15; i++) {
    var reg = new RegExp("\\[" + i + "\\]", "g");
    summary = summary.replace(reg, "<button id=\"citationButton-" + i + "\" class=\"vuiSummaryCitation\" onclick=\"clickCitation(this, " + i + ")\">" + i + "</button>");
  }

  return summary;
}

function clickCitation(clickedButton, newReferenceNum) {
  // nop if the button clicked is the one already just clicked
  if (newReferenceNum == currSelectedVectaraReference) {
    return;
  }

  // Remove 'vuiSummaryCitation-isSelected' from origDiv class list (if it was originally set)
  origDiv = document.getElementById("searchResultCitation-" + currSelectedVectaraReference);
  if (origDiv) {
    origDiv.classList.remove("vuiSearchResultPosition--selected");
  }

  // Add 'vuiSummaryCitation-isSelected' to newDiv class list
  newDiv = document.getElementById("searchResultCitation-" + newReferenceNum);
  newDiv.classList.add("vuiSearchResultPosition--selected");

  // Jump to the correct tab when a citation is clicked
  const panelEl = newDiv.closest('[role="tabpanel"]');
  if (panelEl && panelEl.hidden) {
    const labelId = panelEl.getAttribute('aria-labelledby');
    const tabBtn = labelId && document.getElementById(labelId);
    if (tabBtn) tabBtn.click();
  }

  // Remove vuiSummaryCitation-isSelected class from all buttons
  citationButtons = document.querySelectorAll("button.vuiSummaryCitation");
  if (citationButtons) {
    for (let i = 0; i < citationButtons.length; i++) {
      currButton = citationButtons[i];
      if (clickedButton.id == currButton.id) {
        currButton.classList.add("vuiSummaryCitation-isSelected");
      } else {
        currButton.classList.remove("vuiSummaryCitation-isSelected");
      }
    }
  }

  // Scroll screen to newDiv's parent
  var y = newDiv.parentElement.offsetTop - 78;
  window.scrollTo({
    top: y,
    behavior: 'smooth'
  });

  currSelectedVectaraReference = newReferenceNum;
}

function renderError(err, containerId) {
  let txt = "";

  // Vectara-style structured error
  if (
    err &&
    err.responseSet &&
    err.responseSet[0] &&
    err.responseSet[0].status &&
    err.responseSet[0].status[0]
  ) {
    txt += `<span class="vuiTitle--s">${err.responseSet[0].status[0].code}</span>: `;
    txt += `<span class="vuiText--s">${err.responseSet[0].status[0].statusDetail}</span>`;

  // Normal JS error object
  } else if (err && err.message) {
    txt += `<span class="vuiText--s">${err.message}</span>`;

  // Fallback for strings or plain objects
  } else {
    txt += `<pre>${JSON.stringify(err, null, 2)}</pre>`;
  }

  // Set innerHTML only if the container exists
  const container = document.getElementById(containerId);
  if (container) {
    container.innerHTML = txt;
  } else {
    console.error("renderError: container not found:", containerId, err);
  }
}


//////////////////////////////////////////////////////////
// The section below handles pagination in the search.
//
// NOTE !!! Pagination is not supported yet. Do not try to use it.
//          Once it is ready, you need to add the following in the
//          HTML page below where you create the searchWidget.
//            const searchPagination = createPagination(searchWidget);
//            document.getElementById("search-widget-pagination").appendChild(searchPagination);
//////////////////////////////////////////////////////////

function createPagination(widget) {
  let resultsPerPage = widget.resultsPerPage;
  let page = 0;
  let pages = [];
  let offset = 0;
  let length = 0;
  let query = "";

  const left_arrow = `<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
    </svg>`;

  const right_arrow = `<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
    </svg>`;

  // variables which are used to make pagination buttons group
  let paginationDiv = document.createElement("div");
  let previousBtn;
  let nextBtn;
  let centerBtns;

  paginationDiv.classList.add("vectara__pagination");

  // call back function, it will receive query text and length
  // of response array after every server call
  function latestMeta(result) {
    query = result.queryText;
    length = result.length;
  }

  function generatePaginationMeta() {
    // Clear the div on every run,
    // then append set of buttons
    paginationDiv.innerHTML = "";

    // create button elements
    previousBtn = document.createElement("button");
    nextBtn = document.createElement("button");
    centerBtns = document.createElement("div");

    // passing call back to the search box to get updated
    // value of length and query text
    widget.generateMeta(latestMeta);
    centerBtns.innerHTML = "";

    pages = getPages(page + 1, length, resultsPerPage);

    previousBtn.addEventListener("click", () => {
      handleSelectedPage(page - 1 >= 0 ? page - 1 : 0);
    });
    previousBtn.classList.add("btn");
    previousBtn.classList.add("left");
    previousBtn.classList.add(page === 0 ? "disable" : "none");
    previousBtn.innerHTML = `<span>${left_arrow}</span>`;

    nextBtn.addEventListener("click", () => {
      handleSelectedPage(page + 1);
    });
    nextBtn.classList.add("btn");
    nextBtn.classList.add("right");
    nextBtn.classList.add(
      length < resultsPerPage && page > 0 ? "disable" : "none"
    );
    nextBtn.innerHTML = `<span>${right_arrow}</span>`;

    const firstBtn = document.createElement("button");
    firstBtn.addEventListener("click", () => {
      handleSelectedPage(0);
    });
    firstBtn.classList.add("btn");
    firstBtn.classList.add(page + 1 === 1 ? "active_page" : "none");
    firstBtn.innerHTML = `<span>1</span>`;

    if (page > 3 && query !== "") {
      const btn = document.createElement("button");
      btn.classList.add("dots");
      btn.innerHTML = "<span>...</span>";
      centerBtns.appendChild(btn);
    }
    pages.map((p) => {
      const btn = document.createElement("button");
      btn.addEventListener("click", () => {
        handleSelectedPage(p - 1);
      });
      btn.classList.add("btn");
      btn.classList.add(page + 1 === p ? "active_page" : "none");
      btn.classList.add(
        length < resultsPerPage && page > 0 && p > page + 1 ? "disable" : "none"
      );
      btn.innerHTML = `<span>${p}</span>`;
      centerBtns.appendChild(btn);
    });

    paginationDiv.appendChild(previousBtn);
    paginationDiv.appendChild(firstBtn);
    paginationDiv.appendChild(centerBtns);
    paginationDiv.appendChild(nextBtn);
  }

  generatePaginationMeta();

  const handleSelectedPage = (pageNum) => {
    if (pageNum >= 0) {
      page = pageNum;
      offset = pageNum * resultsPerPage;
      runSearchAndPagination();
    }
  };

  const runSearchAndPagination = () => {
    widget.generateMeta(latestMeta);
    widget.search(query, offset);
    generatePaginationMeta();
  };

  return paginationDiv;
}

/**
 * @param{page} current page number
 * @param{numberOfResults} number of query results
 * @param{resultsPerPage} number of result we want to show in one time
 * @return array of numbers, which will be dsplayed as pages in the
 * pagination widget, for instance: [4, 5, 6, 7, 8]
 */
const getPages = (page, numberOfResults, resultsPerPage) => {
  let result = [];
  if (page > 3) {
    if (numberOfResults === resultsPerPage) {
      for (let i = page - 2; i <= page + 2; i++) {
        result.push(i);
      }
      return result;
    } else {
      const start = page === 4 ? page - 2 : page - 3;
      const end = page === 4 ? page + 1 : page;
      for (let i = start; i <= end; i++) {
        result.push(i);
      }
      return result;
    }
  }

  if (page <= 3) {
    for (let i = 2; i < 6; i++) {
      result.push(i);
    }
    return result;
  }

  return [];
};
