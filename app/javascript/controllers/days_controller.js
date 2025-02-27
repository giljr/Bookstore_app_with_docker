import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        const divElement = this.element
        const data = JSON.parse(divElement.getAttribute('data-day-sells'))
        const colors = ['#A7F3D0','#99F6E4','#A5F3FC','#BAE6FD','#93C5FD','#C7D2FE','#DDD6FE' ]
        let days = []
        let total = []

        data.forEach((element) => {
            days.push(element[0])
            total.push(element[1])
        })
        new Chart("daySells", {
          type: "bar",
          data: {
            labels: days,
            datasets: [{
              backgroundColor: colors,
              data: total
            }]
          },
          options: {
            legend: { display: false },
            title: { display: false }
        }
      })
    }
}
