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

class Account < ActiveRecord::Base

end

account = Account.new
account.username = "JohnBat26"
account.save