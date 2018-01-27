FactoryBot.define do
  factory :post do
    sequence :title do |n|
      "This is a title - #{n}"
    end
    sequence :body do |n|
      "This is a body - #{n}"
    end
  end

end
