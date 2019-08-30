class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order('created_at desc').includes(:comments).page(params[:page]).per(10)
  end
end
