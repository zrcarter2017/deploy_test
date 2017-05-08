class AddColumnToInvestorTable < ActiveRecord::Migration[5.0]
  def change
    add_column :investors, :active, :string
  end
end
