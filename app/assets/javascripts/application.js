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
//= require jquery-ui

//= require_tree .

$(function () {
  
  if ($('.survey-edit-title-text').length) {
    var questions = $('#survey-question').html();
    
    $('.unordered-list').sortable();
    $('.unordered-list').disableSelection();
    
    $('body').on('click', '.survey-edit-add', function (e) {
      e.preventDefault();
      e.stopPropagation();
      
      questions = questions.replace(/\[[0-9]+\]/g, '[' + $('.survey-edit-question-container').length + ']')
        .replace(/_[0-9]+_/g, '_' + $('.survey-edit-question-container').length + '_');
      
      $('.unordered-list').append('<li>' + questions + '</li>')
    })
  }
  
});