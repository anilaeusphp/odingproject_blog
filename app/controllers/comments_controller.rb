class CommentsController < ApplicationController

  before_action :set_article, only: [:create]

  def create
    @comment = @article.comments.create(comment_params)
    if @comment.save
      redirect_to article_path(@article)
    else
      flash[:alert] = "Some error has been occured"
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end
