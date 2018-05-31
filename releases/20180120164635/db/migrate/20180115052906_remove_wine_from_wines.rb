class RemoveWineFromWines < ActiveRecord::Migration[5.0]
  def change
    remove_column :wines, :wine, :string
  end
end
