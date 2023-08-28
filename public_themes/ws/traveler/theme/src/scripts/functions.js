(function($) {
  "use strict"; // Start of use strict

  $('.img-gallery').each(function() {
    if ($(this).attr('target')) return true;
    $(this).magnificPopup({
        delegate: '.img-popup', // the selector for gallery item
        type: 'image',
        gallery: {
          enabled:true
        }
    });
  });

  $('.popup-modal').each(function () {
    if ($(this).attr('target')) return true;
    $(this).magnificPopup({
        type: 'inline',
        preloader: false,
    });
  });

  $('.form-booking').each(function(){
    var $form = $(this);
    var $success = $(this).find('.success');
    var $alert_error = $(this).find('.alert-danger');
    var $required_fields = $(this).find('.field[required]');

    var booking_reset = function(){
      $form.children().show();
      $form.find('label').removeClass('text-danger');
      $success.hide();
    }
    var booking_success = function(){
      $form.children().hide();
      $alert_error.hide();
      $success.show();
    }
    var booking_failed = function(){
      $alert_error.show();
    }

    $(this).find('.success button').click(function(e) {
      e.preventDefault();
      setTimeout(function(){
        booking_reset();
      }, 100)
      $.magnificPopup.close();
    });


    var check_required_fields = function(form_fields){
      var _field_keys = [];
      for (var j = 0; j < form_fields.length; j ++) {
        if (form_fields[j].value) {
          _field_keys.push(form_fields[j].name);
        }
      }
      for (var i = 0; i < $required_fields.length; i ++){
        var rfield = $($required_fields[i]);
        var field_name = rfield.attr('name');
        if (_field_keys.indexOf(field_name) < 0){
          rfield.parent().find('> label').addClass('text-danger');
          return false
        }
      }
      return true
    }

    var parse_maildata = function(fields){
      var data = {};
      for (var i=0; i < fields.length; i++) {
        var field = fields[i];
        var key = field.name;
        if (data[key]) {
          if (Array.isArray(data[key])) {
            data[key].push(field.value);
          } else {
            data[key] = [data[key], field.value];
          }
        } else {
          data[key] = field.value;
        }
      }
      return data
    }

    $(this).on('reset', function(e) {
      booking_reset();
    });

    $(this).submit(function(e) {
      e.preventDefault();

      booking_reset();

      var form_data = {
        fields: $(this).serializeArray(),
        title: $(this).attr('title'),
        action: $(this).attr('action'),
      };

      if (!check_required_fields(form_data.fields)){
        return false;
      }

      if (!form_data.action) {
        return false;
      } else {
        var fields_data = parse_maildata(form_data.fields);
        if (form_data.action.toLowerCase().indexOf('mailto:') == 0) {
          var subject = form_data.title || '';
          var action = form_data.action;
          var mail_content = '';
          for(var k in fields_data){
            var v = fields_data[k];
            var _value = Array.isArray(v) ? v.join(', ') : v;
            mail_content = mail_content + k + ': ' + _value + '\n';
          }
          mail_content = encodeURIComponent(mail_content);
          var mail_url = action+'?subject='+subject+'&body='+mail_content;
          window.location.href = mail_url;
          booking_success();
        } else {
          $.ajax({
            type: 'POST',
            url: form_data.action,
            data: JSON.stringify(fields_data),
            dataType: 'json',
            contentType: 'application/json'
          })
          .done(function(){
            booking_success();
          })
          .fail(function(){
            booking_failed();
          })
        }
      }
      return false;
    });

  })

})(jQuery); // End of use strict
