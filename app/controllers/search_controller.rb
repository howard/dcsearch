class SearchController < ApplicationController
  
  def term_parser(term)
    return term
  end
  
  def search
  end

  def results
    if not params[:query]
	    flash[:error] = "No search terms specified!"
	    redirect_to :controller => 'search'
	  else
	    term = term_parser params[:query][:term]
	    @file_results = Fileentry.find_with_ferret(params[:query][:term])
	    #@file_results = Fileentry.all(:conditions => {:name => params[:query][:term]})
	    
	    if @file_results == []
	      flash[:error] = "No results for this search term!"
	      redirect_to :action => 'search'
	    end
	  end
  end

end
