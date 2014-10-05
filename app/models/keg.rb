class Keg < ActiveRecord::Base
  belongs_to :beer
  has_many :transactions
  
  def self.get_keg_on_tap
    k = Keg.last()
    if k.blank?
      #No Keg created yet...
    elsif k.end_date
      #No Keg currently tapped, last one was marked as ended
    else
      k
    end
  end
  
  def get_name()
    self.beer ? self.beer.name : "Emtpy"
  end
  
  def get_style()
    self.beer ? self.beer.style : "Empty"
  end
  
  def get_info()
    if self.nil?
      "No Keg on Tap! :("
    else
      get_name + " (" + get_style + ")"
    end
  end
  
  def get_end_date()
    self.end_date ? self.end_date : "Currently on Tap"
  end
end
