require "pry"


class Waiter

  attr_accessor :name, :experience

  @@all = []

  def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
   Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end
  
  def best_tipper
    biggest_tip = 0
    biggest_tipper = "Uncle Money Bags"
    
    Meal.all.select do |meal|
      # binding.pry
      if biggest_tip < meal.tip
        biggest_tip = meal.tip
        biggest_tipper = meal.customer
      end
    end
    return biggest_tipper
  end
  
end
