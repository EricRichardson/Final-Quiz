class Auction < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :details, presence: true
  validates :end_time, presence: true

  has_many :bids
  has_one :highest_bid
end
