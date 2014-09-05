
class ArticlesController < ApplicationController
    before_action :set_articles, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end
end

  def show
  end

  def new
    @articles = Article.new
  end

  def edit
  end

  def create
    @articles = Article.new(article_params)

    respond_to do |format|
      if @articles.save
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @articles }
      else
        format.html { render action: 'new' }
        format.json { render json: @articles.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @articles.update(article_params)
        format.html { redirect_to articles_path, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @articles.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @articles.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @articles = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:articles).permit(:title, :url)
    end
