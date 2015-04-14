class AddAnthologyToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :anthology, index: true
    add_foreign_key :posts, :anthologies
  end
end
