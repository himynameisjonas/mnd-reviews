class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :review
      t.string :other
      t.integer :rating
      t.string :author
      t.integer :venue_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
