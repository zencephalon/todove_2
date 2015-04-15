$(document).ready(function() {
  $('.subtask_add').hide();

  $('.subtask_add_link').on('click', function(event) {
    var $target = $(event.target);
    $target.closest('.task').children('.subtask_add').show();
  })

  $('.new_task_form').on('submit', function(event) {
    event.preventDefault();
    var $form = $(event.target);

    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      data: $form.serialize()
    }).done(function (response) {
      $form.closest('.task').children('.subtask_list').append("<li>" + response + "</li>")
      $form.closest('.subtask_add').hide();
    }).fail(function (response) {

    })
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
