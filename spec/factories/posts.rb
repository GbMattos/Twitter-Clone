FactoryBot.define do
  factory :post do
    body { "Example content..." }
    user
    created_at { Time.current }
  end
end
