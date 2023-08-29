class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
end
