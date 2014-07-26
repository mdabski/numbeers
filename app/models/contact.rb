class Contact < ActiveRecord::Base
  belongs_to :user
  
  def assign_numbeer_id()
    begin
      n_id = Random.rand(1000..9999)
      exists = Contact.find_by(numbeer_id: n_id.to_s)
    end while !exists.nil?
    
    self.numbeer_id = n_id.to_i
      
  end
end
