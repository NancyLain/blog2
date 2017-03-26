class ResultsController < ApplicationController
  def index
    @search_results = Micropost.search_everywhere(params[:query])
  end
end
