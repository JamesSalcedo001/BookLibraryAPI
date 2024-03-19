# /Users/jamessalcedo/Development/code/practice-projects/BookLibraryAPI/class_practice/Displayable.rb

module Displayable
    def display_info
      instance_variables.each do |var|
        value = instance_variable_get(var)
        puts "#{var.to_s.delete('@')}: #{value}"
      end
    end
end
  