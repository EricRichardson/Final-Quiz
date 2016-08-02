class UsersController < ApplicationController

  def show
    @user = current_user
    @bids = Bid.where(user: current_user)
  end
end
