# -*- coding: utf-8 -*-
class Customer
  attr_reader :name

  Instances = {}

  def initialize(name)
    @name = name
  end

  def self.create(name)
    Instances[name]
  end

  def self.load_customers
    new("customer_1").store
    new("customer_2").store
  end

  def store
    Instances[name] = self
  end
end
