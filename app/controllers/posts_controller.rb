class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html{ render :show }
      format.js {
        render partial: "posts/#{params[:partial]}", locals: { post: @post }
      }
    end
  end
end
