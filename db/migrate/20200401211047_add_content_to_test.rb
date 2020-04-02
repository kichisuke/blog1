class AddContentToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :content, :text
  end
end
