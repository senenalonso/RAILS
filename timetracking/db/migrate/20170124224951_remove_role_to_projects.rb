class RemoveRoleToProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :role
  end
end
