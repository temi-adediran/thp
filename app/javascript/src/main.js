$(function(){
  'use strict'

  $('.burger-menu:first-child').on('click', function(e){
    console.log("I've been clicked");
    e.preventDefault();
    $('body').toggleClass('toggle-sidebar');
  })

  $('.header-search .form-control').on('focusin', function(e){
    $(this).parent().addClass('active');
  })

  $('.header-search .form-control').on('focusout', function(e){
    $(this).parent().removeClass('active');
  })
})
