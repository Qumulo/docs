// Configure the search widget
let searchWidget = createSearch(
  "zqt_8wQ3QoFUYf53ymz-8ceKXsxAnFNwEJsobnvK6A", // api key
  4077139778,                                   // customer id
  [2,4],                                        // array of corpus ids
                                                // 2 == Docs Portal, 4 == Qumulo Care
  successFn,                                    // success function
  errorFn,                                      // error function
  "/images/magnifying-glass.png",               // custom icon for the search box
  25,                                           // number of results to return
  5,                                            // max number of results to summarize
  1,                                            // number of sentences to show before each matching snippet
  1,                                            // number of sentences to show after each matching snippet
  "What would you like to know?",               // search placeholder
  false                                         // default focus
  //0                                           // offset for paging
);
document.getElementById("search-widget").appendChild(searchWidget);

function successFn(results) {
  hideOverlay();

  // Check if results are valid or not empty
  if (!results || results.length === 0) {
    console.log("No results to show.");
    return;
  }

  // Process the results and display them on the page.
  console.log(results);
  renderResults(results, "search-widget-results");

  // Remove suffixes from all elements within .vuiSearchResult
  const suffixToRemove = " | Qumulo Documentation";
  const searchResultElements = document.querySelectorAll(".vuiSearchResult a, .vuiSearchResult strong");
  searchResultElements.forEach(function(element) {
    if (element.textContent.includes(suffixToRemove)) {
      element.textContent = element.textContent.replace(suffixToRemove, "");
    }
  });

  // Add prefixes to qq CLI, On-Prem, and Azure guides
  const qqCLIlinks = document.querySelectorAll(".vuiSearchResult a");
  qqCLIlinks.forEach(function(link) {
    if (link.href.includes("/qq-cli-command-guide/")) {
      link.innerHTML = `qq CLI Commands: ${link.textContent}`;
    } else if (link.href.includes("/administrator-guide/")) {
      link.innerHTML = `On-Prem: ${link.textContent}`;
    } else if (link.href.includes("/azure-administrator-guide/")) {
      link.innerHTML = `Azure: ${link.textContent}`;
    }
  });

  // Remove not-useful qq CLI boilerplate
  document.querySelectorAll('.vuiSearchResult a[href*="qq-cli-command-guide"]').forEach(link => {
    // For each of these links, find any parent 'vuiSearchResult' divs
    const parentDiv = link.closest(".vuiSearchResult");
    if (parentDiv) {
      // Within these divs, find any 'vuiText--s' divs and replace their content with <br>
      parentDiv.querySelectorAll(".vuiText--s").forEach(innerDiv => {
        innerDiv.innerHTML = "<br>";
      });
    }
  });

  // Remove cookie banner boilerplate from search results
  const cookieText = "We use cookies to improve your user experience and remember your preferences on this website. If you continue to use this website, we will assume that you accept and understand our Privacy Policy, Cookie Policy, and Terms Hub.";
  const cookieElements = document.querySelectorAll(".vuiText");
  cookieElements.forEach(function(element) {
    if (element.textContent.includes(cookieText)) {
      element.textContent = element.textContent.replace(cookieText, "");
    }
  });

  // Encourage users to enter more search terms.
  const apologyText1 = "The returned results did not contain sufficient information to be summarized into a useful answer for your query. Please try a different search or restate your query differently.";
  const apologyText2 = "The returned search results did not contain sufficient information to be summarized into a useful answer for your query. Please try a different search or restate your query differently.";
  const apologyTextElements = document.querySelectorAll(".vuiText--m");
  apologyTextElements.forEach(function(element) {
    if (element.textContent.includes(apologyText1) || element.textContent.includes(apologyText2)) {
      element.textContent = `Here are some search results. To help me write a better summary, enter more search terms or ask me a question!`;
    }
  });

  // Update history state
  const state = {
    results: results,
    query: document.getElementById("search-input").value
  };
  if (history.state && history.state.results) {
    history.replaceState(state, "", "?query=" + encodeURIComponent(state.query));
  } else {
    history.pushState(state, "", "?query=" + encodeURIComponent(state.query));
  }
}

function errorFn(err) {
  hideOverlay();
  console.log(err);
  renderError(err, "search-widget-results");
}

window.addEventListener("popstate", function(event) {
  let url = new URL(window.location.href);
  let query = url.searchParams.get("query");

  if (event.state && event.state.results) {
    // Directly render the cached results for query pages
    renderResults(event.state.results, "search-widget-results");
  }
});

window.addEventListener("load", function(e) {
  // Display the default search prompt
  const searchResultsContainer = document.getElementById("search-widget-results");
  if (searchResultsContainer) {
    searchResultsContainer.innerHTML = `<div class="search-grumpquat"><p><strong>What would you like to know?</strong></p><p><span class="emoji">🔍</span> You can search for a word, a phrase, or even a question.</p><p><img src="/images/404-grumpquat.png" style="width:200px;height:232px;" alt="404 Grumpquat"></p></div>`;
  }

  // Handle the case where the page is loaded with search results in the history state
  if (history.state && history.state.results) {
    // If there are results in the history state, render them
    successFn(history.state.results);
  } 
});

// Expand left sidebar menu on page load
window.addEventListener("DOMContentLoaded", (event) => {
    var secondListItem = document.querySelector("#mysidebar > li:nth-child(2)");
    if (secondListItem) {
        secondListItem.classList.add("active");
    }
});
