class StatsController < ApplicationController
  
  def get_stats
    
    render json: {
      pours_current_keg: pours_by_user_current_keg,
      pours_current_keg_total: Keg.get_current_pours,
      pours_lifetime: pours_by_user_lifetime,
      pours_lifetime_total: Transaction.count
      }
  end
  
  private
  def pours_by_user_current_keg
    keg = Keg.get_keg_on_tap
    @pours = Transaction.where(keg: keg).group(:contact_id).count.values
    @pours.collect{|p|{label: p, value:p}}
  end
  
  def pours_by_user_lifetime
    @pours = Transaction.all.group(:contact_id).count.values
    @pours.collect{|p|{label: p, value:p}}
  end
  
end