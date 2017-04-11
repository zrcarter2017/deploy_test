class AddItemsAssociationToChallenge < ActiveRecord::Migration[5.0]
  def change
  	update_table :notes do |t|
      t.belongs_to :investor, index: true
    end
  end
end
