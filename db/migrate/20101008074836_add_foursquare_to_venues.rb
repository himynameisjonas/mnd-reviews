class AddFoursquareToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :foursquare_id, :integer
  end

  def self.down
    remove_column :venues, :foursquare_id
  end
end
