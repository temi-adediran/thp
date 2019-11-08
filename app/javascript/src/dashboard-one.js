$(function(){

  'use strict'

  var ctxLabel = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  var ctxData1 = [20, 60, 50, 45, 50, 60, 70, 40, 45, 35, 25, 30];
  var ctxData2 = [10, 40, 30, 40, 60, 55, 45, 35, 30, 20, 15, 20];
  var ctxColor1 = '#59a7fe';
  var ctxColor2 = '#6beaa6';

  // Bar chart
  var ctx1 = document.getElementById('chartBar1').getContext('2d');
  new Chart(ctx1, {
    type: 'bar',
    data: {
      labels: ctxLabel,
      datasets: [{
        data: ctxData1,
        backgroundColor: ctxColor1
      }, {
        data: ctxData2,
        backgroundColor: ctxColor2
      }]
    },
    options: {
      tooltips: { enabled: false },
      hover: {mode: null},
      maintainAspectRatio: false,
      responsive: true,
      legend: {
        display: false,
        labels: {
          display: false
        }
      },
      scales: {
        yAxes: [{
          gridLines: {
            color: '#f4f4f8'
          },
          ticks: {
            beginAtZero:true,
            fontSize: 9,
            fontColor: '#87889a',
            max: 80
          }
        }],
        xAxes: [{
          gridLines: {
            display: false
          },
          barPercentage: 0.6,
          ticks: {
            beginAtZero:true,
            fontSize: 10,
            fontColor: '#87889a'
          }
        }]
      }
    }
  });

  var ctx2 = document.getElementById('chartBar2').getContext('2d');
  new Chart(ctx2, {
    type: 'horizontalBar',
    data: {
      labels: ['META Project', "Haven Project", "Offer 7", 'Rhapsody', 'Healing School', "Local Project"],
      datasets: [{
        data: [90, 60, 50, 65, 50, 60],
        backgroundColor: ['#22d273', '#64ccfa','#fc7090','#5b8ef9','#fca665','#a490f9']
      }]
    },
    options: {
      tooltips: { enabled: false },
      hover: {mode: null},
      maintainAspectRatio: false,
      responsive: true,
      legend: {
        display: false,
        labels: {
          display: false
        }
      },
      layout: {
        padding: {
          left: 5
        }
      },
      scales: {
        yAxes: [{
          gridLines: {
            display: false
          },
          barPercentage: 0.5,
          ticks: {
            beginAtZero:true,
            fontSize: 13,
            fontColor: '#182b49',
            fontFamily: 'Roboto'
          }
        }],
        xAxes: [{
          gridLines: {
            color: '#e5e9f2'
          },
          ticks: {
            beginAtZero: true,
            fontSize: 10,
            fontColor: '#182b49',
            max: 100
          }
        }]
      }
    }
  });



  $('#vmap').vectorMap({
    map: 'world_en',
    backgroundColor: '#fff',
    borderColor: '#fff',
    color: '#e6e7fd',
    colors: {
      'us': '#8788fd',
      'in': '#62d9b6',
      'gb': '#ffd350',
      'br': '#ef77ae',
      'fr': '#9a7ad3',
      'nl': '#68c17c'
    },
    hoverColor: null,
    hoverOpacity: 0.8,
    enableZoom: false,
    showTooltip: false,
    multiSelectRegion: true
  });

  /** PIE CHART **/
  var datapie = {
    labels: ['Organic Search', 'Email', 'Referral', 'Social Media'],
    datasets: [{
      data: [20,20,30,25],
      backgroundColor: ['#5556fd', '#38c4fa','#22d273','#e83e8c']
    }]
  };

  var optionpie = {
    maintainAspectRatio: false,
    responsive: true,
    legend: {
      display: false,
    },
    animation: {
      animateScale: true,
      animateRotate: true
    }
  };

  // For a pie chart
  var ctx3 = document.getElementById('chartDonut');
  var myDonutChart = new Chart(ctx3, {
    type: 'doughnut',
    data: datapie,
    options: optionpie
  });

  var datapie2 = {
    labels: ['Personal', 'Medical', 'Other'],
    datasets: [{
      data: [20,40,35],
      backgroundColor: ['#38c4fa', '#22d273','#6f42c1']
    }]
  };

  // For a pie chart
  var ctx4 = document.getElementById('chartDonut2');
  var myDonutChart = new Chart(ctx4, {
    type: 'doughnut',
    data: datapie2,
    options: optionpie
  });


})
