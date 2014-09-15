class RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    @contact = Contact.new
  end
  
  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation =params[:user][:password_confirmation]

    @contact = Contact.new
    @contact.first_name = params[:contact][:first_name]
    @contact.last_name = params[:contact][:last_name]
    @contact.phone_number = params[:contact][:phone_number]
    #find unique id for each user
    @contact.assign_numbeer_id
    
    @user.valid?
    if @user.errors.blank?
      @user.save
      @contact.user = @user
      @contact.save
      redirect_to root_path
    else
      render :action => "new"
    end
  end
  
  def edit
    @user = User.find(current_user.id)
    @contact = @user.contact
  end
  
  def update
    super do |resource|
      puts "Something"
      @contact = resource.contact
      if update_resource(resource, account_update_params)
        @contact.first_name = params[:contact][:first_name]
        @contact.last_name = params[:contact][:last_name]
        @contact.phone_number = params[:contact][:phone_number]

        @contact.save
      end
    end
  
  end
  
  def show
    @user = User.find(current_user.id)
    @contact = @user.contact
  end
  
  private

#   def user_params
#     # NOTE: Using `strong_parameters` gem
#     params.required(:user).permit(:password, :password_confirmation)
#   end
end
