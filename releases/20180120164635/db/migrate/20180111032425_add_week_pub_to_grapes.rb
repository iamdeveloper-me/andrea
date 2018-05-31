class AddWeekPubToGrapes < ActiveRecord::Migration[5.0]
  def change
    add_column :grapes, :week_pub, :boolean
  end
end
