class SearchController < ApplicationController
  PER_PAGE = 15
  
  def search
  end
  
  def advanced
  end
  
  def similar
    @file_results = Fileentry.find(params[:likethis]).more_like_this :field_names => [:name], :ar_options => {:page => params[:page], :per_page => PER_PAGE}
  end

  def results
    @search_time = Time.now
    if params[:type] == 'basic'
      if not params[:term]
  	    flash[:error] = "No search terms specified!"
  	    redirect_to :controller => 'search'
  	  else
        term = term_parser params[:term]
        @prev_term = term
  	    @file_results = ActsAsFerret::find term, [Fileentry, Folderentry, Userentry], {:page => params[:page], :per_page => PER_PAGE}, {}
        
  	    if @file_results == []
  	      flash[:error] = "No results for this search term!"
  	      redirect_to :action => 'search'
  	    end
  	  end
	  else
	    parts = {}
	    
	    parts[:keywords] = params[:keywords]
	    user  = Userentry.find_with_ferret(params[:user])
	    if user != []
	      parts[:user] = 'userId:' + user[0].id.to_s
	    end
	    folder = Folderentry.find_with_ferret(params[:folder])
	    if folder != []
	      parts[:folder] = 'folderId:' + folder[0].id.to_s
	    end
	    if params[:size] != ''
	      parts[:size] = 'fileSize:' + params[:size]
      end
	    
	    query = ''
      parts.each_key do |k|
        if params[:fuzzy] == '1'
          parts[k] = parts[k] + '~'
        end
        query += parts[k] + ' '
      end
	    
	    @prev_term = query
	    @file_results = Fileentry.find_with_ferret query, :page => params[:page], :per_page => PER_PAGE
	    
	    if @file_results == []
	      flash[:error] = "No results for these search terms!"
	      redirect_to :action => 'advanced'
	    end
	  end
	  @search_time = Time.now - @search_time
  end


  private
  def term_parser(term)
    # dysfunctional!
    user_id = /user:[a-zA-Z0-9]*/.match(term).to_s
    if user_id != ''
      user_id = user_id[5..user_id.length]
      term += ' userId:' + Userentry.find_by_name(user_id).id.to_s
    end
    folder_id = /folder:[\/a-zA-Z0-9]*/.match(term).to_s
    if folder_id != ''
      folder_id = folder_id[7..folder_id.length]
      term += ' folderId:' + Folderentry.find_by_name(folder_id).id.to_s
    end    
    return term
  end
  
  def group_identical_files(fileentry_collection)
    # Takes elements of the collection and groups them into arrays in a hash based on their hashCode.
    hash = {}
    for file in fileentry_collection do
      if hash[file].class == Array
        # may need improvement later
        hash[file] += file
      else
        hash[file] = []
      end
    end
    
    return hash
  end
end
