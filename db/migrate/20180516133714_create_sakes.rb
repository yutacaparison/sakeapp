class CreateSakes < ActiveRecord::Migration[5.1]
  def change
    create_table :sakes do |t|
      t.string :sake
      t.string :brewery
      t.string :prefectures
      t.text :image
      t.text :comment
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
