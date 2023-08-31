import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="alert"
export default class extends Controller {
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
    event.preventDefault();

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
    }).then((action) => {
      if (action.isConfirmed) {
        this.element.click();
      }
    })
    .catch((error) => {
      console.error("Error with SweetAlert2:", error);
    });
  }
}
