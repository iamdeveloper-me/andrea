class CreateWines < ActiveRecord::Migration[5.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :short_des
      t.text :long_des
      t.string :pic
      t.string :regions
      t.string :wine
      t.boolean :publish

      t.timestamps
    end
  end
end
