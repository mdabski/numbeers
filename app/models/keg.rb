class Keg < ActiveRecord::Base
  belongs_to :beer
  has_many :transactions
  
  def get_keg_on_tap
    k = Keg.last()
    if k.blank?
      #No Keg created yet...
    elsif k.end_date
      #No Keg currently tapped, last one was marked as ended
    else
      k
    end
  end
  
  def get_brewer
    self.beer ? self.beer.brewer : "Unknown"
  end
  
  def get_name
    self.beer ? self.beer.name : "Emtpy"
  end
  
  def get_style
    self.beer ? self.beer.style : "Empty"
  end
  
  def get_info
    if self.nil?
      "No Keg on Tap! :("
    else
      get_brewer + " : " + get_name + " (" + get_style + ")"
    end
  end
  
  def get_end_date
    self.end_date ? self.end_date : "Currently on Tap"
  end
  
  def charge_users
    all_pours = Transaction.where( keg_id: self.id )
    total_pours = all_pours.count
    price_per_pour = self.price / total_pours
    grouped_users = all_pours.group(:contact_id).count
    
    grouped_users.each do |k,v|
      Record.new(contact_id: k, amount: (v*price_per_pour), description: self.get_info).save
    end
  end
end
