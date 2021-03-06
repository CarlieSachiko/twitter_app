class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort]
      @tweets = Tweet.order(params[:sort])
    else
      @tweets = Tweet.all
      # if params[:sort] == handle
        # @tweets.order(:handle)
        # redirect_to "/tweets"
      # end
    end
  end

  def new
    @tweet = Tweet.new
  end

  def show
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to @tweet, notice: 'Tweet was sucessfully created.'
    else
      render :new
    end
  end

  def update
    if @tweet.update_attributes(tweet_params)
      redirect_to tweets_path, notice: 'Tweet was sucessfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: 'Tweet was successfully deleted.'
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:handle, :content, :image)
  end

end
