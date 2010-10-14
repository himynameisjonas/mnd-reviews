class AddOfficeIdToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :office_id, :integer
    add_index :venues, :office_id
    Venue.update_all("office_id = #{Office.first.id}")
  end

  def self.down
    remove_column :venues, :office_id
  end
end
