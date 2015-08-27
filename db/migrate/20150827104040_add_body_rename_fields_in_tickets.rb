class AddBodyRenameFieldsInTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :body, :text
    rename_column :tickets, :client_name, :customer_name
    rename_column :tickets, :client_email, :customer_email
  end
end
