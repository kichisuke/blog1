class RemoveFoodFlagFromblogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :blogs, :food_flag
  end
end
