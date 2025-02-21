import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        const divElement = this.element
        const data = JSON.parse(divElement.getAttribute('data-revenue-sells'))
        const colors = ['#A7F3D0','#99F6E4','#A5F3FC']
        let books = []
        let total = []

        data.forEach((element) => {
            books.push(element[0])
            total.push(element[1])
        })
        new Chart("revenueSells", {
          type: "pie",
          data: {
            labels: books,
            datasets: [{
              backgroundColor: colors,
              data: total
            }]
          },
          options: {
            title: { display: true }
        }
      })
    }
}
