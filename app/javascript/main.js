'use strict';

console.clear();
console.log(gon.event)
console.log(gon.event[0].event_date)
for (let i = 0; i < gon.event.length; i++) {
  console.log(gon.event[i].title)
  console.log(`${gon.event[i].event_date}`)
}

{
  const today = new Date();
  let year = today.getFullYear();
  let month = today.getMonth();

  function getCalendarHead() {
    const dates = [];
    const d = new Date(year, month, 0).getDate();
    const n = new Date(year, month, 1).getDay();

    for (let i = 0; i < n; i++) {
      // 30
      // 29, 30
      // 28, 29, 30
      dates.unshift({
        date: d - i,
        isToday: false,
        isDisabled: true,
      });
    }

    return dates;
  }

  function getCalendarBody() {
    const dates = []; // date: 日付, day: 曜日
    const lastDate = new Date(year, month + 1, 0).getDate();

    for (let i = 1; i <= lastDate; i++) {
      dates.push({
        date: i,
        isToday: false,
        isDisabled: false,
      });
    }

    if (year === today.getFullYear() && month === today.getMonth()) {
      dates[today.getDate() - 1].isToday = true;
    }

    return dates;
  }

  function getCalendarTail() {
    const dates = [];
    const lastDay = new Date(year, month + 1, 0).getDay();

    for (let i = 1; i < 7 - lastDay; i++) {
      dates.push({
        date: i,
        isToday: false,
        isDisabled: true,
      });
    }

    return dates;
  }

  function clearCalendar() {
    const tbody = document.querySelector('tbody');

    while (tbody.firstChild) {
      tbody.removeChild(tbody.firstChild);
    }
  }

  function renderTitle() {
    const title = `${year}/${String(month + 1).padStart(2, '0')}`;
    document.getElementById('title').textContent = title;
  }

  function renderWeeks() {
    const dates = [
      ...getCalendarHead(),
      ...getCalendarBody(),
      ...getCalendarTail(),
    ];
    const weeks = [];
    const weeksCount = dates.length / 7;

    for (let i = 0; i < weeksCount; i++) {
      weeks.push(dates.splice(0, 7));
    }

    weeks.forEach(week => {
      const tr = document.createElement('tr');
      week.forEach(date => {
        const td = document.createElement('td');

        
        
        td.textContent = date.date;
        if (date.isToday) {
          td.classList.add('today');
        }
        if (date.isDisabled) {
          td.classList.add('disabled');
        }
        
        td.setAttribute('id', 'event_box')
        
        const get_disabled = document.getElementsByClassName('disabled')
        
        // console.log(date.date, month + 1, year);  // 出力してみる
        
        
        for (let i = 0; i < gon.event.length; i++) {
          if (`${gon.event[i].event_date}` === `${year}-${month + 1}-0${date.date}` || `${gon.event[i].event_date}` === `${year}-${month + 1}-${date.date}`) {
            const title_box = document.createElement('div');
            title_box.setAttribute('id', 'title_box')
            const div = document.querySelector('td');
            td.appendChild(title_box);
            title_box.textContent = gon.event[i].title
          }
        }
        // if (`${year}-${month + 1}-${date.date}` === '2020-12-12') {
        //   title_box.textContent = "タイトル表示"
        // }

        tr.appendChild(td);
      });
      document.querySelector('tbody').appendChild(tr);
    });
  }

  window.addEventListener("DOMContentLoaded", function () {
    // DOMの準備が出来たら実行
    createCalendar();
  })
  function createCalendar() {
    clearCalendar();
    renderTitle();
    renderWeeks();
  }

  window.addEventListener("DOMContentLoaded", function () {
    document.getElementById('prev').addEventListener('click', () => {
      month--;
      if (month < 0) {
        year--;
        month = 11;
      }
    createCalendar();

  })

  });

  window.addEventListener("DOMContentLoaded", function () {
    document.getElementById('next').addEventListener('click', () => {
      month++;
      if (month > 11) {
        year++;
        month = 0;
      }
    createCalendar();
  })

  });

  
  window.addEventListener("DOMContentLoaded", function () {
    document.getElementById('today').addEventListener('click', () => {
      year = today.getFullYear();
      month = today.getMonth();
      createCalendar();
  })

  });

}

