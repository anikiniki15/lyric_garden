class CreateLyrics < ActiveRecord::Migration[7.2]
  def change
    create_table :lyrics do |t|
      t.string :title
      t.text :body
      t.string :reference
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
