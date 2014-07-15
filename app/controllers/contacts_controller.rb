# controllers/contacts_controller.rb
class ContactsController < ApplicationController

    def create
        @contact = Contact.new(contact_params)
    end


    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :phone_number, :unique_id, user_attributes: [ :id, :email, :password ])
    end