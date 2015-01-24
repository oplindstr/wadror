class Beer < ActiveRecord::Base
  include Enumerable
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  def average_rating
    @count = self.ratings.count
    @average = self.ratings.inject(0) { |sum, n| sum + n.score}
    @average = @average/@count
  end

  def to_s
    "#{self.name}, #{self.brewery.name}"
  end
end
