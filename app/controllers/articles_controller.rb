
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
end

# Create topics
def create
    @articles = Article.new(articles_params)

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
      if @articles.update(articles_params)
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

def add_comments
    @articles = Article.find(params[:id])
    @articles.comments.create
  end
