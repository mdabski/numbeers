class UserMailer < ActionMailer::Base
  default from: "numbeers.app@gmail.com"
  default to: "numbeers.app@gmail.com"
  
  def contact_confirmation(email, name, message)
    @email = email
    @name = name
    @message = message
    
    mail( :to => email,
          :subject => "Thank you for contacting us!"
      )
  end
  
  def happy_hour(list)
    mail( :bcc => list.join(","),
          :subject => "3's a party...Happy Hour has Started!!"
      )
  end
  
  def broadcast_to_users(list, subject, message)
    @message = message
    
    mail( :bcc => list.join(","),
          :subject => subject
      )
  end
  
  def balance_notice(email, name, amount)
    @email = email
    @name = name
    @amount = amount
    
    mail( :to => email,
          :subject => "NumBeers Balance"
      )    
  end
end