class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :website
      t.string :at_base
      t.string :at_table
      t.timestamps
    end
  end
end
