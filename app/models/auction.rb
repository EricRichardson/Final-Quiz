class Auction < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :details, presence: true
  validates :end_time, presence: true
end
