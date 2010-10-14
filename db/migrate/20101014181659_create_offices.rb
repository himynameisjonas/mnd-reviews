class CreateOffices < ActiveRecord::Migration
  def self.up
    create_table :offices do |t|
      t.string :name
      t.string :permalink
      t.float :lat
      t.float :lang

      t.timestamps
    end
    Office.create(:name => "Stockholm", :permalink => "stockholm", :lat => 59.3140065, :lang => 18.0568956)
  end

  def self.down
    drop_table :offices
  end
end
