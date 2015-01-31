class Day < ActiveRecord::Base
  has_one :weight
  has_many :exercises
  has_many :steps
  has_many :calories, class_name: "Calorie"

  def calories_burned
    total_cals = Array.new(0)
    self.exercises.each do |e|
      total_cals << e.calories_burned
    end
    return total_cals.reduce(:+)
  end

  def calories_consumed
    total_cals = Array.new(0)
    self.calories.each do |c| 
      total_cals << c.calorie
    end
    return total_cals.reduce(:+)
  end
end
