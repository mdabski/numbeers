class StatsController < ApplicationController
  
  def get_stats
    
    render json: {
      pours_current_keg: pours_by_user_current_keg,
      pours_current_keg_total: Keg.get_current_pours,
      pours_lifetime: pours_by_user_lifetime,
      pours_lifetime_total: Transaction.count,
      keg_gauge_level: liquid_left_in_keg
      }
  end
  
  private
  
  def liquid_left_in_keg
    pours = Keg.get_current_pours
    size = Keg.get_current_size
    # It was calculate that there are roughly 2 pours per liter, so we need to take the size and double it.
    amount_drank = pours / (size*2.0)
    return (1.0-amount_drank) * 100.0
  end
  
  def pours_by_user_current_keg
    keg = Keg.get_keg_on_tap
    @pours = Transaction.where(keg: keg).group(:contact_id).count.values
    @pours.collect{|p|{label: p, value:p}}
  end
  
  def pours_by_user_lifetime
    @pours = Transaction.all.group(:contact_id).count.values
    @pours.keep_if{|p| p>threshold}
    @pours.collect{|p|{label: p, value:p}}
  end
  
  def threshold
    (Transaction.count*0.02).ceil
  end
end