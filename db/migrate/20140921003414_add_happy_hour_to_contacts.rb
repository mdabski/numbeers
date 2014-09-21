class AddHappyHourToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :happy_hour, :boolean
  end
end
