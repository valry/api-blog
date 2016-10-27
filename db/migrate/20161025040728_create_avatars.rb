class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.string :image_id

      t.timestamps
    end
    add_reference :avatars, :user, index: true
  end
end
