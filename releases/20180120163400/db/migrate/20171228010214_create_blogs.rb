class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :des
      t.string :pic
      t.string :tags
      t.boolean :publish

      t.timestamps
    end
  end
end
