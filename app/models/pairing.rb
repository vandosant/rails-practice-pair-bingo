class Pairing < ActiveRecord::Base
  validates :pair_date, presence: true
  validate :pair_date_is_in_the_past

  def pair_date_is_in_the_past
    if pair_date.present? && pair_date > Date.today
      errors.add(:pair_date, "can't be in the future")
    end
  end

  def self.current_pairing(user, pair)
    pairing1 = where(:pair_id => pair.id, :user_id => user.id).first
    pairing2 = where(:user_id => pair.id, :pair_id => user.id).first
    if pairing1
      pairing1
    elsif pairing2
      pairing2
    end
  end

end