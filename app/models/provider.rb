class Provider < ApplicationRecord
	self.table_name = "provider"
	has_many :phones
	has_many :contacts
end
