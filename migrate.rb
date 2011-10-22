#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# Author: Eugene Batogov
# Copyright 2011 Eugene Batogov
# This is manual migration script for ActiveRecord
# data :2011-10-22

require "rubygems"
require "active_record"
require "logger"
require "yaml"

if ARGV[0] =~ /VERSION=\d+/
  version = ARGV[0].split('=')[1].to_i
else
  version = nil
end

@logger = Logger.new(STDOUT)
ActiveRecord::Base.logger = @logger

@config = YAML.load_file(File.join(File.dirname(__FILE__), './config/database.yml'))
ActiveRecord::Base.establish_connection(@config["development"])
ActiveRecord::Migrator.migrate("", version)






