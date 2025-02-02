class ArticlesController < ApplicationController
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
  end

  def update
    @article = Article.find(params[:id])
    @article.update(post_params)
    redirect_to article_path(@article)
  end

  private           #the methods inside private can only be called within the class
#strong params -- specifics the user which part can be updated
  def post_params
    params.require(:article).permit(:title, :description)
  end

end
