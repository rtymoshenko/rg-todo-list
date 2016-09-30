// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){
  $(".project-header").hover(
    function () {
      $(this).find(".small-buttons").removeClass("hide");
    },
    function () {
      $(this).find(".small-buttons").addClass("hide");
    }
  );

  $(".task_row").hover(
    function () {
      $(this).find(".col-xs-2").removeClass("hide");
    },
    function () {
      $(this).find(".col-xs-2").addClass("hide");
    }
  );

  $(".input_project_name").hide();
  $(".input_task_name").hide();

  $(".edit_project_name").on('click', function(){
    $(this).parents('.project-header').find('.label_project_name').toggle("slow");
    $(this).parents('.project-header').find('.input_project_name').toggle("slow");
    return false;
  });


  $(".edit_task_name").on('click', function(){
    $(this).parents('.task_row').find('.label_task_name').toggle("slow");
    $(this).parents('.task_row').find('.input_task_name').toggle("slow");
    return false;
  });

});
