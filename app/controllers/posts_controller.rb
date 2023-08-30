class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
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
      redirect_to event_posts_path , notice: "Thread was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :topic)
  end
end
