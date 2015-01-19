class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :contact
  
  def self.get_happy_hour_list
    joins(:contact).where(contacts: {happy_hour: true, active: true}).pluck(:email)
  end
  
  def self.get_active_list
    joins(:contact).where(contacts: {active: true}).pluck(:email)
  end
end
