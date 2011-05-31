class LinksController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index ]
  
  # GET /links
  def index
    @links = Link.top
  end
  
  # GET /links/new
  def new
    @link = Link.new
  end
  
  # POST /links
  def create
    @link = current_user.links.build(params[:link])
    if @link.save
      redirect_to(root_path, :notice => 'Link was successfully created.')
    else
      render :action => 'new'
    end
  end
end
