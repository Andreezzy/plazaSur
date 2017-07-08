class Phone < ApplicationRecord
	self.table_name = "phone"
  belongs_to :provider
end
