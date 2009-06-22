class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :first_name
      t.string :last_name

      t.belongs_to :party
      t.belongs_to :house
      t.belongs_to :electorate

      t.date :entered_house
      t.string :entered_how

      t.date :exited_house
      t.string :exited_how

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
