class AddDateToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :date, :date
  end

  def self.down
    remove_column :reviews, :date
  end
end
