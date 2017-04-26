$(document).on('ready', function() {
//  $(".panel").hover(
//    function(){
//      $(".panel-body", this).css("display", "block");
 //   }, function(){
 //     $(".panel-body", this).css("display", "none");
 // });

  // INFINITE SCROLLING
  return $("#products").infinitescroll({
    navSelector: "ul.pagination",
    nextSelector: "ul.pagination a[rel=next]",
    itemSelector: "#content .product-list-item"
  });
});
