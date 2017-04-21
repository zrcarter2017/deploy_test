class CreateCriteria < ActiveRecord::Migration
  def change
    create_view :criteria
  end
end
