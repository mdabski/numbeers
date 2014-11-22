class Record < ActiveRecord::Base
  belongs_to :contact
  
  def self.total_balance
    Record.sum(:amount)
  end
  
  def self.calculate_balance(id)
    Record.sum(:amount, :conditions => "contact_id = #{id}")
  end
  
end
