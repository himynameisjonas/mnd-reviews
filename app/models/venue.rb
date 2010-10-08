class Venue < ActiveRecord::Base
  has_many :reviews
  
  def average_rating
    self.reviews.average('rating')
  end
  
  def total_ratings
    self.reviews.count
  end
end
