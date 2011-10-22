#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# Author: Eugene Batogov
# Copyright 2011 Eugene Batogov
#
# data :2011-10-21

require "rubygems"
require "active_record"
ActiveRecord::Base.establish_connection(
    :adapter => "postgresql",
    :host =>"localhost",
    :username => "cti",
    :password => "",
    :database => "project_development"
)

class Role < ActiveRecord::Base

end
class Account < ActiveRecord::Base
  #set_sequence_name "account_seq"
  #set_primary_key :id
  belongs_to :role, :foreign_key =>"role"
end

admin_role = Role.find_or_create_by_name("Administrator")
account = Account.new
account.username= "SuperUser"
account.role = admin_role
account.save

puts "#{account.username} (#{account.id}) is a(n) #{account.role.name}"
# cpytel (1) is a(n) Administrator
# comment out the following line to avoid deleting the created account
#account.destroy
#puts "We have just deleted the #{account.username} account!"




=begin
acc = Account.new # => this should trigger the execution of the sequence aid_seq
acc.username = 'JohnBat26 at '+Time.new.to_s
#acc.id = rand(100000000000)
acc.save
puts acc.id #=> this should display the value of the sequence we executed.
#a = Account.find_by_username("JohnBat26 at 2011-10-22 12:03:30 +0400")
account = Account.find(2)
# do a variety of things within your application...
account.destroy
puts "we just deleted the record with id of #{account.id} from the database"
=end
