class PromotionHasProduct < ApplicationRecord
	self.table_name = "promotion_has_products"
  belongs_to :promotion
  belongs_to :product
end
