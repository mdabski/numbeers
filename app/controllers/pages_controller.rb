class PagesController < ApplicationController
  
  before_action :deny_access, except: [:home,:pour]
  
  def home #public
  end
  
  def pour #public
  end
  
  def stats #users/admins
  end
  
  def dashboard #admins
  end

end
