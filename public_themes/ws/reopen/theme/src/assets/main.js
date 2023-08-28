var $ = jQuery;

$(document).ready(function () {

  $(".site-content").fitVids();

  // menu
  $('.main-menu .has-submenu').click(function(){
    $(this).parent().find('.sub-menu').toggle(function(){
      $(this).animate({
        opacity: 1
      }, 600)
    });
    return false;
  });

  // load more
  var paged = 1;
  var has_more = false;
  var entry_template = [
    '<div class="grid-item element-item">',
    '<a href="$URL">',
    '<img src="$IMG" alt="$TITLE" />',
    '<div class="portfolio-text-holder">',
    '<p class="portfolio-text">$TITLE</p>',
    '<p class="portfolio-type">$TERM</p>',
    '</div></a></div>',
  ].join('')

  var refresh_list = function (url, paged, perpage, term, cate_dict, btn){
    $.get(
      url, {paged: paged, perpage: perpage, term: term},
      function(data){
        var last_entry = null;
        for(var i=0; i<data.length; i++){
          var entry = data[i];
          var el_str = entry_template;
          el_str = el_str.replace(/\$URL/g, entry.url);
          el_str = el_str.replace(/\$TITLE/g, entry.title);
          if (typeof entry.featured_img == 'object') {
            el_str = el_str.replace(/\$IMG/g, entry.featured_img.src);
          }
          var cate_str = '';
          if (entry.terms && entry.terms.length) {
            var _term = cate_dict[entry.terms[0]]
            if (typeof _term.meta == 'object') {
              cate_str = _term.meta.name;
            }
          }

          el_str = el_str.replace(/\$TERM/, cate_str);

          $container = $('.grid');
          $container.isotope('insert', $(el_str));
          $container.imagesLoaded(function() {
            $container.isotope({
              animationOptions: {
                  duration: 7500,
                  easing: 'elasin',
                  queue: false
              }
            });
            fix_grid_items();
          });
          last_entry = entry;
        };

        if(last_entry && last_entry._more){
          btn.show();
        } else {
          btn.hide();
        };
      });
  }

  $('.more-posts-portfolio').click(function(){
    var url = $(this).data('url');
    var cate_url = $(this).data('cate-url');
    var perpage = $(this).data('perpage');
    var term = $(this).data('term');
    var cate_dict = {};
    var btn = $(this);
    $.get(
      cate_url, {}, function(data){
      paged += 1;
      refresh_list(url, paged, perpage, term, data.category.terms_dict, btn);
    });
    return false;
  });


  // portfolio
  var fix_grid_items = function(){
    // fix for portfolio item text
    $('.portfolio-text-holder').each(function () {
      $(this).find('p.portfolio-text').css('margin-top',
        $(this).height() / 2 - 20);
    });

    // fix for portfolio hover text fade in/out
    $('.grid-item a').hover(function () {
      $(this).find('.portfolio-text-holder').fadeIn('fast');
    }, function () {
      $(this).find('.portfolio-text-holder').fadeOut('fast');
    });
  }

  var grid = $('.grid').imagesLoaded(function () {
     grid.isotope({
      itemSelector: '.grid-item',
      masonry: {
        columnWidth: '.grid-sizer'
      }
    });
    fix_grid_items();
  });
});



$(window).load(function () {

  // set menu
  $('.main-menu').on('click', 'span.sub-arrow', function (e) {

  });


  // show-Hide header sidebar
  $('#toggle, .menu-wraper').on('click', multiClickFunctionStop);
  $('.main-menu').click(function (e) {
      e.stopPropagation();
  });

  // init
  $('.doc-loader').fadeOut('fast');
});


$(window).resize(function () {

  // fix for portfolio item text
  $('.portfolio-text-holder').each(function () {
      $(this).find('p.portfolio-text').css('margin-top', $(this).height() / 2 - 20);
  });

});

//------------------------------------------------------------------------
// Helper Methods -->
//------------------------------------------------------------------------

var multiClickFunctionStop = function (e) {
  if ($(e.target).is('.menu-wraper')
      || $(e.target).is('#toggle')
      || $(e.target).is('#toggle div')) {
    $('#toggle, .menu-wraper').off("click");
    $('#toggle').toggleClass("on");
    if ($('#toggle').hasClass("on")) {
      $('.menu-wraper').fadeIn(function () {
        $("html").css("cssText", "overflow: hidden !important");
        $('#toggle, .menu-wraper').on("click", multiClickFunctionStop);
      });
    } else {
      $('.menu-wraper').fadeOut(function () {
        $('#toggle, .menu-wraper').on("click", multiClickFunctionStop);
        $("html").css("cssText", "overflow: auto !important");
      });
    }
  }
};

function is_touch_device() {
    return !!('ontouchstart' in window);
}
