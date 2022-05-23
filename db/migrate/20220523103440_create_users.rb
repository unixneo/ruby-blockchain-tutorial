class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :pk_hash
      t.integer :last_port
      t.decimal :balance
      t.timestamps
    end
  end
end
