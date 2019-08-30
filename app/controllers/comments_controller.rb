class CommentsController < ApplicationController
  def create
    @comment = Comment.new(create_comment_params)
    if @comment.save
      redirect_to article_path(params[:article_id])
    else
      @article = Article.find(params[:article_id])
      render 'articles#show'
    end
  end

  private
  def create_comment_params
    params.require(:comment).permit(:content).merge(params.permit(:article_id)).merge(user_id: current_user.id)
  end
end
