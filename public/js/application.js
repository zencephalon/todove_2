$(document).ready(function() {
  $('.subtask_add_link').on('click', function(event) {
    var $target = $(event.target);
    $target.closest('.task').children('.subtask_add').show();
  })

  $('.delete_form').on('submit', function(event) {
    event.preventDefault();
    var $form = $(event.target);
    var $submit_input = $form.children('input[type=submit]')

    $submit_input.val("Deleting...");

    $.ajax({
      url: $form.attr('action'),
      type: 'DELETE'
    }).done(function (response) {
      $form.closest('li').remove();
    }).fail(function (response) {
      $submit_input.val("Failed, retry?")
    })
  })
});
