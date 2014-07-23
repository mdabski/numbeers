class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :numbeer_id
      t.string :first_name
      t.string :last_name
      t.string :phone_number
     
      t.timestamps
    end
  end
end
