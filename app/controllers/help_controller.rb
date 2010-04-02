class HelpController < ApplicationController
  def index
    redirect_to :action => 'usage'
  end
  
  def stats
  end

  def usage
  end

  def about
  end

end
