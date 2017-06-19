class PostsController < ApplicationController
   before_action :user_logged_in, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end

  end

  private

    def user_logged_in
      unless logged_in?
        flash[:danger] = "Sign in first"
        redirect_to login_path
      end
    end

    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end

end
