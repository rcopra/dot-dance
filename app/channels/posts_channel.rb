class PostsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "some_channel"
    # posts_channel = Event.find(params[:event_id])
    # stream_for posts_channel
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
