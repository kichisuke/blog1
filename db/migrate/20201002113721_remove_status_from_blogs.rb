class RemoveStatusFromBlogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :blogs, :status, :integer
  end
end
