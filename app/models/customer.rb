class Customer < ApplicationRecord
	self.table_name = "customer"
  belongs_to :person
end
