#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# Author: Eugene Batogov
# Copyright 2011 Eugene Batogov
#
# data :2011-10-23

require "rubygems"
require "active_record"

ActiveRecord::Base.establish_connection(
    :adapter => "postgresql",
    :host =>"localhost",
    :username => "cti",
    :password => "",
    :database => "project_development"
)

class Cow  < ActiveRecord::Base
  belongs_to :farmer
end

class Farmer < ActiveRecord::Base
  has_many :cows
end
