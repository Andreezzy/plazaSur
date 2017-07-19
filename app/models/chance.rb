class Chance < ApplicationRecord
	self.table_name = "chance"
  belongs_to :products
end
