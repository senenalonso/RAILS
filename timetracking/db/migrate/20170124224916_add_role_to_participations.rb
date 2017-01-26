class AddRoleToParticipations < ActiveRecord::Migration[5.0]
  def change
    add_column :participations, :role, :string
  end
end
