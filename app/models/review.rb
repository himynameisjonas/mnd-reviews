class Review < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user
  
  validates :review, :presence => true
  validates :author, :presence => true
  validates :rating, :presence => true, :numericality => true, :inclusion => { :in => [1,2,3,4,5] }
  validates :date, :format => { :with => /\A\d{4}-(0|1)\d-\d{2}\z/, :message => " måste vara i formatet ÅÅÅÅ-MM-DD" }
end
