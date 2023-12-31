(function($) {
  "use strict";
  /* loader */
  if ($('.loader').length > 0){
    var loader_duration = 1200;
    $('body').addClass('no-scroll');
    setTimeout(function(){
      $('body').removeClass('no-scroll');
    }, loader_duration-10);
    $('.loader').delay(loader_duration).fadeOut(600);
  }

  /* Mail form */
  $('.mailform').on('submit', function(e){
    e.preventDefault();
    var mailto = $(this).attr('mailto');
    var subject = $(this).find('[name="subject"]').val();
    var name = $(this).find('input[name="name"]').val();
    var msg = $(this).find('textarea[name="message"]').val();
    var body = 'Name: '+name+'%0D%0AMessage:%0D%0A'+msg
    if (mailto) {
      var href = 'mailto:'+mailto+'?subject='+subject+'&body='+body;
      window.location.href = href;
    }
  })
  /* parallax */
  var runParallax = function (){
    var win_h = $(window).height();
    var win_scroll = $(window).scrollTop();

    $('.parallax-bg').each(function(){
      var offset_percent = ($(this).offset().top - win_scroll) / win_h;
      $(this).css({
        'background-position':'50% '+(offset_percent * 100)+'%'
      });
    });
  }

  /* gallery */
  $('.gallery').magnificPopup({
    type: 'image',
    preload: [0, 2],
    removalDelay: 600,
    closeBtnInside: false,
    fixedContentPos: true,
    gallery: {
      enabled: true,
      navigateByImgClick: true,
    },
    image: {
      verticalFit: true,
      tError: '404...',
      titleSrc: function(item) {
        return item.el.attr('title');
      }
    }
  });

  /* history back */
  $('.history-back').on('click', function(){
    console.log(history);
    history.back();
    return false;
  });

  /* navbar collapse */
  $('.navbar').on('show.bs.collapse', function (e) {
    $(this).addClass('is-collapse');
  })
  $('.navbar').on('hidden.bs.collapse', function (e) {
    $(this).removeClass('is-collapse');
  })

  /* navbar affix */
  var toggleAffix = function() {
    var affix_element = $('[toggle-affix]');
    var offset = parseInt($('.hero').height() / 2) || 60;
    if ($(window).scrollTop() >= offset) {
        affix_element.addClass("affix");
    } else {
        affix_element.removeClass("affix");
    }
  };

  /* navigate */
  var hash_scroll_locked = false;
  var curr_hash = window.location.hash;

  var scrollToSection = function(hash) {
    curr_hash = hash;
    var pos_top;
    try {
        pos_top = $(hash).offset().top;
    } catch (e) {
        pos_top = 0;
    }
    hash_scroll_locked = true;
    $('html, body').stop().animate({
      scrollTop: pos_top
    }, 900, 'easeInOutSine', function(){
      hash_scroll_locked = false;
    });
  }

  var autoSectionHash = function() {
    if (hash_scroll_locked){
      return;
    }
    $('.segment, .hero').each(function() {
      var sec_top = $(this).offset().top;
      var sec_bottom = $(this).offset().top + $(this).height();
      var win_offset = window.pageYOffset;
      if (sec_top < win_offset && sec_bottom > win_offset) {
        var hash = '#' + ($(this).attr('id') || '');
        if (hash != curr_hash) {
          curr_hash = hash;
          console.info('Navigate to:', curr_hash);
          try {
            history.replaceState({}, '', hash);
          } catch(err) {
            console.error(err);
          }
        }
      }
    });
  }

  var autoNavActive = function(){
    $('.scroller .indicator').each(function() {
      var target = (curr_hash || '').replace('#', '');
      if ($(this).data('section') == target) {
        $(this).addClass('active');
      } else {
        $(this).removeClass('active');
      }
    });
    $('#primary-navbar .nav-item[data-hash]').each(function() {
      var target = (curr_hash || '#');
      var hash = $(this).data('hash');
      if (hash && hash == target) {
        $(this).addClass('active');
      } else {
        $(this).removeClass('active');
      }
    });
  }

  /* links */
  $('a[href^="#"]:not([role="button"])').on('click', function(e) {
    scrollToSection(this.hash);
    // closes the responsive menu after clicked.
    $('.navbar-collapse').collapse('hide');
  });

  $('.entrance').on('click', function(e) {
    scrollToSection('#' + $('.segment').attr('id'));
    // closes the responsive menu after clicked.
    $('.navbar-collapse').collapse('hide');
    return false;
  });

  $('.card.trigger').on('click', function(e) {
    if (e.target && e.target.tagName == 'A'){
      return false;
    } else {
      var link = $(this).find('a').attr('href');
      if (!link) {
        return false;
      }
      else if (link.indexOf('#') == 0) {
        scrollToSection(link);
      } else {
        window.location.href = link;
      }
      return false;
    }
  });


  /* init */
  toggleAffix();
  runParallax();

  /* listener */
  $(window).on('scroll', function() {
    autoSectionHash();
    autoNavActive();
    runParallax();
  });
  $(window).on('scroll resize', function() {
    toggleAffix();
  });

})(jQuery);
