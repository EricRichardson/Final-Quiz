class AddHighestBidToAuctions < ActiveRecord::Migration
  def change
    add_reference :auctions, :highest_bid, index: true, foreign_key: true
  end
end
