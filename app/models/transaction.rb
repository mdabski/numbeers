class Transaction < ActiveRecord::Base
  belongs_to :keg
  belongs_to :contact
  
  def next
    self.where("id > ?", id).first
  end

  def prev
    self.where("id < ?", id).last
  end
  
end
