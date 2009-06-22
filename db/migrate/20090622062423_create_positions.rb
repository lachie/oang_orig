class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :name
      t.string :slug

      t.boolean :current, :null => false, :default => false

      t.belongs_to :member

      t.date :from
      t.date :to

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
