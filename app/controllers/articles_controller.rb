class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def new
    @article = Article.new #(author: Author.find(params[:author]))
  end
  
  def create
    @article = Article.new(title: params[:article][:title], body: params[:article][:body], author: Author.find(params[:article][:author].to_i))

    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
    render :edit
  end
  
  def update
    @article = Article.find(params[:id])

    if @article.update(title: params[:article][:title], body: params[:article][:body], author: Author.find(params[:article][:author].to_i))
      redirect_to articles_path
    else
      render :edit
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :author)
  end
end