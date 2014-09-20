class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  
  
  def init()
    assign_numbeer_id() 
  end
  
  def assign_numbeer_id()
    begin
      n_id = Random.rand(1000..9999)
      exists = Contact.find_by(numbeer_id: n_id.to_s)
    end while !exists.nil?
      
    self.numbeer_id = n_id.to_i
  end
    
  def full_name()
    first_name + " " + last_name  
  end
    
end
