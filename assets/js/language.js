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

  function browserLanguage() {
    var list = (navigator.languages && navigator.languages.length) ? navigator.languages : [navigator.language || ""];
    for (var i = 0; i < list.length; i++) {
      var tag = String(list[i] || "").toLowerCase();
      if (tag.indexOf("zh") === 0) return "zh";
      if (tag.indexOf("en") === 0) return "en";
    }
    return "en";
  }

  // The shared entry sends visitors straight to a homepage: an explicit query
  // wins, then a saved choice, then the browser language. Without JavaScript
  // the chooser page remains as the fallback.
  if (root.dataset.languageEntry === "true") {
    var preference = requested;
    if (preference !== "zh" && preference !== "en") {
      try { preference = localStorage.getItem(key); } catch (error) { preference = null; }
      if (preference !== "zh" && preference !== "en") preference = browserLanguage();
    } else remember(preference);
    navigate(preference === "zh" ? root.dataset.chineseHome : root.dataset.englishHome);
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
