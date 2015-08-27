class ChangeDefaultStateOfTickets < ActiveRecord::Migration
  def change
    change_column :tickets, :state, :string, default: 'waiting_for_staff'
  end
end
