class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    puts "*"*80
    puts "passei aqui"
    memento = @article.mementos.create!(title: @article.title, content: @article.content, description: @article.description)
    puts memento.inspect
    if @article.update(article_params)
      redirect_to @article
    else
      render 'new'
    end
  end

  def mementos
    @mementos = Article.find(params[:id]).mementos
  end

  def recover
    @memento = Memento.find(params[:memento_id])
    @article = @memento.article
    @article.update_attributes(title: @memento.title, content: @memento.content, description: @memento.description)
    redirect_to article_path @article
  end


  private
    def article_params
      params.require(:article).permit(:title, :description, :content)
    end
end
