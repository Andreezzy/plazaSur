class Sale < ApplicationRecord
	self.table_name = "sale"
  belongs_to :voucher
  belongs_to :customer
end
