class Transaction < ActiveRecord::Base
  belongs_to :keg
  belongs_to :contact
  
end
