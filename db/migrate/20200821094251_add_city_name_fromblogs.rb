class AddCityNameFromblogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :city_name, :string
  end
end
