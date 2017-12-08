class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :superadmin_role, :boolean, default: false
    add_column :users, :instructor_role, :boolean, default: false
    add_column :users, :attendee_role, :boolean, default: true
  end
end
