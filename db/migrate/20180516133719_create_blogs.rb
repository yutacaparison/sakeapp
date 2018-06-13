class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :image
      t.integer :user_id
      t.timestamps
    end
  end
end
