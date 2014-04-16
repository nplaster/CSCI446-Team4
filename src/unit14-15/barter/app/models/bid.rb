class Bid < ActiveRecord::Base
  belongs_to :listing_item
  belongs_to :bid_item
end
