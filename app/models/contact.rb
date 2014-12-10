class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  
  def init()
    assign_numbeer_id() 
    self.happy_hour = true
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
