class User < ActiveRecord::Base
  include RatingAverage

  has_secure_password

  validates :username, uniqueness: true
  validates :username, length: { minimum: 3 }
  validates :username, length: { maximum: 15}
  validates :password, :format => {:with => /(?=.*[A-Z])/, message: "must contain a capital letter", multiline: true}
  validates :password, :format => {:with => /(?=.*\d+)/, message: "must contain a number", multiline: true}
  validates :password, :format => {:with => /^.{4,}$/, message: "must be at least 4 characters long", multiline: true}
  has_many :ratings
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, -> { uniq }, through: :memberships

  def to_s
    self.username
  end
end
