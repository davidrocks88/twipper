class TweetsController < ApplicationController
	
	before_action :authenticate_user!

	def new
		@tweet = Tweet.new
		@tweets = current_user.tweets
	end

	def create

		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		if @tweet.save
		#@tweet = Tweet.create(tweet_params)
			flash[:success] = "You tweeted!."
		else
			flash[:danger] = "FIX PROBLEMS BELOW"
		end
		@tweets = current_user.tweets
		render 'new'
	end

	def index
		@tweets = Tweet.all.reject {|tweet| tweet.user == current_user}
	end


	private
	def tweet_params
		params.require(:tweet).permit(:tweet)
	end
end
