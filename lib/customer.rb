class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
        @name = name
        @age = age
        @@all << self
  end

  def self.all
        @@all
  end

  def new_meal(waiter, total, tip=0)
     Meal.new(waiter, self, total, tip)
  end

  def meals
        Meal.all.select do |meal|
            meal.customer == self
        end
  end

  def waiters
        meals.map do |meal|
            meal.waiter
        end
  end


  





end

#   sam = Customer.new("Sam", 27)
#   pat = Waiter.new("Pat", 2)
#   alex = Waiter.new("Alex", 5)

#   sam.new_meal(pat, 50, 10) # A Customer creates a Meal, passing in a Waiter instance
#   sam.new_meal(alex, 20, 3) # A Customer creates a Meal, passing in a Waiter instance
#   pat.new_meal(sam, 30, 5) # A Waiter creates a Meal, passing in a Customer instance