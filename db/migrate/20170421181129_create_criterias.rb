class CreateCriterias < ActiveRecord::Migration
  def change
    create_view :criterias
  end
end
