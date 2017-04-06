class CreateInvestors < ActiveRecord::Migration[5.0]
  def change
    create_table :investors do |t|
      t.string :investor_id
      t.string :city
      t.string :state
      t.string :zip
      t.string :address
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
