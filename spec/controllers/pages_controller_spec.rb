require 'spec_helper'

describe PagesController do
  describe "GET pour" do
    it "renders pour template" do
      get :pour
      expect(response).to render_template(:pour)
    end
  end
  
  describe "POST pour" do
    context "with successful save" do
      it "redirects to pour page with success message" do
        contact = create(:contact) 
        post :pour, {numbeer_id: contact.numbeer_id}
        expect(response).to redirect_to(:pour)
        expect(response.request.flash[:notice]).to eq "NumBeer was successfully recorded."
      end
    end
    context "with unsuccessful save" do
      it "redirects to pour page with error message" do
        post :pour
        expect(response).to redirect_to(:pour)
        expect(response.request.flash[:alert]).to eq "Invalid NumBeer ID, Try Again!"
      end
    end
  end
end
