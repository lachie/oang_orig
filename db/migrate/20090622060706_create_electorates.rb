class CreateElectorates < ActiveRecord::Migration
  def self.up
    create_table :electorates do |t|
      t.string :name
      t.string :slug

      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :electorates
  end
end
