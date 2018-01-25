class CreateUserEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :user_events do |t|
      t.string :description
      t.integer :type_of
      t.integer :resource_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
