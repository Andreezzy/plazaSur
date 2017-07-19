class Planning < ApplicationRecord
	self.table_name = "planning"
  belongs_to :product
  belongs_to :prodiver
end
