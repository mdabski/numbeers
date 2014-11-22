module StatsHelper
  
  def total_pours
    Transaction.count
  end
  
  def current_total_pours(p_keg)
    if p_keg.blank?
      "No Pours Yet!?"
    else
      pours = Transaction.where(keg_id: p_keg.id)
      if pours.blank?
        "No Pours Yet!?"
      else
        pours.count
      end
    end
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
    if p_keg.blank?
      "No Pours Yet!?"
    else
      pours = Transaction.where(keg_id: p_keg.id)
      if pours.blank?
        "No Pours Yet!?"
      else
        h = pours.group(:contact_id).count().max_by{|k,v| v}
        h[1]
      end
    end
  end
  
  def current_cost_per_pour(p_keg)
    if p_keg.blank?
      0
    else
      pours = Transaction.where(keg_id: p_keg.id)
      if pours.blank?
        0
      else
        price_per_pour = p_keg.price / pours.count
      end
    end
  end
  
end