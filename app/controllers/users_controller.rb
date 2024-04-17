class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @posts = current_user.posts.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end
end
