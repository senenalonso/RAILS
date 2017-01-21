class RenameMinimumBidToMinimunBidToProducts < ActiveRecord::Migration[5.0]
  def change
  	rename_column :products, :minimum_bid, :minimun_bid
  end
end
