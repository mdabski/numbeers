class AddBillableToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :billable, :boolean, :default => true
  end
end
