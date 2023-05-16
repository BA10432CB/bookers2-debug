class RelationshipsController < ApplicationController
  def create
  end

  def destroy
  end

  private

  def relationship_params
    params.reqire(:relationship).permit(:follower_id, :followed_id)
end
