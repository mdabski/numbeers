require 'spec_helper'

describe RegistrationsController do
  
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  context "user is signed in" do
    before :each do
      sign_in(create(:user))
    end
    
    it "redirects to root path, when get new" do
      get :new
      expect(response).to redirect_to root_path
    end
    
    it "redirects to root path, when post create" do
      post :create
      expect(response).to redirect_to root_path
    end
    
    it "renders edit, when get edit" do
      get :edit
      expect(response).to render_template(:edit)
    end
  end
  
  context "user is NOT signed in" do
    it "renders new, when get new" do
      get :new
      expect(response).to render_template(:new)
    end
    
    it "redirects to new user, when get edit" do
      get :edit
      expect(response).to redirect_to new_user_session_path
    end
  end

  it "renders new" do
    get :new
    expect(response).to render_template(:new)
  end
end
