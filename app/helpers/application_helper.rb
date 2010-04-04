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
  
  def human_filesize bytes
    # Converts filesize in bytes into human readable format
    bytes = bytes.to_s
    while bytes.length > 3 do
      bytes = bytes[0..bytes.length-4]
    end
    unit = case bytes.length
      when 0 then 'B'
      when 1 then 'KB'
      when 2 then 'MB'
      when 3 then 'GB'
      when 4 then 'TB'
      when 5 then 'PB'
      when 6 then 'EB'
      when 7 then 'ZB'
      when 8 then 'YB'
    end
    return bytes + ' ' + unit
  end
  
end
