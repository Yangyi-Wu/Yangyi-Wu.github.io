(function () {
  "use strict";
  var search = document.querySelector("[data-publication-search]");
  if (!search) return;
  search.hidden = false;
  var input = search.querySelector("input");
  var groups = Array.from(document.querySelectorAll(".publication-group"));
  input.addEventListener("input", function () {
    var query = input.value.trim().toLocaleLowerCase();
    var matches = 0;
    groups.forEach(function (group) {
      var visible = 0;
      group.querySelectorAll(".publication-entry").forEach(function (entry) {
        entry.hidden = !entry.textContent.toLocaleLowerCase().includes(query);
        if (!entry.hidden) visible++;
      });
      group.hidden = visible === 0;
      matches += visible;
    });
    document.querySelector("[data-publication-empty]").hidden = matches !== 0;
  });
})();
