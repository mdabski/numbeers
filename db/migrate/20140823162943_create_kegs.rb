class CreateKegs < ActiveRecord::Migration
  def change
    create_table :kegs do |t|
      t.integer :size
      t.float :price
      t.date :start_date
      t.date :end_date
      t.belongs_to :beer, index: true

      t.timestamps
    end
  end
end
