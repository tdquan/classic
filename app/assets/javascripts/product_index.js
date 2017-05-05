$(document).on('ready', function() {

  // PRODUCT LIST BOX RESIZE TO SQUARE
  $(".product-list-item img").height($(".product-list-item img").width());

  window.onresize = function(event) {
    $(".product-list-item img").height($(".product-list-item img").width());
  };


  /** -------------------------------------------------------------- **/


  // INFINITE SCROLLING
  $("#products").infinitescroll({
    navSelector: "ul.pagination",
    nextSelector: "ul.pagination a[rel=next]",
    itemSelector: "#content .product-list-item"
  });

  /** -------------------------------------------------------------- **/

  // NAVBAR ACTIVE TAB
  if ($('body').attr('class').includes('taxons show')) {
    if (window.location.href.includes('/t/artistes')) {
      $("a.subtaxon-title").removeClass("active");
      $("a[href='/t/artistes'").addClass("active");
    } else if (window.location.href.includes('/t/ouvrages')) {
      $("a.subtaxon-title").removeClass("active");
      $("a[href='/t/ouvrages'").addClass("active");
    } else if (window.location.href.includes('/t/projets')) {
      $("a.subtaxon-title").removeClass("active");
      $("a[href='/t/projets'").addClass("active");
    } else if (window.location.href.includes('/t/boutiques')) {
      $("a.subtaxon-title").removeClass("active");
      $("a[href='/t/boutiques'").addClass("active");
    }
  }

  /** -------------------------------------------------------------- **/

  // NAVBAR CURRENT LOCALE
  $("a[class=" + Spree.url_params["locale"] + "]").css({"font-weight": "bold"});
});

