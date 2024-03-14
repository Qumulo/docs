document.addEventListener('DOMContentLoaded', (event) => {
    // Define the tags to be targeted
    const tagsToProcess = ['source', 'br', 'img'];

    tagsToProcess.forEach(tagName => {
        // Find all elements of the current tag
        document.querySelectorAll(tagName).forEach(element => {
            const outerHTML = element.outerHTML;
            const newHTML = outerHTML.replace(/\/>/g, `></${tagName}>`); // Replace self-closing syntax with full opening and closing tags

            // Replace the original element with the new one
            element.outerHTML = newHTML;
        });
    });
});
