class SearchController < ApplicationController

  def search
    @results = Search.new(params["search"])
  end

end
