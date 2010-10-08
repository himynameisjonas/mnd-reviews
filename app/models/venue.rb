class Venue < ActiveRecord::Base
  has_many :reviews
  
  def average_rating
    self.reviews.average('rating')
  end
end
