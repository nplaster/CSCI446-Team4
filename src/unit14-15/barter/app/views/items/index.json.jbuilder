json.array!(@items) do |item|
  json.extract! item, :id, :image_url, :name, :description, :status, :condition
  json.url item_url(item, format: :json)
end
