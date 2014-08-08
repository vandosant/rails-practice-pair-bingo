class Pairing < ActiveRecord::Base
  validates :pair_date, presence: true
end