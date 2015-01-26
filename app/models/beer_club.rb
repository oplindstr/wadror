class BeerClub < ActiveRecord::Base
  has_many :users, through: :membership

  def to_s
    "#{self.name} #{self.city}"
  end
end
