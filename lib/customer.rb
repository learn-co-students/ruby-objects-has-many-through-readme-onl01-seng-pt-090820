
#  We want to
#  make sure when building out classes, that there's something to store each
#  instance.  That is to say: the `Customer` class should know about every
#  `customer` instance that gets created.
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

    def meals
        Meal.all.select do |meal|
             meal.customer == self #CHECKING FOR WAITER NOW
# We're iterating through every instance of `Meal` and returning only the
# ones where the meal's `customer` matches the current `customer` instance. If a
# customer, Rachel, wants to know about all of her meals, all we need to do is call
# the `#meals` method on the her Customer instance
        end

    end
    
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
# they'll need to take in an instance of a `waiter` and supply the `total`
# and `tip`, which we'll have defaulted to 0 here as well:
      end


    def waiters
        meals.map do |meal|
# what if we now;
# want a list of all of the waiters that Rachel has interacted with?  Each meal is
# also associated with a waiter, so to get every waiter from every meal Rachel has
# had, we need to take the array of all of Rachel's meals, map over it, getting the
# waiter from each of those meals.
            meal.waiter
        end
    end

  
end