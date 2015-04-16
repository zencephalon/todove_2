function makeAdder(x) {
  return function (y) {
    return x + y;
  }
}

function greeterMaker(name) {
  return function() {
    return "Hello " + name;
  }
}

function makeBankAccount(balance) {
  return {
    getBalance: function() {
      return balance;
    },
    deposit: function(amount) {
      balance += amount;
      return balance;
    },
    withdraw: function(amount) {
      balance -= amount;
      return balance;
    }
  }
}

var adder10 = makeAdder(10)
var adder15 = makeAdder(15)

function createDog(x, y) {
  return {
    x: x,
    y: y,
    hello: function() {
      return "hello world";
    }
  }
}

function Dog(x, y) {
  this.x = x;
  this.y = y;
}

Dog.prototype.hello = function() {
  return "hello world";
};

var dog = createDog(10, 15);
var dog2 = new Dog(10, 15);

$(document).ready(function() {
  $('.subtask_add').hide();

  // $('#task_list').on('click', '.subtask_add_link', function(event) {
  //   var $target = $(event.target);
  //   $target.closest('.task').children('.subtask_add').show();
  // })

  var subtask_add_click_handler = function(event) {
    var $target = $(event.target);
    $target.closest('.task').children('.subtask_add').show();
  }

  $('.subtask_add_link').on('click', subtask_add_click_handler)

  $('.new_task_form').on('submit', function(event) {
    event.preventDefault();
    var $form = $(event.target);

    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      data: $form.serialize()
    }).done(function (response) {
      var $task = $("<li>" + response + "</li>");
      $form.closest('.task').children('.subtask_list').append($task)
      $task.find('.subtask_add_link').bind('click', subtask_add_click_handler);
      $('.subtask_add').hide();

      //$form.closest('.subtask_add').hide();
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
