class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.belongs_to :contact, index: true
      t.decimal :amount

      t.timestamps
    end
  end
end
