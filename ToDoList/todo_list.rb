class TodoList
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
    puts "Added task: '#{task}'"
  end

  def display_tasks
    if @tasks.empty?
      puts "No tasks available."
    else  
      puts "To-Do List:"
      @tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end
  end

  def delete_task(index)
    if index.between?(1, @tasks.size)
      removed_task = @tasks.delete_at(index - 1)
      "Deleted task: '#{removed_task}'"
    else
      "Invalid task number."
    end
  end

  def update_task(index, new_task)
    if index.between?(1, @tasks.size)
      @tasks[index - 1] = new_task
      "Updated task #{index} to: '#{new_task}'"
    else
      "Invalid task number."
    end
  end

  def task_count
    @tasks.size
  end
end

def menu
  puts "\nTo-Do List Menu:"
  puts "1. Add Task"
  puts "2. View Tasks"
  puts "3. Delete Task"
  puts "4. Update Task"
  puts "5. Exit"
end

todo_list = TodoList.new

loop do
  menu
  puts "Choose an option: "
  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Enter task description: "
    task = gets.chomp
    todo_list.add_task(task)
  when 2
    todo_list.display_tasks
  when 3
    todo_list.display_tasks
    if todo_list.task_count > 0
      puts "Enter task number to delete: "
      task_number = gets.chomp.to_i
      puts todo_list.delete_task(task_number)
    else
      puts "No tasks to delete."
    end
  when 4
    todo_list.display_tasks
    if todo_list.task_count > 0
      puts "Enter task number to update: "
      task_number = gets.chomp.to_i
      if task_number.between?(1, todo_list.task_count)
        puts "Enter new task description: "
        new_task = gets.chomp
        puts todo_list.update_task(task_number, new_task)
      else
        puts "Invalid task number."
      end
    else
      puts "No tasks to update."
    end
  when 5
    puts "Exiting..."
    break
  else
    puts "Invalid choice. Please try again."
  end
end

