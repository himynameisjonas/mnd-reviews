class Office < ActiveRecord::Base
  has_many :venues
  
  def to_param
    permalink
  end
end
