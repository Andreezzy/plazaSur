class Product < ApplicationRecord
  self.table_name = "products"
  belongs_to :category
  belongs_to :unity
  has_one :atp_impost
  has_one :atp_stock
  has_many :purchases
  has_one :warehouse

  has_one :planning
  
  has_many :products_has_chance
end
