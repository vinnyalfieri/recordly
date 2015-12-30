class SearchController < ApplicationController
  before_filter :authenticate_user
  
  def search
    @results = Search.new(params["search"])
  end

end
