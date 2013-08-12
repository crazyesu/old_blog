class AddNameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :name, :stringra
  end
end
