// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('page:load ready', function() {

  $('#new_review').on('ajax:beforeSend', function() {
    $('input[type=submit]').val('Saving...').attr('disabled', 'disabled');
  });

  $('#new_review').on('ajax:complete', function() {
    $('input[type=submit]').val('Add Message').removeAttr('disabled');
  });

});