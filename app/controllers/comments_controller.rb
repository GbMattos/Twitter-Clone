class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user if user_signed_in?
    if @comment.save
      redirect_to root_path, notice: 'Comentário adicionado com sucesso.'
    else
      redirect_to root_path, alert: 'Não foi possível adicionar o comentário.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
