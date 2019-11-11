class ClickbaitValidator < ActiveModel::Validator

    def has_clickbait(title)
        clickbait_words = ["Won't Believe", "Secret", "Guess", "Top"]
        clickbait_words.any? {|w| title.include?(w)} if title
    end
    
    def validate(record)
        unless has_clickbait(record.title)
            record.errors[:title] << "Must be clickbait-y"
        end
    end

end