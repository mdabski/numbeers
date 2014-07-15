class PagesController < ApplicationController
  
  before_action :deny_access, except: [:home,:pour,:stats]
  
  def home #public
  end
  
  def pour #public
  end
  
  def stats #public
  end
  
  def dashboard #admins
  end
  
  def about #public
  end
  
  def contact #public
  end

end
