class AddSupplyFromWines < ActiveRecord::Migration[5.0]
  def change
    add_column :wines, :supply, :string
  end
end
