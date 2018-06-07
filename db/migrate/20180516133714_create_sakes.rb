class CreateSakes < ActiveRecord::Migration[5.1]
  def change
    create_table :sakes do |t|
      t.string :sake, null: false
      t.string :brewery
      t.string :prefectures, null: false
      t.text :image
      t.text :comment, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
