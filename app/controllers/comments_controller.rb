class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to article_path(@article.id)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:article_id].to_i)
    @comment = @article.comments.find(params[:id].to_i)
    render :edit
  end
  
  def update
    @article = Article.find(params[:article_id].to_i)
    @comment = @article.comments.find(params[:id].to_i)
    if @comment.update(comment_params)
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article.id)
  end

  def comment_params
    params.require(:comment).permit(:username, :body)
  end

  private
  def set_article
    @article = Article.find(params[:article_id].to_i)
  end
  def set_comment
    @comment = @article.comments.find(params[:id].to_i)
  end
end