class AddSupplyUrlFromGrapes < ActiveRecord::Migration[5.0]
  def change
    add_column :grapes, :supply_url, :string
  end
end
