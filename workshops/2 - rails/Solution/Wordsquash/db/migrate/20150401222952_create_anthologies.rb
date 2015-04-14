class CreateAnthologies < ActiveRecord::Migration
  def change
    create_table :anthologies do |t|
      t.string :title
      t.datetime :publication_date

      t.timestamps null: false
    end
  end
end
