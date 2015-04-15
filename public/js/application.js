$(document).ready(function() {
  $('.subtask_add_link').on('click', function(event) {
    var $target = $(event.target);
    $target.closest('.task').children('.subtask_add').show();
  })
});
