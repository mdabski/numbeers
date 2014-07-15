class Contact < ActiveRecord::Base
  has_one :user, as: :meta, dependent: :destroy
  accepts_nested_attributes_for :user
  
  validates :unique_id, uniqueness: true
end
