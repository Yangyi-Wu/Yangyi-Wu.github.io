(function () {
  "use strict";
  var search = document.querySelector("[data-publication-search]");
  if (!search) return;
  search.hidden = false;
  var input = search.querySelector("input");
  var theme = search.querySelector("select");
  var groups = Array.from(document.querySelectorAll(".publication-group"));
  var years = Array.from(document.querySelectorAll("[data-publication-year-group]"));
  var yearNav = document.querySelector("[data-publication-years]");
  function filter() {
    var query = input.value.trim().toLocaleLowerCase();
    var matches = 0;
    groups.forEach(function (group) {
      var visible = 0;
      group.querySelectorAll(".publication-entry").forEach(function (entry) {
        var topics = (entry.getAttribute("data-publication-themes") || "").split(" ");
        entry.hidden = !entry.textContent.toLocaleLowerCase().includes(query) || (theme.value !== "" && !topics.includes(theme.value));
        if (!entry.hidden) visible++;
      });
      group.hidden = visible === 0;
      matches += visible;
    });
    years.forEach(function (year) {
      year.hidden = !Array.from(year.querySelectorAll(".publication-entry")).some(function (entry) { return !entry.hidden; });
    });
    if (yearNav) {
      var visibleYears = 0;
      yearNav.querySelectorAll("a").forEach(function (link) {
        var target = document.getElementById(link.getAttribute("href").slice(1));
        link.hidden = !target || target.hidden;
        if (!link.hidden) visibleYears++;
      });
      yearNav.hidden = visibleYears === 0;
    }
    document.querySelector("[data-publication-empty]").hidden = matches !== 0;
    document.querySelector("[data-publication-count]").textContent = document.documentElement.lang === "zh" ? matches + " 项成果" : matches + " publications";
  }
  input.addEventListener("input", filter);
  theme.addEventListener("change", filter);
  filter();
})();
