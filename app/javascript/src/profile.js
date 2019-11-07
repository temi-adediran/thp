$(function(){
  'use strict'

  $('#wizard3').steps({
    headerTag: 'h4',
    bodyTag: 'section',
    autoFocus: true,
    titleTemplate: '<span class="number">#index#</span> <span class="title">#title#</span>',
    stepsOrientation: 1
  });

  $('#datepicker3').datepicker({
    showOtherMonths: true,
    selectOtherMonths: true,
    changeMonth: true,
    changeYear: true
  });
});
