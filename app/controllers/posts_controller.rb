class PostsController < ApplicationController
   before_action :user_logged_in, only: [:new, :create]

  def index
    @posts = Post.all
  end

end
