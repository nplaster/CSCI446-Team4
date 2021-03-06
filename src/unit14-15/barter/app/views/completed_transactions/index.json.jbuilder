json.array!(@completed_transactions) do |completed_transaction|
  json.extract! completed_transaction, :id, :listing_item_id, :bid_item_id, :listing_user_id, :bid_user_id, :listing_verify, :bid_verify
  json.url completed_transaction_url(completed_transaction, format: :json)
end
