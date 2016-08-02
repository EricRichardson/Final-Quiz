require 'rails_helper'

RSpec.describe BidsController, type: :controller do

  before do
    @bid = create(:bid)
    @auction = create(:auction)
    @auction.update(highest_bid_id: @bid.id)
    @user = create(:user)
    sign_in @user
  end

  describe "#create" do
    it "should not make a bid if it won't be the highest" do
      count_before = Bid.count
      post :create, auction_id: @auction.id, bid: attributes_for(:bid)
      count_after = Bid.count
      expect(count_before).to eq(count_after)
    end

    it "should update the auctions highest bid" do
      old_bid = @auction.highest_bid_id
      post :create, auction_id: @auction.id, bid: attributes_for(:bid, amount: 2)
      expect(Auction.last.highest_bid_id).not_to eq(old_bid)
    end
  end
end
