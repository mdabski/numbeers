class AdminMailer < ActionMailer::Base
  default from: "numbeers.app@gmail.com"
  default to: "dabrowski.mark@gmail.com"
  
    def visitor_contact(email, name, message)
    @email = email
    @name = name
    @message = message
    
      mail(  :subject => "NumBeers - Contact #{name}"
      )
  end
  
end