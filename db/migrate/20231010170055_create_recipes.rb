class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :preparation_time
      t.float :cooking_time
      t.text :description
      t.boolean :public, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :recipes, :name
  end
end
