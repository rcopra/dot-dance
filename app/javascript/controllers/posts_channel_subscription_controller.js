import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="posts-channel-subscription"
export default class extends Controller {
  static values = { eventId: Number }
  static targets = ["posts"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "PostsChannel", event_id: this.eventIdValue },
      { received: data => console.log("hello") }
    )
  }
}
