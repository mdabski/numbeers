module TransactionsHelper
  def total_pours()
    Transaction.count()
  end
  
  def most_pours_by_a_user()
    t = Transaction.all()
    h = t.group(:contact_id).count().max_by{|k,v| v}
    h[1]
  end
  
  def last_pour()
    lastpour = Transaction.last
    if lastpour.nil?
      "No Pours Yet!?"
    else
      lastpour.created_at.strftime("%A - %b %d, %Y at %I:%M %p")
    end
  end
  
  #User Transactions
  def user_total_pours(user)
    Transaction.where(contact_id: user.id).count()
  end
  
  def user_last_pour(user)
    lastpour = Transaction.where(contact_id: user.id).last
    if lastpour.nil?
      "No Pours Yet!?"
    else
      lastpour.created_at().strftime("%A - %b %d, %Y at %I:%M %p")
    end
  end
  
  def user_pours_current_keg(user, keg)
    pours = Transaction.where(contact_id: user.id, keg_id: keg.id)
    if pours.nil?
      "No Pours Yet!?"
    else
      pours.count()
    end
  end
end
