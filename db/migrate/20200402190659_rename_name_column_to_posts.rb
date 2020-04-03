class RenameNameColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :name, :title
  end
end
