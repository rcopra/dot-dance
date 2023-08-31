class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
    @post.comments.build
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @event = Event.find(params[:event_id])
    @post = Post.new(post_params)
    @post.user = current_user
    @post.event = @event
    if @post.save
      @comment = Comment.new(comment_params[:comments_attributes]["0"])
      @comment.post = @post
      @comment.user = current_user
      if @comment.save
        ChatroomChannel.broadcast_to(
          @chatroom,
          render_to_string(partial: "post", locals: { post: @post })
        )
        head :ok
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :topic)
  end

  def comment_params
    params.require(:post).permit(comments_attributes: [:content])
  end
end
