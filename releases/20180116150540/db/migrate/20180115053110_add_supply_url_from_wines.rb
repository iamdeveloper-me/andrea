class AddSupplyUrlFromWines < ActiveRecord::Migration[5.0]
  def change
    add_column :wines, :supply_url, :string
  end
end
