class CreateGrapes < ActiveRecord::Migration[5.0]
  def change
    create_table :grapes do |t|
      t.string :name
      t.string :short_des
      t.text :logn_des
      t.string :pic
      t.string :regions
      t.boolean :publish

      t.timestamps
    end
  end
end
