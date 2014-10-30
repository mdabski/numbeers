require 'spec_helper'

feature 'User Submitting Pour' do
  scenario "adds a transaction to the database" do
    contact = create(:contact, numbeer_id: 1234)
    
    visit pour_path
    
    fill_in 'NumBeer-ID :', with: '1234'
    
    expect{
      click_button 'Pour'
      }.to change(Transaction, :count).by(1)
  end
end