class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.order('created_at desc').includes(:user, :comments).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(create_params)
    if @article.save
      redirect_to user_path(current_user), notice: "#{@article.title} was posted"
    else
      flash.now[:alert] = "any content"
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(create_params)
      redirect_to user_path(current_user), notice: "#{@article.title} was updated"
    else
      flash.now[:alert] = "any content"
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to user_path(current_user), notice: "#{@article.title} was deleted"
  end

  private
  def create_params
    params.require(:article).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
  
end
