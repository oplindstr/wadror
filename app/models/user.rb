class User < ActiveRecord::Base
  include RatingAverage

  validates :username, uniqueness: true
  validates :username, length: { minimum: 3 }
  validates :username, length: { maximum: 15}
  has_many :ratings
end
