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

  // The shared entry asks new visitors; only an explicit saved choice redirects.
  if (root.dataset.languageEntry === "true") {
    var preference = requested;
    if (preference !== "zh" && preference !== "en") {
      try { preference = localStorage.getItem(key); } catch (error) { /* Keep the chooser available. */ }
    } else remember(preference);
    if (preference === "zh") navigate(root.dataset.chineseHome);
    if (preference === "en") navigate(root.dataset.englishHome);
    return;
  }

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

  // Explicit language routes and shared deep links are never overridden.
})();
