class AddColumnsToGrape < ActiveRecord::Migration[5.0]
  def change
    add_column :grapes, :supply, :string
    add_column :grapes, :share, :string
    add_column :grapes, :like, :string
  end
end
