class Rating < ActiveRecord::Base
  belongs_to :beer, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :score, numericality: { greater_than_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true}

  def to_s
    "#{self.beer.name} #{self.score}"
  end

end
