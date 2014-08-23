class Beer < ActiveRecord::Base
  
  validates :brewer, presence: true
  validates :name, presence: true
  validates :style, presence: true
  
  has_many :kegs
end
