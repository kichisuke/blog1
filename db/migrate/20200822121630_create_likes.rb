class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :blog, foreign_key: true
      t.string :ip
      t.timestamps
    end
  end
end
