import { Turbo } from "@hotwired/turbo-rails"
import { Controller } from "@hotwired/stimulus";
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import listPlugin from '@fullcalendar/list';
import frLocale from '@fullcalendar/core/locales/fr';
import moment from 'moment';


export default class extends Controller {
  static targets = ["calendar", "modal", "start_time", "end_time"]
  
  connect() {
    let _this = this
    let calendar = new Calendar(this.calendarTarget, {
      plugins: [  interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin ],
      initialView: 'dayGridMonth',
      headerToolbar: {
        start: 'prev,next today',
        center: 'title',
        end: 'dayGridMonth,listMonth'
      },
      eventSources: [
        {
          url: 'openings/calendar.json',
          textEscape: false,
          color: 'yellow',
          textColor: 'white'
        }
      ],

      navLinks: true,
      editable: false,
      locale: frLocale,
      themeSystem: 'bootstrap5',
      displayEventEnd: true,
      navLinkDayClick: function(date, jsEvent) {
        _this.modalTarget.style.display = "block"
        _this.start_timeTarget.value = date
        _this.end_timeTarget.value = date
      },
      eventClick: function (info) {
        info.jsEvent.preventDefault()
        Turbo.visit(info.event.extendedProps.show_url)
      },
      dateClick: function(info) {
        Turbo.visit('new?date='+ info.dateStr)
      }
    })
    calendar.render()
  }

  data(info) {
    return {
      "event[start_time]": info.event.start,
      "event[end_time]": info.event.end,
    }
  }
}