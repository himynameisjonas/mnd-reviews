class User < ActiveRecord::Base
  has_many :authorizations
  
  def self.create_from_hash!(hash)
    name = hash['user_info']['name'] || hash['user_info']['email']
    create(:name => name)
  end
end
