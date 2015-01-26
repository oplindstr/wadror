class Beer < ActiveRecord::Base
  include RatingAverage
  include Enumerable
  belongs_to :brewery
  validates :name, presence: true
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  def to_s
    "#{self.name}, #{self.brewery.name}"
  end
end
