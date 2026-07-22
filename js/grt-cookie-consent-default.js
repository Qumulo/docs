window.dataLayer = window.dataLayer || [];
function gtag() { dataLayer.push(arguments); }

// Read saved user choice from cookie
var match = document.cookie.match(new RegExp('(^| )acceptgrt=([^;]+)'));
var userChoice = match ? match[2] : null;

if (userChoice === 'all') {
  gtag('consent', 'default', {
    'analytics_storage': 'granted',
    'ad_storage': 'granted',
    'ad_user_data': 'granted',
    'ad_personalization': 'granted'
  });
} else {
  // Default to DENIED for initial visits, 'essential', or 'deny'
  gtag('consent', 'default', {
    'analytics_storage': 'denied',
    'ad_storage': 'denied',
    'ad_user_data': 'denied',
    'ad_personalization': 'denied'
  });
}
