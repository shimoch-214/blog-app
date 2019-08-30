class Api::ArticlesController < ApplicationController
  puts "hoge"
  def index
    @html = view_context.markdown(params[:content])
    # @Article = Article.find(10)
  end
end