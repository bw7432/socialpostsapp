class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :description
      t.integer :type_of
      t.bigint :github_event_id
      t.timestamp :posted_at
      t.text :use_words, array: true, default: []
      t.references :user, foreign_key: true
      t.references :eventable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
