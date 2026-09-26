/*
* Greedy Navigation
*
* http://codepen.io/lukejacksonn/pen/PwmwWV
*
*/

var $nav = $('#site-nav');
var $btn = $('#site-nav .nav-toggle');
var $vlinks = $('#site-nav .visible-links');
var $vlinks_persist_tail = $vlinks.children("*.persist.tail");
var $hlinks = $('#site-nav .hidden-links');

function setNavOpen(open) {
  $btn.toggleClass('close', open).attr('aria-expanded', String(open));
  $hlinks.toggleClass('hidden', !open);
}

function navItemsWidth() {
  var width = 0;
  $vlinks.children().each(function () {
    // Exclude the brand's auto margin; only intrinsic item widths determine fit.
    width += $(this).outerWidth();
  });
  return width;
}

function updateNav() {
  if (!$nav.length) return;

  setNavOpen(false);
  if ($vlinks_persist_tail.length) {
    $hlinks.children().insertBefore($vlinks_persist_tail);
  } else {
    $hlinks.children().appendTo($vlinks);
  }

  var compact = window.matchMedia('(max-width: 767px)').matches;
  var availableSpace = $nav.width();
  var needsMenu = compact || navItemsWidth() > availableSpace;
  if (needsMenu) availableSpace -= 52;

  while ($vlinks.children(':not(.persist)').length &&
      (compact || navItemsWidth() > availableSpace)) {
    $vlinks.children(':not(.persist)').last().prependTo($hlinks);
  }

  var hiddenCount = $hlinks.children().length;
  $nav.toggleClass('has-hidden', hiddenCount > 0);
  $btn.toggleClass('hidden', hiddenCount === 0).attr('count', hiddenCount);

  // update masthead height and the body/sidebar top padding
  var mastheadHeight = $('.masthead').height();
  $('body').css('padding-top', mastheadHeight + 'px');
  if ($(".author__urls-wrapper button").is(":visible")) {
    $(".sidebar").css("padding-top", "");
  } else {
    $(".sidebar").css("padding-top", mastheadHeight + "px");
  }

}

// Window listeners

$(window).on('resize', function () {
  updateNav();
});
if (window.screen.orientation) {
  window.screen.orientation.addEventListener('change', updateNav);
}
if (document.fonts && document.fonts.ready) {
  document.fonts.ready.then(updateNav);
}

$btn.on('click', function () {
  setNavOpen($btn.attr('aria-expanded') !== 'true');
});

$hlinks.on('click', 'a', function () {
  setNavOpen(false);
});

$(document).on('click', function (event) {
  if ($nav.length && !$nav[0].contains(event.target)) setNavOpen(false);
});

$(document).on('keydown', function (event) {
  if (event.key === 'Escape' && $btn.attr('aria-expanded') === 'true') {
    setNavOpen(false);
    $btn[0].focus();
  }
});

updateNav();
