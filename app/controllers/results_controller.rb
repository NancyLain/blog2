class ResultsController < ApplicationController
  def index

    @search_results = Micropost.full_search(params[:query])
  end
end
