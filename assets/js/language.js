(function () {
  "use strict";
  var root = document.documentElement;
  var key = "yangyi-wu-site-language";
  var language = root.lang === "zh" ? "zh" : "en";
  var alternate = root.dataset.alternateUrl;
  var params = new URLSearchParams(window.location.search);
  var requested = params.get("lang");

  function remember(value) {
    try { localStorage.setItem(key, value); } catch (error) { /* Storage is optional. */ }
  }

  function navigate(target) {
    var url = new URL(target, window.location.origin);
    params.delete("lang");
    url.search = params.toString();
    url.hash = window.location.hash;
    window.location.replace(url.href);
  }

  document.addEventListener("click", function (event) {
    var link = event.target.closest("[data-language-option]");
    if (link) remember(link.dataset.languageOption);
  });

  // Preserve old shared publication URLs, including their language query.
  if (requested === "zh" || requested === "en") {
    remember(requested);
    if (requested !== language && alternate) navigate(alternate);
    else {
      params.delete("lang");
      history.replaceState(null, "", window.location.pathname + (params.toString() ? "?" + params.toString() : "") + window.location.hash);
    }
    return;
  }

  // Explicit deep links keep their language; only the default home chooses one.
  if (root.dataset.siteHome !== "true" || language !== "en" || !alternate) return;
  var preference;
  try { preference = localStorage.getItem(key); } catch (error) { /* Use browser preferences. */ }
  if (preference !== "zh" && preference !== "en") {
    var languages = navigator.languages || [navigator.language || "en"];
    preference = "en";
    for (var i = 0; i < languages.length; i++) {
      var candidate = languages[i].toLowerCase().split(/[-_]/)[0];
      if (candidate === "zh" || candidate === "en") { preference = candidate; break; }
    }
  }
  if (preference === "zh") navigate(alternate);
})();
