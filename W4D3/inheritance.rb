class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end


end


class Manager < Employee
  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    return 0 if !self.is_a?(Manager)
    total = 0
    @employees.each do |employee|
      # if employee.is_a?(Manager)
      total += employee.salary*multiplier+ employee.bonus(multiplier)
      # else
      #   total += employee.salary*multiplier
      # end

    end

    return total
  end
end