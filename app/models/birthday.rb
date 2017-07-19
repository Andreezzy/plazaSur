class Birthday < ApplicationRecord
	self.table_name = "birthday"
  belongs_to :customer
  belongs_to :calentar
end
