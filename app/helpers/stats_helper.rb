module StatsHelper
  
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