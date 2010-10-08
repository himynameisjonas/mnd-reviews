class RenameTypeToTypeOfFood < ActiveRecord::Migration
  def self.up
    rename_column :venues, :type, :type_of_food
  end

  def self.down
    rename_column :venues, :type_of_food, :type
  end
end
