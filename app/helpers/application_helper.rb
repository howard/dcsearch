# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def magnet(fileentry, linktext)
    # Returns magnet URI based on file entry object attributes
    return '<a href="magnet:?' + '&xt=urn:tree:tiger:' + fileentry.hashCode + '&xl=' + fileentry.fileSize.to_s + '&dn=' + fileentry.name + '">' + linktext + '</a>'
  end
  
  #def folder_magnet(folderentry, linktext)
    # Creates magnet URI for all files in a folder
  #  link = '<a hreF="magnet:?'
  #  files = Fileentry.find_all_by_folderId(folderentry)
  #  i = 1
  #  for f in files do
  #    link += 'xt.' + i.to_s + 'urn:tree:tiger:' + f.hashCode
  #    i += 1
  #  end
  #  return link + '">' + linktext + '</a>'
  #end
  
end
