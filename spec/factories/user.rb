FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'abc123'}
    password_confirmation {password}
    last_name             {'佐藤'}
    first_name            {'太郎'}
    last_name_kana        {'サトウ'}
    first_name_kana       {'タロウ'}
    birthday              {'2000/10/01'}  
  end
end