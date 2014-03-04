# -*- coding: utf-8 -*-
class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
    @orders = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def add_order(arg)
    @orders << arg
  end

  def statement
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      # このレンタルの料金を表示
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end
    # フッター行を追加
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{total_frequent_renter_points} frequent renter points"
    result
  end

  def print_owing(previous_amount)
    print_banner
    outstanding = calculate_outstanding(previous_amount * 1.2)
    print_details(outstanding)
  end

  def print_banner
    puts '**************************'
    puts '****** Customer Owes******'
    puts '**************************'
  end

  def print_details(outstanding)
    puts "name: #{@name}"
    puts "amount: #{outstanding}"
  end

  def calculate_outstanding(initial_value)
    @orders.inject(initial_value) { |result, order| result + order.amount }
  end

  private

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge }
  end

  def total_frequent_renter_points
    @rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
  end
end
