class BidsController < ApplicationController

  def create
    @bid = Bid.new bid params
    @bid.user = current_user
    if @bid.save
      redirect_to @auction
    else
      flash[:alert] = "Invalid bid"
      redirect_to @auction
    end
  end

  private

    def bid_params
      params.require(:bid).permit(:user, :auction, :amount)
    end
end
