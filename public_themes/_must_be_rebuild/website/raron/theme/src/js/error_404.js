$(window).load(function(){
  var whight = $(window).height();
  $(".header").css('height', whight);
  $(".bg_mask").css('height', whight);
  $(".bg_mask").css('background', 'none');
  $(".wrap").css('padding-top', '10%');
  $(window).resize(function(){
    var whight = $(window).height();
    $(".header").css('height', whight);
    $(".header").css('background-position', 'center');
  });
});
