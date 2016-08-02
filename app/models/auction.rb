class Auction < ActiveRecord::Base
  include AASM

  aasm whiny_tansitions: false do
    state :draft, initial: true
    state :published
    state :reserve_met
    state :won
    state :canceled
    state :reserve_not_met

    event :publish do
      transitions from: :draft, to: :published
    end

    event :cancel do
      transitions from: :published, to: :canceled
    end

    event :win do
      transitions from: :published, to: :won
    end

    event :unmet_reserve do
      transitions from: :published, to: :reserve_not_met
    end
  end

  belongs_to :user
  validates :title, presence: true
  validates :details, presence: true
  validates :end_time, presence: true

  has_many :bids
  has_one :highest_bid
end
