class ProductsHasChance < ApplicationRecord
  self.table_name = "products_has_chance"
  belongs_to :product
  belongs_to :chance
end
