require "rubygems"
require "active_record"

class AddFkForDistributions < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE distributions
        ADD CONSTRAINT fk_distributions_farmers
        FOREIGN KEY (farmer_id)
        REFERENCES farmers(id)
    SQL
  end

  def down
    execute "ALTER TABLE distributions DROP CONSTRAINT fk_distributors_farmers"
  end
end