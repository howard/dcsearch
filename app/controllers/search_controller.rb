class SearchController < ApplicationController
  PER_PAGE = 15
  
  def search
  end
  
  def advanced
  end
  
  def similar
    @results = Fileentry.find(params[:likethis]).more_like_this :field_names => [:name], :ar_options => {:page => params[:page], :per_page => PER_PAGE}
  end

  def results
    @search_time = Time.now
    if not params[:term]
	    flash[:error] = "No search terms specified!"
	    redirect_to :controller => 'search'
	  else
      term = term_parser params[:term]
      @prev_term = term
	    @results = ActsAsFerret::find term, [Fileentry, Folderentry, Userentry], {:page => params[:page], :per_page => PER_PAGE}, {}
      
	    if @results == []
        flash[:error] = 'No results for "' + term +'"!'
	      redirect_to :action => 'search'
	    end
	  end
	  @search_time = Time.now - @search_time
  end
  
  def advanced_results
    @prev_term = params
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
    @results = Fileentry.find_with_ferret query, :page => params[:page], :per_page => PER_PAGE
    
    if @results == []
      flash[:error] = 'No results for "' + query +'"!'
      redirect_to :action => 'advanced'
    end
  end


  private
  def term_parser(term)
    user_id = /user:[a-zA-Z0-9]*/.match(term).to_s
    if user_id != ''
      user_id = user_id[5..user_id.length]
      user = Userentry.find_by_name(user_id)
      term.delete!(/user:[a-zA-Z0-9]*/.match(term).to_s)
      term += ' userId:' + user.id.to_s unless user == nil
    end
    folder_id = /folder:[\/a-zA-Z0-9]*/.match(term).to_s
    if folder_id != ''
      folder_id = folder_id[7..folder_id.length]
      folder = Folderentry.find_by_shortName(folder_id)
      term.delete!(/folder:[\/a-zA-Z0-9]*/.match(term).to_s)
      term += ' folderId:' + folder.id.to_s unless folder == nil
    end    
    return term
  end
end
