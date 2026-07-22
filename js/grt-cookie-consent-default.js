window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}

var match = document.cookie.match(new RegExp('(^| )acceptgrt=([^;]+)'));
var userChoice = match ? match[2] : null;

gtag('js', new Date());

// Set default consent state BEFORE GA config runs
gtag('consent', 'default', {
  'analytics_storage': userChoice === 'all' ? 'granted' : 'denied',
  'ad_storage': userChoice === 'all' ? 'granted' : 'denied',
  'ad_user_data': userChoice === 'all' ? 'granted' : 'denied',
  'ad_personalization': userChoice === 'all' ? 'granted' : 'denied'
});

gtag('config', 'G-81J7N4LMSE', { 
  cookie_flags: 'SameSite=None;Secure'
});
