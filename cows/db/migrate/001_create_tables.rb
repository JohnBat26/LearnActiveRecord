require "rubygems"
require "active_record"

class CreateTables < ActiveRecord::Migration
  def change
    create_table :cows do |t|
      t.column :name, :string
      t.column :bread, :string
      t.column :born_on, :datetime
      t.column :milkable, :boolean
      t.column :farmer_id, :integer
      t.timestamps
    end
    create_table :farmers do |t|
      t.column :name, :string
      t.column :address, :string
      t.timestamps
    end
    create_table :resellers do |t|
      t.column :name, :string
      t.column :address, :string
      t.timestamps
    end
    create_table :farmers_resellers, :id => false do |t|
      t.column :reseller_id, :integer
      t.column :farmer_id, :integer
      t.timestamps
    end
    create_table :distributors do |t|
      t.column :reseller_id, :integer
      t.column :farmer_id, :integer
      t.column :milk_price, :float
      t.timestamps
    end
    create_table :tractors do |t|
      t.column :name, :string
      t.column :farmer_id, :integer
      t.timestamps
    end
  end
end