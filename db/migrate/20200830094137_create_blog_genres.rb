class CreateBlogGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_genres do |t|
      t.integer :blog_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
