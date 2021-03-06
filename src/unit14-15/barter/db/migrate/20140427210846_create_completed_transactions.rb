class CreateCompletedTransactions < ActiveRecord::Migration
  def change
    create_table :completed_transactions do |t|
      t.integer :listing_item_id
      t.integer :bid_item_id
      t.integer :listing_user_id
      t.integer :bid_user_id
      t.integer :listing_verify
      t.integer :bid_verify

      t.timestamps
    end
  end
end
