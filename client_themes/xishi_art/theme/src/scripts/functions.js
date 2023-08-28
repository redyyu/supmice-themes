$(document).ready(function() {

  /* Form */
  var skipper = new Skipper();

  $('form[type="event"]').submit(function(e) {
    e.preventDefault();
    var self = this;
    var form_data = skipper.parse_form(self);
    if(!form_data.status) {
      console.error(form_data.fields);
      return false;
    }
    var results_success = $(self).find('.results .success');
    var results_errors = $(self).find('.results .errors');
    results_success.hide();
    results_errors.hide();

    skipper.demand.free(form_data.action, form_data.fields
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

    if (skipper.utils.isWeChat()){
      results_errors.html('WeChat sucks!!!');
      results_errors.show();
      return false;
    }

    var form_data = skipper.parse_form(this);
    if(!form_data.status) {
      return false;
    }

    results_success.show();
    window.location.href = skipper.mailto(form_data.action, form_data.fields)
    return false;
  });

});