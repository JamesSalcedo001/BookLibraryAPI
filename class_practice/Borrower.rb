# /Users/jamessalcedo/Development/code/practice-projects/BookLibraryAPI/class_practice/Borrower.rb

class Borrower
    include Displayable 
    attr_accessor :name, :loans

    def initialize(name)
        @name = name
        @loans = []
    end

    def take_loan(loan)
        @loans << loan
    end

    def close_loan(loan)
        if @loans.include?(loan) && loan.status == 'open'
            loan.close_loan
            puts "Loan closed successfully"
        else
            puts "Loan not found or already closed"
        end
    end

end