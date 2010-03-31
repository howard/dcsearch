class FileentriesController < ApplicationController
  # GET /fileentries
  # GET /fileentries.xml
  def index
    @fileentries = Fileentry.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fileentries }
    end
  end

  # GET /fileentries/1
  # GET /fileentries/1.xml
  def show
    @fileentry = Fileentry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fileentry }
    end
  end

  # GET /fileentries/new
  # GET /fileentries/new.xml
  def new
    @fileentry = Fileentry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fileentry }
    end
  end

  # GET /fileentries/1/edit
  def edit
    @fileentry = Fileentry.find(params[:id])
  end

  # POST /fileentries
  # POST /fileentries.xml
  def create
    @fileentry = Fileentry.new(params[:fileentry])

    respond_to do |format|
      if @fileentry.save
        flash[:notice] = 'Fileentry was successfully created.'
        format.html { redirect_to(@fileentry) }
        format.xml  { render :xml => @fileentry, :status => :created, :location => @fileentry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fileentry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fileentries/1
  # PUT /fileentries/1.xml
  def update
    @fileentry = Fileentry.find(params[:id])

    respond_to do |format|
      if @fileentry.update_attributes(params[:fileentry])
        flash[:notice] = 'Fileentry was successfully updated.'
        format.html { redirect_to(@fileentry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fileentry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fileentries/1
  # DELETE /fileentries/1.xml
  def destroy
    @fileentry = Fileentry.find(params[:id])
    @fileentry.destroy

    respond_to do |format|
      format.html { redirect_to(fileentries_url) }
      format.xml  { head :ok }
    end
  end
end
