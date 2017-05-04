class CreateNotifies < ActiveRecord::Migration[5.0]
  def change
    create_table :notifies do |t|
      t.string :entity_name
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
