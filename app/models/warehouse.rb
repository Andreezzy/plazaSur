class Warehouse < ApplicationRecord
	self.table_name = "warehouse"
  belongs_to :product
end
