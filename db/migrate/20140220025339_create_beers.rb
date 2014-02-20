class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :brewer
      t.string :name
      t.string :style
      t.string :url

      t.timestamps
    end
  end
end
