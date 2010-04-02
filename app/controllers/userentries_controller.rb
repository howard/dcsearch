class UserentriesController < ApplicationController
  # GET /userentries
  # GET /userentries.xml
  def index
    @userentries = Userentry.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @userentries }
    end
  end

  # GET /userentries/1
  # GET /userentries/1.xml
  def show
    @userentry = Userentry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @userentry }
    end
  end

  # GET /userentries/new
  # GET /userentries/new.xml
  def new
    @userentry = Userentry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @userentry }
    end
  end

  # GET /userentries/1/edit
  def edit
    @userentry = Userentry.find(params[:id])
  end

  # POST /userentries
  # POST /userentries.xml
  def create
    @userentry = Userentry.new(params[:userentry])

    respond_to do |format|
      if @userentry.save
        flash[:notice] = 'Userentry was successfully created.'
        format.html { redirect_to(@userentry) }
        format.xml  { render :xml => @userentry, :status => :created, :location => @userentry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @userentry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /userentries/1
  # PUT /userentries/1.xml
  def update
    @userentry = Userentry.find(params[:id])

    respond_to do |format|
      if @userentry.update_attributes(params[:userentry])
        flash[:notice] = 'Userentry was successfully updated.'
        format.html { redirect_to(@userentry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @userentry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /userentries/1
  # DELETE /userentries/1.xml
  def destroy
    @userentry = Userentry.find(params[:id])
    @userentry.destroy

    respond_to do |format|
      format.html { redirect_to(userentries_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def browse
    # File browser for a user's files
    @path = '/' + params['path']
    @folder = Folderentry.all(:conditions => {:fullName => @path, :parentId => 0, :userId => Userentry.find_by_name(params['user'])})[0]
    @sub_folders = Folderentry.all(:conditions => {:parentId => @folder})
    @files = Fileentry.all(:conditions => {:folderId => @folder})
  end
end
