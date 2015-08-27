class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :reference
      t.references :owner, index: true, foreign_key: true
      t.string :state
      t.string :client_name
      t.string :client_email
      t.string :subject

      t.timestamps null: false
    end
    add_index :tickets, :state
    add_index :tickets, :reference, unique: true
  end
end
