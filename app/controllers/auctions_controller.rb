class AuctionsController < ApplicationController
  before_action :find_auction, only: [:show]
  before_action :authenticate_user!, only: [:create]

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    initial_bid = Bid.create( amount: 0, auction: @auction, user: current_user )
    @auction.highest_bid_id = initial_bid.id
    if @auction.save
      redirect_to @auction, notice: "Auction created"
    else
      flash[:alert] = "Auction not created"
      render :new
    end
  end

  def show
    @bid = Bid.new
    @bids = @auction.bids
    @highest_bid = Bid.find @auction.highest_bid_id
  end

  def index
    @auctions = Auction.all
  end

  private

    def auction_params
      params.require(:auction).permit(:title, :details, :end_time, :reserve_price)
    end

    def find_auction
      @auction = Auction.find params[:id]
    end
end
