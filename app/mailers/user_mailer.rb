class UserMailer < ActionMailer::Base
  default from: "numbeers.app@gmail.com"
  defualt to: "numbeers.app@gmail.com"
  
  def contact_confirmation(email, name, message)
    @email = email
    @name = name
    @message = message
    
    mail( :to => email,
          :subject => "Thank you for contacting us!"
      )
  end
  
  def happy_hour(users)
    @email_list = users.join(",")
    
    mail( :bcc => email_list,
          :subject => "Happy Hour Has Started..."
      )
  end
end