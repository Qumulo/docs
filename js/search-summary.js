function stripHtml(html) {
    var tempDiv = document.createElement("div");
    tempDiv.innerHTML = html;
    return tempDiv.textContent || tempDiv.innerText || "";
}

function showSummary(element) {
    var summaryHtml = element.getAttribute('data-summary');
    var summaryText = stripHtml(summaryHtml); // Strip HTML from the summary
    var summaryBox = element.getElementsByClassName('summary-box')[0];
    summaryBox.innerHTML = summaryText; // Display plain text summary
    summaryBox.style.display = 'block';
}

function hideSummary() {
    var summaryBoxes = document.getElementsByClassName('summary-box');
    for (var i = 0; i < summaryBoxes.length; i++) {
        summaryBoxes[i].style.display = 'none';
    }
}

