$(document).on('ready', function() {

  // PRODUCT LIST BOX RESIZE TO SQUARE
  $(".product-list-item img").height($(".product-list-item img").width());

  window.onresize = function(event) {
    $(".product-list-item img").height($(".product-list-item img").width());
  };

  /** -------------------------------------------------------------- **/

    // INFINITE SCROLLING
  $(".home.index #products").infinitescroll({
    navSelector: "ul.pagination",
    nextSelector: "ul.pagination a[rel=next]",
    itemSelector: "#content .product-list-item"
  });

  /** -------------------------------------------------------------- **/

  // NAVBAR ACTIVE TAB
  if ($('body').attr('class').includes('taxons show')) {
    if (window.location.pathname.includes('/t/artistes')) {
      $("a.subtaxon-title").removeClass("active");
      $("a.subtaxon-title[href*='/t/artistes'").addClass("active");
    } else if (window.location.pathname.includes('/t/ouvrages')) {
      $("a.subtaxon-title").removeClass("active");
      $("a.subtaxon-title[href*='/t/ouvrages']").addClass("active");
    } else if (window.location.pathname.includes('/t/projets')) {
      $("a.subtaxon-title").removeClass("active");
      $("a.subtaxon-title[href*='/t/projets']").addClass("active");
    } else if (window.location.pathname.includes('/t/boutiques')) {
      $("a.subtaxon-title").removeClass("active");
      $("a.subtaxon-title[href*='/t/boutiques']").addClass("active");
    };
    var path = window.location.pathname;
    $("a.taxon-dropdown-list-item").removeClass("active");
    $("a.taxon-dropdown-list-item[href='" + path + "']").addClass("active");

  }

  /** -------------------------------------------------------------- **/

  // NAVBAR CURRENT LOCALE
  $("a[class=" + Spree.url_params["locale"] + "]").css({"font-weight": "bold"});
});

