class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:notice] = "Story saved successfully!"
      redirect_to stories_path
    else
      flash[:alert] = "Story NOT saved. Try again!"
      render :new
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story =Story.find(params[:id])
    if @story.update(story_params)
      flash[:notice] = "Update saved successfully!"
      redirect_to stories_path
    else
      flash[:alert] = "Update not saved. Try again!"
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    flash[:notice] = "Story was deleted successfully!"
    redirect_to stories_path
  end

  private
  def story_params
    params.require(:story).permit(:title, :image_url)
  end

end
