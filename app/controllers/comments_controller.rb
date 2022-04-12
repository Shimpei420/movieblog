class CommentsController < ApplicationController
    def create
       tweet = Tweet.find(params[:tweet_id])
       comment = current_user.comments.new(comment_params)
       comment.tweet_id = tweet.id
       comment.save
       redirect_to tweet_path(tweet.id)
    end
    
    def destroy
     @comment = Comment.find(params[:id])
     if current_user == @comment.user
         Comment.find_by(id: params[:id], tweet_id: params[:tweet_id]).destroy
         redirect_to tweet_path(params[:tweet_id])
     else
          redirect_to tweet_path(params[:tweet_id])
     end
    end
    
    
    private
    def comment_params
        params.require(:comment).permit(:comment, :tweet_id)
    end
end
