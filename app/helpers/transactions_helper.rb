module TransactionsHelper
  def total_pours()
    Transaction.count()
  end
  
  def user_total_pours(user)
    Transaction.where(contact_id: user.id).count()
  end
  
  def user_with_most_pours()
    t = Transaction.all()
    h = t.group(:contact_id).count().max_by{|k,v| v}
    u = Contact.find_by_id(h[0])
    u.full_name()+", Pours: "+ h[1].to_s
  end
end
