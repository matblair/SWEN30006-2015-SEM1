class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio
      t.string :url

      t.timestamps null: false
    end
  end
end
