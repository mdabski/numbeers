module ApplicationHelper
  #Send an email to everyone that has subscribed to happy hour notices!
  def self.send_happy_hour_notice()
    users = User.joins(:contact).where(contacts: {happy_hour: true})
    email_list = users.map{|u| u[:email]}
    DelayedEmail.new.perform(UserMailer, {method: :happy_hour, args: [email_list]})
  end
  
  def send_happy_hour_notice()
    ApplicationHelper.send_happy_hour_notice()
  end
end
