import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="post-subscription"
  export default class extends Controller {
    static values = { postId: Number }
    static targets = ["comments"]

    connect() {
      this.channel = createConsumer().subscriptions.create(
        { channel: "PostChannel", id: this.postIdValue },
        { received: data => console.log(data) }
      )
      console.log(`Subscribed to the post with the id ${this.postIdValue}.`)
    }
}
