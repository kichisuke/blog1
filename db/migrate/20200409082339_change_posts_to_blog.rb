class ChangePostsToBlog < ActiveRecord::Migration[6.0]
  def change
    rename_table :posts, :blogs
  end
end
