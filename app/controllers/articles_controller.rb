# frozen_string_literal: true

class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "ann", password: "secret", except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

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
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end 
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
