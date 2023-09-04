import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="alert"
export default class extends Controller {

  static targets = ["popup"]

  static values = {
    html: String,
    title: String,
    footer: String,
    confirmButtonText: String,
    showCancelButton: Boolean,
    cancelButtonText: String
  }

  connect() {
  }

  initSweetalert(event) {

    console.log(event.currentTarget.href);


  // const url = event.currentTarget.href
  // fetch(url, {
  //   method: "POST",
  //   headers: { "Accept": "text/plain" },
  //   body: ""
  // })
  //   .then(response => response.text())
  //   .then((data) => {


  //     this.popupTarget.outerHTML = data

      Swal.fire({
        customClass: {
          popup: 'border-radius-0'
        },
        html: this.htmlValue,
        title: this.titleValue,
        // footer: this.footerValue,
        showCancelButton: this.showCancelButtonValue,
        confirmButtonText: this.confirmButtonTextValue,
        cancelButtonText: this.cancelButtonTextValue,
        reverseButtons: true
      })
      // .catch((error) => {
      //   console.error("Error with SweetAlert2:", error);
      // });
    // })

  //    const url = event.currentTarget.href
  // fetch(url, {
  //   method: "POST",
  //   headers: { "Accept": "text/plain" },
  //   body: ""
  // }).then(response => response.text())
  // .then((data) => {
  //   console.log(data)
  // }

  // )


  }

  attend(event) {
    event.preventDefault();

    console.log(event)
  }
}
