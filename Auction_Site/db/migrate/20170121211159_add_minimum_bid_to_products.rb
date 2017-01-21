class AddMinimumBidToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :minimum_bid, :integer
  end
end
