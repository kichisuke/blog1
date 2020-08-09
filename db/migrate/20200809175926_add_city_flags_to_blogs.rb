class AddCityFlagsToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :city_flag, :boolean
    add_column :blogs, :food_flag, :boolean
    add_column :blogs, :coffee_flag, :boolean
    add_column :blogs, :city_name, :string
    add_column :blogs, :food_name, :string
  end
end
