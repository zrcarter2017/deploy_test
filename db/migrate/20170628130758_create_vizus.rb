class CreateVizus < ActiveRecord::Migration[5.0]
  def change
    create_table :vizus do |t|

      t.timestamps
    end
  end
end
