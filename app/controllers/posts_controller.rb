class PostsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @posts = @event.posts
    @post = Post.new
    @post.comments.build
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    if !@post.comments.empty?
      @first_comment = @post.comments.first
      @rest_comments = @post.comments.slice(1...)
    else
      @first_comment = @post.comments
    end
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
        PostsChannel.broadcast_to(
          @event,
          render_to_string(partial: "post", locals: { post: @post })
        )
        head :ok
        # redirect_to event_posts_path, notice: "Thread was successfully created."
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
