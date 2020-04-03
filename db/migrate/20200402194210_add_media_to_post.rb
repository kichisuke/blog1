class AddMediaToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :media, :text
  end
end
