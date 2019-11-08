// import "fullcalendar";

// $(function(){
//   'use strict'

//   var moment = require('moment');
//   var curYear = moment().format('YYYY');
//   var curMonth = moment().format('MM');

//   // Calendar Event Source
//   var calendarEvents = {
//     id: 1,
//     backgroundColor: 'rgba(1,104,250, .15)',
//     borderColor: '#0168fa',
//     events: [
//       {
//         id: '1',
//         start: curYear+'-'+curMonth+'-08T08:30:00',
//         end: curYear+'-'+curMonth+'-08T13:00:00',
//         title: 'ThemeForest Meetup',
//         description: 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis az pede mollis...'
//       },{
//         id: '2',
//         start: curYear+'-'+curMonth+'-10T09:00:00',
//         end: curYear+'-'+curMonth+'-10T17:00:00',
//         title: 'Design Review',
//         description: 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis az pede mollis...'
//       },{
//         id: '3',
//         start: curYear+'-'+curMonth+'-13T12:00:00',
//         end: curYear+'-'+curMonth+'-13T18:00:00',
//         title: 'Lifestyle Conference',
//         description: 'Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi...'
//       },{
//         id: '4',
//         start: curYear+'-'+curMonth+'-15T07:30:00',
//         end: curYear+'-'+curMonth+'-15T15:30:00',
//         title: 'Team Weekly Brownbag',
//         description: 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis az pede mollis...'
//       },{
//         id: '5',
//         start: curYear+'-'+curMonth+'-17T10:00:00',
//         end: curYear+'-'+curMonth+'-19T15:00:00',
//         title: 'Music Festival',
//         description: 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis az pede mollis...'
//       },{
//         id: '6',
//         start: curYear+'-'+curMonth+'-08T13:00:00',
//         end: curYear+'-'+curMonth+'-08T18:30:00',
//         title: 'Attend Lea\'s Wedding',
//         description: 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis az pede mollis...'
//       }
//     ]
//   };

//   // Birthday Events Source
//   var birthdayEvents = {
//     id: 2,
//     backgroundColor: 'rgba(16,183,89, .25)',
//     borderColor: '#10b759',
//     events: [
//       {
//         id: '7',
//         start: curYear+'-'+curMonth+'-01T18:00:00',
//         end: curYear+'-'+curMonth+'-01T23:30:00',
//         title: 'Socrates Birthday',
//         description: 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis az pede mollis...'
//       },
//       {
//         id: '8',
//         start: curYear+'-'+curMonth+'-21T15:00:00',
//         end: curYear+'-'+curMonth+'-21T21:00:00',
//         title: 'Reynante\'s Birthday',
//         description: 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis az pede mollis...'
//       },
//       {
//         id: '9',
//         start: curYear+'-'+curMonth+'-23T15:00:00',
//         end: curYear+'-'+curMonth+'-23T21:00:00',
//         title: 'Pauline\'s Birthday',
//         description: 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis az pede mollis...'
//       }
//     ]
//   };


//   var holidayEvents = {
//     id: 3,
//     backgroundColor: 'rgba(241,0,117,.25)',
//     borderColor: '#f10075',
//     events: [
//       {
//         id: '10',
//         start: curYear+'-'+curMonth+'-04',
//         end: curYear+'-'+curMonth+'-06',
//         title: 'Feast Day'
//       },
//       {
//         id: '11',
//         start: curYear+'-'+curMonth+'-26',
//         end: curYear+'-'+curMonth+'-27',
//         title: 'Memorial Day'
//       },
//       {
//         id: '12',
//         start: curYear+'-'+curMonth+'-28',
//         end: curYear+'-'+curMonth+'-29',
//         title: 'Veteran\'s Day'
//       }
//     ]
//   };

//   var discoveredEvents = {
//     id: 4,
//     backgroundColor: 'rgba(0,204,204,.25)',
//     borderColor: '#00cccc',
//     events: [
//       {
//         id: '13',
//         start: curYear+'-'+curMonth+'-17T08:00:00',
//         end: curYear+'-'+curMonth+'-18T11:00:00',
//         title: 'Web Design Workshop Seminar'
//       }
//     ]
//   };

//   var meetupEvents = {
//     id: 5,
//     backgroundColor: 'rgba(91,71,251,.2)',
//     borderColor: '#5b47fb',
//     events: [
//       {
//         id: '14',
//         start: curYear+'-'+curMonth+'-03',
//         end: curYear+'-'+curMonth+'-05',
//         title: 'UI/UX Meetup Conference'
//       },
//       {
//         id: '15',
//         start: curYear+'-'+curMonth+'-18',
//         end: curYear+'-'+curMonth+'-20',
//         title: 'Angular Conference Meetup'
//       }
//     ]
//   };


//   var otherEvents = {
//     id: 6,
//     backgroundColor: 'rgba(253,126,20,.25)',
//     borderColor: '#fd7e14',
//     events: [
//       {
//         id: '16',
//         start: curYear+'-'+curMonth+'-06',
//         end: curYear+'-'+curMonth+'-08',
//         title: 'My Rest Day'
//       },
//       {
//         id: '17',
//         start: curYear+'-'+curMonth+'-29',
//         end: curYear+'-'+curMonth+'-31',
//         title: 'My Rest Day'
//       }
//     ]
//   };



//   // Initialize tooltip
//   $('[data-toggle="tooltip"]').tooltip()

//   // Sidebar calendar
//   $('#calendarInline').datepicker({
//     showOtherMonths: true,
//     selectOtherMonths: true,
//     beforeShowDay: function(date) {

//       // add leading zero to single digit date
//       var day = date.getDate();
//       console.log(day);
//       return [true, (day < 10 ? 'zero' : '')];
//     }
//   });

//   // Initialize fullCalendar
//   $('#calendar').fullCalendar({
//     height: 'parent',
//     header: {
//       left: 'prev,next today',
//       center: 'title',
//       right: 'month,agendaWeek,agendaDay,listWeek'
//     },
//     navLinks: true,
//     selectable: true,
//     selectLongPressDelay: 100,
//     editable: true,
//     nowIndicator: true,
//     defaultView: 'listMonth',
//     views: {
//       agenda: {
//         columnHeaderHtml: function(mom) {
//           return '<span>' + mom.format('ddd') + '</span>' +
//                  '<span>' + mom.format('DD') + '</span>';
//         }
//       },
//       day: { columnHeader: false },
//       listMonth: {
//         listDayFormat: 'ddd DD',
//         listDayAltFormat: false
//       },
//       listWeek: {
//         listDayFormat: 'ddd DD',
//         listDayAltFormat: false
//       },
//       agendaThreeDay: {
//         type: 'agenda',
//         duration: { days: 3 },
//         titleFormat: 'MMMM YYYY'
//       }
//     },

//     eventSources: [calendarEvents, birthdayEvents, holidayEvents, discoveredEvents, meetupEvents, otherEvents],
//     eventAfterAllRender: function(view) {
//       if(view.name === 'listMonth' || view.name === 'listWeek') {
//         var dates = view.el.find('.fc-list-heading-main');
//         dates.each(function(){
//           var text = $(this).text().split(' ');
//           var now = moment().format('DD');

//           $(this).html(text[0]+'<span>'+text[1]+'</span>');
//           if(now === text[1]) { $(this).addClass('now'); }
//         });
//       }

//       console.log(view.el);
//     },
//     eventRender: function(event, element) {

//       if(event.description) {
//         element.find('.fc-list-item-title').append('<span class="fc-desc">' + event.description + '</span>');
//         element.find('.fc-content').append('<span class="fc-desc">' + event.description + '</span>');
//       }

//       var eBorderColor = (event.source.borderColor)? event.source.borderColor : event.borderColor;
//       element.find('.fc-list-item-time').css({
//         color: eBorderColor,
//         borderColor: eBorderColor
//       });

//       element.find('.fc-list-item-title').css({
//         borderColor: eBorderColor
//       });

//       element.css('borderLeftColor', eBorderColor);
//     },
//   });

//   var calendar = $('#calendar').fullCalendar('getCalendar');

//   // change view to week when in tablet
//   if(window.matchMedia('(min-width: 576px)').matches) {
//     calendar.changeView('agendaWeek');
//   }

//   // change view to month when in desktop
//   if(window.matchMedia('(min-width: 992px)').matches) {
//     calendar.changeView('month');
//   }

//   // change view based in viewport width when resize is detected
//   calendar.option('windowResize', function(view) {
//     if(view.name === 'listWeek') {
//       if(window.matchMedia('(min-width: 992px)').matches) {
//         calendar.changeView('month');
//       } else {
//         calendar.changeView('listWeek');
//       }
//     }
//   });

//   // Display calendar event modal
//   calendar.on('eventClick', function(calEvent, jsEvent, view){

//     var modal = $('#modalCalendarEvent');

//     modal.modal('show');
//     modal.find('.event-title').text(calEvent.title);

//     if(calEvent.description) {
//       modal.find('.event-desc').text(calEvent.description);
//       modal.find('.event-desc').prev().removeClass('d-none');
//     } else {
//       modal.find('.event-desc').text('');
//       modal.find('.event-desc').prev().addClass('d-none');
//     }

//     modal.find('.event-start-date').text(moment(calEvent.start).format('LLL'));
//     modal.find('.event-end-date').text(moment(calEvent.end).format('LLL'));

//     //styling
//     modal.find('.modal-header').css('backgroundColor', (calEvent.source.borderColor)? calEvent.source.borderColor : calEvent.borderColor);
//   });

//   // display current date
//   var dateNow = calendar.getDate();
//   calendar.option('select', function(startDate, endDate){
//     $('#modalCreateEvent').modal('show');
//     $('#eventStartDate').val(startDate.format('LL'));
//     $('#eventEndDate').val(endDate.format('LL'));

//     $('#eventStartTime').val(startDate.format('LT')).trigger('change');
//     $('#eventEndTime').val(endDate.format('LT')).trigger('change');
//   });

//   $('.select2-modal').select2({
//     minimumResultsForSearch: Infinity,
//     dropdownCssClass: 'select2-dropdown-modal',
//   });

//   $('.calendar-add').on('click', function(e){
//     e.preventDefault()

//     $('#modalCreateEvent').modal('show');
//   });

// })
