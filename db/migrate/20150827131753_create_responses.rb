class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :ticket, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
