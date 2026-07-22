(function ($) {
  $.fn.grtCookie = function (options) {
    var settings = $.extend({ duration: 365 }, options);

    // Read cookie by name
    function getCookie(name) {
      var match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
      return match ? match[2] : null;
    }

    // Delete cookies across all potential domains and paths
    function eraseCookie(name) {
      var domains = [window.location.hostname, '.' + window.location.hostname.replace(/^www\./, ''), '.qumulo.com'];
      var paths = ['/', '/legal'];

      domains.forEach(function (domain) {
        paths.forEach(function (path) {
          document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=' + path + '; domain=' + domain + ';';
          document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=' + path + ';';
        });
      });
    }

    // Sets acceptgrt cookie
    function setConsent(level) {
      var d = new Date();
      d.setTime(d.getTime() + (settings.duration * 24 * 60 * 60 * 1000));
      var expires = "expires=" + d.toUTCString();
      document.cookie = "acceptgrt=" + level + ";" + expires + ";path=/;SameSite=Lax;Secure";
    }

    // Update Google Analytics Consent Mode dynamically
    function updateGoogleConsent(status) {
      if (typeof gtag === 'function') {
        gtag('consent', 'update', {
          'analytics_storage': status,
          'ad_storage': status,
          'ad_user_data': status,
          'ad_personalization': status
        });
      }
    }

    // Clear local GA cookies manually
    function removeGACookies() {
      var cookies = document.cookie.split(";");
      for (var i = 0; i < cookies.length; i++) {
        var cookieName = cookies[i].split("=")[0].trim();
        if (cookieName === "_ga" || cookieName.indexOf("_ga_") === 0) {
          eraseCookie(cookieName);
        }
      }
    }

    // Apply UI state and cookie purges
    function applyConsentRules(consentLevel) {
      if (consentLevel === "deny") {
        // Hide ONLY the non-essential/tracking elements (keep #view-favorites visible!)
        $("#tg-sb-link").hide();
        
        // Purge non-essential cookies
        removeGACookies();
        eraseCookie("reading_mode");
      } else if (consentLevel === "essential") {
        removeGACookies();
        $("#tg-sb-link").show();
      } else if (consentLevel === "all") {
        $("#tg-sb-link").show();
      }
    }

    var consentState = getCookie("acceptgrt");

    // If user has already made a choice on a previous pageview, hide banner and enforce rules
    if (consentState) {
      this.remove();
      applyConsentRules(consentState);
    } else {
      // Show the banner to first-time visitors
      this.addClass("grt-cookie-active");
    }

    var $banner = this;

    // Allow All
    $banner.find("span.grt-allow-all").on("click", function () {
      setConsent("all");
      updateGoogleConsent('granted');
      $banner.remove();
      applyConsentRules("all");
      if ($('#search-input').length) $('#search-input').focus();
    });

    // Essential Only
    $banner.find("span.grt-essential-only").on("click", function () {
      setConsent("essential");
      updateGoogleConsent('denied');
      $banner.remove();
      applyConsentRules("essential");
      if ($('#search-input').length) $('#search-input').focus();
    });

    // Deny All
    $banner.find("span.grt-deny-all").on("click", function () {
      setConsent("deny");
      updateGoogleConsent('denied');
      $banner.remove();
      applyConsentRules("deny");
      if ($('#search-input').length) $('#search-input').focus();
    });

    return this;
  };
}(jQuery));
