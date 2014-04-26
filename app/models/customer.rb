# -*- coding: utf-8 -*-
require 'set'

class Customer
  attr_reader :name

  Instances = {}

  def initialize(name)
    @name = name
    @orders = Set.new
  end

  def friend_orders
    # Orderがリンクを更新するときにのみ使われる
    @orders
  end

  def add_order(order)
    order.customer = self
  end

  def self.with_name(name)
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
