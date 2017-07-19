class Promotion < ApplicationRecord
	self.table_name = "promotion"
  belongs_to :calendar
end
