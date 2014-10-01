class Transaction < ActiveRecord::Base
  belongs_to :keg
  belongs_to :contact
  
  def next
    self.where("id > ?", id).first
  end

  def prev
    self.where("id < ?", id).last
  end
  
  def self.first_pour_of_day()
    Transaction.where("created_at >= ?", Time.zone.now.beginning_of_day).first
  end
  
end
