module StatsHelper
  
  def total_pours
    Transaction.count
  end
  
  def current_total_pours(p_keg)
    Transaction.where(keg_id: p_keg.id).count
  end
  
  def most_pours_by_a_user()
    pours = Transaction.all()
    if pours.blank?
      "No Pours Yet!?"
    else
      h = pours.group(:contact_id).count().max_by{|k,v| v}
      h[1]
    end
  end
  
  def current_most_pours_by_a_user(p_keg)
    pours = Transaction.where(keg_id: p_keg.id)
    if pours.blank?
      "No Pours Yet!?"
    else
      h = pours.group(:contact_id).count().max_by{|k,v| v}
      h[1]
    end   
  end
  
  def current_cost_per_pour(p_keg)
    pours = Transaction.where(keg_id: p_keg.id).count
    price_per_pour = p_keg.price / pours
  end
  
end