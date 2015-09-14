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
    if size != 0
      # It was calculate that there are roughly 2.5 pours per liter (based on 400ml glasses)
      amount_drank = pours / (size*2.5)
      return (1.0-amount_drank) * 100.0
    else
      return 0
    end
  end
  
  def pours_by_user_current_keg
    keg = Keg.get_keg_on_tap
    @pours = Transaction.where(keg: keg).group(:contact_id).count
    @pours.collect{|k,v|{label: v, value: v, name: 'Mark'}}
  end
  
  def pours_by_user_lifetime
    @pours = Transaction.all.group(:contact_id).count
    @pours.keep_if{|k,v| v>threshold}
    @pours.collect{|k,v|{label: v, value:v, name: 'Mark'}}
  end
  
  def threshold
    (Transaction.count*0.02).ceil
  end
end