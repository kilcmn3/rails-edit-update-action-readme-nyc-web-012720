class ArticlesController < ApplicationController
  # before_action :article_helper, only:[:show, :edit, :update]
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  # add edit and update methods here
  def edit
    @article = Article.find(params[:id])
    # redirect_to article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(title: params[:article][:title], description: params[:article][:description])
    redirect_to article_path(@article)
  end

  # private

  # def article_helper
  #   @article = Article.find(params[:id])
  # end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
