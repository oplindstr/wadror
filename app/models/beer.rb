class Beer < ActiveRecord::Base
  include RatingAverage
  include Enumerable
  belongs_to :brewery
  validates :name, presence: true
  has_many :ratings, dependent: :destroy

  def to_s
    "#{self.name}, #{self.brewery.name}"
  end
end
