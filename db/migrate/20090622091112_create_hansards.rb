class CreateHansards < ActiveRecord::Migration
  def self.up
    create_table :hansard do |t|
      t.string :parlinfo_url

      t.datetime :transcribed_at
      t.string :section_identifier

      t.belongs_to :parent
      t.belongs_to :member

      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :hansards
  end
end
