class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postcode
      t.string :country
      t.string :propertytype
      t.integer :emgcontact
      t.integer :numberofbedrooms
      t.integer :numberofbathrooms
      t.integer :squarefootage
      t.integer :maxtenantoccupancy
      t.decimal :desiredmonthlyrent
      t.integer :user_id

      t.timestamps
    end
      add_index :properties, [:user_id, :created_at]
  end
end
