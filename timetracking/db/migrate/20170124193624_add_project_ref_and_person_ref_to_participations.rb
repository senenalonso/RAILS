class AddProjectRefAndPersonRefToParticipations < ActiveRecord::Migration[5.0]
  def change
    add_reference :participations, :project, foreign_key: true
    add_reference :participations, :person, foreign_key: true
  end
end
