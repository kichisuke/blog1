class AddColumnToBlog < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :genre, :text
    add_column :blogs, :draft, :boolean
  end
end
