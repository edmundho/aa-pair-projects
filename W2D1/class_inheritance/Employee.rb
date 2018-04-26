class Employee

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def add_boss(boss)
    boss.employees << self
  end

# private

attr_accessor :salary

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end


  def bonus(multiplier)
    salaries = []
    employees.each do |emp|
      salaries << emp.salary
    end
    total_salaries = salaries.reduce(:+)
    total_salaries * multiplier
  end



  attr_accessor :employees
end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new("Ned", "Founder", 1_000_000, "bob")
  darren = Manager.new("Darren", "TA Manager", 78_000, ned)
  darren.add_boss(ned)
  shawna = Employee.new("Shawna", "TA", 12_000, darren)
  shawna.add_boss(darren)
  shawna.add_boss(ned)
  david = Employee.new("David", "TA", 10_000, darren)
  david.add_boss(darren)
  david.add_boss(ned)

  p darren.employees

  p ned.bonus(5)
  p darren.bonus(4)
  p david.bonus(3)
end
