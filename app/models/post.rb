# class MyValidator < ActiveModel::Validator
#     def validate(record)
#         unless record.title.match?("You Won't Believe These True Facts")
#             record.errors.add :name, "Has to be true facts!"
#         end
#     end
# end

class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    validate :validate_title? 


    # def validate_title
    #     if title != "Won't Believe" 
    #         errors.add :title, "Has to be true facts!"
    #     end
    # end

    PATTERNS = [/Won't Believe/, /Secret/, /Top\d/, /Guess/]

    def validate_title?
        
            if PATTERNS.none? {|pattern| pattern.match title}
                  
                errors.add :title, "Has to be true facts!"
            end
        
    end


    # def validate_title
    #     if title 
    #         unless title.match? (Won't Believe| Secret| Top\d| Guess)/
    #             errors.add :title, "Has to be true facts!"
    #         end
    #     end
        
    # end
    
    
end 







 # def true_facts
    #     unless title.match?("You Won't Believe These True Facts")

    #     end
    # end