class Keg < ActiveRecord::Base
  belongs_to :beer
  has_many :transactions
end
