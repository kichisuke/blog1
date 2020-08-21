class RemoveCoffeeFlagFromblogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :blogs, :coffee_flag
  end
end
