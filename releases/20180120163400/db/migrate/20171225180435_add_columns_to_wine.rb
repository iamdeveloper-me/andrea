class AddColumnsToWine < ActiveRecord::Migration[5.0]
  def change
    add_column :wines, :share, :string
    add_column :wines, :like, :string
  end
end
