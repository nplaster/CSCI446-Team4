class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :listing_item, index: true
      t.references :bid_item, index: true

      t.timestamps
    end
  end
end
