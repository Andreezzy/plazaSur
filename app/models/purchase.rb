class Purchase < ApplicationRecord
	self.table_name = "purchase"
  belongs_to :receipt
  belongs_to :products
end
