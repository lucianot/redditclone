class VotesController < ApplicationController  
  before_filter :authenticate_user!
  
  # POST /votes
  def create
    @vote = Vote.build(:link => params[:link], 
                       :voter => current_user,
                       :value => 1)
    if @vote.save!
      redirect_to(root_path, :notice => 'Vote was successfully created.')
    else
      render root_path
    end
  end

  def index
    @votes = Vote.all
  end
  
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to(votes_path)
  end
end
