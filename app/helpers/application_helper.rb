module ApplicationHelper
  #Send an email to everyone that has subscribed to happy hour notices!
  def self.send_happy_hour_notice(transaction)
    if transaction.first_pour_of_day?
      email_list = User.get_happy_hour_list
      DelayedEmail.new.perform(UserMailer, {method: :happy_hour, args: [email_list]})
    end
  end
  
  def send_happy_hour_notice()
    ApplicationHelper.send_happy_hour_notice()
  end
end
