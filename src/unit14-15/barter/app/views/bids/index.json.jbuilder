json.array!(@bids) do |bid|
  json.extract! bid, :id, :listing_item_id, :bid_item_id
  json.url bid_url(bid, format: :json)
end
