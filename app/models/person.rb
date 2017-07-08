class Person < ApplicationRecord
	self.table_name = "person"
	has_one :phone
end
