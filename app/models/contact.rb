class Contact < ActiveRecord::Base
  belongs_to :user, as: :meta, dependent: :destroy
  accepts_nested_attributes_for :user
  
  validates :unique_id, uniqueness: true
end
