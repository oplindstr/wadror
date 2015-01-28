class User < ActiveRecord::Base
  include RatingAverage

  has_secure_password

  validates :username, uniqueness: true
  validates :username, length: { minimum: 3 }
  validates :username, length: { maximum: 15}
  has_many :ratings
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, -> { uniq }, through: :memberships

  def to_s
    self.username
  end
end
