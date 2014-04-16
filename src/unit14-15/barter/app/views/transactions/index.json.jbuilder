json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :listing_item_id, :bid_item_id, :listing_user_id, :bid_user_id, :listing_verify, :bnteger, :bid_user_id, :listing_verify, :bid_verify
  json.url transaction_url(transaction, format: :json)
end
