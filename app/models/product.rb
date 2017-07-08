class Product < ApplicationRecord
  self.table_name = "products"
  belongs_to :category
  belongs_to :unity
end
