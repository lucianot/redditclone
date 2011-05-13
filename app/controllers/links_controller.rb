class LinksController < ApplicationController
  # skip_before_filter :authenticate_user!, :only => :index
  
  # GET /links
  # GET /links.xml
  def index
    @links = Link.all
  end
  
  # GET /links/new
  # GET /links/new.xml
  def new
    @link = Link.new
  end
  
  # POST /sites
  # POST /sites.xml
  def create
    @link = current_user.links.build(params[:link])
    if @link.save
      redirect_to(root_path, :notice => 'Link was successfully created.')
    else
      render :action => "new"
    end
  end
end
