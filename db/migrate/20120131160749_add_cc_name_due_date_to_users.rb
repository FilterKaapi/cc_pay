class AddCcNameDueDateToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :cc_name, :string
    add_column :users, :due_date, :integer
  end

  def self.down
    remove_column :users, :due_date
    remove_column :users, :cc_name
  end
end
