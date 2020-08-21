class CityNameColumnToBlogs < ActiveRecord::Migration[6.0]
  def change
    rename_column :blogs, :city_name, :pref_name
  end
end
