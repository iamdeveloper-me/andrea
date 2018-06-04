class AddWeekPubToWines < ActiveRecord::Migration[5.0]
  def change
    add_column :wines, :week_pub, :boolean
  end
end
