# /Users/jamessalcedo/Development/code/practice-projects/BookLibraryAPI/class_practice/BusinessLoan.rb

class BusinessLoan < Loan
    attr_accessor :business_name

    def initialize(amount, interest_rate, term, business_name)
        super(amount, interest_rate, term)
        @business_name = business_name
    end
end