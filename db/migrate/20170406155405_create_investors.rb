class CreateInvestors < ActiveRecord::Migration[5.0]
  def change
    create_table :investors do |t|
      t.string :investor_id
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :entity_name
      t.string :first_name
      t.string :last_name
      t.string :rep
      t.string :broker

      t.timestamps
    end
  end
end
