class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :message
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamp :commented_at

      t.timestamps
    end
  end
end
