require "rubygems"
require "active_record"

class RenameDistributors < ActiveRecord::Migration
  def change
    rename_table :distributors, :distributions
  end
end