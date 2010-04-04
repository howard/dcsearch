class UserentriesController < ApplicationController
  def browse
    # File browser for a user's files
    @path = '/'
    if params['path'] != nil
      @path += params['path'].join('/')
    else
      @path = '/'
    end
    @folder = Folderentry.all(:conditions => {:fullName => @path, :userId => params['id'].to_i})[0]
    @sub_folders = Folderentry.all(:conditions => {:parentId => @folder})
    @files = Fileentry.all(:conditions => {:folderId => @folder})
  end
end
