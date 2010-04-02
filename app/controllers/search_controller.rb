class SearchController < ApplicationController
  def search
  end

  def results
    if not params[:query]
	    flash[:error] = "No search terms specified!"
	    redirect_to :controller => 'search'
	  else
	    #@file_results = Fileentry.find_with_ferret(params[:query][:term])
	    @file_results = Fileentry.all(:conditions => {:name => params[:query][:term]})
	    
	    #render :partial => 'results'
	  end
  end

end
