module ApplicationHelper
  #Send an email to everyone that has subscribed to happy hour notices!
  def self.send_happy_hour_notice()
    User.find_each do |user|
      if user.contact.happy_hour
        DelayedEmail.new.perform(UserMailer, {method: :happy_hour, args: [user.email, user.contact.full_name]})
      end
    end
  end
  
  def send_happy_hour_notice()
    ApplicationHelper.send_happy_hour_notice()
  end
end
