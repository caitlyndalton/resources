class Employee
  attr_reader :first_name, :last_name, :active
  attr_writer :active

  def initialize(input_options_hash)
    @first_name = input_options_hash[:first_name]
    @last_name = input_options_hash[:last_name]
    @salary = input_options_hash[:salary]
    @active = input_options_hash[:active]
  end

  def print_info
    puts "#{@first_name} #{@last_name} makes #{@salary} a year. #{@active}."
  end

  def give_annual_raise
    @salary = 1.05 * @salary
  end

  def fire_employee
    @active = false
    puts "#{first_name} #{last_name} has been fired."
  end
end

class Manager < Employee
  def initialize(input_options_hash)
    super(input_options_hash)
    @employees = input_options_hash[:employees]
  end

  def send_report
    puts "Sending email..."
    # use email sending library
    puts "Email sent!"
  end

  def give_all_raises
    @employees[0].give_annual_raise
    @employees[1].give_annual_raise
  end

  def fire_all_employees
    @employees[0].fire_employee
    @employees[1].fire_employee
  end
end

employee1 = Employee.new({ first_name: "Majora", last_name: "Carter", salary: 80000, active: true })
employee2 = Employee.new(first_name: "Danilo", last_name: "Campos", salary: 70000, active: true)
employee1.print_info
employee2.print_info
employee2.give_annual_raise
employee2.print_info

manager = Manager.new(first_name: "Saron", last_name: "Yitbarek", salary: 100000, active: true, employees: [employee1, employee2])
manager.print_info
manager.send_report
manager.give_all_raises
manager.print_info
manager.fire_all_employees
employee2.print_info
