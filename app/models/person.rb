class Person < ApplicationRecord
	self.table_name = "person"
	#has_one :phone
	has_one :user
	has_one :person
end
