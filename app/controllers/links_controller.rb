class LinksController < ApplicationController
  # # GET /links
  # # GET /links.xml
  # def index
  #   @links = Link.all
  # 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @links }
  #   end
  # end
  
  # GET /links/new
  # GET /links/new.xml
  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @link }
    end
  end
  
  # POST /sites
  # POST /sites.xml
  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to(root_path, :notice => 'Link was successfully created.') }
        format.xml  { render :xml => root_path, :status => :created, :location => @link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end
end
