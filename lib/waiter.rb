class Waiter

    attr_reader :name, :years_experience

    @@all = []
    def initialize(name, years_experience)
        @name = name
        @years_experience = years_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, waiter, total, tip = 0)
        Meal.new(customer, self, total, tip = 0)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        self.meals.max_by {|meal| meal.tip}.customer
    end
end