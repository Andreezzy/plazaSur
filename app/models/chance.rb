class Chance < ApplicationRecord
	self.table_name = "chance"
    has_many :products_has_chance
end
