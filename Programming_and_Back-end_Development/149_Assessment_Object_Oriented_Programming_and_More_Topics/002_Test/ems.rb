module DelegateWork
  def delegate_work(employee, task_description)
    employee.delegated_work << [task_description, self.name]
  end
end

class Employee
  @@current_serial_number = 0
  attr_accessor :serial_number, :delegated_work, :work_space, :vacation_days
  
  def initialize(name)
    @serial_number = @@current_serial_number
    @@current_serial_number += 1
    @name = name
    @delegated_work = []  # will be an array of arrays, in each array there
                          # will be a task, and the name who assigned the task
  end
  
  def name
    @name
  end
end

class FullTimeEmployee < Employee
  attr_accessor :desk_number
  
  def initialize(name)
    super(name)
    @vacation_days = 10
  end
end

class PartTimeEmployee < Employee
  def initialize(name)
    super(name)
    @vacation_days = 0
  end
end

class Manager < FullTimeEmployee
  attr_accessor :office_number
  
  include DelegateWork
  
  def initialize(name)
    super(name)
    @vacation_days = 14
  end
  
  def name
    "Mgr. " + @name
  end
end

class Executive < FullTimeEmployee
  attr_accessor :corner_office_number
  
  include DelegateWork
  
  def initialize(name)
    super(name)
    @vacation_days = 20
  end
  
  def name
    "Exe. " + @name
  end
end