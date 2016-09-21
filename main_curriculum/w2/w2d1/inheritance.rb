require 'byebug'
class Employee

  attr_reader :salary, :name
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss)
    @employees = []
    super
  end

  def bonus(multiplier)
    bonus = 0
    queue = @employees
    until queue.empty?
      queue.each do |e|
        bonus+= queue.shift.salary
        queue += e.employees if e.is_a?(Manager)
      end
    end

    # employees_salary = @employees.inject {|sum, employee| sum += employee.salary}
    bonus *= multiplier
  end

  def add_employee(employee)

    # byebug if self.name == "ned"
    # empl_arr = []
    @employees << employee
    # if employee.is_a?(Manager)
    #   employee.employees.each do |e|
    #     @employees += add_employee(e)
    #   end
    # end
    # empl_arr += add_employee(e.employees) if e.is_a?(Manager)
    # @employees.concat(empl_arr)
  end
end

david = Employee.new("david", "TA", 10000, "darren")
shawna = Employee.new("shawna", "TA", 12000, "darren")
darren = Manager.new("darren", "TA Manager", 78000, "ned")
darren.add_employee(david)
darren.add_employee(shawna)
ned = Manager.new("ned", "founder", 1000000, "")
ned.add_employee(darren)
p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
