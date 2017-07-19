class AtpStock < ApplicationRecord
	self.table_name = "atp_stock"
  belongs_to :product
end
