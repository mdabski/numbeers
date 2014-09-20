class UserMailer < ActionMailer::Base
  default from: "numbeers.app@gmail.com"
  
  def contact_confirmation(email, name, message)
    @email = email
    @name = name
    @message = message
    
    mail( :to => email,
          :subject => "Thank you for contacting us!"
      )
  end
  
  def happy_hour_notice(email, name)
    @email = email
    @name = name
    
    mail( :to => email,
          :subject => "Happy Hour has Started...",
          :message => "Just thought you should know."
      )
  end
end