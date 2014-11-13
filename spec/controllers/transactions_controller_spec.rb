require 'spec_helper'

describe TransactionsController do
  
  describe "POST create" do
    context "with successful save" do
      it "redirects to pour page with success message" do
        contact = create(:contact)
        keg = create(:keg)
        post :create, {numbeer_id: contact.numbeer_id}
        expect(response).to redirect_to(:pour)
        expect(response.request.flash[:notice]).to eq "NumBeer was successfully recorded."
      end
    end
    context "with unsuccessful save" do
      it "redirects to pour page with error message" do
        post :create
        expect(response).to redirect_to(:pour)
        expect(response.request.flash[:alert]).to eq "Invalid NumBeer ID, Try Again!"
      end
    end
  end
end
