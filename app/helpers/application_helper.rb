module ApplicationHelper
  #Send an email to everyone that has subscribed to happy hour notices!
  def self.send_happy_hour_notice()
    User.find_each do |user|
      #eventually check to see if the user wants to get notified about happy hour
      UserMailer.happy_hour(user.email, user.contact.full_name).deliver
    end
  end
  
  def send_happy_hour_notice()
    ApplicationHelper.send_happy_hour_notice()
  end
end
