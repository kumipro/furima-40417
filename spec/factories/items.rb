FactoryBot.define do
  factory :item do
    title            {Faker::Lorem.sentence}
    review           {Faker::Lorem.sentence}
    price            {3000} 
    category_id      {2}
    condition_id     {2}
    shipping_id      {2}
    region_id        {2}
    shipping_date_id {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
 end
end
