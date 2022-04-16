class SearchesController < ApplicationController
    def search
      @tweets = Tweet.search(params[:keyword])
    end
end
