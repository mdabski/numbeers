class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :keg, index: true
      t.references :contact, index: true

      t.timestamps
    end
  end
end
