class LinksController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index ]
  
  # GET /links
  def index
    @links = Link.all.sort {|a,b| b.points <=> a.points}
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
    if current_user
      @link = Link.find(params[:id])
      @link.upvote(current_user)
      redirect_to root_path, :notice => 'Link upvoted.'
    else
      redirect_to root_path, :notice => 'You must be signed in to vote.'
    end
  end
  
  # POST /links/1/downvote
  def downvote
    if current_user
      @link = Link.find(params[:id])
      @link.downvote(current_user)
      redirect_to root_path, :notice => 'Link downvoted.'
    else
      redirect_to root_path, :notice => 'You must be signed in to vote.'
    end
  end    
  
  # POST /links/1/remove_vote
  def remove_vote
    if current_user
      @link = Link.find(params[:id])
      @link.remove_vote(current_user)
      redirect_to root_path, :notice => 'Vote removed.'
    else
      redirect_to root_path, :notice => 'You must be signed in to vote.'
    end
  end
end
