class AddBalanceToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :balance, :decimal
  end
end
