class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer  :listing_item_id
      t.integer  :bid_item_id

      t.timestamps
    end
  end
end
