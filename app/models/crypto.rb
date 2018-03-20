class Crypto < ApplicationRecord
  before_save { self.symbol = symbol.upcase }
  belongs_to :user
  validates :symbol, presence: true
  validates :cost_per, presence: true
  validates :amount_owned, presence: true
end
