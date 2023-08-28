/*!
 * Start Bootstrap - Creative Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

(function($) {
    "use strict"; // Start of use strict

    $('.img-gallery').each(function() {
        $(this).magnificPopup({
            delegate: '.img-popup', // the selector for gallery item
            type: 'image',
            gallery: {
              enabled:true
            }
        });
    });

    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        var scorll_target = $($anchor.attr('href'));
        var pos_top = 0;
        if (scorll_target.length > 0){
          pos_top = scorll_target.offset().top
        }
        $('html, body').stop().animate({
            scrollTop: pos_top - 50
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 51
    })

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click(function() {
        $('.navbar-toggle:visible').click();
    });

    // Offset for Main Navigation
    $('#primary-nav').affix({
        offset: {
            top: 100
        }
    })

    // member
    var member = new Skipper();

    $('form[type="event"]').submit(function(e) {
      e.preventDefault();
      var self = this;
      var form_data = member.parse_form(self);
      if(!form_data.status) {
        console.error(form_data.fields);
        return false;
      }
      var results_success = $(self).find('.results .success');
      var results_errors = $(self).find('.results .errors');
      results_success.hide();
      results_errors.hide();

      member.demand.free(form_data.action, form_data.fields
      , function(data) {
        console.log('success:', data);
        results_success.show();
      }, function(error) {
        var errmsg = "error"
        if (error.data && error.data.errmsg){
          errmsg = error.data.errmsg
        }
        results_errors.html(errmsg);
        results_errors.show();
        console.error('failed:', error.data);
      });
      return false;
    });

    $('form[type="mailto"]').submit(function(e) {
      e.preventDefault();
      var self = this;
      var results_success = $(self).find('.results .success');
      var results_errors = $(self).find('.results .errors');
      results_success.hide();
      results_errors.hide();

      if (member.utils.isWeChat()){
        results_errors.html('WeChat not allowed!!');
        results_errors.show();
        return false;
      }

      var form_data = member.parse_form(this);
      if(!form_data.status) {
        return false;
      }

      results_success.show();
      window.location.href = member.mailto(form_data.action, form_data.fields)
      return false;
    });

})(jQuery); // End of use strict
