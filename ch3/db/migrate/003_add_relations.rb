require "rubygems"
require "active_record"

class AddRelations < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE cows
        ADD CONSTRAINT fk_cows_farmers
        FOREIGN KEY (farmer_id)
        REFERENCES farmers(id)
    SQL
    execute <<-SQL
      ALTER TABLE farmers_resellers
        ADD CONSTRAINT fk_farmers_resellers_farmers
        FOREIGN KEY (farmer_id)
        REFERENCES farmers(id)
    SQL
    execute <<-SQL
      ALTER TABLE farmers_resellers
        ADD CONSTRAINT fk_farmers_resellers_resellers
        FOREIGN KEY (reseller_id)
        REFERENCES resellers(id)
    SQL
    execute <<-SQL
      ALTER TABLE distributors
        ADD CONSTRAINT fk_distributors_resellers
        FOREIGN KEY (reseller_id)
        REFERENCES resellers(id)
    SQL
    execute <<-SQL
      ALTER TABLE tractors
        ADD CONSTRAINT fk_tractors_farmers
        FOREIGN KEY (farmer_id)
        REFERENCES farmers(id)
    SQL
  end

  def down
    execute "ALTER TABLE cows DROP CONSTRAINT fk_cows_farmers"
    execute "ALTER TABLE farmers_resellers DROP CONSTRAINT fk_farmers_resellers_farmers"
    execute "ALTER TABLE farmers_resellers DROP CONSTRAINT fk_farmers_resellers_resellers"
    execute "ALTER TABLE distributors DROP CONSTRAINT fk_distributors_resellers"
    execute "ALTER TABLE tractors DROP CONSTRAINT fk_tractors_farmers"
  end
end