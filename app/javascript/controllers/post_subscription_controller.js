import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="post-subscription"
  export default class extends Controller {
    static values = { postId: Number }
    static targets = ["comments"]

    connect() {
      this.channel = createConsumer().subscriptions.create(
        { channel: "PostChannel", id: this.postIdValue },
        { received: data => this.commentsTarget.insertAdjacentHTML("beforeend", data) }
      )
      console.log(`Subscribed to the post with the id ${this.postIdValue}.`)
    }

    resetForm(event) {
      event.target.reset()
    }

    disconnect() {
      console.log("Unsubscribed from the post")
      this.channel.unsubscribe()
    }

    #insertCommentAndScrollDown(data) {
      this.commentsTarget.insertAdjacentHTML("beforeend", data)
      this.commentsTarget.scrollTo(0, this.commentsTarget.scrollHeight)
    }
}
