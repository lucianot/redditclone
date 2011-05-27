class VotesController < ApplicationController  
  before_filter :authenticate_user!
  
  # POST /votes
  def create
    @vote = current_user.votes.build(:link_id => params[:link_id], 
                                     :value => params[:value])                 
    if @vote.save!
      notice = params[:value].to_i == -1 ? 'Link downvoted.' : 'Link upvoted.'
      redirect_to(root_path, :notice => notice)
    else
      redirect_to root_path
    end
  end

  def index
    @votes = Vote.all
  end
  
  def destroy
    @vote = current_user.votes.find_by_link_id(params[:link_id])
    @vote.destroy
    redirect_to(root_path, :notice => 'Vote removed.')
  end
end
