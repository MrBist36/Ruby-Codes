class Contact
  attr_accessor :details

  def initialize(details)
    @details=details
  end

  def contact_info
    "Name: #{@details[:name]}, Phone_Number: #{@details[:phone]}, Email: #{@details[:email]}"
  end
end

class AddressBook
  def initialize
    @contacts = []
  end

  def add_contacts(contact)
    @contacts << contact
  end

  def list_contact
    @contacts.each_with_index do |contact, index|
      puts "#{index+1}. #{contact.contact_info}"
    end
  end

  def delete_contact(index)
    @contacts.delete_at(index-1)
  end
end


def select
  puts "Address Book"
  puts "1) Add Contact"
  puts "2) View Contact"
  puts "3) Delete Contact"
  puts "4) Exit"
  print "Choose an Option: "
end

address_book= AddressBook.new

loop do
  select
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter Name: "
    name = gets.chomp

    print "Enter Phone Number: "
    phone = gets.chomp

    print "Enter Email: "
    email = gets.chomp

    contact_details= {name: name, phone: phone, email: email}
    contact= Contact.new(contact_details)
    address_book.add_contacts(contact)
    puts "Contact addded successfully"
  
  when 2
    address_book.list_contact
  
  when 3 
    address_book.list_contact
    puts "Enter the number you want to delete: "
    index = gets.chomp.to_i
    if index > 0 && index <= address_book.instance_variable_get(:@contacts).length
      address_book.delete_contact(index)
      puts "Contact Deleted Successfully"
    else
      puts "Invalid Index"
    end
  
  when 4
    puts "GoodByeeeee!!!!!!!!!!"
    break 
  else
    puts "Invalid choice"
  end
end
