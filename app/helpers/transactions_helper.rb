module TransactionsHelper
  def self.first_pour_of_day()
    Transaction.where("created_at >= ?", Time.zone.now.beginning_of_day).first
  end
  
  def last_pour()
    lastpour = Transaction.last
    if lastpour.nil?
      "No Pours Yet!?"
    else
    time_ago_in_words(lastpour.created_at) + " ago"
      #lastpour.created_at.strftime("%a - %b %d, %Y \n %I:%M %p")
    end
  end
  
  #User Transactions
  def user_total_pours(user)
    pours = Transaction.where(contact_id: user.id)
    if pours.nil?
      "No Pours Yet1?"
    else
      pours.count()
    end
  end
  
  def user_last_pour(user)
    lastpour = Transaction.where(contact_id: user.id).last
    if lastpour.nil?
      "No Pours Yet!?"
    else
      lastpour.created_at().strftime("%a - %b %d, %Y \n %I:%M %p")
    end
  end
  
  def user_pours_current_keg(user, keg)
    if keg.blank?
      "No Pours Yet!?"
    else
      pours = Transaction.where(contact_id: user.id, keg_id: keg.id)
      if pours.nil?
        "No Pours Yet!?"
      else
        pours.count()
      end
    end
  end
  
  def user_pours_past_week(user)
    pours = Transaction.where('created_at >= ? AND contact_id = ?', 1.week.ago, user.id)
    if pours.nil?
      "No Pours in the Past Week!?"
    else
      pours.count()
    end
  end
end
