class SentencesController < ApplicationController

  def show
    @story = Story.find(params[:id])
    @sentence = Sentence.find(params[:story_id])
  end

  def new
    @story = Story.find(params[:story_id])
    @sentence = @story.sentences.new
  end

  def create
    @story = Story.find(params[:story_id])
    @sentence = @story.sentences.new(sentence_params)
    if @sentence.save
      flash[:notice] = "New sentence saved successfully!"
      redirect_to story_path(@sentence.story)
    else
      flash[:alert] = "Sentence not saved. Try again!"
      render :new
    end
  end

  def edit
    @sentence = Sentence.find(params[:id])
    @story = Story.find(@sentence.story_id)
  end

  def update
    @sentence = Sentence.find(params[:id])
    if @sentence.update(sentence_params)
      flash[:notice] = "Update saved successfully!"
      redirect_to story_path(@sentence.story)
    else
      flash[:alert] = "Update not saved. Try again!"
      render :edit
    end
  end

  def destroy
    @sentence = Sentence.find(params[:id])
    @sentence.destroy
    flash[:notice] = "Sentence was deleted successfully!"
    redirect_to stories_path
  end

  private
  def sentence_params
    params.require(:sentence).permit(:author, :text, :image_url)
  end

end
