class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.string :key
      t.timestamps
    end
    add_reference :api_keys, :user, index: true
  end
end
