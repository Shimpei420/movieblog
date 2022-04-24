class TweetsController < ApplicationController
    
    def index
        @tweets = Tweet.all.includes(:user).order("updated_at DESC")
    end
    
    def show
        @tweet = Tweet.find(params[:id])
        @comment = current_user.comments.new
        @comments = @tweet.comments
    end
    
    def new
        @tweet = Tweet.new
    end
    
    def create
        Tweet.create(tweet_params)
        redirect_to root_path
    end
    
    def edit
        @tweet = Tweet.find(params[:id])
        unless @tweet.user == current_user
            redirect_to root_path
        end
    end
    
    def update
        @tweet = Tweet.find(params[:id])
        @tweet.update(tweet_params)
        redirect_to root_path
    end
    
    def destroy
       @tweet = Tweet.find(params[:id])
       if current_user == @tweet.user
         @tweet.destroy
         redirect_to root_path
       else
         redirect_to root_path
       end
    end
    
    def search
      @tweets = Tweet.search(params[:keyword])
    end
    
    private
    def tweet_params
        params.require(:tweet).permit(:title, :story, :review, :image, :rate).merge(user_id: current_user.id) 
    end
end
