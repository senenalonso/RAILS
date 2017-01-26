class AddPosterToMovie < ActiveRecord::Migration[5.0]
  def change
  	  def self.up
  	add_attachment :movies, :poster
  end

  def self.down
  	remove_attachment :movies, :poster  	
  end
  end
end
