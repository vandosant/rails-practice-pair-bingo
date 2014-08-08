class Pairing < ActiveRecord::Base
  validates :pair_date, presence: true
  validate :pair_date_is_in_the_past

  def pair_date_is_in_the_past
    if pair_date.present? && pair_date > Date.today
      errors.add(:pair_date, "can't be in the future")
    end
  end
end