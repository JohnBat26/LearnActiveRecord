require "rubygems"
require "active_record"

class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.column :street, :string
      t.column :city, :string
      t.column :addressable_id, :integer
      t.column :addressable_type, :string
      t.timestamps
    end



  end
end