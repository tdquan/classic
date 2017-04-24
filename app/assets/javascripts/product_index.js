$(".panel").hover(
  function(){
      $(".panel-body", this).css("display", "block");
  }, function(){
      $(".panel-body", this).css("display", "none");
});

$("img").lazyload();
