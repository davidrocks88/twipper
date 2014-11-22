class TweetsController < ApplicationController
	def new
		@tweet = Tweet.new
		@tweets = Tweet.all
	end

	def create

		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		@tweet.save
		#@tweet = Tweet.create(tweet_params)
		flash[:success] = "Yep."
		@tweets = Tweet.all
		render 'new'
	end

	def tweet_params
		params.require(:tweet).permit(:tweet)
	end
end
