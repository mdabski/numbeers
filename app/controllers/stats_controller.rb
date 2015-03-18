class StatsController < ApplicationController
  
  def pours_by_user_current_keg
    keg = Keg.get_keg_on_tap
    @pours = Transaction.where(keg: keg).group(:contact_id).count.values
    
    render json: @pours.collect{|p|{label: p, value:p}}
  end
  
  def pours_by_user_lifetime
    @pours = Transaction.all.group(:contact_id).count.values
    
    render json: @pours.collect{|p|{label: p, value:p}}
  end
  
end