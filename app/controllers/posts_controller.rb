class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    post = Post.new(post_params.merge(user: current_user))

    if post.save
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    # Certifique-se de que apenas o usuário que criou o post possa editá-lo
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_profile_path, notice: 'Post foi atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_profile_path, notice: 'Post foi apagado com sucesso.'
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    unless current_user == @post.user
      redirect_to root_path, alert: "Você não tem autorização para essa ação."
    end
  end
end
