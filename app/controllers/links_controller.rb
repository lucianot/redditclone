class LinksController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  
  # GET /links
  def index
    @links = Link.all
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
      render :action => "new"
    end
  end
  
  # POST /links/1/upvote
  def upvote
    @link = Link.find(params[:id])
    @link.upvote(current_user)
    redirect_to root_path
  end
  
end
