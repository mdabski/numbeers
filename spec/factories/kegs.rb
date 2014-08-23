# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :keg do
    size 1
    price 1.5
    start_date "2014-08-23"
    end_date "2014-08-23"
    beer nil
  end
end
