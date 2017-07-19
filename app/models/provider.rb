class Provider < ApplicationRecord
	self.table_name = "provider"
	has_many :phones
	has_many :contacts
	has_one :receipt
	has_one :planning
end
