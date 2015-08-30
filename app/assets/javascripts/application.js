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
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bjqs-1.3.min
//= require_tree .

var ready = function(){
  $('#banner-fade').bjqs({
    height      : 638,
    width       : 1500,
    responsive  : true
  });

  $('#result-section').hide();

  $('#agree').click(function(){
    $('#answer').text('您的選擇是贊成！')
    $('#result-section').slideDown( "slow" )
  })

  $('#disagree').click(function(){
    $('#answer').text('您的選擇是反對！')
    $('#result-section').slideDown( "slow" )
  })
};

$(document).ready(ready);
