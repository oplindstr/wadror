module RatingAverage
  def average_rating
    @count = self.ratings.count
    @average = self.ratings.inject(0) { |sum, n| sum + n.score}
    @average = @average/@count
  end
end