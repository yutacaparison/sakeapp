class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :blog, null: false, foreign_key: true
      t.string :name, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
