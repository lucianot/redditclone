class LinksController < ApplicationController
  # GET /links
  # GET /links.xml
  def index
    @links = Link.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # GET /links/new
  # GET /links/new.xml
  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  # POST /sites
  # POST /sites.xml
  def create
    @link = current_user.links.build(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to(root_path, :notice => 'Link was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
