class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = current_user.posts.build(body: params[:body])

    if @post.save
      redirect_to @post
    else
      render root_path, status: :unprocessable_entity
    end
  end
end