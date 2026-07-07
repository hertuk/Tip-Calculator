# tip_calculator.rb
def get_float(prompt)
  loop do
    print prompt
    input = gets.chomp
    val = Float(input) rescue nil
    if val && val >= 0
      return val
    else
      puts "Invalid input. Please enter a positive number."
    end
  end
end

def get_int(prompt)
  loop do
    print prompt
    input = gets.chomp
    val = Integer(input) rescue nil
    if val && val > 0
      return val
    else
      puts "Invalid input. Please enter a positive integer."
    end
  end
end

puts "=== Tip Calculator ==="
bill = get_float("Enter bill amount: ")
tip_percent = get_float("Enter tip percentage (e.g., 15 for 15%): ")
people = get_int("Enter number of people: ")

tip = bill * (tip_percent / 100.0)
total = bill + tip
tip_per_person = tip / people
total_per_person = total / people

puts "\n--- Result ---"
puts "Bill: $%.2f" % bill
puts "Tip (%.0f%%): $%.2f" % [tip_percent, tip]
puts "Total: $%.2f" % total
puts "Split among #{people} people:"
puts "Tip per person: $%.2f" % tip_per_person
puts "Total per person: $%.2f" % total_per_person
