# /Users/jamessalcedo/Development/code/practice-projects/BookLibraryAPI/class_practice/PersonalLoan.rb

class PersonalLoan < Loan
    attr_accessor :credit_score

    def initialize(amount, interest_rate, term, credit_score)
        super(amount, adjust_interest_rate(interest_rate, credit_score), term)
        @credit_score = credit_score
    end

    private 

    def adjust_interest_rate(base_rate, credit_score)
        case credit_score
        when 750..Float::INFINITY
            base_rate - 2 # excellent credit gets 2% reduction
        when 650...750 
            base_rate - 1 # good credit gets 1% reduction
        else
            base_rate + 1 # lower scores result in 1% increase
        end
    end
end