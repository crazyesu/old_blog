class ChangeFromTextToContent < ActiveRecord::Migration
  def change
    rename_column :posts, :text, :content
  end
end
