require "rubygems"
require "active_record"

class CreateCowsTable < ActiveRecord::Migration
  def self.up
    create_table :cows do |t|
      t.column :name, :string
      t.column :bread, :string
      t.column :born_on, :datetime
      t.column :milkable, :boolean
    end

  end

  def self.down

  end
end