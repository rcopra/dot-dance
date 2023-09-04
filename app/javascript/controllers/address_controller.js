import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="address"
export default class extends Controller {
  static targets = [
    'input',
]

  connect() {
    console.log('Address controller is connected');
  }

  initGoogle() {
    // Setup autocomplete
    console.log("Google maps is initialized and the controller knows about it. ")
    console.log(google);
    this.autocomplete = new google.maps.places.Autocomplete(this.inputTarget, {
      componentRestrictions: { country: ["de"] },
      fields: ["address_components", "geometry"],
      types: ["address"],
    });
    this.autocomplete.addListener('place_changed', this.placeSelected.bind(this))

  }

  placeSelected() {
    // use the values from autocomplete
    const place = this.autocomplete.getPlace();
    console.log(place);
  }
}
