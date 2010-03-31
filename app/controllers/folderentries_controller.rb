class FolderentriesController < ApplicationController
  # GET /folderentries
  # GET /folderentries.xml
  def index
    @folderentries = Folderentry.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @folderentries }
    end
  end

  # GET /folderentries/1
  # GET /folderentries/1.xml
  def show
    @folderentry = Folderentry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @folderentry }
    end
  end

  # GET /folderentries/new
  # GET /folderentries/new.xml
  def new
    @folderentry = Folderentry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @folderentry }
    end
  end

  # GET /folderentries/1/edit
  def edit
    @folderentry = Folderentry.find(params[:id])
  end

  # POST /folderentries
  # POST /folderentries.xml
  def create
    @folderentry = Folderentry.new(params[:folderentry])

    respond_to do |format|
      if @folderentry.save
        flash[:notice] = 'Folderentry was successfully created.'
        format.html { redirect_to(@folderentry) }
        format.xml  { render :xml => @folderentry, :status => :created, :location => @folderentry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @folderentry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /folderentries/1
  # PUT /folderentries/1.xml
  def update
    @folderentry = Folderentry.find(params[:id])

    respond_to do |format|
      if @folderentry.update_attributes(params[:folderentry])
        flash[:notice] = 'Folderentry was successfully updated.'
        format.html { redirect_to(@folderentry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @folderentry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /folderentries/1
  # DELETE /folderentries/1.xml
  def destroy
    @folderentry = Folderentry.find(params[:id])
    @folderentry.destroy

    respond_to do |format|
      format.html { redirect_to(folderentries_url) }
      format.xml  { head :ok }
    end
  end
end
