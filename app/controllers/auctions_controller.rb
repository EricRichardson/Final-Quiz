class AuctionsController < ApplicationController
  before_action :find_auction, only: [:show]
  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to @auction, notice: "Auction created"
    else
      flash[:alert] = "Auction not created"
      render :new
    end
  end

  def show
    @bid = Bid.new
  end

  private

    def auction_params
      params.require(:auction).permit(:title, :details, :end_time, :reserve_price)
    end

    def find_auction
      @auction = Auction.find params[:id]
    end
end
