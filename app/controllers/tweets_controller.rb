class TweetsController < ApplicationController
  def index
    @tweets=Tweet.all
  end
  def new
  end
  def create
    Tweet.create(text: tweet_params[:text], user_id: current_user.id)
    redirect_to action: :index
  end
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
    redirect_to action: :index
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
     redirect_to action: :index
  end

  private
  def tweet_params
    params.permit(:text)
  end
end
