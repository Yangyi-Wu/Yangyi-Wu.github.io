(function () {
  "use strict";
  var search = document.querySelector("[data-publication-search]");
  if (!search) return;
  search.hidden = false;
  var input = search.querySelector("input");
  var theme = search.querySelector("select");
  var groups = Array.from(document.querySelectorAll(".publication-group"));
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
    document.querySelector("[data-publication-empty]").hidden = matches !== 0;
    document.querySelector("[data-publication-count]").textContent = document.documentElement.lang === "zh" ? matches + " 项成果" : matches + " publications";
  }
  input.addEventListener("input", filter);
  theme.addEventListener("change", filter);
  filter();
})();
