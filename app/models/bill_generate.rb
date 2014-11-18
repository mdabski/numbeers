class BillGenerate
  
  def initialize ( p_keg )
    @keg = p_keg
  end
  
  def calc_cost_per_pour
    total_pours = Transaction.where( :keg_id => @keg.id ).count
    return @keg.price / total_pours
  end
  
  def charge_each_user
  end
  
end
