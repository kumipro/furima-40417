FactoryBot.define do
  factory :order_address do
    post_code    { '000-0000' }
    region_id    {2}
    city         { '札幌市' }
    block_number { '札幌1-1' }
    building_name{ '札幌ビル'}
    phone        { '0111234567' }
    token        {"tok_abcdefghijk00000000000000000"}
  end
end
