# /Users/jamessalcedo/Development/code/practice-projects/BookLibraryAPI/class_practice/Loan.rb

class Loan
    include Displayable
    attr_accessor :amount, :interest_rate, :term, :status

    def initialize(amount, interest_rate, term)
        @amount = amount
        @interest_rate = interest_rate
        @term = term # in months
        @status = 'open'
    end

    def close_loan
        @status = 'closed'
    end

    def monthly_payment
    interest = @amount * (@interest_rate / 100.0) * (@term / 12.0)
    total_amount = @amount + interest
    total_amount / @term
    end

end