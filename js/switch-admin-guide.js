// Renders a "Switch Platform Guide" list above .post-content when the current
// page exists in one or more sibling guides. The list is injected only on
// administrator-guide by this script, called from footer.html. The script
// uses sitemap.xml to perform peer detection.
(function () {

  // Specify the admin guide user-friendly names for the switcher
  const GUIDES = [
    { slug: 'administrator-guide', label: 'On-Premises Admin Guide' },
    { slug: 'azure-native-administrator-guide', label: 'Azure Native Qumulo Admin Guide' },
    { slug: 'cloud-native-aws-administrator-guide', label: 'Cloud Native Qumulo on AWS Admin Guide' },
    { slug: 'cloud-native-azure-administrator-guide', label: 'Cloud Native Qumulo on Azure Admin Guide' },
    { slug: 'cloud-native-gcp-administrator-guide', label: 'Cloud Native Qumulo on GCP Admin Guide' },
  ];

  // Split the current URL pathname into the guide slug (first segment)
  // and the path remainder
  function getCurrentGuideAndPath() {
    const parts = window.location.pathname.replace(/^\//, '').split('/');
    const slug = parts[0];
    const rest = parts.slice(1).join('/');
    return { slug, rest };
  }

  // Builds and returns a <div> that contains the <select> list or `null`
  // if no peer guides contain the current page (if only the placeholder
  // option exists)
  function buildDropdown(currentSlug, availableSlugs, rest) {
    const wrapper = document.createElement('div');
    wrapper.style.cssText = 'margin-bottom:12px;';

    const select = document.createElement('select');
    select.style.cssText = 'font-size:14px;font-weight:bold;color:#f7981f;padding:2px 4px;';

    // Specify the default placeholder text
    const placeholder = document.createElement('option');
    placeholder.value = '';
    placeholder.textContent = 'Switch Platform Guide';
    select.appendChild(placeholder);

    // For each guide that isn't the current guide and is confirmed to have
    // an identical page file in the sitemap, add one option to the list
    GUIDES.forEach(function (g) {
      if (g.slug === currentSlug) return;
      if (!availableSlugs.has(g.slug)) return;
      const opt = document.createElement('option');
      opt.value = '/' + g.slug + '/' + rest;
      opt.textContent = g.label;
      select.appendChild(opt);
    });

    // If only the placeholder exists, there are no peers
    if (select.options.length <= 1) return null;

    // Navigate immediately upon selection
    select.addEventListener('change', function () {
      if (select.value) window.location.href = select.value;
    });

    wrapper.appendChild(select);
    return wrapper;
  }

  function init() {
    const postContent = document.querySelector('.post-content');
    if (!postContent) return;
    
    const { slug, rest } = getCurrentGuideAndPath();
    if (!rest) return;
    
    const pageFile = rest.split('/').pop();

    // Skip landing pages (index.html exists in every guide)
    if (!pageFile || pageFile === 'index.html') return;
    
    console.log('guide switcher: pageFile is', pageFile);

    // Fetch the sitemap and collect every guide slug that contains
    // a URL whose file name matches the file name of the current page
    fetch('/sitemap.xml')
      .then(function (r) { return r.text(); })
      .then(function (xml) {
        const parser = new DOMParser();
        const doc = parser.parseFromString(xml, 'application/xml');
        const locs = Array.from(doc.querySelectorAll('loc')).map(function (el) {
          return el.textContent.trim();
        });
        
        const availableSlugs = new Set();
        locs.forEach(function (url) {
          const path = url.replace('https://docs.qumulo.com/', '');
          const pathParts = path.split('/');
          const guideSlug = pathParts[0];
          const fileName = pathParts[pathParts.length - 1];
          if (fileName === pageFile && GUIDES.some(function (g) { return g.slug === guideSlug; })) {
            availableSlugs.add(guideSlug);
          }
        });
        
        console.log('guide switcher: availableSlugs', availableSlugs);
        const result = buildDropdown(slug, availableSlugs, rest);
        console.log('guide switcher: result', result);

        // Insert the list immediately before .post-content
        if (result) {
          postContent.parentNode.insertBefore(result, postContent);
        }
      })
      .catch(function (err) { console.error('guide switcher error:', err); });
  }

  // Run the script after the DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
