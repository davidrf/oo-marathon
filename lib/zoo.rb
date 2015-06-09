class Zoo
  attr_reader :employees, :cages

  def initialize(name)
    @name = name
    @employees = []
    @cages = Array.new(10) {Cage.new}
  end

  def add_employee(employee)
    @employees << employee
  end


  def add_animal(animal)
    cage = find_empty_cage

    raise ZooAtCapacity if cage.nil?

    cage.animal = animal
  end

  def find_empty_cage
    cages.select { |cage| cage.empty?}.first
  end

  def visit
    string = ''
    employees.each do |employee|
      string << employee.greet + "\n"
    end
    cages.each do |cage|
      unless cage.empty?
      string << cage.animal.speak + "\n"
      end
    end
    string
  end
end

class ZooAtCapacity < StandardError
end
