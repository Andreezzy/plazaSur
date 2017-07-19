class Voucher < ApplicationRecord
	self.table_name = "voucher"
	has_one :receipt
end
