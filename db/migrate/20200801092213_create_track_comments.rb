class CreateTrackComments < ActiveRecord::Migration[5.2]
  def change
    create_table :track_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :track_id

      t.timestamps
    end
  end
end
