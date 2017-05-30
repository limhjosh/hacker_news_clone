class UsersController < ApplicationController
  before_filter :authorize

  def show
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def posts
    @posts = current_user.posts
  end

  def comments
    @comments = current_user.comments
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end

end