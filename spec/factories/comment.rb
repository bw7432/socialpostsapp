FactoryBot.define do
  factory :valid_comment do
    sequence :message do |n|
      "This is a comment - #{n}"
    end
  end

  factory :invalid_comment do
    message nil
  end

end
