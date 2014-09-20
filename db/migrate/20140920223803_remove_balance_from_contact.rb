class RemoveBalanceFromContact < ActiveRecord::Migration
  def change
    remove_column :contacts, :balance, :decimal
  end
end
