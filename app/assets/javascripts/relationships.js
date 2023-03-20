$(document).on('ajax:success', '.btn-primary, .btn-danger', function() {
  $('#follow-form').html('<%= j render "public/relationships/button", user: @user %>');
});