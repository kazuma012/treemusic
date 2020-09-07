class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :track_audio_id
      t.string :track_image_id
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
