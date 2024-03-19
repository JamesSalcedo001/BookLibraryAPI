# /Users/jamessalcedo/Development/code/practice-projects/BookLibraryAPI/class_practice/testing_file.rb

require_relative 'Displayable'
require_relative 'Loan'
require_relative 'PersonalLoan'
require_relative 'BusinessLoan'
require_relative 'Borrower'



john = Borrower.new("John Doe")
puts "Created new borrower: #{john.name}"

personal_loan = PersonalLoan.new(5000, 5, 12, 720) # $5000 dollars, 5% interest, 12 months, credit score 720
puts "\nJohn takes out a personal loan:"
puts "Loan amount: $#{personal_loan.amount}"
puts "Interest Rate: #{personal_loan.interest_rate}%"
puts "Term: #{personal_loan.term} months"

# John takes the personal loan
john.take_loan(personal_loan)
puts "\nJohn's loans after taking personal loan: "
john.loans.each { |loan| loan.display_info }

# Close the personal loan
puts "\nJohn closes his Personal Loan."
john.close_loan(personal_loan)
puts "Personal Loan status: #{personal_loan.status}"

# Display John's loan information after closing the personal loan
puts "\nJohn's Loans after closing Personal Loan:"
john.loans.each { |loan| loan.display_info }