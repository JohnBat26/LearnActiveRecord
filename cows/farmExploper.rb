#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# Author: Eugene Batogov
# Copyright 2011 Eugene Batogov
#
# data :2011-10-23

require "rubygems"
require "active_record"
require "logger"
require "yaml"


@logger = Logger.new(STDOUT)
ActiveRecord::Base.logger = @logger

@config = YAML.load_file(File.join(File.dirname(__FILE__), 'config/database.yml'))
ActiveRecord::Base.establish_connection(@config["development"])


class Cow < ActiveRecord::Base
  set_table_name :cows
  belongs_to :farmer
end

class Farmer < ActiveRecord::Base
  has_many :cows
  has_many :tractors
  has_many :resellers, :through => :distributions
  has_one :address, :as => :addressable
end

class Tractor < ActiveRecord::Base
  belongs_to :farmer
end

class Reseller < ActiveRecord::Base
  has_many :distributions
  has_many :farmers, :through => :distributions
  has_one :address, :as => :addressable
end

class Distribution < ActiveRecord::Base
  belongs_to :reseller
  belongs_to :farmer
end

class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
end
##########################################
farmer = Farmer.find(1)
reseller1 = Reseller.find(1)
puts farmer.address.to_yaml

=begin
addr1 = Address.new
addr1.city="Moscow"
addr1.street="Волжский бульвар"
addr1.save

addr2 = Address.new
addr2.city="Няндома"
addr2.street="ул. Ленина"
addr2.save

farmer.address = addr1
reseller1.address = addr2
farmer.save
reseller1.save
=end












#distribution1 = Distribution.new
#distribution1.farmer= farmer
#distribution1.reseller= reseller1
#distribution1.milk_price = 100
#distribution1.save


=begin
farmer = Farmer.new
farmer.name = "Eugene"

cow = Cow.new
cow.name='cow 1'
cow.milkable =TRUE
cow.farmer = farmer
cow.save
=end

=begin
tractor = Tractor.new
tractor.name='Беларусь'
tractor.save
=end


=begin
reseller1 = Reseller.new
reseller1.name = "reseller1"
reseller1.address= "Moscow"
reseller1.farmers << farmer
reseller1.save

reseller2 = Reseller.new
reseller2.name = "reseller2"
reseller2.address= "Kostroma"
reseller2.farmers << farmer
reseller2.save
farmer.save
=end
