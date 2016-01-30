class StatsController < ApplicationController
  
  def get_stats
    @keg = Keg.get_keg_on_tap
    
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
    @pours_with_name = Transaction.where(keg: keg).map { |x| Contact.find(x.contact_id).first_name }.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }
    @pours_with_name.collect{|k,v|{label: v, value: v, name: k}}
  end
  
  def pours_by_user_lifetime
    @pours_with_name = Transaction.all.map { |x| Contact.find(x.contact_id).first_name }.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }.keep_if{|k,v| v>threshold}
    @pours_with_name.collect{|k,v|{label: v, value: v, name: k}}
  end
  
  def threshold
    (Transaction.count*0.02).ceil
  end
end