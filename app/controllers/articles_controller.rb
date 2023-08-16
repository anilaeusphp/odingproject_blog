class ArticlesController < ApplicationController
  before_action :set_article, only: %w[show update destroy edit]
  def index
    @articles = Article.all
  end
  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    else
      render @article
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
