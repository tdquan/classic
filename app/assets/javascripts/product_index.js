$(document).on('ready', function() {
//  $(".panel").hover(
//    function(){
//      $(".panel-body", this).css("display", "block");
 //   }, function(){
 //     $(".panel-body", this).css("display", "none");
 // });
  $(".product-list-item img").height($(".product-list-item img").width());

  window.onresize = function(event) {
    $(".product-list-item img").height($(".product-list-item img").width());
  };

  // INFINITE SCROLLING
  $("#products").infinitescroll({
    navSelector: "ul.pagination",
    nextSelector: "ul.pagination a[rel=next]",
    itemSelector: "#content .product-list-item"
  });
});

