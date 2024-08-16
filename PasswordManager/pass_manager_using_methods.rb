=begin 
USERNAME PASSWORD RETRIEVER PROGRAM 
USING METHODS ONLY TO KNOW HOW METHODS 
CAN BE USED A RESUABLE CODE 
=end


EMAIL= "sandesh@gmail.com"
PASSWORD="password"
PASSWORD_VAULT= {abc: {username:"sandesh", password:"asdsfasdf"}}

def welcome_message
  puts "Hello Welcome to this Program"
end

def prompt_user_email
  puts "Please Enter your Email"
  print"Email: "
  gets.chomp
end

def verify_user_email (user_email)
  if user_email!= EMAIL
      puts "Invalid Email"
      exit
  end
end

def prompt_user_password
  puts "Please Enter your Password"
  print "Enter password: "
  gets.chomp
end

def verify_user_password(user_password)
  if user_password!= PASSWORD
      puts "Invalid password"
      exit
  end
end

def greet_user(user_email)
  puts "Hello , #{user_email}."
  puts "What would you like to do?"
end

def menu_options
  puts "1) Add new service"
  puts "2) Retrive existing service"
  puts "3) Exit"
end

def get_user_menu_selection
  print "Enter the option: "
  gets.chomp
end

#For handling the selection made by user

def handle_user_selection(user_selection)
  case user_selection
  when "1"
    new_service = set_new_service_name
    set_username_for(new_service)
    set_password_for(new_service)
        
  when "2"
    requested_service_name= retrieve_service_name
    access= retrieve_service_access_for(requested_service_name)
    display_service(requested_service_name, access)
  else
    exit_program
  end
end

#Methods for all the user_handle

def set_new_service_name
  print "Enter the name of service: "
  new_service= gets.chomp
  PASSWORD_VAULT[new_service.to_sym]={}
  new_service
end

def set_username_for(service)
  print "Please Enter the username for this new service: "
  new_service_username = gets.chomp
  PASSWORD_VAULT[service.to_sym][:username]= new_service_username
end

def set_password_for(service)
  print "Please Enter the password for new service: "
  new_service_password= gets.chomp
  PASSWORD_VAULT[service.to_sym][:password]=new_service_password
end

def retrieve_service_name
  print "Please enter the name of the service you want to access: "
  requested_service_name= gets.chomp
end

def retrieve_service_access_for(service_name)
  PASSWORD_VAULT[service_name.to_sym]
end

def display_service(service_name, access)
  puts "Here are the access credentials for #{service_name}: "
  access.each do |key, val|
      puts "#{key}: #{val}"
  end
end

def exit_program 
  puts "Exiting the program, Goodbye!"
  exit
end


#CALLING THE METHODS

welcome_message
user_email = prompt_user_email
verify_user_email(user_email)

user_password = prompt_user_password
verify_user_password(user_password)
greet_user(user_email)

loop do
  menu_options
  user_selection= get_user_menu_selection
  handle_user_selection(user_selection)
end
