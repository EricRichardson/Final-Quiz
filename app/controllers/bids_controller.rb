class BidsController < ApplicationController
  before_action :find_auction
  before_action :authenticate_user!

  def create
    @bid = Bid.new bid_params
    @bid.user = current_user
    @bid.auction = @auction
    highest_bid = Bid.find @auction.highest_bid_id
    if (
      @bid.amount > highest_bid.amount &&
      !(@auction.user == current_user) &&
      @bid.save
      )
        @auction.update(highest_bid_id: @bid.id)
        redirect_to @auction, notice: "Bid made"
    else
      redirect_to @auction, alert: "Invalid bid"
    end
  end

  private

    def bid_params
      params.require(:bid).permit(:amount)
    end

    def find_auction
      @auction = Auction.find params[:auction_id]
    end
end
