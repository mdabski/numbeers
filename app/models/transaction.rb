class Transaction < ActiveRecord::Base
  belongs_to :keg
  belongs_to :contact
  
  validates :keg, presence: true
  validates :contact, presence: true
  
  def next
    self.where("id > ?", id).first
  end

  def prev
    self.where("id < ?", id).last
  end
  
  def first_pour_of_day?
    Transaction.where("created_at >= ?", Time.zone.now.beginning_of_day).first == self
  end
  
  def self.x_in_y_min(x,y)
    t = Transaction.where("created_at >= ?", Time.zone.now - (y * 60))
    t.count >= x
  end

end
