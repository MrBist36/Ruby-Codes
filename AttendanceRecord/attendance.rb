class Employee
  attr_accessor :details

  def initialize(details)
    @details = details
  end

  def employee_info
    "Name: #{@details[:name]}, Employee ID: #{@details[:id]}, Employee Address: #{@details[:address]}"
  end
end

class Attendance
  def initialize
    @employee_attendance = []
    @attendance_records = {}
  end

  def add_employee_details(employee)
    @employee_attendance << employee
    @attendance_records[employee.details[:id]] = []
  end

  def view_employee_details
    @employee_attendance.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.employee_info}"
    end
  end

  def mark_attendance(id, date)
    if @attendance_records.key?(id)
      unless @attendance_records[id].include?(date)
        @attendance_records[id] << date
        puts "Attendance marked for Employee ID: #{id} on #{date}"
      else
        puts "Attendance for Employee ID: #{id} on #{date} is already marked!"
      end
    else
      puts "Employee ID: #{id} not found!"
    end
  end

  def view_attendance(id)
    if @attendance_records.key?(id)
      puts "Attendance for Employee ID: #{id}:"
      @attendance_records[id].each do |date|
        puts date
      end
    else
      puts "Employee ID: #{id} not found!"
    end
  end

  def check_presence(id, date)
    if @attendance_records.key?(id)
      if @attendance_records[id].include?(date)
        puts "Employee ID: #{id} is present on #{date}."
      else
        puts "Employee ID: #{id} is absent on #{date}."
      end
    else
      puts "Employee ID: #{id} not found!"
    end
  end
end

def select
  puts "Enter the choice"
  puts "1) Add Employee"
  puts "2) View Employee details"
  puts "3) Mark attendance"
  puts "4) Show Attendance"
  puts "5) Check Presence"
  puts "6) Exit"
  puts "Choose an Option:"
end

attendance = Attendance.new

loop do
  select
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter the employee name: "
    name = gets.chomp

    print "Enter Employee ID: "
    id = gets.chomp.to_i

    print "Enter Employee Address: "
    address = gets.chomp

    employee_details = { name: name, id: id, address: address }
    employee = Employee.new(employee_details)
    attendance.add_employee_details(employee)
    puts "Employee details added successfully!"
    
  when 2
    attendance.view_employee_details

  when 3
    print "Enter the date (YYYY-MM-DD): "
    date = gets.chomp

    print "Enter the Employee ID: "
    id = gets.chomp.to_i

    attendance.mark_attendance(id, date)

  when 4
    print "Enter the Employee ID: "
    id = gets.chomp.to_i

    attendance.view_attendance(id)

  when 5
    print "Enter the date (YYYY-MM-DD): "
    date = gets.chomp

    print "Enter the Employee ID: "
    id = gets.chomp.to_i

    attendance.check_presence(id, date)

  when 6
    puts "Goodbye!"
    break

  else
    puts "Invalid Choice!"
  end
end
