class ChangeColumnToPost < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column :posts, :title, :string, null: false
    end
  end
end
