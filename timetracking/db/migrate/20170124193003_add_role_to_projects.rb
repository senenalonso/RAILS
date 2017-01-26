class AddRoleToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :role, :string
  end
end
