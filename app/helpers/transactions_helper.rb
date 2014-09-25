module TransactionsHelper
  def total_pours()
    Transaction.count()
  end
  
  def user_total_pours(user)
    Transaction.where(contact_id: user.id).count()
  end
  
  def most_pours_by_a_user()
    t = Transaction.all()
    h = t.group(:contact_id).count().max_by{|k,v| v}
    "Pours: "+ h[1].to_s
  end
  
  def user_last_pour(user)
    Transaction.where(contact_id: user.id).last.created_at()
  end
end
