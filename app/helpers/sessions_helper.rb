module SessionsHelper
  def admin?
    if current_user.nil?
      false
    else
      current_user.meta_type == "admin"
    end
  end
end